<?php

namespace App\Http\Controllers\Redis;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
class RedisController extends Controller
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
        Redis::multi();
        Redis::exec();

        dd(2);
        $key = 'hml';
        $data = array(
            'name'=> 'hml',
            'age'=> 17,
        );
        return $this->redis_spike($key,$data);
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
                    Redis::multi();
                    //解锁
                    $r = Redis::set($receive_key,1,'EX',$lock_time,'NX');
                    Redis::set('totalTicket',$tickets - 1);
                    Redis::set($ticket_bind_key,json_encode($data));
                    Redis::exec();
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

    /*-----------------------redis解决超卖问题----------------*/
    public function super_sell_index(){
        $number = DB::table('redis_stores')->where(array('goods_id'=>1))->value('number');

        for ( $i=1;$i<=$number;$i++){

            $r = Redis::lPush('goods_num',1);

        }
        echo Redis::llen('goods_num');

    }
    //记录日志
    function insertLog($event,$type=0){
        $data['event'] = $event;
        $data['type']  = $type;
        $res = DB::table('redis_logs')->insert($data);
    }
    public function order_no(){
        return date("ymd").substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }
    public function super_sell_order(){
        $w = array('goods_id'=>1);
        $info = DB::table('redis_stores')->where($w)->first();

        $sale_num = 1;
        $redis_nums = Redis::rPop('goods_num');
        if($redis_nums <= 0){
            $this->insertLog('error:no goods_number redis');  //如果库存为0写入日志 并停止下单操作
            return;
        }
        if($info->number < $sale_num ){
            $this->insertLog('商品售罄');  //如果库存为0写入日志 并停止下单操作
            return;
        }
        //生成订单
        $user_id = rand(1,200);
        $data = array(
            'order_sn' => $this->order_no(),
            'user_id'=>$user_id,
            'sku_id'=>1,
            'status'=>0,
            'goods_id'=>1,
            'number'=>$sale_num,
            'price'=>$info->price,
            'created_at'=>date("Y-m-d H:i:s",time()),
        );
       $r =  DB::table('redis_orders')->insert($data);
        DB::table('redis_stores')->where($w)->decrement('number',$sale_num);
        if($r){
            $this->insertLog("user_id：{$user_id}抢购成功");  //如果库存为0写入日志 并停止下单操作
            return;
        }else{
            $this->insertLog("user_id：{$user_id}抢购失败");  //如果库存为0写入日志 并停止下单操作
            return;
        }
    }
    /*-----------------------end---------------------*/


    /*----------------redis订阅 sub pub--------------*/
    public function publish(){

        $ix = 0;
        //发布内容
        while (true) {
            $r = Redis::publish('news', json_encode([
                'title' => '我是新闻标题' . $ix,
                'content' => '我是新闻内容' . $ix,
                'time' => date('Y-m-d H:i:s'),
            ]));
            $ix++;
            sleep(1);
        }

   }
    public function subscribe(){

        //订阅内容
       $r =  Redis::subscribe(['news'], function ($msg) {
            $msg = json_decode($msg, true);
            echo "标题: {$msg['title']} 内容: {$msg['content']} 时间: {$msg['time']} <br>";
        });

    }

    /*------------------ end -------------------------*/


}
