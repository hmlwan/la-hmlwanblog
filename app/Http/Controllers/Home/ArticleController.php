<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Article;
use Illuminate\Http\Request;


class ArticleController extends Controller
{
    public function show(Request $request,$cid){
        $w = [];
        $w[] = array('articles.status','=',1);

        if($cid > 0){
            $w[] = array('articles.category_id','=',$cid);
        }

        $contents = Article::where($w)
            ->leftJoin('tags','articles.tags','=','tags.id')
            ->orderByDesc('articles.is_top')
            ->orderByDesc('articles.id')
            ->paginate(8,['articles.*','tags.name as tag_name']);

        $data = compact('contents');

        $content = view('home.article.ajax_article',$data)->render();

        if($request->ajax()){
            $data['content'] = $content;
            return response()->json($data);
        }else{

            return view('home.article.article',$data);
        }

    }
    public function read(Request $request ,$aid){
        $info = Article::findOrFail($aid);
        $data = compact('info');
        return view('home.article.read',$data);
    }

}
