@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<style type="text/css">
    .online{
        background-color: #cce2ce !important;
    }
    .offline {
        background-color: #dde44c !important;
    }
</style>

<div class="box">
    <div class="box-header">
        <h3 class="box-title">List device</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        @if(Auth::user()->can('device-manager'))
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
                        <label>Loại thiết bị</label><br />
                        {!! Form::select('devicetype_id', ['' => 'Please Select']+$devicetypes, old('devicetype_id'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>&nbsp;</label>
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
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Trạng thái thiết bị</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Trạng thái cổng hiện thời</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($devices as $device)
                            <tr role="row" class="odd <?php echo ($device->state == "1" || $device->state == 1) ? "online" : "offline"; ?>">
                                <td class="">{{$device->code }}</td>
                                <td class="">
                                    <?php if($device->state == "1" || $device->state == 1) { ?>
                                    Online
                                    <?php } else { ?>
                                    Offline
                                    <?php } ?>
                                </td>
                                <td>
                                    <span class="port_status_{{$device->id}}">
                                        @foreach($device->ports() as $keyPort => $aPort)
                                        <input {{$aPort == 1?'checked':''}} name="port[]" id="port_status_{{$device->code}}_{{$keyPort}}" type="checkbox" disabled>&nbsp;&nbsp;
                                        @endforeach
                                    </span>
                                </td>
                                <td>
                                    <div class="visible-xs visible-sm">
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Action
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="{{ route('schedule.index', ['device_id'=>$device->id]) }}">DS lịch server</a></li>
                                                <li><a href="{{ route('schedule.create', ['device_id'=>$device->id]) }}">Đặt lịch Server</a></li>
                                                <li><a href="{{ route('deviceSchedule.index', ['id'=>$device->id]) }}">DS lịch Thiết bị</a></li>
                                                <li><a href="{{ route('deviceSchedule.create', ['id'=>$device->id]) }}">Đặt lịch Thiết bị</a></li>
                                                <li><a href="{{ route('control.control', ['id'=>$device->id]) }}">Điều khiển ngay</a></li>
                                                <li><a href="{{ route('control.history', ['id'=>$device->id]) }}">Lịch sử điều khiển</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="hidden-xs hidden-sm">
                                        <a href="{{ route('schedule.index', ['device_id'=>$device->id]) }}" class="btn-xs btn btn-success">DS lịch server</a>
                                        <a href="{{ route('schedule.create', ['device_id'=>$device->id]) }}" class="btn-xs btn btn-success">Đặt lịch Server</a>
                                        <a href="{{ route('deviceSchedule.index', ['id'=>$device->id]) }}" class="btn-xs btn btn-success">DS lịch Thiết bị</a>
                                        <a href="{{ route('deviceSchedule.create', ['id'=>$device->id]) }}" class="btn-xs btn btn-success">Đặt lịch Thiết bị</a>
                                        <a href="{{ route('control.control', ['id'=>$device->id]) }}" class="btn-xs btn btn-success">Điều khiển ngay</a>
                                        <a href="{{ route('control.history', ['id'=>$device->id]) }}" class="btn-xs btn btn-success">Lịch sử điều khiển</a>
                                        <!--<a href="{{ url('device/realtime?id='.$device->id) }}" class="btn-xs btn btn-success">Lịch sử trạng thái</a>-->
                                    </div>

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
@section('inpage-script')
<script>
    var intervalStatus = null;
    function updateRealtimeStatus() {
        $.ajax({
            url: "{{url('ajax/realtimeStatus')}}",
            data: $("form").serialize(),
            crossDomain: true,
            dataType: 'json',
            success: function (data) {
                $(data).each(function (index, value) {
                    if (value.port_status != "") {
                        var ports = $.parseJSON(value.port_status);
                        $(ports).each(function (index2, value2) {
                            $("#port_status_" + value.id + "_" + index2).prop('checked', value2 == "1" ? true : false);
                        });
                    }

                });
            }
        });
    }
    $(document).ready(function () {
        intervalStatus = setInterval(updateRealtimeStatus, 3000);
    });

    var url_socket = "ws://103.1.238.77:6789/deviceState/";

    var listDevice = "";
<?php foreach ($devices as $device): ?>
        listDevice += '<?php echo $device->code; ?>' + ",";
<?php endforeach; ?>
    console.log(listDevice);

    function WebSocketState() {
        console.log("START SOCKET...");
        if ("WebSocket" in window) {
            // Let us open a web socket
            var ws = new WebSocket(url_socket);
            ws.onopen = function () {
                // Web Socket is connected, send data using send()
                ws.send("Message is sent...");
                if (intervalStatus != null) {
                    clearInterval(intervalStatus);
                }
            };
            ws.onmessage = function (evt) {
                if (intervalStatus != null) {
                    clearInterval(intervalStatus);
                }
                //If string then send obj {id, area}
                //Else khong lam gi
                try {
                    var received_msg = JSON.parse(evt.data);
                    if (received_msg) {
                        $(received_msg).each(function (key, device) {
                            var ports = $.parseJSON(device.data);
                            $(ports).each(function (index, value) {
                                $("#port_status_" + device.device + "_" + index).prop('checked', value == "1" ? true : false);
                            });
                        });
                    }
                } catch (err) {
                    console.error(err);
                    var message = {id: evt.data, "lstDevice": listDevice};
                    ws.send(JSON.stringify(message));
                }
            };

            ws.onclose = function () {
                // websocket is closed.
                WebSocketState();
                if (intervalStatus == null) {
                    intervalStatus = setInterval(updateRealtimeStatus, 3000);
                }
            };

            ws.onerror = function (event) {
                console.log("---onerror-------");
                if (intervalStatus == null) {
                    intervalStatus = setInterval(updateRealtimeStatus, 3000);
                }
            };
        } else {
            // The browser doesn't support WebSocket
            alert("WebSocket NOT supported by your Browser!");
            if (intervalStatus == null) {
                intervalStatus = setInterval(updateRealtimeStatus, 3000);
            }
        }

    }
    WebSocketState();
</script>
@endsection
