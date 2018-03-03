<?php

namespace App\Http\Controllers;

use App\Schedule;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Input;
use Auth;
use DB;
use Illuminate\Support\Facades\Validator;
use Log;
use \Carbon\Carbon;

class ScheduleController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request) {
        $device_id = Input::get('device_id');
        $query = \App\Schedule::query();
        if ($device_id != null) {
            if ($this->checkPermissonDevice($device_id) === false) {
                Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                return redirect('control/index');
            }
            $query = $query->where('device_id', '=', $device_id);
        }
        $schedules = $query->orderBy('created_at', 'desc')->paginate(12);
        return view('schedule.index')->with('schedules', $schedules);
    }

    public function create(Request $request) {
        $device_id = Input::get('device_id');
        $device = \App\Device::find($device_id);
        if ($this->checkPermissonDevice($device_id, $device) === false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('home');
        }
        $devices = \App\Device::getDevices()->lists('code', 'id')->toArray();
        return view('schedule.create')
                        ->with('devices', $devices)
                        ->with('device', $device);
    }

    public function store(Request $request) {
        $input = $request->all();
        try {
            $device_id = Input::get('device_id');
            $device = \App\Device::find($device_id);
            if ($this->checkPermissonDevice($device_id, $device) === false) {
                Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                return redirect('home');
            }
            $port = $request->get('port');
            $time = $request->get('time');
            $timeArr = array();
            foreach ($port as $aPort) {
                array_push($timeArr, $time[$aPort]);
            }
            $data = ['ports' => $port, 'time' => $timeArr];
            $command = $device->driver->buildControlCommand($data);
            $description = $device->driver->createDesCrlCmd($data);

            //ThuyetLV: dat lich server
            Log::info('------------------------------------ScheduleController store: '
                    . " - device_id: " . Input::get('device_id')
                    . " - content: " . Input::get('content')
                    . " - type: " . Input::get('type')
                    . " - port: " . join(',', $port)
                    . " - time: " . join(',', $time)
                    . " - command: " . $command);

            $startTime;
            if (Input::get('type') == 1) {
                $startTime = Carbon::createFromFormat("d/m/Y H:i:s", Input::get('content'));
            } else if (Input::get('type') == 2) {
                $content = explode(":", Input::get('content'));
                $startTime = Carbon::now()->hour($content[0])->minute($content[1])->second($content[2]);
            }

            //Da qua gio hien tai
            if ($startTime && !$startTime->isFuture()) {
                $startTime->addDay();
            }


            \App\Schedule::create([
                'type' => Input::get('type'),
                'content' => Input::get('content'),
                'device_id' => Input::get('device_id'),
                "count" => 0,
                'command' => $command,
                'status' => \App\Schedule::STATUS_RUNNING,
                'serial' => $device->code,
                'start_time' => $startTime,
                'topic' => $device->driver->mqttout(),
                'description' => $description
            ]);
            Session::flash('flash_message', 'Device serverSchedule successfully!');
            return redirect('control/index');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e);
            return \Redirect::to('schedule/create')->withErrors('Exception' . $e->getMessage())->withInput();
        }
        return redirect()->back();
    }
    
    public function edit($id) {
        $schedule = Schedule::find($id);
        if (!$schedule) {
            Session::flash('error_message', 'Server Schedule not found!');
            return redirect('control/index');
        }

        if ($this->checkPermissonDevice($schedule->device_id) === false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('home');
        }

        $command = json_decode($schedule->command);
        $relayStates = explode(',', $command->data);
        $relayTime = $command->time;
        return view('schedule.edit')
                        ->with('relayStates', $relayStates)
                        ->with('relayTime', $relayTime)
                        ->with('schedule', $schedule);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id, Request $request) {
        $schedule = \App\Schedule::find($id); // Pull back a given schedule
        if (!$schedule) {
            Session::flash('error_message', 'Server Schedule not found!');
            return redirect('control/index');
        }

        $device = \App\Device::find($schedule->device_id);
        if ($this->checkPermissonDevice($schedule->device_id, $device) === false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('home');
        }

        $port = $request->get('port');
        $time = $request->get('time');
        $timeArr = array();
        foreach ($port as $aPort) {
            array_push($timeArr, $time[$aPort]);
        }
        $data = ['ports' => $port, 'time' => $timeArr];
//        var_dump($port);echo "<br />";
//        var_dump($timeArr);echo "<br />";
//        var_dump($data);die;
        $command = $device->driver->buildControlCommand($data);
        $description = $device->driver->createDesCrlCmd($data);
        //ThuyetLV: dat lich server
        Log::info('------------------------------------ScheduleController update: ' . $id
                . " - type: " . Input::get('type')
                . " - content: " . Input::get('content')
                . " - port: " . join(',', $port)
                . " - time: " . join(',', $time)
                . " - command: " . $command);

        //ThuyetLV
        $startTime;
        if (Input::get('type') == 1) {
            $startTime = Carbon::createFromFormat("d/m/Y H:i:s", Input::get('content'));
        } else if (Input::get('type') == 2) {
            $content = explode(":", Input::get('content'));
            $startTime = Carbon::now()->hour($content[0])->minute($content[1])->second($content[2]);
        }

        //Da qua gio hien tai
        if ($startTime && !$startTime->isFuture()) {
            $startTime->addDay();
        }

        $schedule->update([
            'command' => $command,
            'type' => Input::get('type'),
            'content' => Input::get('content'),
            'from' => Input::get('from'),
            'to' => Input::get('to'),
            'serial' => $device->code,
            'start_time' => $startTime,
            'topic' => $device->driver->mqttout(),
            'description' => $description,
        ]);
        return \Redirect('schedule?device_id=' . $schedule->device_id)->with('status', 'Update Schedule Success!');
    }

    public function show($id) {
        if (!Auth::user()->can('control-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $schedule = \App\Schedule::find($id);
        if (!$schedule) {
            Session::flash('error_message', 'Server Schedule not found!');
            return redirect('control/index');
        }

        return view('schedule.show')->with('schedule', $schedule);
    }

    public function destroy($id) {
        $schedule = Schedule::find($id);
        if (!$schedule) {
            Session::flash('error_message', 'Server Schedule not found!');
            return redirect('control/index');
        }
        $id = $schedule->device_id;
        if ($this->checkPermissonDevice($id) === false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('home');
        }
        $schedule->delete();
        return \Redirect('schedule?device_id=' . $id)->with('status', 'Delete Success!');
    }

    public function toggle(Request $request) {

        $input = $request->all();
        $schedule = \App\Schedule::find($input['id']);
        if (!$schedule) {
            Session::flash('error_message', 'Server Schedule not found!');
            return redirect('control/index');
        }
        if ($this->checkPermissonDevice($schedule->device_id) === false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('home');
        }
        $schedule->update(array('status' => $schedule->status == \App\Schedule::STATUS_RUNNING ? \App\Schedule::STATUS_STOP : \App\Schedule::STATUS_RUNNING));

        Session::flash('flash_message', 'Schedule updated successfully!');
        return redirect('schedule?device_id=' . $schedule->device_id);
    }

}

?>