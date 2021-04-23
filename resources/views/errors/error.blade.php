
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @break
            @endforeach
        </ul>
    </div>
@endif
@if(session('success_status'))
    <div class="alert alert-success">
        {{ session('success_status') }}
    </div>
    <script>
        setTimeout(function (){
            $(".alert-success").hide();
        },3000)
    </script>
@endif
@if(session('error_status'))
    <div class="alert alert-danger">
        {{ session('error_status') }}
    </div>
    <script>
        setTimeout(function (){
            $(".alert-danger").hide();
        },3000)
    </script>
@endif
