@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới irrigation</h3>
    </div><!-- /.box-header -->

    <!-- form start -->
    {!! Form::open(array("id" => "formIrri",'onsubmit' => 'return validateOnSubmit(this);','route' => 'irrigation.store', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('area_name', 'Tên khu vực:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('area_name', null, ["id"=>"txtName",'class' => 'form-control', 'placeholder' => 'Tên khu vực']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('code', 'Mã quy trình:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('code', null, ["id"=>"txtCode",'class' => 'form-control', 'placeholder' => 'Mã quy trình']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('from_date', 'Ngày bắt đầu:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('from_date', null, ["id"=>"txtForm",'class' => 'form-control datepicker', 'placeholder' => 'Ngày bắt đầu']) !!}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('to_date', 'Ngày kết thúc:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('to_date', null, ["id"=>"txtTo",'class' => 'form-control datepicker', 'placeholder' => 'Ngày kết thúc']) !!}
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
                            <div class="pull-right">
                                <a href="#" class="btn btn-primary them-moi" id="them-moi">Thêm</a>
                            </div>
                            <table id="irrigationDetailTable" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <tr role="row">
                                    <th class="col-sm-2">Thiết bị</th>
                                    <th>Bước</th>
                                    <th>Cổng</th>
                                    <th>Điều kiện</th>
                                    <th>Khối lượng</th>
                                    <th>Bắt đầu</th>
                                    <th>Thời gian (s)</th>
                                    <th>Kết thúc</th>
                                    <th></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div><!-- /.tab-pane -->
            </div>
        </div>
    </div><!-- /.box-body -->

</div><!-- /.box-body -->

<div class="box-footer">
    {!! Form::submit('Thêm mới',['class' => 'btn btn-primary',"onclick" => "onsubmitForm()"]) !!}
</div>
{!! Form::close() !!}
</div>
@endsection
@section('inpage-script')
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
 <script id="rowTemplate" type="text/x-jQuery-tmpl">
    <tr role="row" class="odd">
    <td class="form-group trRow">
    {!! Form::select('items[${stt}][device_id]', $devices, null, ['class' => 'form-control select2','id' => 'device_id_${stt}'])  !!}
    <input type="hidden" name="items[${stt}][id]" value="" />
    </td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][step]', null, ['class' => 'form-control', 'placeholder' => 'Bước']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][port]', null, ["id" => 'port_${stt}','class' => 'form-control', 'placeholder' => 'Cổng']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][condition]', null, ['class' => 'form-control', 'placeholder' => 'Điều kiện']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][weight]', null, ['class' => 'form-control', 'placeholder' => 'Khối lượng']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][from]', null, ["id" => 'from_${stt}', 'class' => 'form-control timemask', 'placeholder' => 'Bắt đầu', "onkeyup"=>'updateEndTime("${stt}")']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][time]', null, ["id" => 'time_${stt}','class' => 'form-control', 'placeholder' => 'Thời gian (s)',"onkeyup"=>'updateEndTime("${stt}")']) !!}</td>
    <td class="form-group trRow">{!! Form::text('items[${stt}][to]', null, ["id" => 'to_${stt}','class' => 'form-control timemask', 'placeholder' => 'Kết thúc',"readOnly"=>true]) !!}</td>
    <td class="form-group trRow">
    <i class="fa fa-fw fa-remove"></i>
    </td>
    </tr>
</script>
<script type="text/javascript">
    $(".timemask").inputmask({"mask": '99:99:99'});
