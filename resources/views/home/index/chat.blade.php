@extends('home.public.home')
@section('title','聊天室')
@section('css')
    <link rel="stylesheet" href="{{URL::asset('statics/home/assets/css/master.css')}}" />
    <link href="{{URL::asset('statics/home/assets/css/message.css')}}" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="{{URL::asset('statics/home/chat/css/bootstrap.min.css')}}" />
    <link rel="stylesheet" href="{{URL::asset('statics/home/chat/css/jquery-sinaEmotion-2.1.0.min.css')}}" />
    <link rel="stylesheet" href="{{URL::asset('statics/home/chat/css/style.css')}}" />

@endsection
@section("doc-container")
    <div class="container-fixed">
        <div class="container-inner">
            <section class="msg-remark">
                <h1>聊天室</h1>
                <p>
                    沟通交流，拉近你我！
                </p>
            </section>
            <div class="textarea-wrap message" id="textarea-wrap">
                <input type="hidden" name="client_id">
                <div class="container">
                    <div class="row clearfix">

                        <div class="col-md-1 column">

                        </div>

                        <div class="col-md-6 column">

                            <div class="thumbnail">

                                <div class="caption" id="dialog"></div>
                            </div>

                            <form onsubmit="onSubmit(); return false;">
                                <select style="margin-bottom:8px" id="client_list">
                                    <option value="all">所有人</option>
                                </select>
                                <textarea class="textarea thumbnail" id="textarea"></textarea>
                                <div class="say-btn">
                                    <input type="button" class="btn btn-default face pull-left" value="表情" />
                                    <input type="submit" class="btn btn-default" value="发表" />
                                </div>
                            </form>
                            <div class="">
                                &nbsp;&nbsp;&nbsp;&nbsp;<p style="margin-left: 15px">房间列表:（当前在&nbsp;房间{{session()->get('room_id')?session()->get('room_id'):1}}）</p>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="{{url('chat/index',array('room_id'=>1))}}">房间1</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{url('chat/index',array('room_id'=>2))}}">房间2</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{url('chat/index',array('room_id'=>3))}}">房间3</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{url('chat/index',array('room_id'=>4))}}">房间4</a>
                                <br><br>
                            </div>
                        </div>
                        <div class="col-md-3 column">
                            <div class="thumbnail">
                                <div class="caption" id="userlist"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
@endsection
@section('footer')
    <footer class="grid-footer">
        <div class="footer-fixed">
            <div class="copyright">
                <div class="info">
                    <div class="contact">
                        <a href="javascript:void(0)" class="github" target="_blank"><i class="fa fa-github"></i></a>
                        <a href="https://wpa.qq.com/msgrd?v=3&uin=930054439&site=qq&menu=yes" class="qq" target="_blank" title="930054439"><i class="fa fa-qq"></i></a>
                        <a href="https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=gbiysbG0tbWyuMHw8K-i7uw" class="email" target="_blank" title="930054439@qq.com"><i class="fa fa-envelope"></i></a>
                        <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                    </div>
                    <p class="mt05">
                        Copyright &copy; 2018-2018 燕十三 All Rights Reserved V.1.0.0 蜀ICP备18008600号
                    </p>
                </div>
            </div>
        </div>
    </footer>
@endsection

