@extends('admin.public.admin')

@section('title','编辑')
@section('css')
  <link rel="stylesheet" href="{{ asset('statics/editormd/css/editormd.min.css') }}">
@endsection
@section('page-content')
    <div class="page-header">
        <h1>
            文章
            <small>
                <i class="icon-double-angle-right"></i>
                新增
            </small>
        </h1>
    </div><!-- /.page-header -->

        <div class="col-xs-12">
            <form class="form-horizontal" action="{{ url('admin/article/store') }}" method="post" role="form">
                {{ csrf_field() }}
                @include('errors.error')
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 分类 </label>
                    <div class="col-sm-9">
                        <select class="col-xs-7"  name="category_id" id="category_id" >
                            @foreach($cates as $cate)
                                <option value="{{$cate->id}}">{{$cate->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标题 </label>
                    <div class="col-sm-9">
                        <input type="text" name="title" id="title"  placeholder="请输入标题" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 作者 </label>
                    <div class="col-sm-9">
                        <input type="text" name="author" id="author" value="hmlwan" placeholder="请输入作者" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标签 </label>
                    <div class="col-sm-9">
                        <div class="radio">
                            @foreach($tags as $tag)
                                <label>
                                    <input name="tags" type="radio" value="{{ $tag->id }}" class="ace">
                                    <span class="lbl">{{ $tag->name }}</span>
                                </label>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 关键字 </label>
                    <div class="col-sm-9">
                        <input type="text" name="keywords" id="keywords"  placeholder="请输入关键字" class="col-xs-7" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 描述 </label>
                    <div class="col-sm-9">
                        <textarea class="col-xs-7" name="description" id="description" style="height: 120px;resize: vertical"   ></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 是否置顶 </label>
                    <div class="col-sm-9">
                        <div class="radio">
                            <label>
                                <input name="is_top" type="radio" value="0" class="ace">
                                <span class="lbl"> 否</span>
                            </label>
                            <label>
                                <input name="is_top" type="radio" value="1"  class="ace">
                                <span class="lbl"> 是</span>
                            </label>
                        </div>
                        <span class="lbl"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 封面 </label>
                    <div class="col-sm-9">
                        <p style="width: 160px;height: 170px;padding-bottom: 10px;">
                            <img class="show_img" style="width: 160px;height: 160px;" src="{{asset('statics/admin/assets/avatars/avatar.png')}}"  alt="">
                            <input type="file" name="file" id="file" style="display: none">
                            <input type="hidden" id="cover" name="cover" style="display: none">
                        </p>
                        <a href="javascript:;" class="btn btn-xs btn-primary" id="upload_cover">选择图片</a>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 内容 </label>

                        <div class="col-sm-9" id="markdown_content">
                            <textarea class="col-xs-7" name="markdown" rows="10"></textarea>
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

    <script src="{{URL:: asset('statics/editormd/editormd.min.js') }}"></script>

    <script>
        var testEditor;

        $(function() {
            // You can custom @link base url.
            editormd.urls.atLinkBase = "https://github.com/";

            testEditor = editormd("markdown_content", {
                autoFocus : false,
                width     : '1000px',
                height    : 720,
                toc       : true,
                //atLink    : false,    // disable @link
                //emailLink : false,    // disable email address auto link
                todoList  : true,
                placeholder: "输入文章内容",
                toolbarAutoFixed: false,
                path      : '{{ asset('/statics/editormd/lib') }}/',
                emoji: true,
                toolbarIcons : ['undo', 'redo', 'bold', 'del', 'italic', 'quote', 'uppercase', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'list-ul', 'list-ol', 'hr', 'link', 'reference-link', 'image', 'code', 'code-block', 'table', 'emoji', 'html-entities', 'watch', 'preview', 'search', 'fullscreen'],
                imageUpload: true,
                imageUploadURL : '{{ url('admin/article/uploadImage') }}',
            });
        });
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
                        $("input[name='cover']").val(url);
                        $(".show_img").attr('src',url);
                        layer.msg("上传成功！");
                    }else
                    {
                        layer.msg(data.msg);
                        return false;
                    }
                }
            })
        });
    </script>
@endsection

