@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">Logs list</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

                <div class="col-sm-12 table-responsive">
                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1" style="width: 33%">Username</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"  style="width: 30%;">Mã</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"  style="width: 30%;">Browser</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"  style="width: 20%;">Ip</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"  style="width: 20%;">Date</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($logs as $log)
                            <tr role="row" class="odd">
                                <td class="">{{$log->username }}</td>
                                <td class="">{{$log->code }}</td>
                                <td class="">{{$log->browser }}</td>
                                <td class="">{{$log->ip }}</td>
                                <td class="">{{date('d/m/Y H:i:s', strtotime($log->create_date)) }}</td>
                                <td>
                                    <a href="{{ route('log.show', $log->id) }}" class="btn btn-info">Xem</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>

            <div class="row">
                <div class="col-sm-5">
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$logs->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $logs->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
