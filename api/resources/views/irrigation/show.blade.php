@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Xem irrigation</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <div class="box-body">

        <div class="row">

            <div class="col-sm-6">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('area_name', 'Tên khu vực:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! $irrigation->area_name !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('code', 'Mã quy trình:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! $irrigation->code !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('from_date', 'Từ ngày:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! date('d/m/Y', strtotime($irrigation->from_date)) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('to_date', 'Đến ngày:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! date('d/m/Y', strtotime($irrigation->to_date)) !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Custom Tabs -->
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Danh sách tưới</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="irrigationDetailTable" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <tr role="row">
                                    <th class="col-sm-2">Thiết bị</th>
                                    <th>Bước</th>
                                    <th>Cổng</th>
                                    <th>Điều kiện</th>
                                    <th>Khối lượng</th>
                                    <th>Thời gian (s)</th>
                                    <th>Bắt đầu</th>
                                    <th>Kết thúc</th>
                                </tr>
                                @foreach($irrigation->irrigationdetails as $loop => $aDetail)
                                <tr role="row" class="odd">
                                    <td class="">
                                        {!! $aDetail->device->code !!}
                                        <input type="hidden" name="items[{{$loop}}][id]" value="{{$aDetail->id}}" />
                                    </td>
                                    <td class="">{!! $aDetail->step !!}</td>
                                    <td class="">{!! $aDetail->port !!}</td>
                                    <td class="">{!! $aDetail->condition !!}</td>
                                    <td class="">{!! $aDetail->weight !!}</td>
                                    <td class="">{!! $aDetail->time !!}</td>
                                    <td class="">{!! $aDetail->from !!}</td>
                                    <td class="">{!! $aDetail->to !!}</td>
                                </tr>
                                @endforeach
                            </table>
                        </div>
                    </div>
                </div><!-- /.tab-pane -->
            </div>
        </div>
    </div><!-- /.box-body -->

</div>
@endsection
@section('inpage-script')
@endsection