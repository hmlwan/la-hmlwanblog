<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Config\Store;
use App\Http\Requests\Config\Update;
use App\Models\Config;

use Illuminate\Http\Request;

class ConfigController extends Controller
{
    public  function index(){
        $data = Config::orderByDesc('updated_at')
            ->paginate(10);
        $assign = compact('data');

        return view('admin.config.index',$assign);
    }
    public function edit_view(Request $request,$id){
        $info = Config::where(array('id'=>$id))->firstOrFail();
        $data = compact('info');
        return view('admin.config.edit_view',$data);
    }
    public function create_view(){


        return view('admin.config.create_view');
    }
    public function store(Store $request){

        Config::create($request->except('_token'));
        return redirect('admin/config/index')->with('success_status', '成功');
    }
    public function update(Update $request){

        Config::updateOrInsert(array('id'=>$request->post('id')),$request->except('_token'));
        return redirect('admin/config/index')->with('status', '成功');
    }
    public function del($id){

        Config::destroy($id);
        return redirect(url('admin/config/index'))->with('success_status', ' 成功');
    }
}
