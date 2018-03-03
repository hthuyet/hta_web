@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới notification</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => 'notification.store', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('to', 'To:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::select('to', ['' => 'Please Select'] + $users, null, ['class' => 'form-control select2'])  !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('title', 'Title:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('title', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('description', 'Description:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('description', null, ['class' => 'form-control', 'placeholder' => 'Enter description']) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('content', 'Content:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('content', null, ['class' => 'form-control', 'placeholder' => 'Enter content']) !!}
            </div>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Thêm mới',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection