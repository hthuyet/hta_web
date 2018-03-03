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
            <div class="btn-group" id="realtime" data-toggle="btn-toggle">
                <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
            </div>
            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="interactive" style="height: 300px;"></div>
    </div><!-- ./box-body -->
    <div class="box-footer">
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

<!-- FLOT CHARTS -->
<script src="{{ asset('/plugins/flot/jquery.flot.min.js') }}"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="{{ asset('/plugins/flot/jquery.flot.resize.min.js') }}"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="{{ asset('plugins/flot/jquery.flot.pie.min.js') }}"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="{{ asset('plugins/flot/jquery.flot.categories.min.js') }}"></script>
<script language="javascript" type="text/javascript" src="{{ asset('plugins/flot/jquery.flot.time.js') }}"></script>


<!-- AdminLTE for demo purposes -->
<!-- Page script -->
<script>
Object.size = function (obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key))
            size++;
    }
    return size;
};
var totalPoints = 20;
var mydatas = {};
var mycolors = {};
function parseDt(dateAsString) {
    return new Date(dateAsString.replace(/-/g, '/'))
}
$(function () {
    var interactive_plot;
    var prevTime;
    function getRealtimeData(num, time, callback) {
        var url = "{{ url ('device/ajaxrealtime')}}?id={{app('request')->input('id')}}&number=" + num;
        if (time) {
            url = url + "&time=" + (time.getTime()/ 1000);
        }
        $.ajax({
            url: url,
            context: document.body
        }).done(function (retdata) {
            $.each(retdata, function (i, v) {
                $.each(v.port_status, function (j, m) {
                    mydatas[m.sensor_id + "_data1"].push([parseDt(v.created_at), m.data1]);
                    mydatas[m.sensor_id + "_data2"].push([parseDt(v.created_at), m.data2]);
                    prevTime = parseDt(v.created_at);
                });
            });

            var res = [];
            $.each(mydatas, function (i, v) {
                res.push({data: mydatas[i], color: mycolors[i]});
            });
            callback(res);
        });
    }


    var updateInterval = 10000; //Fetch data ever x milliseconds
    var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
    function update() {
        getRealtimeData(1, prevTime, function (ret) {
            interactive_plot.setData(ret);

            // Since the axes don't change, we don't need to call plot.setupGrid()
            interactive_plot.setupGrid()
            interactive_plot.draw();
            if (realtime === "on")
                setTimeout(update, updateInterval);
        });
    }
    getRealtimeData(20, prevTime, function (ret) {
        interactive_plot = $.plot("#interactive", ret, {
            grid: {
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0,
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            yaxis: {
                show: true
            },
            xaxis: {
                show: true,
                mode: "time"
            }
        });

        //INITIALIZE REALTIME DATA FETCHING
        if (realtime === "on") {
            update();
        }
    });

    //REALTIME TOGGLE
    $("#realtime .btn").click(function () {
        if ($(this).data("toggle") === "on") {
            realtime = "on";
        } else {
            realtime = "off";
        }
        update();
    });
});

</script>
@endsection