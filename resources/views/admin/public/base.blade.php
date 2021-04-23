<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <input type="hidden" name="csrf-token" content="{{csrf_token()}}">
    <link rel="stylesheet" href="{{ URL::asset('statics/admin/assets/css/bootstrap.min.css')  }}">
    <link rel="stylesheet" href="{{ URL::asset('statics/admin/assets/css/font-awesome.min.css')  }}">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
    <link rel="stylesheet" href="{{ URL::asset('statics/admin/assets/css/ace.min.css')  }}" />
    <link rel="stylesheet" href="{{ URL::asset('statics/admin/assets/css/ace-rtl.min.css')  }}" />
    <link rel="stylesheet" href="{{ URL::asset('statics/admin/assets/css/ace-skins.min.css')  }}" />

    <script src="{{ URL::asset('statics/admin/assets/js/ace-extra.min.js')  }}"></script>
    @yield('css')
</head>
<body>

@yield('main')

</body>
@yield('footer')
</html>



<script src="http://apps.bdimg.com/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='{{URL::asset('statics/admin/assets/js/jquery-2.0.3.min.js')}}'>"+"<"+"script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='{{URL::asset('statics/admin/assets/js/jquery-1.10.2.min.js')}}'>"+"<"+"script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='{{URL::asset('statics/admin/assets/js/jquery.mobile.custom.min.js')}}'>"+"<"+"script>");
</script>

<script src="{{URL::asset('statics/admin/assets/js/bootstrap.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/typeahead-bs2.min.js')}}"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="{{URL::asset('statics/admin/assets/js/excanvas.min.js')}}"></script>
<![endif]-->

<script src="{{URL::asset('statics/admin/assets/js/jquery-ui-1.10.3.custom.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/jquery.ui.touch-punch.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/jquery.slimscroll.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/jquery.easy-pie-chart.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/jquery.sparkline.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/flot/jquery.flot.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/flot/jquery.flot.pie.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/flot/jquery.flot.resize.min.js')}}"></script>

<!-- ace scripts -->

<script src="{{URL::asset('statics/admin/assets/js/ace-elements.min.js')}}"></script>
<script src="{{URL::asset('statics/admin/assets/js/ace.min.js')}}"></script>

<script>
    $(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    })
</script>

@yield('js')
