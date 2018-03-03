<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Intervention\Image\Facades\Image;
use Auth;

class ConfigController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $key = $request->get('filterKey');
        $description = $request->get('filterDescription');
        $query = \App\Config::query();
        if ($key != null) {
            $query = $query->where('key', 'like', '%' . $key  . '%');
        }
        if ($description != null) {
            $query = $query->where('description', 'like', '%' . $description . '%');
        }
        $configs = $query->orderBy('created_at', 'desc')->paginate(10);
        $request->flash();
        //dd($configs); 
        return view('config.index')->with('configs', $configs);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        return view('config.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $this->validate($request, [
            'key' => 'required',
            'value' => 'required',
        ]);

        $input = $request->all();

        \App\Config::create($input);

        Session::flash('flash_message', 'Success!');

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $config = \App\Config::find($id);

        return view('config.show')->with('config', $config);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $config = \App\Config::find($id);

        return view('config.edit')->with('config', $config);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id, Request $request) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $config = \App\Config::find($id);


        $this->validate($request, [
            'key' => 'required',
            'value' => 'required',
        ]);

        $input = $request->all();

        if ($request->hasFile('value')) {
            $file = $request->file('value');

            $destinationPath = public_path() . '/uploads/images/avantar/';

            $name_avantar = md5(microtime() . $file->getClientOriginalName()) . "." . $file->getClientOriginalExtension();

            $path = $destinationPath . $name_avantar;

            Image::make($file)->save($path);

            $input['value'] = $name_avantar;
        }


        $config->fill($input)->save();

        Session::flash('flash_message', 'Success!');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        if(!Auth::user()->can('config-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $config = \App\Config::find($id);

        $config->delete();

        Session::flash('flash_message', 'Delete Record Success!');
        return redirect()->route('config.index');
    }

}

?>