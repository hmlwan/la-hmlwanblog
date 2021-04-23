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
    //分类管理
    Route::prefix('category')->group(function (){
        //列表
        Route::get('index','Admin\CategoryController@index');
        //添加
        Route::get('create_view','Admin\CategoryController@create_view');
        Route::post('store','Admin\CategoryController@store');
        //编辑
        Route::get('edit_view/{id}','Admin\CategoryController@edit_view');
        Route::post('update','Admin\CategoryController@update');

        //删除
        Route::get('del/{id}','Admin\CategoryController@del');
        //发布
        Route::get('pub/{id}','Admin\CategoryController@pub');
        //下架
        Route::get('down/{id}','Admin\CategoryController@down');
    });
    //文章管理
    Route::prefix('article')->group(function(){
        //列表
        Route::get('index','Admin\ArticleController@index');
        //添加
        Route::get('create_view','Admin\ArticleController@create_view');
        Route::post('store','Admin\ArticleController@store');
        //编辑
        Route::get('edit_view/{id}','Admin\ArticleController@edit_view');
        Route::post('update','Admin\ArticleController@update');

        //删除
        Route::get('del/{id}','Admin\ArticleController@del');
        //发布
        Route::get('pub/{id}','Admin\ArticleController@pub');
        //下架
        Route::get('down/{id}','Admin\ArticleController@down');
    });
    //系统配置
    Route::prefix('config')->group(function(){

    });
    //标签管理
    Route::prefix('tag')->group(function(){
        //列表
        Route::get('index','Admin\TagController@index');
        //添加
        Route::get('create_view','Admin\TagController@create_view');
        Route::post('store','Admin\TagController@store');
        //编辑
        Route::get('edit_view/{id}','Admin\TagController@edit_view');
        Route::post('update','Admin\TagController@update');

        //删除
        Route::get('del/{id}','Admin\TagController@del');
        //发布
        Route::get('pub/{id}','Admin\TagController@pub');
        //下架
        Route::get('down/{id}','Admin\TagController@down');
    });
    //管理员
    Route::prefix('user')->group(function(){

    });
    //友情链接管理
    Route::prefix('friendshiplink')->group(function(){

    });
    //评论管理
    Route::prefix('comment')->group(function(){

    });
});
