@extends('app')

@section('htmlheader_title')
Home
@endsection


@section('main-content')
<h1>{{ $user->name }}</h1>
<p class="lead">{{ $user->email }}</p>
<p class="lead">{{ $user->phone }}</p>
<p class="lead">{{ $user->phone }}</p>
<hr>

<a href="{{ route('user.index') }}" class="btn btn-info">Back</a>
<a href="{{ route('user.edit', $user->id) }}" class="btn btn-primary">Edit</a>
{!! Form::open(['method' => 'DELETE','route' => ['user.destroy', $user->id], 'style' =>'display: inline;']) !!}
    {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
{!! Form::close() !!}
@endsection
