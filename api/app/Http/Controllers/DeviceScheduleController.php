<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Auth;
use DB;
use Input;
use Log;
use Carbon\Carbon;
use App\User;
use App\Device;
use App\DeviceSchedule;
use App\DeviceType;
use App\Helpers\SoapHelper;
use Response;

class DeviceScheduleController extends Controller {

    public function index(Request $request) {
        $device_id = Input::get('id');
        $limit = ($request->get("limit")) ? ($request->get("limit")) : 10;
        if ($device_id != null) {
            if ($this->checkPermissonDevice($device_id) === false) {
                Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
                return redirect('control/index');
            }
        }
        $query = \App\DeviceSchedule::getDeviceSchedule($device_id);
        $schedules = $query->paginate($limit);
        return view('deviceSchedule.index')->with('schedules', $schedules)->with('device_id', $device_id);
    }

    public function create(Request $request) {
        $id = Input::get('id');
        $device = Device::find($id);
        if ($this->checkPermissonDevice($id, $device) == false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('control/index');
        }
        return view('deviceSchedule.create')->with('device', $device);
    }

    public function store(Request $request) {
        $input = $request->all();
        $device = Device::find($request->get('device_id'));
        if ($this->checkPermissonDevice($request->get('device_id'), $device) == false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('control/index');
        }
        try {
            $message = "";
            $relay = $request->get('relay');
            $block = $request->get('block');
            $enable = $request->get('enable');
            $number = $request->get('number');
            $blocks = array();
            foreach ($block as $key => $item) {
                $blocks["block" . ($key + 1)] = array($item,
                    isset($enable[$key]) ? str_replace(":", "", $enable[$key]) : "0",
                    isset($number[$key]) ? $number[$key] : "0");
            }
            //ThuyetLV: dat lich thiet bi (CMD = 3)
            $command = $device->driver->buildDeviceScheduleCommand($relay, $blocks);
            $description = $device->driver->buildDeviceScheduleDes($relay, $blocks, $enable);
            $data = array(
                "block" => $block,
                "enable" => $enable,
                "number" => $number,
            );

            $message = "";
            $response = SoapHelper::sendCommand($device->code, $device->driver->mqttout(), SoapHelper::$TYPE_CONFIG_MODE, SoapHelper::$TYPE_HIS_SCHE_DEVICE, $command, $description);
            if ($response->return->errorCode == 0) {
                //Luu thong tin vao DB
                DeviceSchedule::create([
                    'device_id' => $device->id,
                    'serial' => $device->code,
                    'relay' => $relay,
                    'data' => json_encode($data),
                    'command' => $command,
                    "topic" => $device->driver->mqttout(),
                    "description" => $description,
                ]);
                //Set response
                $message = $response->return->msg;
                Session::flash('flash_message', 'Đặt lịch thiết bị thành công!');
                return response()->json($message);
            } else {
                //Set response
                if ($response->return && $response->return->msg) {
                    $message = $response->return->msg;
                } else {
                    $message = "Lỗi hệ thống, vui lòng thử lại sau!";
                }
                return Response::json(['message' => $message], 404); // Status code here
            }
        } catch (\Exception $e) {
            Log::error($e);
            $message = "Lỗi hệ thống, vui lòng thử lại sau!";
            return Response::json(['message' => $message], 404);
        }
    }

    public function edit($id) {
        $schedule = DeviceSchedule::find($id);
        $device = Device::find($schedule->device_id);
        if ($this->checkPermissonDevice($schedule->device_id, $device) == false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('control/index');
        }
        return view('deviceSchedule.edit')
                        ->with('schedule', $schedule)
                        ->with('device', $device);
    }

    public function update($id, Request $request) {
        $schedule = DeviceSchedule::find($id);
        if (!$schedule) {
            return \Redirect::to('control/index')->withErrors('Lịch thiết bị không tồn tại!');
        }
        $device = Device::find($request->get('device_id'));
        if ($this->checkPermissonDevice($request->get('device_id'), $device) == false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('control/index');
        }
        try {
            $message = "";
            //@TODO: ThuyetLV: Xu ly dat lich thiet bi
            $relay = $request->get('relay');
            $block = $request->get('block');
            $enable = $request->get('enable');
            $number = $request->get('number');

            $blocks = array();
            foreach ($block as $key => $item) {
                //array ["Ena ", " sHHmmSS ", " numberS "]
                $blocks["block" . ($key + 1)] = array($item,
                    isset($enable[$key]) ? str_replace(":", "", $enable[$key]) : "0",
                    isset($number[$key]) ? $number[$key] : "0");
            }
            //ThuyetLV: dat lich thiet bi (CMD = 3)
            $command = $device->driver->buildDeviceScheduleCommand($relay, $blocks);
            $description = $device->driver->buildDeviceScheduleDes($relay, $blocks, $enable);

            $data = array(
                "block" => $block,
                "enable" => $enable,
                "number" => $number,
            );

            $message = "";

            $response = SoapHelper::sendCommand($device->code, $device->driver->mqttout(), SoapHelper::$TYPE_CONFIG_MODE, SoapHelper::$TYPE_HIS_SCHE_DEVICE, $command);
            if ($response->return->errorCode == 0) {
                //Luu thong tin vao DB
                $schedule->serial = $device->code;
                $schedule->topic = $device->driver->mqttout();
                $schedule->relay = $relay;
                $schedule->data = json_encode($data);
                $schedule->command = $command;
                $schedule->description = $description;
                $schedule->save();
//                $message = $response->return->msg;
                Session::flash('flash_message', 'Cập nhật lịch thiết bị thành công!');
                return response()->json($message);
            } else {
                if ($response->return && $response->return->msg) {
                    $message = $response->return->msg;
                } else {
                    $message = "Lỗi hệ thống, vui lòng thử lại sau!";
                }
                return Response::json(['message' => $message], 404); // Status code here
            }
        } catch (\Exception $e) {
            Log::error($e);
            $message = "Lỗi hệ thống, vui lòng thử lại sau!";
            return Response::json(['message' => $message], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id, Request $request) {
        $schedule = DeviceSchedule::find($id);
        if (!$schedule) {
            return \Redirect::to('control/index')->withErrors('Lịch thiết bị không tồn tại!');
        }
        $device = Device::find($schedule->device_id);
        if ($this->checkPermissonDevice($schedule->device_id, $device) == false) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect('control/index');
        }

        $schedule->delete();
        Session::flash('flash_message', 'Xóa lịch thiết bị thành công!');
        return redirect()->route('deviceSchedule.index', array("id" => $device->id));
    }

}

?>