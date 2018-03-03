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
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Loại Lệnh</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Ngày gửi</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Nội dung</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Thời gian gửi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($histories as $aHistory)
                            <tr role="row" class="odd">
                                <td class="">
                                    @if($aHistory->type == 1)
                                    Điều khiển
                                    @elseif($aHistory->type == 2)
                                    Đặt lịch server
                                    @elseif($aHistory->type == 3)
                                    Đặt lịch thiết bị
                                    @elseif($aHistory->type == 4)
                                    Đặt lịch tưới theo quy trình
                                    @endif
                                </td>
                                <td>
                                    <span>
                                        @foreach($aHistory->ports() as $keyPort => $aPort)
                                        <input {{$aPort == 1?'checked':''}} name="port[]" type="checkbox" disabled>&nbsp;&nbsp;
                                        @endforeach
                                    </span>
                                </td>
                                <td>
                                    <?php echo html_entity_decode($aHistory->description); ?>
                                </td>
                                <td class="">{{date('d/m/Y H:i:s', strtotime($aHistory->created_at)) }}</td>
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
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$histories->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $histories->setPath('')->appends(['id' => app('request')->input('id')])->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection


@section('inpage-script')
@endsection