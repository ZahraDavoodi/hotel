@extends('layout')
@section('content')
    <main>
       @include('items.main_slider')
        <header>
            @include('items.main_searchbox')
        </header>
   @include('items.main_best')
{{--   @include('items.main_blog')--}}
   @include('items.main_features')
   @include('items.main_faq')
    </main>
    
 @stop
 
 
 