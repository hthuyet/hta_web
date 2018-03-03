<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Response;
use Log;
use Auth;
use Input;
use Flash;
use \Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use App\Role;
use Illuminate\Support\Facades\Validator;
use Hash;

class UserController extends Controller {

    public function index(Request $request) {
        if (!Auth::user()->can('user-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $key = $request->get('username');
        $query = \App\User::query()->where('company_id', '=', Auth::user()->company_id);
        if ($key != null) {
            $query = $query->where('username', 'like', '%' . $key . '%');
        }
        $users = $query->orderBy('created_at', 'desc')->paginate(10);
        $request->flash();
        //dd($users); 
        return view('user.index')->with('users', $users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $user = Auth::user();
        $roles = \App\Role::query()->lists('name', 'id')->toArray();
        return view('user.create')->with('roles', $roles);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        $input = $request->all();
        $rules = array(
            'username' => 'required|unique:users',
            'password' => 'required',
            'repassword' => 'same:password',
            'email' => 'required|email|unique:users',
        );
        $validation = Validator::make($input, $rules);
        $input['company_id'] = Auth::user()->company_id;
        $input['password'] = bcrypt($input['password']);


        // var_dump($validation);
        if ($validation->fails()) {
            return \Redirect::to('user/create')->withErrors($validation)->withInput();
        }


        $user = \App\User::create($input);
        $url_root = url();
        // var_dump($v);
        // role attach alias
        $roleUser = \App\Role::where('name', '=', 'user')->first();
        $user->attachRole($roleUser); // parameter can be an Role object, array, or id
        \App\Log::create(array(
            'ip' => $request->getClientIp(),
            'code' => \App\Log::CODE_CREATE_USER,
            'create_date' => new \DateTime(),
            'username' => $request->user()->username,
            'browser' => $request->header('User-Agent'),
        ));
        return \Redirect()->back()->with('status', 'Register Success!')->with('url', $url_root);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function show($id) {
        if (!Auth::user()->can('user-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $user = \App\User::find($id);

        return view('user.show')->with('user', $user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function edit($id) {
        if (!Auth::user()->can('user-manager')) {
            return \Redirect::to('member/dashboard')->withErrors('You don\'t have permission');
        }
        $user = \App\User::find($id);
        $roles = \App\Role::query()->lists('name', 'id')->toArray();
        return view('user.edit')->with('user', $user)->with('roles', $roles);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int $id
     * @return Response
     */
    public function update($id, Request $request) {
        $user = \App\User::find($id);

        $this->validate($request, [
            'username' => 'required',
            'email' => 'required|email',
        ]);

        $input = $request->all();
        if ($input['password']) {
            $input['password'] = bcrypt($input['password']);
        }
        $user->fill($input)->save();
        \App\Log::create(array(
            'ip' => $request->getClientIp(),
            'code' => \App\Log::CODE_UPDATE_USER,
            'create_date' => new \DateTime(),
            'username' => $request->user()->username,
            'browser' => $request->header('User-Agent'),
        ));
        if ($input['role_user']) {
            $user->detachRoles($user->roles);
            $user->roles()->attach($input['role_user']);
        }
        Session::flash('flash_message', 'User updated successfully!');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id, Request $request) {
        $user = \App\User::find($id);

        $user->delete();
        \App\Log::create(array(
            'ip' => $request->getClientIp(),
            'code' => \App\Log::CODE_REMOVE_USER,
            'create_date' => new \DateTime(),
            'username' => $request->user()->username,
            'browser' => $request->header('User-Agent'),
        ));

        Session::flash('flash_message', 'Delete user successfully!');
        return redirect()->route('user.index');
    }

    public function prechangepass(Request $request) {
        $user = Auth::user();
        return view('user.changepass')->with('user', $user);
    }

    public function checkpass(Request $request) {
        $user = Auth::user();
        $input = $request->all();
        $check = false;
        $message = "";
        if ($input['passwordOld']) {
            $passwordOld = $input['passwordOld'];
            if (!Hash::check($passwordOld, $user->password)) {
                $message = "Mật khẩu không đúng!";
            } else {
                $check = true;
            }
        } else {
            $message = "Vui lòng nhập mật khẩu!";
        }
        return response()->json(["code" => $check, "message" => $message]);
    }

    public function changepass(Request $request) {
        $user = Auth::user();
        $input = $request->all();
        $passwordOld = "";
        if ($input['passwordOld']) {
            $passwordOld = $input['passwordOld'];
        }
        if ($input['password']) {
            if (Hash::check($passwordOld, $user->password)) {
                $password = bcrypt($input['password']);
                $user->password = $password;
                $user->save();
                Session::flash('flash_message', 'Change pass user successfully!');
            } else {
                Session::flash('error_message', 'Sai pasword!');
            }
        } else {
            Session::flash('error_message', 'New pass is requried!');
        }
        return redirect()->route('user.changepass');
    }

}

?>