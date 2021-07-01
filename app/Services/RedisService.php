<?php
namespace App\Services;
use Illuminate\Support\Facades\Redis;

class RedisService{

    //生产者发布
    public function publish(){
        try {
            for ($i = 0;$i < 5;$i++){
                $ret = Redis::publish('news',json_encode(array(
                    'title' => '我是新闻标题' . $i,
                    'content' => '我是新闻内容' . $i,
                    'time' => date('Y-m-d H:i:s'),
                )));
                print_r($ret . "\n");
            }

        }catch (\Exception $exception){
            echo $exception->getMessage();
        }

    }
    //消费者订阅
    public function subScribe(){
        echo '开始：';
        try {
            Redis::subscribe(['news'], function ($msg) {
                $msg = json_decode($msg, true);
                echo "标题: {$msg['title']} 内容: {$msg['content']} 时间: {$msg['time']} \n";
            });

        }catch (\Exception $exception){
            echo $exception->getMessage();
        }

    }


}






