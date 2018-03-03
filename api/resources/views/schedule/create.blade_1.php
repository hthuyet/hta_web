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
    <form action="{{ url('schedule?device_id='.$device->id) }}" method="post">
        <div class="box-body">
            <div class="row">
                <div class="form-group">
                    {!! Form::label('type', 'Loại:', ['class' => 'control-label col-sm-4']) !!}
                    <div class="col-sm-8">
                        {!! Form::select('type', ['1' => 'Hẹn theo thời điểm cố định','2' => 'Định kỳ theo ngày'], old('type'), ['class' => 'form-control select2','id' => 'type'])  !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('content', 'Lịch:', ['class' => 'control-label col-sm-4']) !!}
                    <div class="col-sm-8">
                        {!! Form::text('content', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4">Mã thiết bị</label><br />
                    {!! Form::checkbox('port[]', '1', true)   !!} Relay 1
                    {!! Form::checkbox('port[]', '2', true)   !!} Relay 2
                    {!! Form::checkbox('port[]', '3', true)   !!} Relay 3
                    {!! Form::checkbox('port[]', '4', true)   !!} Relay 4
                    {!! Form::checkbox('port[]', '5', true)   !!} Relay 5
                </div>
            </div>
            <br />
            <div class="row row-area">
            </div>
            {!!Form::hidden('device_id',$device->id,['id'=> 'device_id'])!!}
            {!! Form::submit('Đặt lịch',['class' => 'btn btn-primary']) !!}
        </div><!-- /.box-body -->

    </form>
</div>


@endsection
@section('inpage-script')
<script>
    function typeChange() {
        if ($("#type").val() == 1) {
            $("#content").inputmask({"mask": '99:99:99'});
        } else {
            $("#content").inputmask({"mask": '99/99/9999 99:99:99'});
        }
    }
    $("#type").change(typeChange);
    typeChange();
</script>
@endsection