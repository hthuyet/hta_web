@extends('app')

@section('htmlheader_title')
Role
@endsection


@section('main-content')

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Update Role: <strong>{{$model->name}}</strong></h3>
    </div><!-- /.box-header -->
    <!-- form start -->

    @if (session('status'))
    <div class="alert alert-success">
        {{ session()->get('status') }}
    </div>
    @endif

    <!-- form start -->
    {!! Form::open(array('route' => ['role.update', $model->id], 'method' => 'PUT', 'files'=>true)) !!}
    <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <div class="box-body">


        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Tên<span
                    class="lable_red">*</span></label>
            <div class="col-sm-10">
                {!!Form::text('name',$model->name,['class'=>'form-control','placeholder'=>'Enter Tên','maxlength'=>'350'])!!}

            </div>
        </div>

        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label col-sm-2">Description<span
                    class="lable_red">*</span></label>
            <div class="col-sm-10">
                {!! Form::text('description',$model->description, array('class'=>'form-control', 'id' => 'description',
                'placeholder'=>'Enter Description', 'value'=>Input::old('description'))) !!}
            </div>
        </div>

        <div class="form-group">
            @foreach($permissions as $permission)
            <div class="col-sm-3">
                {!! Form::checkbox('permissions[]', $permission->id, $model->perms()->where('id',$permission->id)->count() > 0); !!} {{$permission->name}}
            </div>
            @endforeach
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <div class="form-group" align="center">
                {!!Form::hidden('id',$model->id,['class'=>'form-control'])!!}
                {!! Form::submit('Update Role',['class' => 'addBTCSubmitBtn']) !!}
            </div>
        </div>
        <!-- /.box-footer -->
    </div>
    {!! Form::close() !!}

</div>

@endsection