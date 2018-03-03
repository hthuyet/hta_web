@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List device</h3>
        <div class="pull-right">
        @if (Auth::user()->can('device-manager'))
            <a href="{{ route('device.create') }}" class="btn btn-primary">Thêm</a>
        @endif 
        </div>
    </div><!-- /.box-header -->
    <div class="box-body">
		@if(Auth::user()->can('device-manager'))
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

            <div class="row">
                {!! Form::open(array('route' => ['device.index'], 'method' => 'GET')) !!}
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Mã thiết bị</label><br />
                        <input type="text" class="form-control" name="code" id="code" value="{{ old('code') }}" placeholder="">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Loại thiết bị</label><br />
                        {!! Form::select('devicetype_id', ['' => '---Please Select---']+$devicetypes, old('devicetype_id'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Người quản lý</label><br />
                        {!! Form::select('assign_id', ['' => '---Please Select---']+$assigns, old('assign_id'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Trạng thái thiết bị</label><br />
                        {!! Form::select('status', ['' => '---Please Select---','0'=>'Nhập kho','1'=>'Gán khách hàng','2'=>'Kích hoạt','4'=>'Mất/Hỏng'], old('status'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label></label>
                        <input class="btn btn-primary" type="submit" value="Filter">
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
		@endif
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Mã</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Loại thiết bị</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Ngày nhập kho</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($devices as $device)
                            <tr role="row" class="odd">
                                <td class="">{{$device->code }}</td>
                                <td class="">{{$device->devicetype->name }}</td>
                                <td class="">{{date('d/m/Y', strtotime($device->created_at)) }}</td>
                                <td>
                                    
                                    @if (Auth::user()->can('device-manager'))
                                    <a href="{{ route('device.edit', $device->id) }}" class="btn-xs btn btn-primary">Edit</a>
                                    <a href="{{ route('device.destroy', $device->id) }}" class="btn-xs btn btn-danger">Delete</a>
                                    @else
                                    <a href="{{ url('device/unassign?id='.$device->id) }}" class="btn-xs btn btn-danger">Xóa</a>
                                    <a href="{{ url('device/lost?id='.$device->id) }}" class="btn-xs btn btn-danger">Báo hỏng/Báo mất</a>
                                    @endif

                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$devices->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $devices->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
