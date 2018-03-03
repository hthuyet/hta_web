@extends('app')

@section('htmlheader_title')
Profile Information
@endsection
@section('main-content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">My Profile</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <!-------->
        <div id="content">
            <div class="box profile">
                <div class="box-header with-border">
                    <h3 class="box-title">PROFILE</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" method="POST" action="{{route('member.update')}}" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">User name</label>

                            <div class="col-sm-10">
                                {!!Form::text('username',$profile->username,['class'=>'form-control','maxlength'=>'', 'id'=>'','readonly'=>'readonly'])!!}

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Avatar</label>

                            <div class="col-sm-8">
                                <input readonly="readonly" class="form-control form-control-disable" id="imgavatar"  type="text">

                            </div>
                            <div class="col-sm-1">
                                <div class="fileUpload btn btn-primary">
                                    <span>Avatar</span>
                                    <input id="uploadBtn3" type="file" class="upload" name="avatar" />
                                </div>
                            </div>
                        </div>

                        @if($profile->avatar!="")
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2"></label>
                            <div class="col-sm-8">
                                @if($profile->avatar!="")
                                {!! HTML::image('uploads/images/avatar/'.$profile->avatar, 'Avatar', array('class' => 'thumb')) !!}
                                @endif
                            </div>
                        </div>
                        @endif
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Tên <span class="lable_red">*</span></label>
                            <div class="col-sm-10">
                                {!!Form::text('name',$profile->name,['class'=>'form-control','maxlength'=>'35', 'id'=>'name'])!!}
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Email <span class="lable_red">*</span></label>
                            <div class="col-sm-10">
                                {!!Form::email('email',$profile->email,['class'=>'form-control', 'id'=>'email'])!!}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Phone number <span class="lable_red">*</span></label>
                            <div class="col-sm-10">
                                {!!Form::text('phone',$profile->phone,['class'=>'form-control','maxlength'=>'11', 'id'=>'phone'])!!}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Person ID</label>
                            <div class="col-sm-10">
                                {!!Form::text('peopleid',$profile->peopleid,['class'=>'form-control', 'id'=>'peopleid'])!!}

                            </div>

                        </div>


                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Images Person ID </label>

                            <div class="col-sm-3">
                                <input id="imgpepole1" placeholder="Choose Fontside of Person ID" disabled="disabled" class="form-control" />
                            </div>

                            <div class="col-sm-2">
                                <div class="fileUpload btn btn-primary">
                                    <span>Fontside</span>
                                    <input id="uploadBtn1" type="file" class="upload" name="fontside" />
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <input id="imgpepole2" placeholder="Choose Backside of Person ID" disabled="disabled" class="form-control" />
                            </div>

                            <div class="col-sm-2">
                                <div class="fileUpload btn btn-primary">
                                    <span>Backside</span>
                                    <input id="uploadBtn2" type="file" class="upload" name="backside" />
                                </div>
                            </div>


                        </div>



                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2"></label>

                            <div class="col-sm-5">
                                @if($profile->fontside!="")
                                {!! HTML::image('uploads/images/personid/'.$profile->fontside, 'Fontside', array('class' => 'imgpersonid')) !!}
                                @endif
                            </div>

                            <div class="col-sm-5">
                                @if($profile->backside!="")
                                {!! HTML::image('uploads/images/personid/'.$profile->backside, 'Backside', array('class' => 'imgpersonid')) !!}
                                @endif
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Day Of Birth <span class="lable_red">*</span></label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask name="birthday" value="{{$profile->birthday}}">

                            </div>

                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Gender <span class="lable_red">*</span></label>
                            <div class="col-sm-10">
                                <select class="form-control" id="gender" name="gender">

                                    @if($gender==0)
                                    <option value="0">[----Choose Gender----]</option>
                                    <option  value="1">Male</option>
                                    <option value="2">Female</option>
                                    @else
                                    <option value="{{$gender}}" selected="selected">{{$gender_name}}</option>
                                    <option  value="{{$genderop_value}}">{{$genderop_name}}</option>
                                    @endif
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Address <span class="lable_red">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  value="{{$profile->address}}" name="address" id="address">
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <div class="form-group" align="center">
                            <button type="submit" class="btn btn-primary" id="add_city">Update</button>
                            <input type="reset" name="reset" value="Reset" class="btn btn-default">
                        </div>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>



        </div>

    </div><!-- /.box-body -->
</div>

@endsection
@section('inpage-script')
<script>
    $('#uploadBtn1').change(function () {

        $('#imgpepole1').val(this.value);

    });

    $('#uploadBtn2').change(function () {

        $('#imgpepole2').val(this.value);

    });

    $('#uploadBtn3').change(function () {

        $('#imgavatar').val(this.value);

    });


    $("#RecoverTransactionPasswordBtn").click(function () {
        $(".wait").css("display", "block");
        $("#RecoverTransactionPasswordBtn").attr('disabled', 'disabled');
    });

</script>
@endsection

