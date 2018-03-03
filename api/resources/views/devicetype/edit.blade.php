@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Sửa devicetype</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => ['devicetype.update', $devicetype->id], 'method' => 'PUT')) !!}
    <div class="box-body">
        <div class="form-group">
            {!! Form::label('code', 'Mã:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('code', $devicetype->code, ['class' => 'form-control', 'placeholder' => 'Enter code']) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('name', 'Tên:', ['class' => 'control-label col-sm-2']) !!}
            <div class="col-sm-10">
                {!! Form::text('name', $devicetype->name, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
            </div>
        </div>
        
        <!-- Custom Tabs -->
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Thông số thiết bị</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <a href="{{ route('devicespecification.create', ['devicetype_id' => $devicetype->id]) }}" class="btn btn-primary">Thêm</a>
                            </div>
                            <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1">Tên</th>
                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1">Thông số</th>
                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1">Mô tả</th>
                                        <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($devicetype->devicespecifications as $devicespecification)
                                    <tr role="row" class="odd">
                                        <td class="">{{$devicespecification->name }}</td>
                                        <td class="">{{$devicespecification->value }}</td>
                                        <td class="">{{$devicespecification->description }}</td>
                                        <td class="">
                                            <a href="{{ route('devicespecification.destroy', $devicespecification->id) }}" onclick="return confirm('Bạn có muốn thực hiện xóa?')" class="btn btn-danger">Xóa</a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div><!-- /.tab-pane -->
            </div>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection