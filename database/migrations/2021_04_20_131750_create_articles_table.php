<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('articles');
        Schema::create('articles', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedTinyInteger('category_id')->default(0)->comment('分类');
            $table->string('title')->default('')->comment('标题');
            $table->string('tags')->default('')->comment('标签');
            $table->string('author')->default('')->comment('作者');
            $table->mediumText('markdown')->comment('作者');
            $table->string('description')->default('')->comment('描述');
            $table->string('keywords')->default('')->comment('关键字');
            $table->string('cover')->default('')->comment('封面');
            $table->integer('views')->default(0)->comment('点击数');
            $table->unsignedTinyInteger('is_top')->default(0)->comment('是否置顶0:否 1:是');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态 0：下架 1：发布 ');
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
        Schema::dropIfExists('articles');
    }
}
