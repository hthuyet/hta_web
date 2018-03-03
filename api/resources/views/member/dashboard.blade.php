@extends('app')

@section('htmlheader_title')
My Wallet
@endsection


@section('main-content')

<div class="box">
    <h3 class="box-title">Announcement</h3>
    <!-- /.box-header -->            
    <div class="box-body">
        <div class="table-responsive">
            {!! $announcement !!}
        </div>

    </div>
</div>
@endsection