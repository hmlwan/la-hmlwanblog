@extends('admin.public.admin')

@section('title','系统管理')

@section('page-content')
    <div class="page-header">
        <h1>
            系统
            <small>
                <i class="icon-double-angle-right"></i>
                编辑
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="col-xs-12">
        <form class="form-horizontal" action="{{url('admin/config/update')}}" method="post" role="form">
            {{ csrf_field() }}
            @include('errors.error')
            <input type="hidden" name="id" value="{{ $info->id }}">

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 </label>
                <div class="col-sm-9">
                    <input type="text" name="name" id="name" placeholder="请输入名称" value="{{$info->name}}" class="col-xs-7" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> key值 </label>
                <div class="col-sm-9">
                    <input type="text" name="key" id="key" readonly  placeholder="请输入key" value="{{$info->key}}" class="col-xs-7" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 类型 </label>
                <div class="col-sm-9">
                    <select name="type" id="type" disabled class="col-xs-7">
                        <option value="1" @if($info->type == 1 )  selected @endif>text输入框</option>
                        <option value="2" @if($info->type == 2 ) selected @endif>textarea文本框</option>
                        <option value="3" @if($info->type== 3 ) selected @endif>单选</option>
                        <option value="4" @if($info->type== 4 ) selected @endif>图片上传</option>
                        <option value="5" @if($info->type== 5 ) selected @endif>select选择框</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> args值 </label>
                <div class="col-sm-9">
                    <textarea class="col-xs-7" name="args" id="args" style="height: 100px;resize: vertical"   >{{ $info->args }}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> value值 </label>
                <div class="col-sm-9">
                    @switch($info->type)
                        @case('1')
                            <input type="text" name="value" id="value"   placeholder="请输入value" value="{{$info->value}}" class="col-xs-7" />
                        @break
                        @case('2')
                            <textarea class="col-xs-7" name="value" id="value" style="height: 100px;resize: vertical" >{{$info->value}}</textarea>
                        @break
                        @case('3')
                            <div class="radio">
                                @if($info->args)
                                    @foreach(json_decode($info->args) as $radio)
                                        <label>
                                            <input name="tags" type="radio" value="{{$radio->id}}" @if($info->value == $radio->id ) checked @endif class="ace">
                                            <span class="lbl">{{$radio->name}}</span>
                                        </label>
                                    @endforeach
                                @endif

                            </div>
                        @break
                        @case('4')
                            <p style="width: 160px;height: 170px;padding-bottom: 10px;">
                                <img class="show_img" style="width: 160px;height: 160px;" src="{{$info->value ?? asset('statics/admin/assets/avatars/avatar.png')}}"  alt="">
                                <input type="file"  id="file" style="display: none">
                                <input type="hidden" id="value" name="value" value="{{$info->value ?? asset('statics/admin/assets/avatars/avatar.png')}}" style="display: none">
                            </p>
                            <a href="javascript:;" class="btn btn-xs btn-primary" id="upload_cover">选择图片</a>
                        @break
                        @case('5')
                            <select name="type" id="type"  class="col-xs-7">
                                @if($info->args)
                                    @foreach(json_decode($info->args) as $select)
                                        <option value="{{$select->id}}" @if($info->value == $select->id )  selected @endif>{{$select->name}}</option>
                                    @endforeach
                                @endif
                            </select>
                        @break
                    @endswitch
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
@section('js')
    <script>
        $("#upload_cover").click(function(){
            $("#file").click();
        });
        $("#file").change(function(){
            var $this = $(this);
            var file = this.files[0];
            if(file.length == 0)
            {
                layer.msg("请选择要上传的图片");
                return false;
            }
            var data = new FormData();
            data.append('image',file);
            data.append('_token', '{{csrf_token()}}');
            loading(true)
            $.ajax({
                url:"/admin/article/uploadImage",
                type:"post",
                data:data,
                processData:false,
                contentType:false,
                dataType:'json',
                success:function(data){
                    loading(false)
                    if(data.result != 0)
                    {
                        var url = data.url;
                        $("input[name='value']").val(url);
                        $(".show_img").attr('src',url);
                        layer.msg("上传成功！");
                    }else{
                        layer.msg(data.msg);
                        return false;
                    }
                }
            })
        });
    </script>
@endsection
