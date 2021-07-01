<?php
namespace App\Services;
use App\Contracts\Test;

class TwoTestService implements  Test{
    public function doing(){
        echo  'this is twotest';
    }

}
