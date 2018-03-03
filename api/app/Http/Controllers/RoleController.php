<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Input;
use Auth;
use DB;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        if(!Auth::user()->can('role-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $role = \App\Role::orderBy('created_at', 'desc')->paginate(25);
        return view('role.index',compact('role'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        if(!Auth::user()->can('role-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $permissions = \App\Permission::all();
        return view('role.create')->with('permissions',$permissions);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {

        $formData = array(
            'name' => Input::get('name'),
            'description' => Input::get('description'),
        );

        $rules = array(
            'name' => 'required',
            'description' => 'required',
        );

        $messages = [
            'name.required' => 'Please enter Name!',
            'description.required' => 'Please enter your Description!',
        ];

        $validation = Validator::make($formData, $rules, $messages);

        if ($validation->fails()) {
            return \Redirect::to('role/create')->withErrors($validation)->withInput();
        }
        Role::create($formData);
        return \Redirect::to('role/create')->with('status', 'Creat FAQ Success!');
    }


    public function edit($id)
    {
        if(!Auth::user()->can('role-manager')){
             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $model = Role::find($id);
        $permissions = \App\Permission::all();
        return view('role.edit',compact('model','permissions'));
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */


    public function update()
    {
        $formData = array(
            'name' => Input::get('name'),
            'description' => Input::get('description'),
        );

        $id = Input::get('id');

        $rules = array(
            'name' => 'required',
            'description' => 'required',
        );

        $messages = [
            'name.required' => 'Please enter Name!',
            'description.required' => 'Please enter your Description!',
        ];
        
        $validation = Validator::make($formData, $rules, $messages);

        if ($validation->fails()) {
            return \Redirect()->back()->withErrors($validation)->withInput();
        }
        
        $role = Role::findOrFail($id); // Pull back a given role
        $role->update($formData);
        $permissions = Input::get('permissions');
        $role->perms()->sync($permissions); // Delete relationship data

        return \Redirect()->back()->with('status', 'Update FAQ Success!');
    }



    public function show($id) {
//        if(!Auth::user()->can('role-manager')){
//             return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
//        }
        $notification = \App\Notification::find($id);

        $permissions = \App\Permission::all();
        return view('notification.show')
            ->with('notification', $notification)
            ->with('permissions', $permissions);
    }

    public function destroy($id)
    {
        Role::find($id)->delete();
        return \Redirect()->back()->with('status', 'Delete FAQ Success!');
    }


}

?>