<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConfigsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('configs')) {
            Schema::create('configs', function (Blueprint $table) {
                $table->increments('id');
                $table->string('name')->default('')->comment('名称');
                $table->string('key')->default('')->comment('key值');
                $table->mediumText('value')->nullable(true)->comment('value值');
                $table->unsignedTinyInteger('type')->default(1)->comment('类型 1:text输入框 2：文本框 3：单选 4：图片上传 5:select');
                $table->text('args')->nullable(true)->comment('类型结构');
                $table->timestamps();
            });
        }
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('configs');
    }
}
