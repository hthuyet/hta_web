@extends('app')

@section('htmlheader_title')
    
@endsection

@section('contentheader_title')
    403 Error Page
@endsection

@section('$contentheader_description')
@endsection

@section('main-content')

<div class="error-page">
    <h2 class="headline text-yellow"> 403</h2>
    <div class="error-content">
        <h3><i class="fa fa-warning text-yellow"></i> Oops! Forbidden.</h3>
        <p>
            Bạn không có quyền truy cập chức năng này, click vào <a href='{{ url('/home') }}'>trở lại trang chủ</a>
        </p>
        <form class='search-form'>
            <div class='input-group'>
                <input type="text" name="search" class='form-control' placeholder="Search"/>
                <div class="input-group-btn">
                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
                </div>
            </div><!-- /.input-group -->
        </form>
    </div><!-- /.error-content -->
</div><!-- /.error-page -->
@endsection