@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Cập nhật thông tin người dùng</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => ['user.update', $user->id], 'method' => 'PUT')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('username', 'Username:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::text('username', $user->username, ['class' => 'form-control', 'placeholder' => 'Enter username']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('email', 'Email:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::text('email', $user->email, ['class' => 'form-control', 'placeholder' => 'Enter email']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('phone', 'Phone:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::text('phone', $user->phone, ['class' => 'form-control', 'placeholder' => 'Enter phone']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('password', 'Password:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::password('password', ['class' => 'form-control', 'placeholder' => 'Password']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('role_user', 'Role:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::select('role_user', ['' => 'Please Select'] + $roles, $user->roles()->first() != null?$user->roles()->first()->id:NULL, ['class' => 'form-control select2'])  !!}
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection
