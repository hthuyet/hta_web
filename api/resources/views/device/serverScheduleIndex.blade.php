@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List device</h3>
        @if (Auth::user()->hasRole('admin'))
        <div class="pull-right">
            <a href="{{ route('device.create') }}" class="btn btn-primary">Thêm</a>
        </div>
        @endif 
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

            <div class="row">
                {!! Form::open(array('route' => ['device.index'], 'method' => 'GET')) !!}
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Mã thiết bị</label><br />
                        <input type="text" class="form-control" name="code" id="code" value="{{ old('code') }}" placeholder="">
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Lịch</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Loại</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($schedules as $schedule)
                            <tr role="row" class="odd">
                                <td class="">{{$schedule->content }}</td>
                                <td class="">
                                    @if ($schedule->type == 1)
                                    Hẹn theo thời điểm cố định
                                    @elseif ($schedule->type == 2)
                                    Định kỳ theo ngày
                                    @endif
                                </td>
                                <td>
                                    <a href="{{ route('schedule.edit', $schedule->id) }}" class="btn-xs btn btn-primary">Edit</a>
                                    <a href="{{ route('schedule.destroy', $schedule->id) }}" class="btn-xs btn btn-danger">Delete</a>
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
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$schedules->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $schedules->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
