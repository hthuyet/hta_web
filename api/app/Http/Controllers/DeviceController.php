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
use App\DeviceType;
use App\Helpers\SoapHelper;
use Response;

class DeviceController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request) {
        $code = $request->get('code');
        $devicetype_id = $request->get('devicetype_id');
        $assign_id = $request->get('assign_id');
        $status = $request->get('status');

        $devicetypes = DeviceType::query()->lists('name', 'id')->toArray();
        $assigns = User::query()->lists('username', 'id')->toArray();
        $query = null;
        if (Auth::user()->can('device-manager')) {
            $query = Device::query();
        } else {
            $query = Device::where('assign_id', '=', Auth::user()->id)
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
        if ($status != null) {
            $query = $query->where('device.status', '=', $status);
        }
        $device = $query->orderBy('device.created_at', 'desc')->first();
        $devices = $query->orderBy('device.created_at', 'desc')->paginate(10);
        $request->flash();
        return view('device.index')->with('devices', $devices)
                        ->with('assigns', $assigns)
                        ->with('devicetypes', $devicetypes);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function assign(Request $request) {
        return view('device.assign');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function postassign(Request $request) {
        $code = $request->get('code');
        $device = Device::where('code', '=', $code)
                ->where('assign_id', '=', Auth::user()->id)
                ->first();
        if (!$device) {
            return \Redirect::to('device/assign')->withErrors('Thiết bị không tồn tại hoặc không thuộc quản lý của bạn')->withInput();
        }

        $device->update([
            'long' => $request->get('long'),
            'lat' => $request->get('lat'),
            'status' => Device::STATUS_ACTIVED,
        ]);
        return redirect('device');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request) {
        $devicetypes = DeviceType::query()->lists('name', 'id')->toArray();
        $users = \App\User::query()->lists('username', 'id')->toArray();


        $devices = Device::getDevices()->lists('name', 'id')->toArray();
        return view('device.create')
                        ->with('devices', $devices)
                        ->with('devicetypes', $devicetypes)
                        ->with('users', $users);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        $this->validate($request, [
            'devicetype_id' => 'required',
            'code' => 'required',
            'manufacture_date' => 'required',
        ]);

        $input = $request->all();

        try {
            DB::beginTransaction();

            if ($request->get('warranty_date') != '') {
                $warranty_date = $request->get('warranty_date');
                $warranty_date = Carbon::createFromFormat("d/m/Y", $warranty_date);
                $input['warranty_date'] = $warranty_date;
            } else {
                $input['warranty_date'] = null;
            }


            $manufacture_date = $request->get('manufacture_date');
            $manufacture_date = Carbon::createFromFormat("d/m/Y", $manufacture_date);
            if ($request->get('assign_id')) {
                $input['status'] = Device::STATUS_ASSIGNCUSTOMER;
            } else {
                $input['assign_id'] = null;
            }
            $input['user_id'] = Auth::user()->id;
            $input['manufacture_date'] = $manufacture_date;
            $device = Device::create($input);

            DB::commit();
            Session::flash('flash_message', 'Add new device success!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e);
            return \Redirect::to('device/create')->withErrors('Exception' . $e->getMessage())->withInput();
        }



        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $device = Device::find($id);

        return view('device.show')->with('device', $device);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function edit($id) {
        if (!Auth::user()->can('device-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $device = Device::find($id);
        if (!$device) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect()->back();
        }
        $devicetypes = DeviceType::query()->lists('name', 'id')->toArray();
        $devices = Device::query()->lists('name', 'id')->toArray();
        $users = \App\User::query()->lists('username', 'id')->toArray();
        return view('device.edit')
                        ->with('device', $device)
                        ->with('devicetypes', $devicetypes)
                        ->with('devices', $devices)
                        ->with('users', $users);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function lost(Request $request) {
        $id = $request->get('id');
        $device = Device::find($id);

        $device->update(['status' => Device::STATUS_LOST]);

        Session::flash('flash_message', 'Bạn xóa thiết bị thành công!');
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function unassign(Request $request) {
        $id = $request->get('id');
        $device = Device::find($id);

        $device->update(['assign_id' => null]);
        Session::flash('flash_message', 'Bạn xóa thiết bị thành công!');
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function history(Request $request) {
        return view('device.history');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function update($id, Request $request) {
        $device = Device::find($id);
        if (!$device) {
            Session::flash('error_message', 'Thiết bị không tồn tại hoặc không thuộc quản lý của bạn!');
            return redirect()->back();
        }

        $this->validate($request, [
            'devicetype_id' => 'required',
            'code' => 'required',
            'manufacture_date' => 'required',
        ]);
        $input = $request->all();
        if ($request->get('assign_id')) {
            $input['status'] = Device::STATUS_ACTIVED;
        }
        if ($request->get('warranty_date') != '') {
            $warranty_date = $request->get('warranty_date');
            $warranty_date = Carbon::createFromFormat("d/m/Y", $warranty_date);
            $input['warranty_date'] = $warranty_date;
        } else {
            $input['warranty_date'] = null;
        }

        $manufacture_date = $request->get('manufacture_date');
        $manufacture_date = Carbon::createFromFormat("d/m/Y", $manufacture_date);
        $input['manufacture_date'] = $manufacture_date;
        $device->fill($input)->save();
        Session::flash('flash_message', 'Device updated successfully!');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id, Request $request) {
        $device = Device::find($id);
        try {
            $response = SoapHelper::deleteDevice($id,$device->code);
            if ($response->return->errorCode == 0) {
                $message = $response->return->msg;
                Session::flash('flash_message', 'Delete device successfully!');
                return redirect()->route('device.index');
            } else {
                if ($response->return && $response->return->msg) {
                    $message = $response->return->msg;
                } else {
                    $message = "Lỗi hệ thống, vui lòng thử lại sau!";
                }
                Session::flash('error_message', 'Delete device fail!');
//                return Response::json(['message' => $message], 404); // Status code here
            }
        } catch (\Exception $e) {
            Log::error("ERROR DeviceController delete: " . $e);
        }
    }

    public function toggle(Request $request) {

        $input = $request->all();
        $device = Device::find($input['id']);
        $device->update(array('status' => $device->status == Device::STATUS_OFF ? Device::STATUS_ON : Device::STATUS_OFF));

        Session::flash('flash_message', 'Device updated successfully!');
        return \Redirect::to('control/index');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function info(Request $request) {
        $gateway_id = $request->get('gateway_id');
        $from_date = $request->get('from_date');
        $to_date = $request->get('to_date');
        $type = $request->get('type');
        if ($from_date == null) {
            $type = 1;
        }
        if ($from_date == null) {
            $from_date = Carbon::now()->subMonth('1');
        } else {
            $from_date = Carbon::createFromFormat("d/m/Y", $from_date);
        }
        if ($to_date == null) {
            $to_date = Carbon::now();
        } else {
            $to_date = Carbon::createFromFormat("d/m/Y", $to_date);
        }
        $data = DeviceDataHistory::project(['created_at' => array('$week' => '$created_at')])
                        ->where('gateway_id', '=', $gateway_id)
                        ->where('created_at', '>=', $from_date)
                        ->where('created_at', '<=', $to_date)
                        ->take(20)
                        ->get()->reverse()->toArray();
        dd($data);

        $datas = DeviceDataHistory::query()
                        ->where('gateway_id', '=', $gateway_id)
                        ->where('created_at', '>=', $from_date)
                        ->where('created_at', '<=', $to_date)
                        ->orderBy('created_at', 'desc')
                        ->take(20)
                        ->get()->reverse()->toArray();
//        dump($datas);
        return view('device.info')
                        ->with('datas', json_encode($datas));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function ajaxrealtime(Request $request) {
        $device_id = $request->get('id');
        $number = $request->get('number');
        $time = $request->get('time');
        $query = DeviceDataHistory::query()->where('device_id', '=', $device_id);
        if ($time) {
            $query->where('created_at', '>=', Carbon::createFromTimestamp($time));
        }
        $datas = $query->orderBy('created_at', 'desc')
                        ->take((int) $number)
                        ->get()->reverse()->toArray();
        return response()
                        ->json($datas);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function realtime(Request $request) {
        return view('device.realtime');
    }
}

?>