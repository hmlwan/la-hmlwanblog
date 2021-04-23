<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Article\Store;
use App\Http\Requests\Article\Update;
use App\Models\Article;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public  function index(){
        $data = Article::orderByDesc('updated_at')->paginate(10);
        $assign = compact('data');

        return view('admin.article.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Article::where(array('id'=>$id))->firstOrFail();

        return view('admin.article.edit_view',['info'=>$info]);
    }
    public function create_view(){

        return view('admin.article.create_view');
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
}
