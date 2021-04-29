@extends('admin.public.admin')

@section('title','评论管理')

@section('page-content')
    <div class="page-header">
        <h1>
            评论管理
            <small>
                <i class="icon-double-angle-right"></i>
                编辑
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="col-xs-12">
        <form class="form-horizontal" action="{{url('admin/comment/update')}}" method="post" role="form">
            {{ csrf_field() }}
            @include('errors.error')
            <input type="hidden" name="id" value="{{ $info->id }}">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 内容 </label>
                <div class="col-sm-9">
                    <textarea name="content" id="content" cols="30" class="col-xs-7" rows="10">{{ $info->content }}</textarea>
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
