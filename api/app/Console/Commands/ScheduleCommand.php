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

class ScheduleCommand extends Command {

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'schedule:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Run schedule.';

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
        $schedules = \App\Schedule::where('status', '=', \App\Schedule::STATUS_RUNNING)->get();
        foreach ($schedules as $aSchedule) {
            try {
                DB::beginTransaction();
                $device = \App\Device::find($aSchedule->device_id);
                if(!$device){
                    Log::error("----------ScheduleCommand fire schedule " .  $aSchedule->id . " error with device not found: " . $aSchedule->device_id);
                    continue;
                }
                if ($aSchedule->type == 1) {
                    $scheduleDate = Carbon::createFromFormat("d/m/Y H:i:s", $aSchedule->content);
                    if (Carbon::now()->lte($scheduleDate) == true) {
                        DB::rollBack();
                        continue;
                    }
                    $device->driver->sendCommand($aSchedule->command);
                    $aSchedule->update(['status' => \App\Schedule::STATUS_DONE]);
                }

                if ($aSchedule->type == 2) {
                    $content = explode(":", $aSchedule->content);
                    $scheduleStart = Carbon::now()->hour($content[0])->minute($content[1])->second($content[2]);
                    if (Carbon::now()->gte($scheduleStart) == true && $aSchedule->is_start == 0) {
                        Log::error("---Send command---".$aSchedule->id);
                        $aSchedule->update(['is_start' => 1, 'count' => $aSchedule->count+1]);
                        $device->driver->sendCommand($aSchedule->command, 2);
                    }else if(Carbon::now()->gte($scheduleStart) == false && $aSchedule->is_start == 1){
                        $aSchedule->update(['is_start' => 0]);
                    }

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
