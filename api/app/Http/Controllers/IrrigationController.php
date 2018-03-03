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
use App\Irrigation;
use App\IrrigationType;

class IrrigationController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request) {
        $code = $request->get('code');
        $area_name = $request->get('area_name');
        $status = $request->get('status');

        $query = Irrigation::getIrrigations();
        if ($code != null) {
            $query = $query->where('irrigation.code', 'like', '%' . $code . '%');
        }
        if ($area_name != null) {
            $query = $query->where('irrigation.area_name', 'like', '%' . $area_name . '%');
        }
        if ($status != null) {
            $query = $query->where('irrigation.status', '=', $status);
        }
        $irrigations = $query->orderBy('irrigation.created_at', 'desc')->paginate(10);
        $request->flash();
        return view('irrigation.index')->with('irrigations', $irrigations);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request) {
        $devices = \App\Device::getDevices()->lists('code', 'id')->toArray();
        $irrigations = Irrigation::getIrrigations()->lists('name', 'id')->toArray();
        return view('irrigation.create')
                        ->with('irrigations', $irrigations)
                        ->with('devices', $devices);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        $this->validate($request, [
            'code' => 'required',
            'area_name' => 'required',
            'from_date' => 'required',
            'to_date' => 'required',
        ]);

        $input = $request->all();

        try {
            DB::beginTransaction();

            if ($request->get('from_date') != '') {
                $from_date = $request->get('from_date');
                $from_date = Carbon::createFromFormat("d/m/Y", $from_date);
                $input['from_date'] = $from_date;
            } else {
                $input['from_date'] = null;
            }

            if ($request->get('to_date') != '') {
                $to_date = $request->get('to_date');
                $to_date = Carbon::createFromFormat("d/m/Y", $to_date);
                $input['to_date'] = $to_date;
            } else {
                $input['to_date'] = null;
            }

            $input['status'] = Irrigation::STATUS_ON;
            $input['user_id'] = Auth::user()->id;
            $irrigation = Irrigation::create($input);

            $items = $input['items'];
            foreach ($items as $aItem) {
                $device = \App\Device::find($aItem['device_id']);
                $commandOn = $device->driver->buildCmdControl($aItem['port'], $aItem['time'], 1);
                $commandOff = $device->driver->buildCmdControl($aItem['port'], $aItem['time'], 0);
                $description = $device->driver->createDesCmdControl($aItem['port'], $aItem['time'], 1);

                \App\IrrigationDetail::create([
                    'irrigation_id' => $irrigation->id,
                    'step' => $aItem['step'],
                    'device_id' => $aItem['device_id'],
                    'weight' => $aItem['weight'],
                    'condition' => $aItem['condition'],
                    'from' => $aItem['from'],
                    'to' => $aItem['to'],
                    'time' => $aItem['time'],
                    'port' => $aItem['port'],
                    "topic" => $device->driver->mqttout(),
                    "serial" => $device->code,
                    "command" => $commandOn,
                    "command_off" => $commandOff,
                    "is_start" => 0,
                    "count" => 0,
                    "description" => $description
                ]);
            }

            DB::commit();
            Session::flash('flash_message', 'Add new irrigation success!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e);
            return \Redirect::to('irrigation/create')->withErrors('Exception' . $e->getMessage())->withInput();
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
        $irrigation = Irrigation::find($id);

        return view('irrigation.show')->with('irrigation', $irrigation);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function edit($id) {
        if (!Auth::user()->can('irrigation-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $irrigation = Irrigation::find($id);
        $devices = \App\Device::getDevices()->lists('code', 'id')->toArray();
        return view('irrigation.edit')
                        ->with('irrigation', $irrigation)
                        ->with('devices', $devices);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function update($id, Request $request) {

        $irrigation = Irrigation::find($id);

        $this->validate($request, [
            'code' => 'required',
            'area_name' => 'required',
            'from_date' => 'required',
            'to_date' => 'required',
        ]);
        $input = $request->all();
        if ($request->get('from_date') != '') {
            $from_date = $request->get('from_date');
            $from_date = Carbon::createFromFormat("d/m/Y", $from_date);
            $input['from_date'] = $from_date;
        }

        if ($request->get('to_date') != '') {
            $to_date = $request->get('to_date');
            $to_date = Carbon::createFromFormat("d/m/Y", $to_date);
            $input['to_date'] = $to_date;
        }
        $irrigation->fill($input)->save();


        $items = $input['items'];

        foreach ($items as $aItem) {
            $device = \App\Device::find($aItem['device_id']);
            $commandOn = $device->driver->buildCmdControl($aItem['port'], $aItem['time'], 1);
            $commandOff = $device->driver->buildCmdControl($aItem['port'], $aItem['time'], 0);
            $description = $device->driver->createDesCmdControl($aItem['port'], $aItem['time'], 1);

            if ($aItem['id']) {
                $irrigationDetail = \App\IrrigationDetail::find($aItem['id']);
                if ($irrigationDetail->is_start == null) {
                    $irrigationDetail->is_start = 0;
                }
                if ($irrigationDetail->count == null) {
                    $irrigationDetail->count = 0;
                }
                $irrigationDetail->update([
                    'step' => $aItem['step'],
                    'device_id' => $aItem['device_id'],
                    'weight' => $aItem['weight'],
                    'condition' => $aItem['condition'],
                    'from' => $aItem['from'],
                    'to' => $aItem['to'],
                    'time' => $aItem['time'],
                    'port' => $aItem['port'],
                    "topic" => $device->driver->mqttout(),
                    "serial" => $device->code,
                    "command" => $commandOn,
                    "command_off" => $commandOff,
                    "is_start" => $irrigationDetail->is_start,
                    "count" => $irrigationDetail->count,
                    "description" => $description
                ]);
                continue;
            }
            \App\IrrigationDetail::create([
                'irrigation_id' => $irrigation->id,
                'step' => $aItem['step'],
                'device_id' => $aItem['device_id'],
                'weight' => $aItem['weight'],
                'condition' => $aItem['condition'],
                'from' => $aItem['from'],
                'to' => $aItem['to'],
                'time' => $aItem['time'],
                'port' => $aItem['port'],
                "topic" => $device->driver->mqttout(),
                "serial" => $device->code,
                "command" => $commandOn,
                "command_off" => $commandOff,
                "is_start" => 0,
                "count" => 0,
                "description" => $description
            ]);
        }

        Session::flash('flash_message', 'Irrigation updated successfully!');
//        return redirect()->back();
        return \Redirect::to('irrigation');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id, Request $request) {
        $irrigation = Irrigation::find($id);

        $irrigation->delete();
        Session::flash('flash_message', 'Delete irrigation successfully!');
        return redirect()->route('irrigation.index');
    }

    public function delete(Request $request) {
        $id = $request->get("id");
        $irrigation = Irrigation::find($id);
        if (!$irrigation) {
//            return response()->json(["code" => false, "message" => "Thiết lập tưới không tồn tại!"]);
            Session::flash('flash_message', 'Thiết lập tưới không tồn tại!');
            return redirect()->route('irrigation.index');
        }
        $irrigation->delete();
//        return response()->json(["code" => true, "message" => "Xóa thiết lập tưới thành công!"]);

        Session::flash('flash_message', 'Xóa thiết lập tưới thành công!');
        return redirect()->route('irrigation.index');
    }

    public function toggle(Request $request) {

        $input = $request->all();
        $irrigation = Irrigation::find($input['id']);
        $irrigation->update(array('status' => $irrigation->status == Irrigation::STATUS_OFF ? Irrigation::STATUS_ON : Irrigation::STATUS_OFF));

        Session::flash('flash_message', 'Irrigation updated successfully!');
        return \Redirect::to('irrigation');
    }

}

?>