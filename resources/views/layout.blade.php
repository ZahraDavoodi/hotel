<!DOCTYPE html>
<!-- Microdata markup added by Google Structured Data Markup Helper. -->
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{Session::get('seo_title')}} | hotel | هتل</title>


    <meta name="description" content=" {{Session::get('seo_description')}}">
    <meta name="keywords" content="{{Session::get('keywords')}}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="" sizes="16x16" type="image/png">
    <!--alertify.rtl.css,bootstrap.min.css,bootstrap-3.2.rtl.css,owl.carousel.min.css,owl.theme.default.min.css,persianDatepicker-default.css,font-awesome.min.css,style.css-->
    <link href="{{asset('frontend/css/font-awesome.min.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/owl.carousel.min.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/owl.theme.default.min.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/alertify.rtl.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/persianDatepicker-default.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/xzoom.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/jquery-customselect-1.9.1.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/bootstrap.min.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/bootstrap-rtl.min.css')}}" rel="stylesheet" />
    <link href="{{asset('frontend/css/ion.rangeSlider.min.css')}}" rel="stylesheet" />
    <link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">

{!! NoCaptcha::renderJs() !!}
<!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-145795272-1"></script>
<!--<script async src="{{asset('frontend/js/gtag.js')}}"></script>-->
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-145795272-1');
    </script>
</head>
<body>

@include('items.main_modal')

<nav class="sticky">
    <div class="content ">
        @include('items.main_menu')
    </div>
    </div>
</nav>
<?php

if (Session::get('msg')) {
    echo '<p class="alert alert-success">';
    echo Session::get('msg');
    echo '</p>';
    Session::put('msg',null);
}
// $session_time='';
// if (Session::get('refresh')=='active')
// {  
//     // echo '<p class="alert alert-success">';
//     // echo 'set shodeh'.Session::get('refresh');//Session::get('msg');
//     // echo '</p>';
// }else
// {
//     session::put('refresh','active');
//     $session_time=time()+600;
//     header("Refresh:40");
//     // echo '<p class="alert alert-success">';
//     // echo 'set nashodeh'.Session::get('refresh')=='active';//Session::get('msg');
//     // echo '</p>';
// }
?>
@yield('content')
@include('items.footer')

<script src="{{asset('frontend/js/jquery.min.js')}}"></script>
<script src="{{asset('frontend/js/popper.min.js')}}"></script>
<script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
<script src="{{asset('frontend/js/easing.js')}}"></script>
<script src="{{asset('frontend/js/owl.carousel.js')}}"></script>
<script src="{{asset('frontend/js/migrate.min.js')}}"></script>
<script src="{{asset('frontend/js/persianDatepicker.min.js')}}"></script>
<script src="{{asset('frontend/js/jquery.mask.js')}}"></script>
<script src="{{asset('frontend/js/xzoom.min.js')}}"></script>
<script src="{{asset('frontend/js/jquery-customselect-1.9.1.min.js')}}"></script>
<script src="{{asset('frontend/js/alertify.min.js')}}"></script>
<script src="{{asset('frontend/js/jquery_session.js')}}"></script>
<script src="{{asset('frontend/js/ion.rangeSlider.min.js')}}"></script>
<script src="{{asset('frontend/js/pagination.min.js')}}"></script>
<script src="{{asset('frontend/js/custom.js')}}"></script>

<script>
    $(document).ready(function () {

        $("#range_slider").ionRangeSlider({
            skin:"round",
            type: 'double',
            onChange:filter_ajax
        });

    })
    function filter_ajax(){
        $('.result-holder').html('<div id="loading"><img src="http://localhost:8000/frontend/images/spiner.gif"><p class="text-center">در انتظار بارگیری</p></div>');
        var slider_values=$('#range_slider').data("ionRangeSlider")
        var from_range=slider_values.result.from;
        var to_range=slider_values.result.to;

        var hotel_rate=[];
        $('.filter-item input[name="rate[]"]:checked').each(function () {

            hotel_rate.push($(this).val())
        });




        var order=$('.result-filters select').val()

        var order_val='';
        var arrange='';
        var price_rate=''
        if(order=='0'){order_val='hotel_pName'; arrange='ASC';}
        if(order=='name'){order_val='hotel_pName'; arrange='ASC';}
        if(order=='price'){ price_rate='priceASC'}
        if(order=='priceDesc'){price_rate='priceDESC'}



        if($(".hotel_name").val()!=''){
            var selectedVal1 = $(".hotel_name").val();
        }else{
            var selectedVal1='none';
        }

//alert(selectedVal1+'-'+hotel_rate+''+order_val+'-'+arrange+'-'+order+'-'+from_range+'-'+to_range)

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: 'http://localhost:8000/hotel/search_ajax',
            method: 'POST',
            data: {hotel_name:selectedVal1,order_val:order_val,arrange:arrange,hotel_rate:hotel_rate,price_rate:price_rate,from_range:from_range,to_range:to_range},
            success: function(data) {
                console.log(data);


                $('.result-holder').html(data.result);
                $('.pagination').rpmPagination({domElement:'.search-result-box',limit:10,currentPage: 1});

            },
            async: false
        });


    }


</script>
<script>
    (function () {
        var urlParams = new URLSearchParams(window.location.search);
        //alert(urlParams)
        if(urlParams.has('section')){
            var section='#'+urlParams.get('section')
            $('html, body').animate({
                scrollTop: $(section).offset().top-50
            }, 1000);
            if(urlParams.has('type')){
                var type=urlParams.get('type')
                $('a[href="#' + type + '"]').tab('show');
            }
        }
    })()
</script>
<script type='text/javascript'>
    var onWebChat={ar:[], set: function(a,b){if (typeof onWebChat_==='undefined'){this.ar.
    push([a,b]);}else{onWebChat_.set(a,b);}},get:function(a){return(onWebChat_.get(a));},
        w:(function(){ var ga=document.createElement('script'); ga.type = 'text/javascript';
            ga.async=1;ga.src=('https:'==document.location.protocol?'https:':'http:') +
                    '//www.onwebchat.com/clientchat/d01a7394583435ecee1a09c31236c534';var s=
                    document.getElementsByTagName('script')[0];s.parentNode.insertBefore(ga,s);})()}
</script>
</body>
</html>



