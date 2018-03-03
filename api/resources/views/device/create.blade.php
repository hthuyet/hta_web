@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới device</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => 'device.store', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('devicetype_id', 'Loại thiết bị:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::select('devicetype_id', ['' => 'Please Select']+$devicetypes, null, ['class' => 'form-control select2'])  !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('code', 'Mã:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('code', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('manufacture_date', 'Ngày xuất xưởng:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('manufacture_date', null, ['class' => 'form-control datepicker', 'placeholder' => 'Enter key']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('warranty_date', 'Ngày hết hạn bảo hành:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('warranty_date', null, ['class' => 'form-control datepicker', 'placeholder' => 'Enter key']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('assign_id', 'Gán cho khách hàng:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::select('assign_id', ['' => 'Please Select']+$users, null, ['class' => 'form-control select2'])  !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Thêm mới',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection
@section('inpage-script')
@endsection