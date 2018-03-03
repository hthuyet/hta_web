<?php

namespace App\Console\Commands;

use App\PayType;
use App\Tranaction;
use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use \Carbon\Carbon;
use Log;
use DB;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Mail;
use View;
use App\UserAds;

class IrrigationScheduleCommand extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'irrigationschedule:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Run irrigation schedule.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function fire() {
//        Log::error("---irrigationschedule---");
        $now = Carbon::now();
        $irrigationschedules = \App\IrrigationDetail::query()
                        ->select('irrigation_detail.*')
                        ->join('irrigation', 'irrigation_detail.irrigation_id', '=', 'irrigation.id')
                        ->where('irrigation.status', '=', \App\Irrigation::STATUS_ON)
                        ->where('irrigation.from_date', '<=', $now)
                        ->where('irrigation.to_date', '>=', $now)
                        ->orderBy('irrigation_detail.step', 'asc')->get();
//        Log::error($now);
        foreach ($irrigationschedules as $aSchedule) {
            try {
                DB::beginTransaction();
                $device = \App\Device::find($aSchedule->device_id);
                if(!$device){
                    Log::error("----------IrrigationScheduleCommand fire irrigation_detail " .  $aSchedule->id . " error with device not found: " . $aSchedule->device_id);
                    continue;
                }
                $from = explode(":", $aSchedule->from);
                $to = explode(":", $aSchedule->to);
                $scheduleStart = Carbon::now()->hour($from[0])->minute($from[1])->second($from[2]);
                $scheduleEnd = Carbon::now()->hour($to[0])->minute($to[1])->second($to[2]);
                if (Carbon::now()->gte($scheduleStart) == true &&
                        Carbon::now()->lt($scheduleEnd) == true &&
                        $aSchedule->is_start == 0) {
                    Log::error("---Send Start---" . $aSchedule->id);

                    $command = $device->driver->buildControlCommand(['ports' => [$aSchedule->port], "time" => [$aSchedule->time]], 1);
                    $device->driver->sendCommand($command, 4);
                    $aSchedule->update(['is_start' => 1]);
                }

                if (Carbon::now()->gte($scheduleEnd) == true && $aSchedule->is_start == 1) {
                    Log::error("---Send Finish---" . $aSchedule->id);
                    $command = $device->driver->buildControlCommand(['ports' => [$aSchedule->port], "time" => [$aSchedule->time]], 0);
                    $device->driver->sendCommand($command, 4);
                    $aSchedule->update(['count' => $aSchedule->count + 1, 'is_start' => 0]);
                }
                DB::commit();
            } catch (Exception $e) {
                Log::error($e);
                DB::rollBack();
            }
        }
    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments() {
        return [
        ];
    }

    /**
     * Get the console command options.
     *
     * @return array
     */
    protected function getOptions() {
        return [
        ];
    }

}
