@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">Danh sách lịch thiết bị</h3>
        <a href="{{ route('deviceSchedule.create', ["id" => $device_id ]) }}" class="btn btn-primary pull-right">Thêm lịch thiết bị</a>
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">STT</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Thiết bị</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Relay</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Data</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Thời gian tạo</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Thời gian cập nhật</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $stt = 1; ?>
                            @foreach($schedules as $schedule)
                            <tr role="row" class="odd">
                                <td class="">
                                    {{$stt++ }}
                                </td>
                                <td class="">
                                    {{$schedule->serial }}
                                </td>
                                <td class="">
                                    {{$schedule->relay }}
                                </td>
                                <td>
                                    <?php echo html_entity_decode($schedule->description); ?>
                                </td>
                                <td>
                                    {{$schedule->created_at }}
                                </td>
                                <td>
                                    {{$schedule->updated_at }}
                                </td>
                                <td>
                                    <a href="{{ route('deviceSchedule.edit', ['id'=>$schedule->id]) }}" class="btn-xs btn btn-primary">Sửa</a>
                                    <a href="{{ route('deviceSchedule.delete', $schedule->id) }}" onclick="return confirm('Bạn muốn xóa lịch thiết bị này?')" 
                                       class="btn-xs btn btn-danger">Xóa</a>
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
            <div class="row">
                <div class="col-sm-12">
                    <a href="{{ route('control.index') }}" class="btn btn-default">Trở về</a>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>
@endsection
