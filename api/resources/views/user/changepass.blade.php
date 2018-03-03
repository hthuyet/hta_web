@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Đổi mật khẩu</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => ['user.changepass'], 'method' => 'POST','onsubmit' => 'return onSubmit(this);')) !!}
    <div class="box-body">
        <div class="form-group row">
            {!! Form::label('username', 'Tên đăng nhập:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-7">
                {!! Form::text('username', $user->username, ['class' => 'form-control', 'placeholder' => 'Enter username','readonly' => 'readonly']) !!}
            </div>
        </div>
        <div class="form-group row">
            {!! Form::label('email', 'Email:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-7">
                {!! Form::text('email', $user->email, ['class' => 'form-control', 'placeholder' => 'Enter email','readonly' => 'readonly']) !!}
            </div>
        </div>
        <div class="form-group row">
            {!! Form::label('phone', 'Điện thoại:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-7">
                {!! Form::text('phone', $user->phone, ['class' => 'form-control', 'placeholder' => 'Enter phone','readonly' => 'readonly']) !!}
            </div>
        </div>
        <div class="form-group row"  id="grpPassOld">
            {!! Form::label('password', 'Mật khẩu cũ:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-5">
                {!! Form::password('passwordOld', ['class' => 'form-control','id' => 'passOld', 'placeholder' => 'Password Old']) !!}
            </div>
            <div class="col-sm-5">
                <small id="passwordHelp" class="text-danger">
                </small>      
            </div>
        </div>
        <div class="form-group row"  id="grpPassNew">
            {!! Form::label('passNew', 'Mật khẩu mới:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-5">
                {!! Form::password('password', ['class' => 'form-control', 'id' => 'passNew', 'placeholder' => 'Password New']) !!}
            </div>
            <div class="col-sm-5">
                <small id="passwordNewHelp" class="text-danger">
                </small>      
            </div>
        </div>
        <div class="form-group row">
            {!! Form::label('passwordNewConfirm', 'Nhập lại mật khẩu mới:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-5">
                {!! Form::password('passwordNewConfirm', ['class' => 'form-control','id' => 'passNewConfirm', 'placeholder' => 'Password New Confirm']) !!}
            </div>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>

<script type="text/javascript">
    function showError(message) {
        $("#myAlert").show();
        $("#alertContent").html(message);
        $("#myAlert").alert();
        setTimeout(function () {
            $("#myAlert").hide();
        }, 3000);
    }

    function onSubmit(item) {
        $("#passwordHelp").html("");
        $("#passwordNewHelp").html("");
        $("#grpPassOld").removeClass("has-error");
        $("#grpPassNew").removeClass("has-error");
        $("#myAlert").hide();

        if (!$("#passOld").val()) {
            $("#grpPassOld").addClass("has-error");
            showError("Please enter password Old!");
            $("#passwordHelp").html("Vui lòng nhập lại mật khẩu cũ!");
            return false;
        }

//        var data = {passwordOld: $("#passOld").val()};
//
//        $.ajax({
//            type: 'POST',
//            url: "{{url('/user/checkpass')}}",
//            data: data,
//            crossDomain: true,
//            dataType: 'json',
//            success: function (response) {
//                console.log(response);
//                if (response.code === true) {
//                    console.log("------true--");
//                    return true;
//                } else {
//                    console.log("------false--");
//                }
//            }
//        });

        if (!$("#passNew").val()) {
            $("#grpPassNew").addClass("has-error");
            showError("Please enter password New!");
            $("#passwordNewHelp").html("Vui lòng nhập mật khẩu mới!");
            return false;
        }
        if ($("#passNew").val() != $("#passNewConfirm").val()) {
            $("#grpPassNew").addClass("has-error");
            showError("Pass new confirm not match!");
            $("#passwordNewHelp").html("Mật khẩu mới và nhập lại không trùng nhau!");
            return false;
        }
        return true;
    }

    function checkPass(pass) {
        $.ajax({
            type: 'POST',
            url: "{{url('/user/checkpass')}}",
            data: data,
            crossDomain: true,
            dataType: 'json',
            success: function (response) {
                console.log(response);
                if (response.code === true) {

                } else {

                }
            }
        });
    }

</script>
@endsection
