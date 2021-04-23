@extends('admin.public.admin')

@section('title','编辑')

@section('page-content')
    <div class="page-header">
        <h1>
            标签
            <small>
                <i class="icon-double-angle-right"></i>
                编辑
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="col-xs-12">
        <form class="form-horizontal" action="{{url('admin/tag/update')}}" method="post" role="form">
            {{ csrf_field() }}
            @include('errors.error')
            <input type="hidden" name="id" value="{{ $info->id }}">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 </label>
                <div class="col-sm-9">
                    <input type="text" id="name" name="name" value="{{ $info->name }}" placeholder="请输入名称" class="col-xs-7" />
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
