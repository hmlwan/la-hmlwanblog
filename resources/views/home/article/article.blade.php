@extends('home.public.article')

@section('title','hmlwan博客')

@section('article')
    <div class="flow_load">
    </div>
@endsection
@section('js')
    <script src="{{ URL::asset('statics/common/jquery-2.0.3.min.js')}}"></script>
    <script>
        lazy_loading("{{url('article/cid',array('cid'=>request('cid')))}}");
    </script>
@endsection