@section('js')
    <script type="text/javascript">var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F7b1919221e89d2aa5711e4deb935debd' type='text/javascript'%3E%3C/script%3E"));</script>
    <script type="text/javascript">
        // 动态自适应屏幕
        document.write('<meta name="viewport" content="width=device-width,initial-scale=1">');
        $("textarea").on("keydown", function(e) {
            // 按enter键自动提交
            if(e.keyCode === 13 && !e.ctrlKey) {
                e.preventDefault();
                $('form').submit();
                return false;
            }

            // 按ctrl+enter组合键换行
            if(e.keyCode === 13 && e.ctrlKey) {
                $(this).val(function(i,val){
                    return val + "\n";
                });
            }
        });
    </script>
    <script src="{{ URL::asset('statics/home/chat/js/swfobject.js')}}"></script>
{{--    <script src="{{ URL::asset('statics/home/chat/js/web_socket.js')}}"></script>--}}
    <script src="{{ URL::asset('statics/home/chat/js/jquery.min.js')}}"></script>
    <script src="{{ URL::asset('statics/home/chat/js/jquery-sinaEmotion-2.1.0.min.js')}}"></script>

    <script type="text/javascript">
        if (typeof console == "undefined") {    this.console = { log: function (msg) {  } };}
        // 如果浏览器不支持websocket，会使用这个flash自动模拟websocket协议，此过程对开发者透明
        WEB_SOCKET_SWF_LOCATION = "/swf/WebSocketMain.swf";
        // 开启flash的websocket debug
        WEB_SOCKET_DEBUG = true;
        var ws,  client_list={};
        var name= '{{ session()->get('name') ?session()->get('name') :'' }}';

        if(name && name != 'null'){

            connect();
        }else{
            show_prompt();
        }
        // 连接服务端
        function connect() {

            // 创建websocket
            ws = new WebSocket("ws://"+document.domain+":8000");
            // 当socket连接打开时，输入用户名
            ws.onopen = onopen;
            // 当有消息时根据消息类型显示不同信息
            ws.onmessage = onmessage;

            ws.onclose = function() {
                console.log("连接关闭，定时重连");
                connect();
            };
            ws.onerror = function() {
                console.log("出现错误");
            };
        }

        // 连接建立时发送登录信息
        function onopen()
        {
            // if(!name || name == 'null')
            // {
            //     show_prompt();
            // }
            // 登录
            /*var login_data = '{"type":"login","client_name":"'+name.replace(/"/g, '\\"')+'","room_id":"<?php echo isset($_GET['room_id']) ? $_GET['room_id'] : 1?>"}';
            console.log("websocket握手成功，发送登录数据:"+login_data);
            ws.send(login_data);*/
        }

        // 服务端发来消息时
        function onmessage(e)
        {

            var d = JSON.parse(e.data);
            console.log(d);
            var type = d.type,
                data = d.data;

            switch(type){
                case 'init':
                    ini(data.client_id);
                    $("input[name='client_id']").val(data.client_id);
                    break;
                // 服务端ping客户端
                case 'hml':
                    ws.send('{"type":"wan"}');
                    break;
                // 登录 更新用户列表
                case 'login':
                    name = data['client_name'];

                    say(data['client_name'],  data['client_name']+' 加入了聊天室', data['time']);
                    console.log(data['client_name']+"登录成功");
                    break;
                case 'online_user':
                    console.log(data);
                    flush_client_list(data);
                    break;
                case 'history':{
                    if(data.length>0){
                        for (var i in data){
                            say( data[i]['client_name'], data[i]['content'], data[i]['time']);
                        }
                    }
                    break;
                }
                // 发言
                case 'say':
                    say( data['client_name'], data['content'], data['time']);
                    break;
                // 用户退出 更新用户列表
                case 'logout':reg
                    //{"type":"logout","client_id":xxx,"time":"xxx"}
                    say( d['from_client_name'], d['from_client_name']+' 退出了', d['time']);

                    flush_client_list(data);
            }
        }
        function ini(client_id){
            $.post('/chat/init',{
                client_id:client_id,
                _token:'{{csrf_token()}}'
            })

        }

        // 输入姓名
        function show_prompt(){
            name = prompt('输入你的名字：', '');

            if(!name || name == 'null'){
                layer.msg('请输入名字');
                show_prompt();
                return false;
            }
            $.post('/chat/reg',{
                name:name,
                _token:'{{csrf_token()}}'
            },function (d){
                console.log(d);
                if(d.ret == 0){
                    show_prompt();
                }else{
                    name = d.name
                    connect();
                }
            })
            // if(!name || name=='null'){
            //     name = '游客';
            // }
        }
        // 提交对话
        function onSubmit() {
            var input = document.getElementById("textarea");
            var to_user_id = $("#client_list option:selected").attr("value");
            var to_client_name = $("#client_list option:selected").text();
            var content = input.value.replace(/"/g, '\\"').replace(/\n/g,'\\n').replace(/\r/g, '\\r');
            // ws.send('{"type":"say","to_client_id":"'+to_client_id+'","to_client_name":"'+to_client_name+'","content":"'+input.value.replace(/"/g, '\\"').replace(/\n/g,'\\n').replace(/\r/g, '\\r')+'"}');
            $.post('/chat/say',{
                'content':content,
                'to_user_id':to_user_id,
                'to_client_name':to_client_name,
                '_token':'{{csrf_token()}}',
            })
            input.value = "";
            input.focus();
            return false;
        }

        // 刷新用户列表框
        function flush_client_list(client_list){
            var userlist_window = $("#userlist");
            var client_list_slelect = $("#client_list");
            userlist_window.empty();
            client_list_slelect.empty();
            userlist_window.append('<h4>在线用户</h4><ul>');
            client_list_slelect.append('<option value="all" id="cli_all">所有人</option>');
            for(var p in client_list){

                if(client_list[p].length !== 0){
                    userlist_window.append('<li id="'+client_list[p]['id']+'">'+client_list[p]['name']+'</li>');
                    if(client_list[p]['id'] != '{{ session()->get('id') }}'){
                        client_list_slelect.append('<option value="'+client_list[p]['id']+'">'+client_list[p]['name']+'</option>');
                    }
                }
            }
            $("#client_list").val(select_client_id);
            userlist_window.append('</ul>');
        }
        // 发言
        function say(from_client_name, content, time){
            //解析新浪微博图片
            content = content.replace(/(http|https):\/\/[\w]+.sinaimg.cn[\S]+(jpg|png|gif)/gi, function(img){
                return "<a target='_blank' href='"+img+"'>"+"<img src='"+img+"'>"+"</a>";}
            );
            var from_client_id = $("input[name='client_id']").val();
            //解析url
            content = content.replace(/(http|https):\/\/[\S]+/gi, function(url){
                    if(url.indexOf(".sinaimg.cn/") < 0)
                        return "<a target='_blank' href='"+url+"'>"+url+"</a>";
                    else
                        return url;
                }
            );

            $("#dialog").append('<div class="speech_item"><img src="http://lorempixel.com/38/38/?'+from_client_id+'" class="user_icon" /> '+from_client_name+' <br> '+time+'<div style="clear:both;"></div><p class="triangle-isosceles top">'+content+'</p> </div>').parseEmotion();
            //聊天框自动拉到最底部
            $("#dialog").animate({scrollTop : $("#dialog").offset().top})
        }

        $(function(){
            select_client_id = 'all';
            $("#client_list").change(function(){
                select_client_id = $("#client_list option:selected").attr("value");
            });
            $('.face').click(function(event){
                $(this).sinaEmotion();
                event.stopPropagation();
            });
        });


    </script>


@endsection
