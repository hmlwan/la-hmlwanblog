<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Friendshiplink\Store;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public  function index(){
        $data = Comment::orderByDesc('updated_at')
            ->paginate(10);
        $assign = compact('data');

        return view('admin.comment.index',$assign);
    }
    public function create_view(){


        return view('admin.comment.create_view');
    }
    public function store(Store $request){

        Comment::create($request->except('_token'));
        return redirect('admin/comment/index')->with('success_status', '成功');
    }
    public function edit_view(Request $request,$id){
        $info = Comment::where(array('id'=>$id))->firstOrFail();
        $data = compact('info');
        return view('admin.comment.edit_view',$data);
    }
    public function update(Store $request){

        Comment::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/comment/index')->with('status', '成功');
    }
    public function del($id){

        Comment::destroy($id);
        return redirect(url('admin/comment/index'))->with('success_status', ' 成功');
    }
}
