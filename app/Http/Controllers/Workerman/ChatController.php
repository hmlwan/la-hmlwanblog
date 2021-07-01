<?php

namespace App\Http\Controllers\Workerman;

use App\Http\Controllers\Controller;
use App\Models\ChatMessage;
use App\Models\SocialiteUser;
use App\Models\User;
use GatewayWorker\Lib\Gateway;
use Illuminate\Http\Request;
use function React\Promise\all;

class ChatController extends Controller
{
    //
    public function index($room_id){

        $uid = session()->get('id');
        $uname = session()->get('name');
        session()->put('room_id',$room_id);
        return view('home.index.chat',['uid'=>$uid,'uname'=>$uname]);
    }
    //聊天初始化
    public function init(Request $request){
        //绑定用户
        $this->bind($request);
        //登录
        if( session('id')){
            $this->login();
        }
        //online_user
        $this->online_user();
        $this->history();

    }
    public function history(){
        $all = ChatMessage::query()->where(array(
            'room_id' => session()->get('room_id'),
            'uid' =>session('id')
        ))->get();
        $all = $all->map(function ($item,$k){
            $client_name = SocialiteUser::where('id','=',$item->uid)->value('name');
            $content = $item->content;
            return array(
                'client_name' => $client_name,
                'time' => $item->created_at,
                'content'=> $content
            );
        });

        $data = array(
            'type'=>'history',
            'data'=>$all?$all:[]
        );
        Gateway::sendToGroup(session()->get('room_id'),json_encode($data));
    }
    public function reg(Request $request){
        $name = $request->post('name');
        if(!$name || $name == 'null'){
            return response()->json(array('ret'=>0));
        }
        $data = array('name'=>$name);
        $info = SocialiteUser::firstOrCreate($data);

        session()->put('id',$info->id);
        session()->put('name',$info->name);
        return response()->json(array('ret'=>1,'name'=>$info->name));
    }
    //用户绑定
    public function bind($request){
        $client_id = $request->post('client_id');
        //客户端与用户绑定
//        Gateway::bindUid($client_id,session('id'));
        Gateway::joinGroup($client_id,session()->get('room_id'));

        //加入房间
        Gateway::setSession($client_id,array(
            'id'=>  session('id'),
            'name'=>  session('name'),
            'room_id'=>session('room_id')
        ));
    }
    //进入
    public function login(){

        $data = array(
            'type'=>'login',
            'data'=>array(
                'client_name' => session()->get('name'),
                'time' => date("Y-m-d H:i:s",time()),
                'content'=> '进入了这个聊天室'
            )
        );
        Gateway::sendToGroup(session()->get('room_id'),json_encode($data));
    }
    public function say(Request $request){
        $to_user_id = $request->post('to_user_id');
        $content = $request->post('content');

        $data = array(
            'type'=>'say',
            'data' => array(
                'content' => nl2br(htmlspecialchars($content)),
                'client_name' => session()->get('name'),
                'time' => date('Y-m-d H:i:s',time())
            )
        );
        //存储聊天记录
        ChatMessage::query()->updateOrCreate(array(
            'uid' => session()->get('id'),
            'to_uid' => $to_user_id,
            'room_id' => session()->get('room_id'),
            'content' => $content,
        ));
        //对某人聊天
        if($to_user_id != 'all'){
            $content = $data['data']['content'];
            $to_user_name = $request->post('to_client_name');
            $data['data']['content'] = "<b>你对{$to_user_name}说</b>：".$content;
            Gateway::sendToClient(session('id'),json_encode($data));
            $data['data']['content'] = "<b>对你说</b>：".$content;
            Gateway::sendToCurrentClient($to_user_id,json_encode($data));
            return ;
        }else{
            Gateway::sendToGroup(session()->get('room_id'),json_encode($data));
        }
    }
    //在线列表
    public function online_user(){

        $online_list = Gateway::getClientSessionsByGroup(session()->get('room_id'));
        $data = array(
            'type' => 'online_user',
            'data' => $online_list,

        );
        Gateway::sendToGroup(session()->get('room_id'),json_encode($data));
    }


}
