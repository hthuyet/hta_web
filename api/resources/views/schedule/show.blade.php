@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $schedule->content }}</h1>
<p class="lead">{{ $schedule->type }}</p>
<hr>

<a href="{{ route('schedule.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('schedule.edit', $schedule->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['schedule.destroy', $schedule->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
