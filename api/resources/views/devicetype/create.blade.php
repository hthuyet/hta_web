@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới devicetype</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => 'devicetype.store', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('code', 'Mã:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('code', null, ['class' => 'form-control', 'placeholder' => 'Enter code']) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('name', 'Tên:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
            </div>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Thêm mới',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection