@extends('admin.public.admin')

@section('title','编辑')

@section('page-content')
    <div class="page-header">
        <h1>
            导航
            <small>
                <i class="icon-double-angle-right"></i>
                新增
            </small>
        </h1>
    </div><!-- /.page-header -->

        <div class="col-xs-12">
            <form class="form-horizontal" action="{{url('admin/category/store')}}" method="post" role="form">
                {{ csrf_field() }}
                @include('errors.error')
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 分类名 </label>
                    <div class="col-sm-9">
                        <input type="text" name="name" id="name" placeholder="请输入分类名" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 关键词 </label>
                    <div class="col-sm-9">
                        <input type="text" name="keywords" id="keywords"  placeholder="请输入关键词" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 描述 </label>
                    <div class="col-sm-9">
                        <input type="text" name="desc" id="desc"  placeholder="请输入描述" class="col-xs-7" />
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
