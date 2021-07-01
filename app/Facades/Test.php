<?php
namespace App\Facades;

use Illuminate\Support\Facades\Facade;

//自定义门面
class Test extends Facade{

    protected  static function  getFacadeAccessor(){
        return 'App\Contracts\Test'; //返回契约Test
    }

}


