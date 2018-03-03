@extends('app')

@section('htmlheader_title')
    Home
@endsection


@section('main-content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Edit Config</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        {!! Form::open(array('route' => ['config.update', $config->id], 'method' => 'PUT', 'files'=>true)) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('key', 'Key:', ['class' => 'control-label col-sm-2']) !!}
                <div class="col-sm-10">
                    {!! Form::text('key', $config->key, ['class' => 'form-control', 'placeholder' => 'Enter key', 'readonly' => 'readonly']) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('description', 'Description:', ['class' => 'control-label col-sm-2']) !!}
                <div class="col-sm-10">
                    {!! $config->description !!}
                </div>
            </div>
            <div class="form-group">
                @if ($config->type == 1)
                    {!! Form::label('value', 'Value:', ['class' => 'control-label col-sm-2']) !!}
                    <div class="col-sm-10">
                        {!! Form::text('value', $config->value, ['class' => 'form-control', 'placeholder' => 'Enter value']) !!}
                    </div>

                @elseif ($config->type == 2)
                    {!! Form::label('value', 'Value:', ['class' => 'control-label col-sm-2']) !!}
                    <div class="col-sm-10">
                        {!! Form::textarea('value', $config->value, ['id' => 'content', 'class' => 'form-control', 'placeholder' => 'Enter value']) !!}
                    </div>

                @elseif ($config->type == 3)

                    <label for="inputEmail3" class="col-sm-2 control-label col-sm-2" style="padding-left: 0px;"><strong>Image
                            Value:</strong></label>
                    <div class="col-sm-8">
                        {!! Form::file('value') !!}
                    </div>
                    <br>
                    <br>
                    <br>
                    @if($config->value!="")

                        <label for="inputEmail3" class="col-sm-2 control-label col-sm-2" style="padding-left: 0px;"><strong>Images:</strong>
                        </label>
                        <div class="col-sm-8">
                            {!! HTML::image('uploads/images/avantar/'.$config->value, 'value', array('class' => 'thumb')) !!}
                        </div>

                    @endif

                @else
                    {!! Form::label('value', 'Value:', ['class' => 'control-label col-sm-2']) !!}
                    <div class="col-sm-10">
                        {!! Form::text('value', $config->value, ['class' => 'form-control', 'placeholder' => 'Enter value']) !!}
                    </div>
                @endif
            </div>


        </div><!-- /.box-body -->

        <div class="box-footer">
            {!! Form::submit('Cập nhật',['class' => 'btn btn-primary']) !!}
        </div>
        {!! Form::close() !!}
    </div>
@endsection
@section('inpage-script')
    <script src="{{ asset('plugins/editor/ckeditor/ckeditor.js') }}" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            CKEDITOR.replace('content', {
                "filebrowserBrowseUrl": "{!! url('filemanager/show') !!}",
            });
        };
    </script>
@endsection