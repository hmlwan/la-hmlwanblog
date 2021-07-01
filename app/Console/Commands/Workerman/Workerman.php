<?php

namespace App\Console\Commands\Workerman;

use Illuminate\Console\Command;
use Workerman\Worker;
use GatewayWorker\BusinessWorker;
use GatewayWorker\Gateway;
use GatewayWorker\Register;

class Workerman extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
//    protected $signature = 'workerman {action} {--start=all : start} {--d}';
    protected $signature = 'workerman {action} {--start=all : start} {--d}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Start a GatewayWorker Server.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        global $argv;
        $action = $this->argument('action');
//        if(!in_array($action,['start','reload','stop'])){
//            $this->error('Error Arguments');
//            exit;
//        }
//        $argv[0] =  'gateway-worker';
        //针对 Windows 一次执行，无法注册多个协议的特殊处理
        if($action == 'single'){
            $start = $this->option('start');
            if($start == 'register'){
                self::start_register();
            }else if($start == 'gateway'){
                self::start_gateway();
            }else if($start == 'worker'){
                self::start_businessworker();
            }else{
                self::start_register();
                self::start_gateway();
                self::start_businessworker();
            }
            Worker::runAll();
            return ;
        }
        $argv[1] =  $action;
        $argv[2] =  $this->option('d') ? '-d' : '';
        $this->start();
    }

    private function start(){
        self::start_register();
        self::start_gateway();
        self::start_businessworker();

        Worker::runAll();
    }
    private function start_businessworker(){
        // bussinessWorker 进程
        $worker = new BusinessWorker();
        // worker名称
        $worker->name = 'YourAppBusinessWorker';
        // bussinessWorker进程数量
        $worker->count = 4;
        // 服务注册地址
        $worker->registerAddress = '127.0.0.1:1236';
        //设置使用哪个类来处理业务，默认值是Events，即默认使用Events.php中的Events类来处理业务。
        //业务类至少要实现onMessage静态方法，onConnect和onClose静态方法可以不用实现。
        $worker->eventHandler  = \App\GatewayWorker\Events::class;
    }
    private function start_gateway(){
        // gateway 进程，这里使用Text协议，可以用telnet测试
        $gateway = new Gateway("websocket://127.0.0.1:8000");
        // gateway名称，status方便查看
        $gateway->name = 'HmlwanAppGateway';
        // gateway进程数
        $gateway->count = 4;
        // 本机ip，分布式部署时使用内网ip
        $gateway->lanIp = '127.0.0.1';
        // 内部通讯起始端口，假如$gateway->count=4，起始端口为4000
        // 则一般会使用4000 4001 4002 4003 4个端口作为内部通讯端口
        $gateway->startPort = 2900;
        // 服务注册地址
        $gateway->registerAddress = '127.0.0.1:1236';

        // 心跳间隔
//        $gateway->pingInterval = 10;
        // 心跳数据
//        $gateway->pingData = '{"type":"hml"}';
    }
    private function start_register(){
        $register = new Register('text://0.0.0.0:1236');
    }
}
