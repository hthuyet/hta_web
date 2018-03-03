@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Cập nhật schedule</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => ['schedule.update', $schedule->id], 'method' => 'PUT', 'files'=>true)) !!}
    <div class="box-body">
        <div class="row">
            <div class="form-group">
                {!! Form::label('type', 'Loại:', ['class' => 'control-label col-sm-4']) !!}
                <div class="col-sm-8">
                    {!! Form::select('type', ['1' => 'Hẹn theo thời điểm cố định','2' => 'Định kỳ theo ngày'], $schedule->type, ['class' => 'form-control select2','id' => 'type'])  !!}
                </div>
            </div>
            <div class="form-group type-1">
                {!! Form::label('content', 'Lịch:', ['class' => 'control-label col-sm-4']) !!}
                <div class="col-sm-8">
                    {!! Form::text('content', $schedule->content, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
                </div>
            </div>
			<div class="form-group">
				<label class="control-label">Cổng</label><br />
				@foreach($schedule->device->ports() as $loop => $aPort)
                                <?php if(isset($relayStates[$loop]) && $relayStates[$loop] == "1"){ ?>
                                {!! Form::checkbox('port[]', $loop+1, true, [])   !!} Relay {{$loop+1}}
                                <?php }else { ?>
                                {!! Form::checkbox('port[]', $loop+1, false, [])   !!} Relay {{$loop+1}}
                                <?php } ?>
				
				@if($schedule->device->driver->canTimer() == true)
				<label>Thời gian: </label>
				{!! Form::text('time['.($loop+1).']', isset($relayTime[$loop]) ? $relayTime[$loop] : null, [ 'placeholder' => 'Enter time']) !!}
				@endif
				<br />
				@endforeach
			</div>
        </div>
        <br />
        <div class="row row-area">
        </div>
        {!!Form::hidden('device_id',$schedule->device_id,['id'=> 'device_id'])!!}
        {!! Form::submit('Đặt lịch',['class' => 'btn btn-primary']) !!}
    </div><!-- /.box-body -->

    {!! Form::close() !!}
</div>


@endsection
@section('inpage-script')
<script>
    $("#content").inputmask({"mask": '99/99/9999 99:99:99'});
    $("#from").inputmask({"mask": '99:99:99'});
    $("#to").inputmask({"mask": '99:99:99'});
    function typeChange() {
        if ($("#type").val() == 1) {
            $(".type-1").show();
            $(".type-2").hide();
        } else {
            $(".type-1").hide();
            $(".type-2").show();
        }
    }
    $("#type").change(typeChange);
    typeChange();
</script>
@endsection