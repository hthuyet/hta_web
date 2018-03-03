<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Input;
use Auth;
use DB;
use Illuminate\Support\Facades\Validator;
use App\Device;
use App\DeviceType;
use Log;
use App\Helpers\SoapHelper;
use Response;

class ControlController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function realtimeStatus(Request $request) {
        $code = $request->get('code');
        $devicetype_id = $request->get('devicetype_id');
        $assign_id = $request->get('assign_id');
        $query = null;
        if (Auth::user()->can('device-manager')) {
            $query = \App\Device::query();
        } else {
            $query = \App\Device::where('assign_id', '=', Auth::user()->id)
                    ->whereIn('status', [Device::STATUS_ACTIVED, Device::STATUS_LOST]);
        }
        if ($code != null) {
            $query = $query->where('device.code', 'like', '%' . $code . '%');
        }
        if ($devicetype_id != null) {
            $query = $query->where('device.devicetype_id', '=', $devicetype_id);
        }
        if ($assign_id != null) {
            $query = $query->where('device.assign_id', '=', $assign_id);
        }
        $devices = $query->select('id', 'port_status')->orderBy('device.created_at', 'desc')->get();
        return response()->json($devices);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function precontrol(Request $request) {
        $id = Input::get('id');
        $device = \App\Device::find($id);

//        if (Auth::user()->can('device-manager')) {
//            $query = \App\Device::query();
//        } else {
//            $query = \App\Device::where('assign_id', '=', Auth::user()->id)
//                    ->whereIn('status', [Device::STATUS_ACTIVED, Device::STATUS_LOST]);
//        }
        return view('control.control')->with('device', $device);
    }

    public function control(Request $request) {
        try {
            $port = $request->get('port');
            $type = $request->get('type');
            $time = $request->get('time');
            $device = \App\Device::find(Input::get('device_id'));

            if ($this->checkPermissonDevice(Input::get('device_id'), $device) == false) {
                Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                return redirect('control/index');
            }
            //Log::info('------------------------------------Dieu khien ngay device: '. Input::get('device_id') . " - port: " . $port . " - type: " . $type. " - time: " . $time);
            $timeArr = array();
            foreach ($port as $aPort) {
                array_push($timeArr, $time[$aPort]);
            }
            $data = ['ports' => $port, 'time' => $timeArr];

            $command = $device->driver->buildControlCommand($data, $type);

            $description = $device->driver->createDesCrlCmd($data, $type);
            //Dugn SOAP de send command
            $response = SoapHelper::sendCommand($device->code, $device->driver->mqttout(), SoapHelper::$TYPE_CONTROL, SoapHelper::$TYPE_HIS_CONTROL, $command, $description);

            //@TODO: Comment by thuyetlv for test
            //$device->driver->sendCommand($command);

            $request->flash();

            if ($response->return->errorCode == 0) {
                $message = $response->return->msg;
                Session::flash('flash_message', 'Control Device ' . $device->code . ' successfully!');
                return response()->json($message);
            } else {
                if ($response->return && $response->return->msg) {
                    $message = $response->return->msg;
                } else {
                    $message = "Lỗi hệ thống, vui lòng thử lại sau!";
                }
                return Response::json(['message' => $message], 404); // Status code here
            }

            Session::flash('flash_message', 'Control Device ' . $device->code . ' successfully!');
            return redirect('control/index');
        } catch (\Exception $e) {
            Log::error($e);
            $message = "Lỗi hệ thống, vui lòng thử lại sau!";
            return Response::json(['message' => $message], 404);
        }
    }

    public function index(Request $request) {
        $code = $request->get('code');
        $devicetype_id = $request->get('devicetype_id');
        $assign_id = $request->get('assign_id');

        $devicetypes = \App\DeviceType::query()->lists('name', 'id')->toArray();
        $assigns = \App\Device::getDevices()->lists('name', 'id')->toArray();

        $query = null;
        if (Auth::user()->can('device-manager')) {
            $query = \App\Device::query();
        } else {
            $query = \App\Device::where('assign_id', '=', Auth::user()->id)
                    ->whereIn('status', [Device::STATUS_ACTIVED, Device::STATUS_LOST]);
        }
        if ($code != null) {
            $query = $query->where('device.code', 'like', '%' . $code . '%');
        }
        if ($devicetype_id != null) {
            $query = $query->where('device.devicetype_id', '=', $devicetype_id);
        }
        if ($assign_id != null) {
            $query = $query->where('device.assign_id', '=', $assign_id);
        }
        $devices = $query->orderBy('device.created_at', 'desc')->paginate(10);
        $request->flash();
        return view('control.index')->with('devices', $devices)
                        ->with('assigns', $assigns)
                        ->with('devicetypes', $devicetypes);
    }

    public function index2(Request $request) {
        if (!Auth::user()->can('control-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }

        $devices = \App\Device::getDevices()->orderBy('device.created_at', 'desc')->paginate(10);
        $request->flash();
        return view('control.index2')->with('devices', $devices);
    }

    public function history(Request $request) {
        $device = \App\Device::find($request->get('id'));
        $histories = \App\DeviceControlHistory::where('code', '=', $device->code)->orderBy('created_at', 'desc')->paginate(10);
        return view('control.history')->with('histories', $histories);
    }

    public function test(Request $request) {
        $id = $request->get('id');
        $device = \App\Device::find($id);
        if (!$device) {
            return \Redirect::to('control/index')->withErrors('Thiết bị không tồn tại hoặc không thuộc quản lý của bạn')->withInput();
        }
        $command = $device->driver->buildCmdGetStatus();

        $device->driver->sendCommand($command);
        dd($command);

        Log::info('------------------------------------buildControlCommand for device: ' . $device->id . " - " . $command);

        //@TODO: Comment by thuyetlv for test
        $device->driver->sendCommand($command);

        $request->flash();
        Session::flash('flash_message', 'Control Device ' . $device->code . ' successfully!');
        return redirect('control/index');
    }

    public function receive(Request $request) {
        $id = $request->get('id');
        $device = \App\Device::find($id);
        if (!$device) {
            return \Redirect::to('control/index')->withErrors('Thiết bị không tồn tại hoặc không thuộc quản lý của bạn')->withInput();
        }

        $device->driver->receiveResponse();
    }

}

?>