<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    //首页
    public function index(){
        return view('home.article.index');
    }

    public function show($cid){
        return view('home.article.article');
    }
    public function read($aid){
        return view('home.article.read');
    }

}
