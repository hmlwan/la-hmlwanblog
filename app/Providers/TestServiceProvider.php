<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class TestServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
        $this->app->bind('App\Contracts\Test','App\Services\TestService');
        $this->app->when('App\Http\Controllers\Home\testController')
            ->needs('App\Contracts\Test')
            ->give('App\Services\TwoTestService');

    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
