@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">List notification</h3>
        @if (Auth::user()->hasRole('admin'))
        <div class="pull-right">
            <a href="{{ route('notification.create') }}" class="btn btn-primary">Thêm</a>
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
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Title</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Content</th>
                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Created date</th>
<!--                                <th class="sorting" tabindex="0" rowspan="1" colspan="1">Type</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($notifications as $notification)
                            <tr role="row" class="odd">
                                <td class="">{{$notification->title }}</td>
                                <td class="">{{$notification->content }}</td>
                                <td class="">{{date('d/m/Y H:i:s', strtotime($notification->created_at)) }}</td>
<!--                                <td class="">
                                    @if($notification->type == 1)
                                        Url
                                    @elseif($notification->type == 2)
                                        Text
                                    @elseif($notification->type == 3)
                                        Popup
                                    @elseif($notification->type == 4)
                                        Show invoice
                                    @endif
                                </td>-->
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
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Number of records: {{$notifications->total()}}</div>
                </div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                        {!! $notifications->setPath('')->render() !!}
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</div>


@endsection
