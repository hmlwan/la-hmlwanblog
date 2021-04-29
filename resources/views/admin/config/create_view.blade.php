@extends('admin.public.admin')

@section('title','系统管理')

@section('page-content')
    <div class="page-header">
        <h1>
            系统
            <small>
                <i class="icon-double-angle-right"></i>
                新增
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="col-xs-12">
        <form class="form-horizontal" action="{{url('admin/config/store')}}" method="post" role="form">
            {{ csrf_field() }}
            @include('errors.error')
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 </label>
                <div class="col-sm-9">
                    <input type="text" name="name" id="name" placeholder="请输入名称" value="{{old('name')}}" class="col-xs-7" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> key值 </label>
                <div class="col-sm-9">
                    <input type="text" name="key" id="key"  placeholder="请输入key" value="{{old('key')}}" class="col-xs-7" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 类型 </label>
                <div class="col-sm-9">
                    <select name="type" id="type" class="col-xs-7">
                        <option value="1">text输入框</option>
                        <option value="2">textarea文本框</option>
                        <option value="3">单选</option>
                        <option value="4">图片上传</option>
                        <option value="5">select选择框</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 类型结构 </label>
                <div class="col-sm-9">
                    <textarea name="args" id="args" cols="30" rows="10" class="col-xs-7">{{old('args')}}</textarea>
                </div>
            </div>
            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok bigger-110"></i>
                        Submit
                    </button>
                    &nbsp; &nbsp; &nbsp;
                    <button class="btn" type="reset">
                        <i class="icon-undo bigger-110"></i>
                        Reset
                    </button>
                </div>
            </div>
        </form>

    </div>
@endsection
