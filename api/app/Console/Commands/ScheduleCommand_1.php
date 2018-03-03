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
                    $from = explode(":", $aSchedule->from);
                    $to = explode(":", $aSchedule->to);
                    $scheduleStart = Carbon::now()->hour($from[0])->minute($from[1])->second($from[2]);
                    $scheduleEnd = Carbon::now()->hour($to[0])->minute($to[1])->second($to[2]);
                    if (Carbon::now()->gte($scheduleStart) == true &&
                        Carbon::now()->lt($scheduleEnd) == true &&
                            $aSchedule->is_start == 0) {
                        Log::error("---Send Finish---".$aSchedule->id);

                        $aSchedule->update(['is_start' => 1]);
                        $device->driver->sendCommand($aSchedule->command, 2);
                    }

                    if (Carbon::now()->gte($scheduleEnd) == true && $aSchedule->is_start == 1) {
                        Log::error("---Send Finish---".$aSchedule->id);
                        
                        $newCommand = json_decode($aSchedule->command);
                        $arrRelay = explode(',', $newCommand->data);
                        foreach ($arrRelay as $key => $aRelay){
                            if($aRelay == 2){
                                continue;
                            }
                            $arrRelay[$key] = (!$aRelay)?'1':'0';
                        }
                        $data = join(',',$arrRelay);
                        $newCommand->data = $data;
                        $device->driver->sendCommand(json_encode($newCommand), 2);
                        $aSchedule->update(['count' => $aSchedule->count + 1, 'is_start' => 0]);
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
