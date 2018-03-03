<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Auth;

class DeviceSpecificationController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $devicespecifications = \App\DeviceType::query()
                ->orderBy('created_at', 'desc')->paginate(10);
        //dd($devicespecifications);
        return view('devicespecification.index')->with('devicespecifications', $devicespecifications);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $devicespecifications = \App\User::query()->lists('name', 'id')->toArray();
        return view('devicespecification.create')->with('devicespecifications', $devicespecifications);
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
        $devicespecification = \App\DeviceType::create($input);

        Session::flash('flash_message', 'Add new devicespecification success!');

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $devicespecification = \App\DeviceType::find($id);

        return view('devicespecification.show')->with('devicespecification', $devicespecification);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function edit($id)
    {
        if(!Auth::user()->can('devicespecification-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $devicespecification= \App\DeviceType::find($id);
        return view('devicespecification.edit')->with('devicespecification', $devicespecification);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function update($id, Request $request)
    {
        $devicespecification = \App\DeviceType::find($id);

        $this->validate($request, [
            'name' => 'required',
        ]);

        $input = $request->all();
        $devicespecification->fill($input)->save();
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
        $devicespecification = \App\DeviceType::find($id);

        $devicespecification->delete();
        Session::flash('flash_message', 'Delete devicespecification successfully!');
        return redirect()->route('devicespecification.index');
    }

}

?>