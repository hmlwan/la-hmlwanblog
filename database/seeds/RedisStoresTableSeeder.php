<?php

use Illuminate\Database\Seeder;
use \Illuminate\Support\Facades\DB;
class RedisStoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('redis_stores')->insert([
           [
               'goods_id'=> 1,
               'sku_id'=> 1,
               'number'=> 100,
               'price'=> 100,
               'freez'=> 100.00,
               'created_at'     => '2016-10-22 07:35:12',
               'updated_at'     => '2016-10-22 07:35:12',
           ]
        ]);

    }
}
