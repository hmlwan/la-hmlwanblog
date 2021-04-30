<!DOCTYPE html>
<html lang="zh-Hans-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <meta name="robots" content="all" />
    <title>@yield('title')</title>
    <link href="{{URL::asset('statics/home/assets/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet" type="text/css">
    <link href="{{URL::asset('statics/home/assets/layui/css/layui.css')}}" rel="stylesheet" type="text/css">
    <link href="{{URL::asset('statics/home/assets/css/animate.min.css')}}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{URL::asset('statics/home/assets/css/gloable.css')}}" />
    <link rel="stylesheet" href="{{URL::asset('statics/home/assets/css/nprogress.css')}}" />
    @yield('css')

</head>
<body>
    @yield('body')

</body>
@yield('footer')

</html>

<script src="{{URL::asset('statics/home/assets/layui/layui.js')}}"></script>
<script src="{{URL::asset('statics/home/assets/js/wow.min.js')}}"></script>
<script src="{{URL::asset('statics/home/assets/js/index.js')}}"></script>
<script src="{{ URL::asset('statics/home/assets/js/yss/gloable.js')}}"></script>
<script src="{{ URL::asset('statics/home/assets/js/plugins/nprogress.js')}}"></script>

<script src="{{ URL::asset('statics/home/assets/js/yss/article.js')}}"></script>
<script src="{{ URL::asset('statics/home/assets/js/pagecomment.js')}}"></script>
<script src="{{ URL::asset('statics/common/main.js')}}"></script>
<script>NProgress.start();</script>
<script>
    window.onload = function () {
        NProgress.done();
    };
</script>
@yield('js')
