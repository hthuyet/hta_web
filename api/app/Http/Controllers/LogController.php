<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;

class LogController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $logs = \App\Log::orderBy('create_date', 'desc')->paginate(10);
        //dd($logs); 
        return view('log.index')->with('logs', $logs);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $log = \App\Log::find($id);

        return view('log.show')->with('log', $log);
    }


}

?>