@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Sửa service</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => ['service.update', $service->id], 'method' => 'PUT')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('name', 'Tên:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::text('name', $service->name, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
        </div>
        <div class="form-group">
            {!! Form::label('status', 'Status:', ['class' => 'control-label col-sm-2']) !!}
            {!! Form::select('status', ['0' => 'No','1' => 'Yes'], $service->status, ['class' => 'form-control select2'])  !!}
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection