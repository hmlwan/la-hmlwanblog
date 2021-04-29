@extends('admin.public.admin')

@section('title','系统管理')

@section('page-content')
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="icon-home home-icon"></i>
                <a href="#">系统管理</a>
            </li>
            <li class="active">列表</li>
        </ul><!-- .breadcrumb -->

        <div class="nav-search" id="nav-search">
            <form class="form-search">
                <span class="input-icon">
                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                    <i class="icon-search nav-search-icon"></i>
                </span>
            </form>
        </div><!-- #nav-search -->
    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                系统管理
                <small>
                    <i class="icon-double-angle-right"></i>
                    列表
                </small>
            </h1>
        </div><!-- /.page-header -->
        @include('errors.error')
        <div class="row">
            <div class="col-xs-12">
                <a class="btn btn-sm btn-success pull-left" href="{{url('admin/config/create_view')}}" style="margin-bottom: 10px;">
                    <span class="bigger-110">添加</span>
                    <i class="icon-arrow-right icon-on-right"></i>
                </a>
                <div class="table-responsive">
                    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label>
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>名称</th>
                            <th>key值</th>
                            <th>类型</th>
                            <th>arg</th>
                            <th>value值</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $v)
                            <tr>
                                <td class="center">
                                    <label>
                                        <input type="checkbox" class="ace" />
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>{{$v->name}}</td>
                                <td>{{$v->key}}</td>
                                <td>
                                    @switch($v->type)
                                        @case('1')
                                            text输入框
                                        @break
                                        @case('2')
                                            文本框
                                        @break
                                        @case('3')
                                            单选
                                        @break
                                        @case('4')
                                            图片上传
                                        @break
                                        @case('5')
                                            select选择框
                                        @break
                                    @endswitch
                                </td>
                                <td style="width: 25%;word-break: break-all;">{{$v->args}}</td>
                                <td style="width: 25%;word-break: break-all;">{{$v->value}}</td>
                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                        <a href="{{ url('/admin/config/edit_view',array('id'=>$v->id)) }}">
                                            <button class="btn btn-xs btn-info">
                                                <i class="icon-edit bigger-120"></i>
                                            </button>
                                        </a>
                                        <a onclick="return confirm('确定要删除？')"  href="{{ url('/admin/config/del',array('id'=>$v->id)) }}">
                                            <button class="btn btn-xs btn-danger">
                                                <i class="icon-trash bigger-120"></i>
                                            </button>
                                        </a>
                                    </div>
                                    <div class="visible-xs visible-sm hidden-md hidden-lg">
                                        <div class="inline position-relative">
                                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
                                                <i class="icon-cog icon-only bigger-110"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="{{ url('/admin/config/edit_view',array('id'=>$v->id))}}" class="tooltip-success" data-rel="tooltip" title="Edit">
                                                    <span class="green">
                                                        <i class="icon-edit bigger-120"></i>
                                                    </span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a onclick="return confirm('确定要删除？')" href="{{ url('/admin/config/del',array('id'=>$v->id)) }}" class="tooltip-error" data-rel="tooltip" title="Delete">
                                                    <span class="red">
                                                        <i class="icon-trash bigger-120"></i>
                                                    </span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div>{{$data->links()}}</div>
                </div><!-- /.table-responsive -->
            </div><!-- /span -->
        </div><!-- /row -->

    </div><!-- /.page-content -->
@endsection




