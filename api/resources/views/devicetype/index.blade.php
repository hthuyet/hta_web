@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List devicetype</h3>
        @if (Auth::user()->hasRole('admin'))
        <div class="pull-right">
            <a href="{{ route('devicetype.create') }}" class="btn btn-primary">Thêm</a>
        </div>
        @endif 
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Mã</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Tên</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($devicetypes as $devicetype)
                            <tr role="row" class="odd">
                                <td class="">{{$devicetype->code }}</td>
                                <td class="">{{$devicetype->name }}</td>
                                <td>
                                    <a href="{{ route('devicetype.edit', $devicetype->id) }}" class="btn-xs btn btn-primary">Edit</a>
                                    <a href="{{ route('devicetype.destroy', $devicetype->id) }}" class="btn-xs btn btn-danger">Delete</a>
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
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$devicetypes->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $devicetypes->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
