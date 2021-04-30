function sendCode1(target) {
    var url = $(target).attr('data-url');

    var mobile = $("#" + $(target).attr('data-mobile')).val();

    var form = $(target).attr('data-form');
    console.log(form);
    var check_ret = check_require($("#" + form));
    if(check_ret.ret != 0){
        layer.msg(check_ret.msg);
        return false;
    }
    if (!mobile) {
        layer.msg('请填写手机号码');
        return false;
    }
    $("#cbox").show();
    act_check(url,mobile);

    // loading(true)
    //
    // $.post(url, {mobile: mobile}, function (data) {
    //     loading(false);
    //     layer.msg(data.msg);
    //     if (data.status == 1) {
    //         $("#send-code").html(60);
    //         daojishi();
    //         $("#send-code").attr('disabled', true);
    //     }
    // }, 'json')
}
function sendCode(target) {
    var url = $(target).attr('data-url');

    var mobile = $("#" + $(target).attr('data-mobile')).val();
    var img_code = $("#" + $(target).attr('data-img_code')).val();

    var form = $(target).closest('form');

    var check_ret = check_require(form);
    console.log(check_ret);
    if(check_ret.ret != 0){
        layer.msg(check_ret.msg);
        return false;
    }
    if (!mobile) {
        layer.msg('请填写手机号码');
        return false;
    }
    $("#cbox").show();

    loading(true)

    $.post(url, {mobile: mobile,img_code:img_code}, function (data) {
        loading(false);
       layer.msg(data.msg);
       if (data.status == 1) {
         $("#send-code").html(60);
        daojishi();
        $("#send-code").attr('disabled', true);
     }
     }, 'json')
}


const LANG_OTHER = {
    'YPcaptcha_01': '请点击按钮开始验证',
    'YPcaptcha_02': '请按顺序点击:',
    'YPcaptcha_03': '向右拖动滑块填充拼图',
    'YPcaptcha_04': '验证失败，请重试',
    'YPcaptcha_05': '验证成功'
}
function act_check(url,phone) {
    /*短信行为验证*/
    new YpRiddler({
        expired: 10,
        mode: 'dialog',
        winWidth: '40%',
        lang: 'zh-cn', // 界面语言, 目前支持: 中文简体 zh-cn, 英语 en
        langPack: LANG_OTHER, // 你可以通过该参数自定义语言包, 其优先级高于lang
        container: document.getElementById('cbox'),
        appId: 'bd471f903e8849aeb6b530e270ecddb8',
        version: 'v1',
        onError: function (param) {
            if (!param.code) {
                layer.msg('错误请求');
            }
            else if (parseInt(param.code / 100) == 5) {
                // 服务不可用时，开发者可采取替代方案
                layer.msg('验证服务暂不可用');
            }
            else if (param.code == 429) {
                layer.msg('请求过于频繁，请稍后再试');

            }
            else if (param.code == 403) {
                layer.msg('请求受限，请稍后再试');

            }
            else if (param.code == 400) {
                layer.msg('非法请求，请检查参数');
            }
            // 异常回调
            layer.msg('验证服务异常');
            return false;
        },
        onSuccess: function (validInfo, close, useDefaultSuccess) {
            // 成功回调
//            alert('验证通过! token=' + validInfo.token + ', authenticate=' + validInfo.authenticate)
            // 验证成功默认样式
            var token = validInfo.token;
            var authenticate = validInfo.authenticate;
            $.post("/index/login/act_check",
                {'token':token,authenticate:authenticate},function(d){
                    console.log(d);
                    close();
                    if(d.status == 1){
//                    layer.msg(d.info,{icon:1});
//                            layer.msg(d.info);
                        useDefaultSuccess(true);
                        // code_count_down(phone);
                        loading(true);
                        $("#cbox").hide();
                        $.post(url, {mobile: phone}, function (data) {
                            loading(false);
                            layer.msg(data.msg);
                            if (data.status == 1) {
                                $("#send-code").html(60);
                                daojishi();
                                $("#send-code").attr('disabled', true);
                            }
                        }, 'json')

                    }else{
                        layer.msg(d.info);
                        return false;
                    }
                });
        },
        onFail: function (code, msg, retry) {
            // 失败回调
//                layer.msg('出错啦：' + msg + ' code: ' + code);
            retry()
        },
        beforeStart: function (next) {
            console.log('验证马上开始')
            next()
        },
        onExit: function () {
            // 退出验证 （仅限dialog模式有效）
            console.log('退出验证')
        }
    })
}

