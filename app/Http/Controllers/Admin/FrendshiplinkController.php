<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Friendshiplink\Store;
use App\Http\Requests\Friendshiplink\Update;
use App\Models\Friendshiplink;
use Illuminate\Http\Request;

class FrendshiplinkController extends Controller
{
    public  function index(){
        $data = Friendshiplink::orderByDesc('updated_at')
            ->paginate(10);
        $assign = compact('data');

        return view('admin.friendshiplink.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Friendshiplink::where(array('id'=>$id))->firstOrFail();
        $data = compact('info');
        return view('admin.friendshiplink.edit_view',$data);
    }
    public function create_view(){


        return view('admin.friendshiplink.create_view');
    }
    public function store(Store $request){

        Friendshiplink::create($request->except('_token'));
        return redirect('admin/friendshiplink/index')->with('success_status', '成功');
    }
    public function update(Store $request){

        Friendshiplink::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/friendshiplink/index')->with('status', '成功');
    }
    public function del($id){

        Friendshiplink::destroy($id);
        return redirect(url('admin/friendshiplink/index'))->with('success_status', ' 成功');
    }

}
