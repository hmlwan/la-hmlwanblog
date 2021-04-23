<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Tag\Store;
use App\Http\Requests\Tag\Update;
use App\Models\Tag;
use Illuminate\Http\Request;

class TagController extends Controller
{
    public  function index(){
        $data = Tag::orderByDesc('updated_at')->paginate(10);
        $assign = compact('data');

        return view('admin.tag.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Tag::where(array('id'=>$id))->firstOrFail();

        return view('admin.tag.edit_view',['info'=>$info]);
    }
    public function create_view(){

        return view('admin.tag.create_view');
    }
    public function store(Store $request){
        Tag::create($request->except('_token'));
        return redirect('admin/tag/index')->with('success_status', '成功');
    }
    public function update(Update $request){

        Tag::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/tag/index')->with('status', '成功');
    }
    public function del($id){
        Tag::destroy($id);
        return redirect(url('admin/tag/index'))->with('success_status', ' 成功');
    }
    public function pub($id){
        Tag::where('id','=',$id)->update(['status'=>1]);
        return redirect(url('admin/tag/index'))->with('success_status', ' 成功');

    }
    public function down($id){
        Tag::where('id','=',$id)->update(['status'=>0]);
        return redirect(url('admin/tag/index'))->with('success_status', ' 成功');
    }
}