function daojishi() {
    var daojishi = setInterval(function () {
        var time = parseInt($("#send-code").html());
        if (time <= 1) {
            $("#send-code").html('发送验证码');
            $("#send-code").attr('disabled', false);
            clearInterval(daojishi);
        } else {
            $("#send-code").html(time - 1);
        }
    }, 1000)
}
/**
 * class:copy_btn
 * data-clipboard-text="赋值的内容"
 */
function copy() {
    var clipboard = new Clipboard('.copy_btn');
    clipboard.on('success', function(e) {
        layer.msg('复制成功', '');
        e.clearSelection();
    });
}
function ajaxPost(target) {
    var form = $(target).attr('data-form');
    var self = $(target);
    var is_click = self.attr('data-is_click')
    if(is_click == 1){
        return false;
    }
    self.attr('data-is_click',1);
    var data = $("#" + form).serialize();
    var url = $("#" + form).attr('action');
    loading(true)
    $.post(url, data, function (data) {
        loading(false)
        self.attr('data-is_click',0);
        if (data.result == 1) {
            if (data.toUrl) {
                layer.msg(data.info, '', function () {
                    window.location.href = data.toUrl;
                })
            } else {
                layer.msg(data.info, '');
            }
        } else {
            if (data.toUrl) {
                layer.msg(data.info, '', function () {
                    window.location.href = data.toUrl;
                })
            } else {
                layer.msg(data.info, '');
            }
            return false;
        }
    }, 'json')
}
function checkMobile(tel) {
    var reg = /(^1[3|4|5|7|8][0-9]{9}$)/;
    if (reg.test(tel)) {
        return true;
    }else{
        return false;
    };
}
function check_require(obj) {
    //检测
    var msg = '';
    var is_require = 0;
    obj.find("input,textarea").each(function () {
        var attr  = $(this).hasClass('required');
        console.log(attr);
        var val = $(this).val();
        if(attr == true && !val){
            is_require = 1;
            msg = $(this).attr('placeholder');
            msg = msg.replace('请输入','').replace('输入','');
            return ;
        }
    });

    if(is_require == 1){
        return {
            'ret':1,
            'msg':'请输入'+msg
        };
    }else{
        return {
            'ret':0
        };
    }

}

function goback() {
    window.location.go(-1);
}

function jump(url)
{
    window.location.href = url;
}
function openeye(obj) {
    var active = obj.attr('data-active');
    if(active == 1){
        obj.prev("input[type='text']").attr('type','password');
        obj.attr('class','eye');
        obj.attr('data-active',0);

    }else{
        obj.prev("input[type='password']").attr('type','text');
        obj.attr('data-active',1);

        obj.attr('class','eye active');
    }

}
function loading(is_open,type) {
    if(!type){
        type = 2;
    }
    if(is_open){
        layer.load(type);
        setTimeout(function(){
            layer.closeAll('loading');
        }, 2000);
    }else{
        layer.closeAll('loading');
    }

}
/*懒加载*/
function lazy_loading(url,elem,mb,ent_con) {
    if(!elem){
        elem = '.flow_load'
    }
    if(!ent_con){
        ent_con='没有更多了'
    }
    if(!mb){
        mb = 120
    }
    layui.use('flow', function() {
        var flow = layui.flow;
        console.log(flow);
        flow.load({
            elem: elem //流加载容器
//                , scrollElem: '.flow_load' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,end:ent_con
            ,isLazyimg: true
            ,mb:mb
            , done: function (page, next) { //执行下一页的回调
                //模拟数据插入
                $.get(url,{p:page},function(data){
                    var d = data;
                    console.log(d);
                    var totalRows = d['contents']['total'];
                    var listRows = d['contents']['per_page'];
                    var p_num = listRows*page;
                    next(d.content,p_num<totalRows);
                });
            }
        });
    })
}
/*上下滚动走马灯*/
function zmd_scroll(obj){

    var $wrapper = obj,
        $ul = $wrapper.find('.scroll_item'),
        $li = $wrapper.find('.scroll_con');
    var srollDistance = $li.height() * $li.length
    var cloneFirst = $ul.children(':nth-child(1)').clone();
    $ul.append(cloneFirst)
    scroll($ul,$li,srollDistance);
}
function scroll($ul,$li,srollDistance) {
    var timer = setInterval(function() {
        var scrollDis = +$ul[0].offsetTop - $li.height()
        $ul.animate({
            top: scrollDis + 'px'
        }, function() {
            if (Math.abs(scrollDis) >= srollDistance) {
                $ul.css('top', '0px')
            }
        })
    }, 2000)
}

