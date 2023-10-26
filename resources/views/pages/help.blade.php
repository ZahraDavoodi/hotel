@extends('layout')

@section('content')
<main>
    {{ Breadcrumbs::render('help') }}
    <section id="ajancy_info" >
        <div class="container">

            <div class="row shadow p-2 ">
                <h4 class="title">راهنمای سایت</h4>
                <div class="container">
                    <h3 class="text-center">ثبت تورهای بدون اقامت در هتل (مدت اقامت صفر شب)</h3>
                    <img src="{{'/frontend/images/help1.jpg'}}"  class="img-responsive help_img" alt="راهنمای سایت">
                    <h3 class="text-center">ثبت تورهای با اقامت در هتل</h3>
                    <img src="{{'/frontend/images/help2.jpg'}}"  class="img-responsive help_img" alt="راهنمای سایت">
                </div>


            </div>
        </div>
    </section>
</main>

@endsection