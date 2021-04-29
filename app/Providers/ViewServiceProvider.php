<?php

namespace App\Providers;

use App\Models\Article;
use App\Models\Category;
use App\Models\Config;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {

        //获取config配置
        $config = Config::pluck('value','key');
        if($config->isNotEmpty()){
            config($config->toArray());
        }

        View::composer(['home/public/article'],function ($view){
            //导航栏
            $cates = Category::where('status','=',1)->orderBy('sort')->get();

            //热门文章
            $hot_articles = Article::where('status','=',1)
                ->orderByDesc('views')
                ->orderByDesc('loves')
                ->limit(8)->get(['id','title']);
            //置顶文章
            $top_articles = Article::where([
                ['status','=',1],
                ['is_top','=',1],
            ])
                ->orderByDesc('views')
                ->get(['id','title']);

            $assign = compact('cates','hot_articles','top_articles');
            $view->with($assign);
        });
        View::composer(['home/index/index'],function ($view){

            //热门文章
            $hot_articles = Article::where('status','=',1)
                ->orderByDesc('views')
                ->orderByDesc('loves')
                ->limit(3)->get(['id','title','created_at','cover','description']);


            $assign = compact('hot_articles');
            $view->with($assign);
        });



    }
}
