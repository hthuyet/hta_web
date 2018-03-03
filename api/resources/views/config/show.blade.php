@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $config->name }}</h1>
<hr>

<a href="{{ route('config.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('config.edit', $config->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['config.destroy', $config->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
