@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $devicetype->name }}</h1>
<hr>

<a href="{{ route('devicetype.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('devicetype.edit', $devicetype->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['devicetype.destroy', $devicetype->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
