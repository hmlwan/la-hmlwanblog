<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Article\Store;
use App\Http\Requests\Article\Update;
use App\Models\Article;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public  function index(){
        $data = Article::
            leftJoin('categories','articles.category_id','=','categories.id')
        ->orderByDesc('articles.updated_at')
            ->paginate(10,['articles.*','categories.name as category_name']);
        $assign = compact('data');

        return view('admin.article.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Article::where(array('id'=>$id))->firstOrFail();
        $tags = Tag::where('status','=',1)->get();
        $cates = Category::where('status','=',1)->orderBy('sort')->get();
        $data = compact('info','cates','tags');
        return view('admin.article.edit_view',$data);
    }
    public function create_view(){
        $cates = Category::where('status','=',1)->orderBy('sort')->get();
        $tags = Tag::where('status','=',1)->get();
        $data = compact('cates','tags');

        return view('admin.article.create_view',$data);
    }
    public function store(Store $request){

        Article::create($request->except('_token'));
        return redirect('admin/article/index')->with('success_status', '成功');
    }
    public function update(Update $request){

        Article::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/article/index')->with('status', '成功');
    }
    public function del($id){

        Article::destroy($id);
        return redirect(url('admin/article/index'))->with('success_status', ' 成功');
    }
    public function pub($id){
        Article::where('id','=',$id)->update(['status'=>1]);
        return redirect(url('admin/article/index'))->with('success_status', ' 成功');

    }
    public function down($id){
        Article::where('id','=',$id)->update(['status'=>0]);
        return redirect(url('admin/article/index'))->with('success_status', ' 成功');
    }
    public function uploadImage(Request $request){

        $path = $request->file('image')->store('/article/'.\Illuminate\Support\Facades\Date::now()->format('Ymd'),'uploads');
        if(!$path){
            return  response()->json(array(
                'result' => 0,
                'msg' => '失败',
            ));
        }
        $path = '/uploads/'.$path;
        return response()->json(array(
            'result' => 1,
            'msg' => '成功',
            'url' => $path,
        ));
    }

}
