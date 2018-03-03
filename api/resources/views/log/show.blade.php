@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $log->name }}</h1>
<hr>

<a href="{{ route('log.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('log.edit', $log->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['log.destroy', $log->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
