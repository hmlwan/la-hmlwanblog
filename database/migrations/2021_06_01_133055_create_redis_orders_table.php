<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRedisOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('redis_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('order_sn');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('goods_id');
            $table->unsignedInteger('sku_id');
            $table->unsignedInteger('number');
            $table->unsignedInteger('price');
            $table->unsignedTinyInteger('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('redis_orders');
    }
}
