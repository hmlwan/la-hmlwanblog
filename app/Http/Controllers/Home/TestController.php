<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
//use App\Contracts\Test;
use Test;
class TestController extends Controller
{
    //
//    public function __construct(Test $test)
//    {
//        $this->test = $test;
//    }
    public function index(){
        Test::doing();
//        app()->make('App\Contracts\Test')->doing();
//        echo '<br>';
//        $this->test->doing();
//        echo '<br>';

    }

}
