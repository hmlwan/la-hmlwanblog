<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('users')->insert([
                [
                    'id'=>1,
                    'name' => 'admin',
                    'email' => Str::random(10).'@gmail.com',
                    'password' => bcrypt('123456'),
                    'remember_token' => null,
                    'created_at'     => '2016-10-22 07:35:12',
                    'updated_at'     => '2016-10-22 07:35:12',

                ],
                [
                    'id'=>2,
                    'name' => 'test',
                    'email' => Str::random(10).'@gmail.com',
                    'password' => bcrypt('123456'),
                    'remember_token' => null,
                    'created_at'     => '2019-01-04 15:35:12',
                    'updated_at'     => '2016-01-04 15:35:12',

                ]
        ]);

    }
}
