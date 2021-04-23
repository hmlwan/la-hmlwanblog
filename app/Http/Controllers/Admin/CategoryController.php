<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Category\Store;
use App\Http\Requests\Category\Update;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

    public  function index(){
        $data = Category::orderBy('sort')->paginate(10);
        $assign = compact('data');

        return view('admin.category.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Category::where(array('id'=>$id))->firstOrFail();

        return view('admin.category.edit_view',['info'=>$info]);
    }
    public function create_view(){

        return view('admin.category.create_view');
    }
    public function store(Store $request){
        Category::create($request->except('_token'));
        return redirect('admin/category/index')->with('success_status', '成功');
    }
    public function update(Update $request){

        Category::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/category/index')->with('status', '成功');
    }
    public function del($id){
        Category::destroy($id);
        return redirect(url('admin/category/index'))->with('success_status', ' 成功');
    }
    public function pub($id){
        Category::where('id','=',$id)->update(['status'=>1]);
        return redirect(url('admin/category/index'))->with('success_status', ' 成功');

    }
    public function down($id){
        Category::where('id','=',$id)->update(['status'=>0]);
        return redirect(url('admin/category/index'))->with('success_status', ' 成功');
    }
}
