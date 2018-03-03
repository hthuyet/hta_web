@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">Cập nhật lịch thiết bị</h3>
    </div><!-- /.box-header -->


    <div class="box-body">
        {!! Form::open(array("id" => "frmForm",'route' => ['deviceSchedule.index',"id"=>$device->id], 'method' => 'POST','onsubmit' => 'return onSubmit(this);')) !!}
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="relay">Relay</label>
                    <select class="form-control" name="relay" id="relay" required>
                        <option value="">--Please Select--</option>
                        <?php foreach ($device->ports() as $keyPort => $aPort) { ?>
                            <?php if ($schedule && $schedule->relay == ($keyPort + 1)) { ?>
                                <option value="<?php echo $keyPort + 1; ?>" selected="selected">Relay {{$keyPort + 1 }}</option>
                            <?php } else { ?>
                                <option value="<?php echo $keyPort + 1; ?>">Relay {{$keyPort + 1 }}</option>
                            <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
        </div>

        <?php $data = json_decode($schedule->data); ?>
        <?php $blocks = $data->block; ?>
        <?php $times = $data->enable; ?>
        <?php $numbers = $data->number; ?>
        
        <?php $blockss = $device->blocks(); ?>

        <?php foreach ($blockss as $i => $blockItem) { ?>
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group grpBlock" id="grpBlock_<?php echo $i; ?>">
                        <span class="input-group-addon">
                            <label class="form-check-label">
                                <input type="hidden" name="block[<?php echo $i; ?>]"  value="0">
                                <input type="checkbox" class="form-check-input blockRelay" name="block[<?php echo $i; ?>]" 
                                       id="block_<?php echo $i; ?>" onclick="clickChkBlock(this)" 
                                       value="1" data-target="<?php echo $i; ?>" 
                                       <?php if ($blocks[$i] == "1") { ?> checked="checked" <?php } ?> >
                            </label>
                            Block <?php echo $i + 1; ?>
                        </span>
                        <span class="input-group-addon">
                            <label for="relay">Bắt đầu</label>
                            <input type="text" class="form-control timeBlock" 
                                   id="time_<?php echo $i; ?>" name="enable[<?php echo $i; ?>]"  data-target="<?php echo $i; ?>"
                                   placeholder="Enable block <?php echo $i + 1; ?>" value="{{ $times[$i] }}">
                        </span>
                        <span class="input-group-addon">
                            <label for="number">Thời gian (s)</label>
                            <input type="number" class="form-control numberBlock" id="number_<?php echo $i; ?>" name="number[<?php echo $i; ?>]"  data-target="<?php echo $i; ?>"
                                   placeholder="Number block <?php echo $i + 1; ?>" value="{{ $numbers[$i] }}" onkeydown="return enterNumber(this, event)">
                        </span>
                    </div>
                </div>
            </div>
        <?php } ?>

        <div class="clearfix" style="margin-top: 20px;"></div>
        <!--        <div class="form-group">
                    <label>Relay</label><br />
                    {!! Form::checkbox('port[]', '1', true, [])   !!} Relay 1
                    {!! Form::text('time[0]', null, ['class' => 'form-control', 'data-inputmask' => '"mask": "99:99:99"', 'data-mask'=>'data-mask' ]) !!} <br />
                    {!! Form::checkbox('port[]', '2', true, [])   !!} Relay 2
                    {!! Form::text('time[1]', null, ['class' => 'form-control', 'data-inputmask' => '"mask": "99:99:99"', 'data-mask'=>'data-mask' ]) !!} <br />
                    {!! Form::checkbox('port[]', '3', true, [])   !!} Relay 3
                    {!! Form::text('time[2]', null, ['class' => 'form-control', 'data-inputmask' => '"mask": "99:99:99"', 'data-mask'=>'data-mask' ]) !!} <br />
                    {!! Form::checkbox('port[]', '4', true, [])   !!} Relay 4
                    {!! Form::text('time[3]', null, ['class' => 'form-control', 'data-inputmask' => '"mask": "99:99:99"', 'data-mask'=>'data-mask' ]) !!} <br />
                </div>-->
        {!!Form::hidden('device_id',$device->id,['id'=> 'device_id'])!!}
        {!!Form::hidden('id',$schedule->id,['id'=> 'schedule_id'])!!}
        <a href="{{ route('deviceSchedule.index', ['id'=>$schedule->device_id]) }}" class="btn btn-default">Trở về</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
        {!! Form::close() !!}
    </div><!-- /.box-body -->
</div>

<script type="text/javascript">
    function clickChkBlock(item) {
        var block = $(item).attr('data-target');
        if (item.checked) {
            $("#time_" + block).prop('disabled', false);
            $("#time_" + block).focus();
            $("#number_" + block).prop('disabled', false);
        } else {
            $("#time_" + block).prop('disabled', true);
            //$("#time_" + block).val("");
            $("#number_" + block).prop('disabled', true);
            //$("#number_" + block).val("300");
            if ($("#block_" + (parseInt(block) + 1)).length > 0) {
                $("#block_" + (parseInt(block) + 1)).focus();
            }
        }
    }
    function enterNumber(item, e) {
        var block = $(item).attr('data-target');
        if (e.keyCode == 13) {
            if ($("#block_" + (parseInt(block) + 1)).length > 0) {
                $("#block_" + (parseInt(block) + 1)).focus();
            } else {
                $("#frmForm").submit();
            }
            return false;
        }
    }

    function onSubmit(item) {
        resetMessage();
        $(".grpBlock").removeClass("has-error");
        if (!$("#relay").val()) {
            showError("Please select relay!", "", false);
            return false;
        }
        var check = true;
        $('.blockRelay:checkbox:checked').each(function () {
            var block = $(this).attr('data-target');
            if (!$("#time_" + block).val()) {
                showError("Please enter time!");
                $("#grpBlock_" + block).addClass("has-error");
                check = false;
            }
            if (!validateHhMm($("#time_" + block).val())) {
                showError("Time must be format HH:mm:ss!");
                $("#grpBlock_" + block).addClass("has-error");
                check = false;
            }
        });

        if (check == false) {
            return false;
        }

        var data = {};
        data["device_id"] = $("#device_id").val();
        data["relay"] = $("#relay").val();

        var arrBlock = [];
        var arrTime = [];
        var arrNumber = [];
        $('.blockRelay').each(function () {
            var block = $(this).attr('data-target');
            if (document.getElementById("block_" + block).checked) {
                arrBlock.push(1);
            } else {
                arrBlock.push(0);
            }
            arrTime.push($("#time_" + block).val());
            arrNumber.push($("#number_" + block).val());

        });
        data["block"] = arrBlock;
        data["enable"] = arrTime;
        data["number"] = arrNumber;
        submitForm(data);
        return false;
    }

    function submitForm(data) {
        showLoading();
        $.ajax({
            url: "{{url('deviceSchedule')}}" + "/" + $("#schedule_id").val(),
            type: "PUT",
            data: data,
            dataType: 'json',
            success: function (response) {
                hideLoading();
                window.location.replace("{{url('deviceSchedule')}}" + "?id=" + $("#device_id").val());
            },
            error: function (err) {
                hideLoading();
                console.error(err);
                showError(err.responseJSON.message);
            }
        });
    }

    $(document).ready(function () {
        $('.timeBlock').prop('disabled', true);
        $('.numberBlock').prop('disabled', true);
        $('.timeBlock').inputmask("hh:mm:ss", {
            placeholder: "HH:MM:SS",
            insertMode: false,
            showMaskOnHover: false,
            hourFormat: 12,
            "oncomplete": function () {
                var block = $(this).attr('data-target');
                $("#number_" + block).focus();
            },
        });

        $('.blockRelay:checkbox:checked').each(function () {
            var block = $(this).attr('data-target');
            $("#time_" + block).prop('disabled', false);
            $("#number_" + block).prop('disabled', false);
        });
    });
</script>

@endsection
