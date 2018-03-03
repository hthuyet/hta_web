<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;
use DB;

class PasswordController extends Controller {
    /*
      |--------------------------------------------------------------------------
      | Password Reset Controller
      |--------------------------------------------------------------------------
      |
      | This controller is responsible for handling password reset requests
      | and uses a simple trait to include this behavior. You're free to
      | explore this trait and override any methods you wish to tweak.
      |
     */

use ResetsPasswords;

    /**
     * Create a new password controller instance.
     *
     * @param  \Illuminate\Contracts\Auth\Guard  $auth
     * @param  \Illuminate\Contracts\Auth\PasswordBroker  $passwords
     * @return void
     */
    public function __construct(Guard $auth, PasswordBroker $passwords) {
        $this->auth = $auth;
        $this->passwords = $passwords;

        $this->middleware('guest');
    }

    /**
     * Display the form to request a password reset link.
     *
     * @return Response
     */
    public function getEmail() {
        $background = $this->getConfigByKey('BANNER');
        $logo = $this->getConfigByKey('LOGO');
        return view('auth.password')->with('background', $background)->with('logo', $logo);
    }

    /**
     * Display the password reset view for the given token.
     *
     * @param  string  $token
     * @return Response
     */
    public function getReset($token = null) {
        if (is_null($token)) {
            throw new NotFoundHttpException;
        }
        $emailReset = DB::table('password_resets')->where('token', '=', $token)->first()->email;
        
        $background = $this->getConfigByKey('BANNER');
        $logo = $this->getConfigByKey('LOGO');
        return view('auth.reset')->with('token', $token)->with('emailReset', $emailReset)->with('background', $background)->with('logo', $logo);
    }

}
