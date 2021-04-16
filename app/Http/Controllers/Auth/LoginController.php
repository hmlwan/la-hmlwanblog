<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;

use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */



    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('guest')->except('logout');
    }
    public function index(Request $request){
        $messages = array(
            'name.required' => '请输入用户名',
            'password.required' => '请输入密码',
        );
        $request->validate([
            'name' => 'required',
            'password' => 'required',
        ],$messages);
        if(Auth::guard('admin')->attempt($request->only('name','password'))){
            return redirect()->intended(url('admin/index/index'));
        }else{
            throw ValidationException::withMessages(['name' => ['用户名或者密码错误']]);
        }
    }
}
