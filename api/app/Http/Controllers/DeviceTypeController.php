<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Auth;

class DeviceTypeController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $devicetypes = \App\DeviceType::query()
                ->orderBy('created_at', 'desc')->paginate(10);
        //dd($devicetypes);
        return view('devicetype.index')->with('devicetypes', $devicetypes);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $devicetypes = \App\User::query()->lists('name', 'id')->toArray();
        return view('devicetype.create')->with('devicetypes', $devicetypes);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        $this->validate($request, [
            'code' => 'required',
            'name' => 'required',
            
        ]);

        $input = $request->all();
        $devicetype = \App\DeviceType::create($input);

        Session::flash('flash_message', 'Add new devicetype success!');

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $devicetype = \App\DeviceType::find($id);

        return view('devicetype.show')->with('devicetype', $devicetype);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function edit($id)
    {
        if(!Auth::user()->can('devicetype-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $devicetype= \App\DeviceType::find($id);
        return view('devicetype.edit')->with('devicetype', $devicetype);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function update($id, Request $request)
    {
        $devicetype = \App\DeviceType::find($id);

        $this->validate($request, [
            'code' => 'required',
            'name' => 'required',
        ]);

        $input = $request->all();
        $devicetype->fill($input)->save();
        Session::flash('flash_message', 'DeviceType updated successfully!');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id, Request $request)
    {
        $devicetype = \App\DeviceType::find($id);

        $devicetype->delete();
        Session::flash('flash_message', 'Delete devicetype successfully!');
        return redirect()->route('devicetype.index');
    }

}

?>