@extends('admin.public.admin')

@section('title','评论管理')

@section('page-content')
    <div class="page-header">
        <h1>
            评论管理
            <small>
                <i class="icon-double-angle-right"></i>
                新增
            </small>
        </h1>
    </div><!-- /.page-header -->

        <div class="col-xs-12">
            <form class="form-horizontal" action="{{url('admin/comment/store')}}" method="post" role="form">
                {{ csrf_field() }}
                @include('errors.error')

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 内容 </label>
                    <div class="col-sm-9">
                        <input type="text" name="name" id="name"  placeholder="请输入名称" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">链接 </label>
                    <div class="col-sm-9">
                        <input type="text" name="url" id="url"  placeholder="请输入链接" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 排序 </label>
                    <div class="col-sm-9">
                        <input type="text" name="sort" id="sort"  placeholder="请输入排序" class="col-xs-7" />
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
