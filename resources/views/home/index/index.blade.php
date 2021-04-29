@extends('home.public.home')

@section('title','首页')

@section('css')
    <link href="{{URL::asset('statics/home/assets/css/index_style.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('body')
    <div id="menu" class="hover_animation menu_open" data-mark="false">
        <span></span>
        <span></span>
        <span></span>
    </div>
    <div id="navgation" class="navgation navgation_close">
        <ul class="point">
            <li><a href="#">首页</a></li>
            <li><a href="{{ url('article/cid/0')}}">博客</a></li>
            <li><a href="{{ url('home/message')}}">留言</a></li>
        </ul>
        <div class="logo"><a>Mr.Yss</a></div>
    </div>
    <div class="section" id="section1">
        <div class="fp-tablecell">
            <div class="page1">
                <div class="nav wow zoomIn" data-wow-duration="2s">
                    <h1>{{config('WEB_AUTHOR')}}</h1>
                    <p>{{config('WEB_INDEX_SLOGAN')}}</p>
                    <a class="layui-btn layui-btn-normal" style="margin-top: 20px" href="{{ url('article/cid/0')}}">Enter Blog</a>
                </div>
                <a class="next wow fadeInUp" data-wow-duration="2s" id="next"></a>
            </div>
        </div>
    </div>
    <div class="section" id="section2">
        <div class="fp-tablecell">
            <div class="page2">
                <div class="warp-box">
                    <div class="new-article">
                        <div class="inner wow fadeInDown" data-wow-delay=".2s">
                            <h1>热门文章</h1>
                            <p>
                              {!!config('HOT_ARTICLE_SLOGAN') !!}
                            </p>
                        </div>
                    </div>
                    <div class="layui-row">
                        @foreach($hot_articles as $k=> $hot_article)
                            <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" @if($k>0) data-wow-delay=".{{ $k*2  }}s" @endif  style="padding: 0 10px">
                                <div class="single-news">
                                    <div class="news-head">
                                        <img src="{{$hot_article->cover ? $hot_article->cover: asset('statics/home/assets/image/1.jpg') }}">
                                        <a href="{{ url('article/aid',array('aid'=>$hot_article->id ))}}" class="link"><i class="fa fa-link"></i></a>
                                    </div>
                                    <div class="news-content">
                                        <h4>
                                            <a href="{{ url('article/aid',array('aid'=>$hot_article->id ))}}">
                                                {{$hot_article->title }}
                                            </a>
                                        </h4>
                                        <div class="date">
                                            {{ $hot_article->created_at ? date("Y年m月d日",strtotime($hot_article->created_at)) :date("Y年m月d日",time()) }}
                                        </div>
                                        <p>
                                            {{$hot_article->description }}
                                        </p>
                                        <a href="{{ url('article/aid',array('aid'=>$hot_article->id ))}}" class="btn">
                                            阅读更多
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section" id="section3">
        <div class="fp-tablecell">
            <div class="page3">
                <div class="warp-box">
                    <div class="warp">
                        <div class="inner">
                            <div class="links">
                                <ul>
                                    <li class="wow fadeInLeft"><a href="{{ url('home/about')}}">关于</a></li>
                                    <li class="wow fadeInRight"><a href="{{ url('home/link')}}">+友情链接</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section" id="section4">
        <div class="fp-tablecell">
            <div class="page4">
                <div class="warp-box">
                    <div class="about">
                        <div class="inner">
                            <h1 class="wow fadeInLeft">{{config('AUTHOR_CHARACTER_title')}}</h1>
                            <p class="wow fadeInRight">
                                {{config('AUTHOR_CHARACTER_DESC')}}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


