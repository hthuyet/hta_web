<?php

namespace App\Http\Controllers;

use App\Faq;
use App\Http\Controllers\Controller;
use App\Http\Controllers\UserController;
use App\Notification;
use App\Order;
use App\Product;
use App\Reminder;
use App\Tranaction;
use App\User;
use Auth;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Input;
use Intervention\Image\Facades\Image;

class MemberController extends Controller
{

    public function dashboarddd()
    {
        return view('member.dashboarddd');
    }
    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function show($id)
    {
        $user = User::find($id);

        return view('member.show')->with('user', $user);
    }

    public function dashboard()
    {
        $announcement = $this->getConfigByKey('ANNOUNCEMENT');

        return view('member.dashboard')->with('announcement', $announcement);
    }


    public function profile($action)
    {
        $profile           = Auth::user();
        $gender            = $profile->gender;
        switch ($gender) {
            case 0:
                $gender         = "0";
                $genderop_value = "";
                $genderop_name  = "";
                break;
            case 1:
                $gender_name    = "Male";
                $genderop_value = "2";
                $genderop_name  = "Female";
                break;
            case 2:
                $gender_name    = "Female";
                $genderop_value = "1";
                $genderop_name  = "Male";
                break;
        }
        $active = array();


        return view('member.profile',
            compact('profile', 'gender', 'genderop_value',
                'gender_name', 'genderop_name', 'active'));
    }


    public function update(Request $request)
    {


        $user     = Auth::user();
        $formData = array(
            'name' => Input::get('name'),
            'email' => Input::get('email'),
            'phone' => Input::get('phone'),
            'peopleid' => Input::get('peopleid'),
            'blockchain' => Input::get('blockchain'),
            'birthday' => Input::get('birthday'),
            'gender' => Input::get('gender'),
            'address' => Input::get('address'),
            'country' => Input::get('country'),
            'avatar' => Input::file('avatar'),
            'fontside' => Input::file('fontside'),
            'backside' => Input::file('backside'),
        );

        $rules = array(
            'name' => 'required|min:6',
            'email' => 'required|email',
            'peopleid' => 'numeric|min:9',
            'phone' => 'numeric|min:10',
            'address' => 'min:6',
            'avatar' => 'image|max:1000',
            'fontside' => 'image|max:2000',
            'backside' => 'image|max:2000',
        );

        $messages = [
            'name.required' => 'Please enter your Full Name!',
            'name.min' => 'The Name must be at least 6 characters!',
            'email.required' => 'Please enter your Email!',
            'peopleid.numeric' => 'The Pepole ID must be a numeric!',
            'peopleid.min' => 'The Pepole ID must be at least 9 characters!',
            'phone.numeric' => 'The Phone must be a numeric!',
            'phone.min' => 'The Phone must be at least 10 characters!!',
            'blockchain.required' => 'Please enter your Blockchain!',
            'address.required' => 'Please enter your Address!',
            'address.min' => 'The address must be at least 6 characters!',
            'country.required' => 'Please enter your Country!',
            'avatar.image' => 'Avatar must a image file!',
            'fontside.image' => 'Font Side must a image file!',
            'backside.image' => 'Back Side must a image file!',
        ];

        $validation = Validator::make($formData, $rules, $messages);

        if ($validation->fails()) {
            return \Redirect::to('profile/changeprofile')->withErrors($validation)->withInput();
        }


        if ($request->hasFile('avatar')) {
            $file = $request->file('avatar');

            $destinationPath = public_path().'/uploads/images/avatar/';

            $name_avatar = md5(microtime().$file->getClientOriginalName()).".".$file->getClientOriginalExtension();

            $path = $destinationPath.$name_avatar;

            Image::make($file)->resize(300, null,
                function ($constraint) {
                $constraint->aspectRatio();
            })->save($path);

            $formData['avatar'] = $name_avatar;
        }



        if ($request->hasFile('fontside')) {
            $file_fontside = $request->file('fontside');

            $destinationPath = public_path().'/uploads/images/personid/';

            $name_fontside = md5(microtime().$file_fontside->getClientOriginalName()).".".$file_fontside->getClientOriginalExtension();

            $path = $destinationPath.$name_fontside;

            Image::make($file_fontside)->resize(300, null,
                function ($constraint) {
                $constraint->aspectRatio();
            })->save($path);

            $formData['fontside'] = $name_fontside;
        }

        if ($request->hasFile('backside')) {
            $file_backside = $request->file('backside');

            $destinationPath = public_path().'/uploads/images/personid/';

            $name_backside = md5(microtime().$file_backside->getClientOriginalName()).".".$file_backside->getClientOriginalExtension();

            $path = $destinationPath.$name_backside;

            Image::make($file_backside)->resize(300, null,
                function ($constraint) {
                $constraint->aspectRatio();
            })->save($path);



            $formData['backside'] = $name_backside;
        }
        $user->update($formData);

        return \Redirect::to('profile/changeprofile')->with('status',
                'Update Profile Success!');
    }
    /* ---- Change login password */

}
?>