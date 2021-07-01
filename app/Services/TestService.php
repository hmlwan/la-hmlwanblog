<?php
namespace App\Services;
use App\Contracts\Test;

class TestService implements  Test{

    public function doing(){
        echo  'this is onetest';
    }

}
