@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Thêm mới thiết bị</h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    {!! Form::open(array('route' => 'device.assign', 'method' => 'POST')) !!}
    <div class="box-body">
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="form-group">
                        {!! Form::label('code', 'Mã:', ['class' => 'control-label col-sm-4']) !!}
                        <div class="col-sm-8">
                            {!! Form::text('code', null, ['class' => 'form-control', 'placeholder' => 'Enter key']) !!}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div  id="map-canvas" style="height:300px;"></div>
            </div>
        </div>


        <!-- Custom Tabs -->
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1" data-toggle="tab">Thông số kỹ thuật</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="row">

                        <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                            <thead>
                                <tr role="row">
                                    <th class="sorting" tabindex="0" rowspan="1" colspan="1">ID</th>
                                    <th class="sorting" tabindex="0" rowspan="1" colspan="1">Specifications</th>
                                    <th class="sorting" tabindex="0" rowspan="1" colspan="1">Value</th>
                                    <th class="sorting" tabindex="0" rowspan="1" colspan="1">Description</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </div>
                </div><!-- /.tab-pane -->
            </div><!-- /.tab-pane -->
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        {!!Form::hidden('long','',['id'=> 'long'])!!}
        {!!Form::hidden('lat','',['id'=> 'lat'])!!}

        {!! Form::submit('Thêm mới',['class' => 'btn btn-primary']) !!}
    </div>
    {!! Form::close() !!}
</div>
@endsection
@section('inpage-script')
<script>
    $(document).ready(function () {
        var lat = $("#lat").val() != ''?$("#lat").val():45.992261;
        var lng = $("#long").val() != ''?$("#long").val():-123.925014;
        var myCenter = new google.maps.LatLng(lat, lng);
        var marker = new google.maps.Marker({
            position: myCenter
        });

        function initialize() {
            var mapProp = {
                center: myCenter,
                zoom: 14,
                draggable: false,
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);
            marker.setMap(map);

            google.maps.event.addListener(map, 'click', function (event) {
                marker.setPosition(event.latLng);
                $("#long").val(event.latLng.lng());
                $("#lat").val(event.latLng.lat());
            });
        }
        initialize();
    });
</script>
@endsection