@foreach($contents as $article)

    <section class="article-item zoomIn article">
        @if($article->is_top == 1)
            <div class="fc-flag">置顶</div>
         @endif

        <h5 class="title">
            @if($article->author == config('WEB_AUTHOR'))
                <span class="fc-blue">【原创】</span>
            @else
                <span class="fc-blue">【转载】</span>
            @endif
            <a href="{{url('article/aid',array('aid'=>$article->id))}}">{{$article['title']}}</a>
        </h5>
        <div class="time">
            <span class="day">{{ $article->created_at ? date("d",strtotime($article->created_at)):  date("d",time())}}</span>
            <span class="month fs-18">{{ $article->created_at ? date("m",strtotime($article->created_at)):  date("m",time())}}<span class="fs-14">月</span></span>
            <span class="year fs-18 ml10">{{ $article->created_at ? date("Y",strtotime($article->created_at)):  date("Y",time())}}</span>
        </div>
        <div class="content">
            <a href="{{ url('article/aid',array('aid'=>$article->id)) }}" class="cover img-light">
                <img src="{{asset($article->cover)}}">
            </a>
            {{$article->description}}
        </div>
        <div class="read-more">
            <a href="{{url('article/aid',array('aid'=>$article->id))}}" class="fc-black f-fwb">继续阅读</a>
        </div>
        <aside class="f-oh footer">
            <div class="f-fl tags">
                <span class="fa fa-tags fs-16"></span>
                <a class="tag">{{$article->tag_name}}</a>
            </div>
            <div class="f-fr">
                <span class="read">
                    <i class="fa fa-eye fs-16"></i>
                    <i class="num">{{$article->views}}</i>
                </span>
                <span class="ml20">
                    <i class="fa fa-comments fs-16"></i>
                    <a href="javascript:void(0)" class="num fc-grey">{{$article->loves}}</a>
                </span>
            </div>
        </aside>

    </section>
@endforeach
