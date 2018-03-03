@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới service</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => 'service.store', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('name', 'Tên:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('status', 'Status:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::select('status', ['' => 'Please Select','0' => 'No','1' => 'Yes'], null, ['class' => 'form-control select2'])  !!}
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Thêm mới',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection