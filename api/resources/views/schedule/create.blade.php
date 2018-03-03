@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<link rel="stylesheet" type="text/css" media="screen"
      href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới schedule</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <form action="{{ url('schedule') }}" method="post">
        <div class="box-body">
            <div class="row">
                <div class="form-group">
                    {!! Form::label('type', 'Loại:', ['class' => 'control-label col-sm-4']) !!}
                    <div class="col-sm-8">
                        {!! Form::select('type', ['1' => 'Hẹn theo thời điểm cố định','2' => 'Định kỳ theo ngày'], old('type'), ['required','class' => 'form-control select2','id' => 'type'])  !!}
                    </div>
                </div>
                @if($device == null)
                <div class="form-group">
                    {!! Form::label('device_id', 'Thiết bị:', ['class' => 'control-label col-sm-4']) !!}
                    <div class="col-sm-8">
                        {!! Form::select('device_id', $devices, old('device_id'), ['required','class' => 'form-control select2','id' => 'device_id'])  !!}
                    </div>
                </div>
                @else
                {!!Form::hidden('device_id',$device->id,['id'=> 'device_id'])!!}
                @endif
                <div class="form-group type-1">
                    {!! Form::label('content', 'Lịch:', ['class' => 'control-label col-sm-4']) !!}
                    <div class="col-sm-8">
                        {!! Form::text('content', null, ['required','class' => 'form-control', 'placeholder' => 'Enter key']) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">Cổng</label><br />
                    @foreach($device->ports() as $loop => $aPort)
                    {!! Form::checkbox('port[]', $loop+1, true, [])   !!} Relay {{$loop+1}}
                    @if($device->driver->canTimer() == true)
                    <label>Thời gian: </label>
                    {!! Form::text('time['.($loop+1).']', null, [ 'placeholder' => 'Enter time']) !!}
                    @endif
                    <br />
                    @endforeach
                </div>
            </div>
            <br />
            <div class="row row-area">
            </div>
            {!! Form::submit('Đặt lịch',['class' => 'btn btn-primary']) !!}
        </div><!-- /.box-body -->

    </form>
</div>


@endsection
@section('inpage-script')
<script>
    function typeChange() {
        if ($("#type").val() == 1) {
            $("#content").inputmask({"mask": '99/99/9999 99:99:99'});
        } else {
            $("#content").inputmask({"mask": '99:99:99'});
        }
    }
    $("#type").change(typeChange);
    typeChange();
</script>
@endsection