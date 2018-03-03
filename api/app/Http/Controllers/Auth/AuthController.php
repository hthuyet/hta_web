<?php

namespace App\Http\Controllers\Auth;

use \Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Contracts\Auth\Registrar;
use \Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use \Carbon\Carbon;
use Socialite;


class AuthController extends Controller {

    use AuthenticatesAndRegistersUsers;

    /**
     * Show the application login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function getLogin() {
        $background = $this->getConfigByKey('BANNER');
        $logo = $this->getConfigByKey('LOGO');
        return view('auth.login')->with('background', $background)->with('logo', $logo);
    }

    public function postLogin(Request $request) {
        $this->validate($request, [
            'username' => 'required', 'password' => 'required',
        ]);

        $credentials = $request->only('username', 'password');

        if ($this->auth->attempt($credentials, $request->has('remember'))) {
            return redirect()->intended($this->redirectPath());
        }

        return redirect($this->loginPath())
                        ->withInput($request->only('username', 'remember'))
                        ->withErrors([
                            'username' => $this->getFailedLoginMessage(),
        ]);
    }

    /**
     * Create a new authentication controller instance.
     *
     * @param  \Illuminate\Contracts\Auth\Guard  $auth
     * @param  \Illuminate\Contracts\Auth\Registrar  $registrar
     * @return void
     */
    public function __construct(Guard $auth, Registrar $registrar) {
        $this->auth = $auth;
        $this->registrar = $registrar;

        $this->middleware('guest', ['except' => 'getLogout']);
    }

    /**
     * Redirect the user to the GitHub authentication page.
     *
     * @return Response
     */
    public function redirectToProvider()
    {
        return \Socialite::driver('facebook')->redirect();
    }

    /**
     * Obtain the user information from GitHub.
     *
     * @return Response
     */
    public function handleProviderCallback()
    {
        $user = $this->createOrGetUser(\Socialite::driver('facebook')->user());
        $this->auth->login($user);
        return redirect()->to('member/dashboard');

    }

    public function createOrGetUser(\Laravel\Socialite\Two\User $providerUser)
    {
        $account = \App\SocialAccount::query()
            ->where('provider', '=', 'facebook')
            ->where('provider_user_id', '=', $providerUser->getId())
            ->first();


        if ($account) {
            return $account->user;
        } else {
            
            $account = new \App\SocialAccount([
                'provider_user_id' => $providerUser->getId(),
                'provider' => 'facebook'
            ]);
        
            $user = \App\User::query()->where('email', '=', $providerUser->getEmail())->first();
            if (!$user) {
                $user = \App\User::create([
                    'email' => $providerUser->getEmail(),
                    'username' => $providerUser->getEmail(),
                    'name' => $providerUser->getName(),
                ]);
                $roleUser = \App\Role::where('name', '=', 'user')->first();
                $user->attachRole($roleUser);
            }

            $account->user()->associate($user);
            $account->save();

            return $user;
        }
    }


}
