@extends('layout')

@section('content')
<main>
    {{ Breadcrumbs::render('about') }}
    <section >

        <div class="container">

            <div class="row shadow p-2">
                <h4 class="title">درباره ما</h4>
                <div class="container">
                    <div class="col-12">
                        @foreach($info as $info)
                            @php(print($info->info_about))
                        @endforeach
                    </div>
                </div>

    </section>
</main>

@endsection