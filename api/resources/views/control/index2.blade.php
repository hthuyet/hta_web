@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List device</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

            <div class="row">
                {!! Form::open(array('route' => ['control.index'], 'method' => 'GET')) !!}
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Mã thiết bị</label><br />
                        <input type="text" class="form-control" name="code" id="code" value="{{ old('code') }}" placeholder="">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Thiết bị</label><br />
                        {!! Form::select('device_id', ['' => 'Please Select']+$devices, old('device_id'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
