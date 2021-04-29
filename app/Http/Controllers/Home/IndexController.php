<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    //首页
    public function index(){
        return view('home.index.index');
    }
    //留言
    public function message(){
        return view('home.index.message');
    }
    //友链
    public function link(){
        return view('home.index.link');
    }

    //关于
    public function about(){
        return view('home.index.about');

    }
    //时间轴
    public function times(){
        return view('home.index.times');

    }


}
