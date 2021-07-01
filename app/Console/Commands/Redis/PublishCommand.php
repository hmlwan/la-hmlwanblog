<?php

namespace App\Console\Commands\Redis;

use Illuminate\Console\Command;
use App\Services\RedisService;

class PublishCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'publish:info';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'start a publish server ';

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
        $RedisService = new RedisService();
        $RedisService->publish();
        $this->comment('publish successful');
    }
}
