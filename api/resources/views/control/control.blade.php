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
        {!! Form::open(array('route' => ['control.control'], 'method' => 'POST')) !!}
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="disabledInput" class="col-sm-2 control-label">Mã thiết bị</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" disabled value="{{$device->code}}">
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 15px;">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="disabledInput" class="col-sm-2 control-label">Hành động:</label>
                    <div class="col-sm-10">
                        {!! Form::radio('type', '0', true, ['class' => 'form-check-input','id'=> 'control_off'])   !!} Tắt
                        {!! Form::radio('type', '1', false, ['class' => 'form-check-input','id'=> 'control_on'])   !!} Bật
                    </div>
                </div>
            </div>
        </div>

        <div class="clear"></div>
        <br/>

        <label>Cổng: </label><br />
        @foreach($device->ports() as $loop => $aPort)
        <div class="row">
            <div class="col-md-6">
                <div class="input-group grpBlock">
                    <span class="input-group-addon">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input port" name="port[<?php echo $loop; ?>]" 
                                   id="port_<?php echo $loop; ?>" onclick="clickChkPort(this)" 
                                   value="<?php echo $loop + 1; ?>" data-target="<?php echo $loop; ?>">
                        </label>
                        Relay {{$loop+1}}
                    </span>
                    <span class="input-group-addon">
                        <label for="time_" class="col-sm-4 control-label" style="margin-top: 9px;font-weight: inherit;">Thời gian: </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" 
                                   id="time_<?php echo $loop; ?>" name="time_[<?php echo $loop; ?>]" 
                                   placeholder="Thời gian" disabled>
                        </div>
                    </span>
                </div>
            </div>
        </div>
        @endforeach

        <div class="row" style="margin-top: 15px;">
            <div class="col-md-6">
                {!!Form::hidden('device_id',$device->id,['id'=> 'device_id'])!!}
                {!! Form::button('Gửi lệnh',['class' => 'btn btn-primary',"onclick" => "onsubmitForm()"]) !!}
            </div>
        </div>
        {!! Form::close() !!}

    </div><!-- /.box-body -->
</div>

<script type="text/javascript">
    function clickChkPort(item) {
        var block = $(item).attr('data-target');
        if (item.checked) {
            $("#time_" + block).prop('disabled', false);
            $("#time_" + block).focus();
        } else {
            $("#time_" + block).prop('disabled', true);
            $("#time_" + block).val("");
        }
    }

    function onsubmitForm() {
        $(".form-group").removeClass("has-error");
        //Validate
        var check = true;
        var isEdit = false;
        $('.port').each(function () {
            var block = $(this).attr('data-target');
            if (document.getElementById("port_" + block).checked) {
                isEdit = true;
                if (!$("#time_" + block).val()) {
                    check = false;
                    showWarning("Vui lòng nhập thời gian!");
                    $("#time_" + block).focus();
                    $("#time_" + block).parent().parent().addClass("has-error");
                } else if (!isNumeric($("#time_" + block).val())) {
                    check = false;
                    showWarning("Thời gian phải là dạng số!");
                    $("#time_" + block).focus();
                    $("#time_" + block).parent().parent().addClass("has-error");
                } else if (parseFloat($("#time_" + block).val()) <= 0) {
                    check = false;
                    showWarning("Thời gian phải lớn hơn 0!");
                    $("#time_" + block).focus();
                    $("#time_" + block).parent().parent().addClass("has-error");
                }
            }
        });
        if (isEdit === false) {
            showWarning("Vui lòng điều khiển ít nhất 1 relay!");
            return;
        }
        if (check === false) {
            return;
        }

        //Create data to post
        var data = {};
        data["device_id"] = $("#device_id").val();
        data["type"] = "0";
        if ($('#control_on').is(':checked')) {
            data["type"] = "1";
        }

        var arrTime = [];
        var arrPort = [];
        arrTime.push(0);
        $('.port').each(function () {
            var block = $(this).attr('data-target');
            if (document.getElementById("port_" + block).checked) {
                arrPort.push($("#port_" + block).val());
                arrTime.push($("#time_" + block).val());
            } else {
                arrTime.push("");
            }
        });
        data["port"] = arrPort;
        data["time"] = arrTime;
        submitForm(data);
        return false;
    }
    function submitForm(data) {
        showLoading();
        $.ajax({
            url: "{{url('control/control')}}",
            type: "POST",
            data: data,
            dataType: 'json',
            success: function (response) {
                hideLoading();
                window.location.replace("{{url('control/index')}}");
            },
            error: function (err) {
                hideLoading();
                console.error(err);
                if (err.responseJSON.message) {
                    showError(err.responseJSON.message);
                } else {
                    showError("Lỗi hệ thống, vui lòng thử lại sau!");
                }
            }
        });
    }
</script>

@endsection