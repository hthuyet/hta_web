@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List irrigation</h3>
        <div class="pull-right">
            @if (Auth::user()->can('irrigation-manager'))
            <a href="{{ route('irrigation.create') }}" class="btn btn-primary">Thêm</a>
            @endif 
        </div>
    </div><!-- /.box-header -->
    <div class="box-body">
        @if(Auth::user()->can('irrigation-manager'))
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

            <div class="row">
                {!! Form::open(array('route' => ['irrigation.index'], 'method' => 'GET')) !!}
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Mã quy trình</label><br />
                        <input type="text" class="form-control" name="code" id="code" value="{{ old('code') }}" placeholder="">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Trạng thái</label><br />
                        {!! Form::select('status', ['' => '---Please Select---','0'=>'Không hoạt động','1'=>'Hoạt động'], old('status'), ['class' => 'form-control select2'])  !!}
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label></label>
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
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Khu vực</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Từ ngày</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Đến ngày</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Trạng thái</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($irrigations as $irrigation)
                            <tr role="row" class="odd">
                                <td class="">{{$irrigation->code }}</td>
                                <td class="">{{$irrigation->area_name }}</td>
                                <td class="">{{date('d/m/Y', strtotime($irrigation->from_date)) }}</td>
                                <td class="">{{date('d/m/Y', strtotime($irrigation->to_date)) }}</td>
                                <td>
                                    <a href="{{ url('irrigation/toggle?id='.$irrigation->id) }}" class="btn-xs btn btn-primary">
                                        @if ($irrigation->status == 1)
                                        <i class="fa fa-fw fa-pause"></i>
                                        @elseif ($irrigation->status == 0)
                                        <i class="fa fa-fw fa-play"></i>
                                        @endif
                                    </a>
                                </td>
                                <td>
                                    <a href="{{ route('irrigation.show', $irrigation->id) }}" class="btn-xs btn btn-primary">Xem</a>
                                    <a href="{{ route('irrigation.edit', $irrigation->id) }}" class="btn-xs btn btn-primary">Edit</a>
                                    <a href="{{ url('irrigation/deleteItem?id='.$irrigation->id) }}" class="btn-xs btn btn-danger">Delete</a>
<!--                                    {!! Form::open(array('route' => ['irrigation.destroy', $irrigation->id], 'method' => 'delete')) !!}
                                        <button class="btn-xs btn btn-danger" type="submit" >Delete</button>
                                    {!! Form::close() !!}-->
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
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$irrigations->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $irrigations->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