// Render the books using the template
    function addRow(stt) {
        $("#rowTemplate").tmpl({'stt': stt}).appendTo("#irrigationDetailTable");
    }
    $(".them-moi").click(function () {
        var stt = $('#irrigationDetailTable tr').length - 1;
        addRow(stt);
        $(".timemask").inputmask({"mask": '99:99:99'});
    });
    $(document).on('click', '.fa-remove', function (e) {
        e.preventDefault();
        $(this).closest('tr').remove();
    });

    function updateEndTime(stt) {
        var from = $("#from_" + stt).val();
        if (from.indexOf("_") >= 0 || !$("#time_" + stt).val()) {
            $("#to_" + stt).val("");
        } else {
            var timeForm = from.split(":");
            var hh = timeForm[0];
            var mm = timeForm[1];
            var ss = timeForm[2];
            var date = new Date();
            date.setHours(hh);
            date.setMinutes(mm);
            date.setSeconds(ss);

            date.setSeconds(date.getSeconds() + parseInt($("#time_" + stt).val()));

            hh = date.getHours();
            mm = date.getMinutes();
            ss = date.getSeconds();
            if (hh < 10) {
                hh = "0" + hh;
            }
            if (mm < 10) {
                mm = "0" + mm;
            }
            if (ss < 10) {
                ss = "0" + ss;
            }
            $("#to_" + stt).val(hh + ":" + mm + ":" + ss);
        }
    }

    function onsubmitForm() {
        if (validateOnSubmit() === true) {
            return $("#formIrri").submit();
        }
    }

    function validateOnSubmit(form) {
        var check = true;
        resetMessage();
        $(".form-group").removeClass("has-error");
//        $("#txtName").parent().parent().removeClass("has-error");
//        $("#txtCode").parent().parent().removeClass("has-error");
//        $("#txtForm").parent().parent().removeClass("has-error");
//        $("#txtTo").parent().parent().removeClass("has-error");
        if (!$("#txtName").val()) {
            $("#txtName").parent().parent().addClass("has-error");
            showError("Vui lòng nhập tên khu vực!");
            $("#txtName").focus();
            check = false;
        }
        if (!$("#txtCode").val()) {
            $("#txtCode").parent().parent().addClass("has-error");
            showError("Vui lòng nhập mã quy trình!");
            $("#txtCode").focus();
            check = false;
        }
        if (!$("#txtForm").val()) {
            $("#txtForm").parent().parent().addClass("has-error");
            showError("Vui lòng nhập từ ngày!");
            $("#txtForm").focus();
            check = false;
        }
        if (!$("#txtTo").val()) {
            $("#txtTo").parent().parent().addClass("has-error");
            showError("Vui lòng nhập đến ngày!");
            $("#txtTo").focus();
            check = false;
        }
        var fromDate = convertToDate($("#txtForm").val());
        var toDate = convertToDate($("#txtTo").val());
        if (fromDate >= toDate) {
            $("#txtForm").parent().parent().addClass("has-error");
            showError("Ngày bắt đầu phải lớn hơn ngày kết thúc!");
            $("#txtForm").focus();
            check = false;
        }
        var stt = $('#irrigationDetailTable tr').length - 1;
        if (stt <= 0) {
            showError("Vui lòng nhập danh sách tưới!");
            check = false;
            $("#them-moi").trigger("click");
        }

        if (check == false) {
            return false;
        }
        for (var i = 0; i < stt; i++) {
            if (!$("#device_id_" + i).val()) {
                $("#device_id_" + i).parent().addClass("has-error");
                showError("Vui lòng chọn thiết bị!");
                check = false;
            }
            if (!$("#port_" + i).val()) {
                $("#port_" + i).parent().addClass("has-error");
                showError("Vui lòng nhập cổng cho thiết bị!");
                $("#port_" + i).focus();
                check = false;
            }
            if (!$("#from_" + i).val()) {
                $("#from_" + i).parent().addClass("has-error");
                showError("Vui lòng nhập thời gian bắt đầu cho thiết bị!");
                $("#from_" + i).focus();
                check = false;
            }
            if (!$("#time_" + i).val()) {
                $("#time_" + i).parent().addClass("has-error");
                showError("Vui lòng nhập thời gian tưới cho thiết bị!");
                $("#time_" + i).focus();
                check = false;
            }
        }
        return check;
    }

</script>
@endsection