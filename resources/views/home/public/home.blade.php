@extends('home.public.base')

@section('title',config('WEB_NAME'))
@section('css')
    <link rel="stylesheet" href="{{URL::asset('statics/home/assets/css/master.css')}}" />
    <link rel="stylesheet" href="{{URL::asset('statics/home/assets/css/blog.css')}}" />
@endsection
@section('body')
    <div class="header">
    </div>
    <header class="gird-header">
        <div class="header-fixed">
            <div class="header-inner">
                <a href="javascript:void(0)" class="header-logo" id="logo">{{strtoupper(config('WEB_AUTHOR'))}}</a>
                <nav class="nav" id="nav">
                    <ul>
                        <li><a href="{{url('/')}}">首页</a></li>
                        <li><a href="{{url('article/cid/2')}}">博客</a></li>
                        <li><a href="{{url('home/message')}}">留言</a></li>
                        <li><a href="{{url('home/times')}}">闲言碎语</a></li>
                        <li><a href="{{url('home/link')}}">友链</a></li>
                        <li><a href="{{url('home/about')}}">关于</a></li>
                    </ul>
                </nav>
                <a href="/User/QQLogin" class="blog-user">
                    <i class="fa fa-qq"></i>
                </a>
                <a class="phone-menu">
                    <i></i>
                    <i></i>
                    <i></i>
                    <i></i>
                    <i></i>
                    <i></i>
                </a>
            </div>
        </div>
    </header>
    <div class="doc-container" id="doc-container">
        @yield('doc-container')
    </div>
@endsection

@section('footer')
    <footer class="footer wow fadeInUp" id="contact">
        <div class="footer-top">
            <div class="container">
                <div class="layui-row">
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                        <div class="single-widget about">
                            <div class="footer-logo">
                                <h2>{{config('WEB_AUTHOR')}}</h2>
                            </div>
                            <p>{{config('WEB_INDEX_SLOGAN')}}</p>
                            <div class="button">
                                <a href="{{url('home/about')}}" class="btn layui-btn layui-btn-normal">About Me</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                        <div class="single-widget">
                            <h2>相关链接</h2>
                            <ul class="social-icon">
                                <li class="active"><a href="{{url('article/cid/0')}}"><i class="fa fa-book"></i>博文</a></li>
                                <li class="active"><a href="{{url('home/message')}}"><i class="fa fa-comments"></i>留言</a></li>
                                <li class="active"><a href="{{url('home/link')}}"><i class="fa fa-share"></i>友链</a></li>
                                <li class="active"><a href="{{url('home/times')}}"><i class="fa fa-snowflake-o"></i>时间轴</a></li>
{{--                                <li class="active"><a href="{{url('home/message')}}"><i class="fa fa-files-o"></i>友链</a></li>--}}
                            </ul>
                        </div>
                    </div>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md4">
                        <div class="single-widget contact">
                            <h2>联系我</h2>
                            <ul class="list">
                                <li><i class="fa fa-map"></i>地址: {{config('AUTHOR_ADDRESS')}}</li>
                                <li><i class="fa fa-qq"></i>QQ: {{config('AUTHOR_QQ')}} </li>
                                <li><i class="fa fa-envelope"></i>邮箱: {{config('AUTHOR_EMAIL')}}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <div class="layui-row">
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 text-center">
                        <p>Copyright &copy; 2018-2018 燕十三 All Rights Reserved V.3.1.3 蜀ICP备18008600号</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
@endsection
