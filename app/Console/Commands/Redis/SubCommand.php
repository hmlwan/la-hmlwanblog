<?php

namespace App\Console\Commands\Redis;

use Illuminate\Console\Command;
use App\Services\RedisService;
class SubCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sub:info';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'start a sub server';

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
        $RedisService->subScribe();
        $this->comment('subscribe successful');
    }
}
