@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $device->name }}</h1>
<hr>

<a href="{{ route('device.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('device.edit', $device->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['device.destroy', $device->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
