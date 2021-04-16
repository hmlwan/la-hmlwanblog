<?php
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Admin 模块 无需auth验证
Route::prefix('admin')->group(function(){
    Route::redirect('/',url('admin/login/index'));
    Route::prefix('login')->group(function (){
        Route::get('index','Admin\LoginController@index');
        Route::get('logout','Admin\LoginController@logout');
    });

});
Route::prefix('auth')->group(function(){
    Route::prefix('login')->group(function(){
        Route::post('index','Auth\LoginController@index');
    });
});

//Admin 模块 需auth验证
Route::prefix('admin')->group(function (){
    //首页管理
    Route::prefix('index')->group(function (){
        Route::get('index','Admin\IndexController@index');
        Route::get('/','Admin\IndexController@index');

    });
    //菜单管理
    Route::prefix('nav')->group(function (){

    });
    //分类管理
    Route::prefix('category')->group(function (){

    });
    //文章管理
    Route::prefix('article')->group(function(){

    });
    //系统配置
    Route::prefix('config')->group(function(){

    });
    //标签管理
    Route::prefix('tag')->group(function(){

    });
    //管理员
    Route::prefix('user')->group(function(){

    });
    //友情链接管理
    Route::prefix('friendshipLink')->group(function(){

    });
    //评论管理
    Route::prefix('comment')->group(function(){

    });
});