(function (global) {
    function Counter(options) {
        this.init(options);
    }

    Counter.__DEFAULTS__ = {
        // 展示效果的元素
        el: null,
        // 起始数
        fromNumber: 0,
        // 结束数
        toNumber: 0,
        // 用于支持小数
        enableFloat: false,
        // 持续时间
        duration: 300
    };

    Counter.prototype.init = function (options) {
        this.precision = getPrecision(options.toNumber);
        this.setOptions(options);
        if (typeof this.el === 'string') {
            this.el = document.querySelector(this.el);
        }
        console.log(this.toNumber);

        if (!(this.el instanceof Element)) {
            throw TypeError('el must be a element.');
        }
    }

    Counter.prototype.setOptions = function (options) {
        var defaults = Counter.__DEFAULTS__, opts = options && typeof options === 'object' ? options : {}, k;
        for( k in defaults ) {
            this[k] = defaults[k];
        }
        for ( k in this ) {
            if (k in opts && typeof opts[k] !== 'undefined'
                && opts[k] !== this[k]
            ) {
                if ( typeof this[k] === 'number' ) {
                    opts[k] = parseFloat(opts[k]) || this[k];
                }

                else if ( typeof this[k] === 'boolean' ) {
                    opts[k] = !!opts[k];
                }

                else if ( typeof this[k] === 'object' ) {
                    opts[k] = typeof opts[k] === 'object' ? opts[k] : this[k];
                }

                else {
                    opts[k] = this[k].construtor(opts[k]);
                }

                if ( this[k] == null || typeof(this[k]) === typeof(opts[k]) ) {
                    this[k] = opts[k];
                }
            }
        }
    }

    Counter.prototype.start = function () {
        const self = this,
            from = parseFloat( self.fromNumber ),
            to = parseFloat( self.toNumber ),
            enableFloat = self.enableFloat,
            precision = self.precision,
            duration = self.duration,
            el = self.el,
            startTime = Date.now();

        const update = function () {
            var nowTime = Date.now(),
                ratio = Math.min( 1, (nowTime - startTime) / duration ),
                result = ratio * (to - from) + from;
            // console.log(from, self.toNumber);
            if (enableFloat) {
                result = result.toFixed(precision);
            } else {
                result = Math.floor(result);
            }

            if ( ratio == 1 || el.innerHTML == to ) {
                clearInterval(self.__timerId__);
            }

            el.innerHTML = result;
        };
        if (self.__timerId__) {
            clearInterval(self.__timerId__);
        }
        self.__timerId__ = setInterval(update, 1000 / 60);
    }

    // 获取小数点精度
    function getPrecision(num) {
        var n = num + '', i = n.indexOf('.') + 1;
        n = n.slice( i, n.length);
        return i ? n.length : i;
    }
    // 自定义方法
    Math.getPrecision = getPrecision;
    global.Counter = Counter;
})(this);

//数字滚动增加
function scroll_create_num(showBox,end_num,duration){
    new Counter({
        el: showBox,
        fromNumber: showBox.innerHTML,
        toNumber: end_num || 0,
        enableFloat: true,
        duration: duration ? duration : 800
    }).start();
}

