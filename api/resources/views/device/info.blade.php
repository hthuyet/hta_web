@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title">Thống kê</h3>
        <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <div class="btn-group">
                <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div><!-- /.box-header -->
    <div class="box-body">
        {!! Form::open(array('route' => ['device.info'], 'method' => 'GET')) !!}
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    {!! Form::label('from_date', 'Từ ngày:', ['class' => 'control-label']) !!}
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        {!! Form::text('from_date', old('from_date'), ['class' => 'form-control datepicker pull-right', 'placeholder' => '']) !!}
                    </div>
                </div>
            </div><!-- /.col -->
            <div class="col-md-4">
                <div class="form-group">
                    {!! Form::label('to_date', 'Đến ngày:', ['class' => 'control-label']) !!}
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        {!! Form::text('to_date', old('to_date'), ['class' => 'form-control datepicker pull-right', 'placeholder' => '']) !!}
                    </div>
                </div>
            </div><!-- /.col -->
            <div class="col-md-4">
                <div for="to_date" class="control-label" style="margin-bottom: 5px;">&nbsp;</div>
                <input class="btn btn-primary" type="submit" value="Tìm kiếm">
                <a href="{{url("device/setsensorlist")}}" class="btn btn-primary" >Turn on</a>
                <a href="{{url("device/setsensorlist2")}}" class="btn btn-primary" >Turn off</a>
            </div>
        </div><!-- /.row -->
        {!! Form::close() !!}
        <div class="row">
            <div class="col-md-12">
                <p class="text-center">
                    <strong>{!!old('from_date')!!} - {!!old('to_date')!!}</strong>
                </p>
                <div class="chart">
                    <!-- Sales Chart Canvas -->
                    <canvas id="salesChart" style="height: 180px;"></canvas>
                </div><!-- /.chart-responsive -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- ./box-body -->
    <div class="box-footer">
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <div class="description-block border-right">
                    <h5 class="description-header"></h5>
                    <span class="description-text">TOTAL MT</span>
                </div><!-- /.description-block -->
            </div>
        </div><!-- /.row -->
    </div><!-- /.box-footer -->
</div><!-- /.box -->


@endsection


@section('inpage-script')
<!-- FastClick -->
<script src="{{ asset('/plugins/fastclick/fastclick.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('/js/app.min.js') }}"></script>
<!-- Sparkline -->
<script src="{{ asset('/plugins/sparkline/jquery.sparkline.min.js') }}"></script>
<!-- jvectormap -->
<script src="{{ asset('/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js') }}"></script>
<script src="{{ asset('/plugins/jvectormap/jquery-jvectormap-world-mill-en.js') }}"></script>
<!-- SlimScroll 1.3.0 -->
<script src="{{ asset('/plugins/slimScroll/jquery.slimscroll.min.js') }}"></script>
<!-- ChartJS 1.0.1 -->
<script src="{{ asset('/plugins/chartjs/Chart.min.js') }}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script type="text/javascript">
var temp = {!!$datas!!}
;
var mykeys = [];
var mydatas = {};
var mydatasets = [];
$.each(temp, function (i, v) {
    $.each(v.sensor_data, function (j, m) {
        if (mydatas[m.sensor_id + "_data1"] == undefined) {
            mydatas[m.sensor_id + "_data1"] = [];
        }
        if (mydatas[m.sensor_id + "_data2"] == undefined) {
            mydatas[m.sensor_id + "_data2"] = [];
        }
        mydatas[m.sensor_id + "_data1"].push(m.data1);
        mydatas[m.sensor_id + "_data2"].push(m.data2);
    });
    if ($.inArray(v.sensor_id + "_data2", mykeys) == -1) {
        mykeys.push(v.created_at);
    }
});
$.each(mydatas, function (i, v) {
    mydatasets.push({
        label: i,
        data: v,
        fillColor: "rgba(60,141,188,0.9)",
        strokeColor: "rgba(60,141,188,0.8)",
        pointStrokeColor: "rgba(60,141,188,1)",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(60,141,188,1)",
    });
    
});
$(function () {

    'use strict';
// Get context with jQuery - using jQuery's .get() method.
    var salesChartCanvas = $("#salesChart").get(0).getContext("2d");
// This will get the first returned node in the jQuery collection.
    var salesChart = new Chart(salesChartCanvas);
    var salesChartData = {
        labels: mykeys,
        datasets: mydatasets
    };
    var lineChartOptions = {
        datasetFill: false,
        responsive: true,
        legend: {
            display: true,
            labels: {
                fontColor: 'rgb(255, 99, 132)'
            }
        }
    };
    salesChart.Line(salesChartData, lineChartOptions);
});
$(function () {
    $(".datepicker").datepicker({
        format: 'dd/mm/yyyy',
    });
});
$(function () {
    $(".select2").select2();
});
</script>
<!-- AdminLTE for demo purposes -->

@endsection