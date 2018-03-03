@extends('auth.auth')

@section('htmlheader_title')
Password reset
@endsection

@section('content')

<body class="login-page" style="
    background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.7), 
    rgba(0, 0, 0, 0.5)), 
    url('{{ url('uploads/images/avantar/') }}/{{$background}}');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
">
    <div class="login-box">
        <div class="login-logo">
            {!! HTML::image('uploads/images/avantar/'.$logo, 'User Image', array('width' => '100px')) !!}
        </div><!-- /.login-logo -->

        @if (session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
        @endif


        @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>There are some problem!:</strong><br><br>
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <div class="login-box-body">
            <p class="login-box-msg">RESET PASSWORD</p>
            <form action="{{ url('/password/reset') }}" method="post">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                
                <input type="hidden" class="form-control" placeholder="Email" name="email" value="{{ $emailReset }}"/>
                <input type="hidden" class="form-control" placeholder="Email" name="token" value="{{ $token }}"/>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password_confirmation"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <div class="row">
                    <div class="col-xs-2">
                    </div><!-- /.col -->
                    <div class="col-xs-8">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Reset password</button>
                    </div><!-- /.col -->
                    <div class="col-xs-2">
                    </div><!-- /.col -->
                </div>
            </form>

            <a href="{{ url('/auth/login') }}">Log in</a><br>

        </div><!-- /.login-box-body -->

    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>

@endsection
