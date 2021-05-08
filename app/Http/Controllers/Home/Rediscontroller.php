<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Redis;
class Rediscontroller extends Controller
{
    //
    public function test(){
        //set存数据 创建一个 key 并设置value
        //锁key
        $lock_key = 'query_cache_lock';
        //缓存查询key
        $cache_key = 'query_cache';

        $info = Redis::get($cache_key);

        if($info){
            return $info;
        }else{

            if(Redis::get($lock_key)){

                echo('服务器异常');

            }else{
                $data = array(
                    'name' => 'jack'
                );
                Redis::setex($lock_key,6,1);
                Redis::setex($cache_key,3,json_encode($data));
                //删除锁
                Redis::del($lock_key);
                return $data;
            }
        }
    }
    /*-------------分布式锁---------------------------------*/

    public function redis_mutex_lock(){
        $key = 'zh';
        $data = array(
            'name'=> 'zh',
            'age'=> 19,
        );
        $this->redis_spike($key,$data);
    }

    /**
     * @param $key  缓存KEY
     * @param $timeout 取锁超时时间。单位(秒)
     * @param $lock_time  锁定时间
     * @param $sleep 微秒  取锁间隔时间
     * 秒杀优惠券 1人只能抢一张
     */
    public function redis_spike($key,$data){

        if(!$key){
            return array(
                'ret' => 0,
                'msg' => '缓存key没有设置',
            );
        }
        $ticket_bind_key = 'ticket_bind_'.$key;
        $is_get = Redis::get($ticket_bind_key);

        if($is_get){
            return response()->json(array(
                'ret' => 0,
                'msg' => '已抢过票',
            ));
        }

        $receive_key = 'receive_key';

        $lock_time = 5;
        try {
            do{
                $tickets = Redis::get('totalTicket');

                if(!$tickets || $tickets == 0){
                    return response()->json(array(
                        'ret' => 0,
                        'msg' => '票已抢完',
                    ));
                }
                $ttl = Redis::ttl($receive_key);
                if($ttl > 0){
                    usleep($ttl*1000*1000);
                }else{

                    //解锁
                    $r = Redis::set($receive_key,1,'EX',$lock_time,'NX');
                    Redis::set('totalTicket',$tickets - 1);
                    Redis::set($ticket_bind_key,json_encode($data));

                    Redis::del($receive_key);

                    return response()->json(array(
                        'ret' =>1,
                        'msg' => '成功抢到优惠券',
                    ));
                }
            }while($tickets > 0);
        }catch (\Exception $e){
            return response()->json([
                $e->getMessage()
            ]);
        }

    }

    public function get_total_ticket(){

        if(Redis::exists('totalTicket')){
            $tickets = Redis::get('totalTicket');
            if($tickets == 0){
                return false;
            }
        }
        return $tickets;
    }


    /*------------------end---------------------*/


}
