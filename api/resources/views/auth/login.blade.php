@extends('auth.auth')

@section('htmlheader_title')
Log in
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
            <p class="login-box-msg">LOGIN</p>
            <form action="{{ url('/auth/login') }}" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="Username" name="username"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
                    </div><!-- /.col -->
                    <div class="col-xs-8">
                        <a href="{{ url('/password/email') }}" class="pull-right">Reset password</a><br>
                    </div><!-- /.col -->
                </div>
            </form>
<!--            <div class="social-auth-links text-center">
                <p>- OR -</p>
                <a href="{{ url('/login/facebook') }}" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
            </div>-->

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
