@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Personal Information</h3>
    </div><!-- /.box-header -->
    <!-- form start -->

    @if (session('status'))
    <div class="alert alert-success">
        {{ session()->get('status') }}
    </div>
    @endif

    <!-- form start -->
    <form class="form-horizontal" method="POST" action="{{route('user.store')}}">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <div class="box-body">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">User name<span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!! Form::text('username', null, ['class' => 'form-control', 'placeholder' => 'Enter username']) !!}

                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Full name<span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Enter fullname']) !!}

                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Email <span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!!Form::email('email', null, ['class'=>'form-control', 'id'=>'email' , 'placeholder' => 'Enter email'])!!}
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Phone number <span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!!Form::text('phone',null,['class'=>'form-control','maxlength'=>'11', 'id'=>'phone', 'placeholder' => 'Enter phone number'])!!}
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Login Password<span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!! Form::password('password', ['class' => 'form-control', 'placeholder' => 'Login Password']) !!}
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Confirm Login Password<span
                        class="lable_red">*</span></label>
                <div class="col-sm-10">
                    {!! Form::password('repassword', ['class' => 'form-control', 'placeholder' => 'Confirm Login Password']) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('role_user', 'Role:', ['class' => 'control-label col-sm-2']) !!}
                <div class="col-sm-10">
                    {!! Form::select('role_user', ['' => 'Please Select'] + $roles, NULL, ['class' => 'form-control select2'])  !!}
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <div class="form-group" align="center">
                    {!! Form::submit('Register',['class' => 'addBTCSubmitBtn','onclick' => 'submitform();']) !!}
                </div>
            </div>
            <!-- /.box-footer -->
        </div>
    </form>

</div>

@endsection
