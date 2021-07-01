<?php

namespace App\GatewayWorker;
use GatewayWorker\Lib\Gateway;

class Events{

    public static function onConnect($client_id)
    {
        $data = array(
            'type' =>  'init',
            'data' =>array(
                'client_id' => $client_id
            )
        );
        Gateway::sendToClient($client_id, json_encode($data));
    }

    public static function onWebSocketConnect($client_id, $data)
    {
    }
    public static function onMessage($client_id, $message)
    {
        // 向所有人发送
//        Gateway::sendToAll("$client_id said $message\r\n");
//        $message = json_decode($message);
//        Gateway::sendToAll(json_encode(array('client_id'=>$client_id, 'content' => $message, 'time' => date("Y-m-d H:i:s", time()))));
    }

    public static function onClose($client_id)
    {

        $new_message = array(
            'type'=>'logout',
            'time'=>date('Y-m-d H:i:s'),
            'from_client_name'=>'有人',
            'data'=>Gateway::getAllClientSessions()
        );
        Gateway::sendToAll(json_encode($new_message));
    }
}
