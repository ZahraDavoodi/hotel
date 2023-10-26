$(document).ready(function () {

    var i = 10, t, n;
    $(window).scroll(function () {

        $(window).scrollTop() > i ? ($(".top-menu").slideUp(), $(".mega-menu").addClass("fixed"), $(".mega-menu .logo img").css("width", "100px")) : ($(".top-menu").slideDown(), $(".mega-menu").removeClass("fixed"), $(".mega-menu .logo img").css("width", "120px"));
        $(this).scrollTop() > i ? $(".scrollUp").show() : $(".scrollUp").hide()
    });
    $(".top-menu .login-link").click(function () {
        $(".top-menu .login-layer").slideToggle()
    });

    $('.mega-menu-responsive .fa-plus').click(function () {
        $(this).parent().find('ul').slideToggle()
    })
    $('.close-menu,.responsive-menu-layer').click(function () {
        $(".mega-menu-responsive").animate({right: "-500px"});
        $(".responsive-menu-layer").fadeOut("slow")
    })
    $('.open-menu').click(function () {
        $(".mega-menu-responsive").animate({right: "0px"});
        $(".responsive-menu-layer").fadeIn("slow")
    })


    jQuery(".owl-carousel").owlCarousel({
        autoplay: true,
        lazyLoad: true,
        loop: true,
        margin: 20,
        navText: [
            "<i class='fa fa-caret-left'></i>",
            "<i class='fa fa-caret-right'></i>"
        ],
        /*
         animateOut: 'fadeOut',
         animateIn: 'fadeIn',
         */
        responsiveClass: true,

        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: true,
        responsive: {
            0: {
                items: 1
            },

            600: {
                items: 3
            },

            1024: {
                items: 4
            },

            1366: {
                items: 4
            }
        }
    });

   if($(".xzoom-container").length >0){
       $('.xzoom, .xzoom-gallery').xzoom({lens:true, title: true, tint: '#333', Xoffset: 15});

   }


   /*search box*/
    var p = new persianDate();
    var endDate='today';

    $('.inDate').persianDatepicker({
        startDate: 'today',
        formatDate: "YYYY-0M-0D",
        endDate: p.now().addDay(365).toString("YYYY/MM/DD"),
        calendarPosition: {
            x:20,
            y: 0,
        },
        onSelect: function (){ endDate=$('[name="inDate"]').val(); $('.outDate').focus() },
    });

    $('.outDate').persianDatepicker({
        startDate:endDate,
        formatDate: "YYYY-0M-0D",
        endDate: p.now().addDay(365).toString("YYYY/MM/DD"),
        calendarPosition: {
            x:20,
            y: 0,
        },
        onSelect: function (){ if($('[name="inDate"]').val() > $('[name="outDate"]').val()){  alertify.myAlert('تاریخ ورود نباید از تاریخ خروج کمتر باشد'); $('[name="outDate"]').val(''); }},
    })

    $('.form-search').find('select').customselect({"search":true });
    $('.form-search').find('button[type="submit"]').click(function(e) {
        if ($(this).closest('.form-search').find('select').val() == 0)
        {       e.preventDefault();
            alertify.myAlert('مقصد را وارد کنید');
        }
    })

   if($('.room_number').length>0){
       $('.room_number').bind('change',function () {

               $('.room_list').empty();

               if($(this).val()>3 || $(this).val()<=0){
               $(this).after('<p class="text-error text-white">تعداد اتاق ها نمیتواند بیشتر از سه باشد</p>')
               $(this).val();
               $(this).css('background-color','rgba(255,0,0,0.5)')
           }else{
               $(this).css('background-color','rgba(255,255,255,1)');
               $('.text-error').remove();
               var i=0;
               var val=$(this).val();
               for(i=1; i<=val ; i++){
                   var rooms='<div class="col-12 room_row"><label> اتاق'+ i+' :</label><label>بزرگسال <div class="form-group"><input  class="adult_number form-control" name="adult_number['+i+']" type="number" min="1" max="6" value="1" required  /></div></label><label>تعداد کودک<div class="form-group"><input type="number" class="form-control child_number" name="child_number['+i+']" min="0" max="4" value="0" required /></div></label></div>';
                   $('.room_list').append(rooms);
               }
           }
       })
       $(document).on('change', '.child_number', function() {
           var i;
           var j=$(this).attr('name');
           j=j.substr(13,1);
           var val = $(this).val();
           $(this).closest('.room_row').find('.child_age').closest('label').remove();
           if($(this).val()>3 || $(this).val()<0){
               $(this).after('<p class="text-error text-white">تعداد کودکان بین 0 تا 3 میتواند باشد</p>')
               $(this).val();
               $(this).css('background-color','rgba(255,0,0,0.5)')
           }else{
               $('.text-error').remove();
               $(this).css('background-color','rgba(255,255,255)');
               for(i=1; i<=parseInt(val);i++){$(this).closest('.room_row').append('<label> سن کودک '+i+' <div class="form-group"><input type="number" class="form-control child_age" name="child_age['+j+']['+i+']" min="1" max="12" value="1" required /></div></label>')}
           }

       });
       $(document).on('change', '.adult_number', function(){
           if($(this).val()>7 || $(this).val()<1){
               $(this).after('<p class="text-error text-white">تعداد بزرگسال هر اتاق باید بین 1 تا 4 باشد</p>')
               $(this).val();
               $(this).css('background-color','rgba(255,0,0,0.5)')
           }else {
               $(this).css('background-color','rgba(255,255,255,1)');
               $('.text-error').remove();
           }
       });
       $(document).on('change', '.child_age', function(){
           if($(this).val()>13 || $(this).val()<1){
               $(this).after('<p class="text-error text-white">تعداد بزرگسال هر اتاق باید بین 1 تا 12 باشد</p>')
               $(this).val();
               $(this).css('background-color','rgba(255,0,0,0.5)')
           }else {
               $(this).css('background-color','rgba(255,255,255,1)');
               $('.text-error').remove();
           }
       });

   }

  /* rating and comment */

    $('.rating').find('input').click(function(){
        var value=$(this).val();

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url:'{{url("/hotel/rating")}}',
            method: 'POST',
            data: {value:value},
            success: function(data) {
                if(data.data>0)
                {
                    var rate=value.split('-')[0];
                    alertify.myAlert('رای شما با موفقیت ثبت شد');
                    $('.tour_rating').empty();
                    $('.tour_rating').append('امتیاز شما به این تور '+rate +'  از 5');
                    var stars='';
                    var i=1;


                    for(i=1;i<=5;i++)
                    {
                        if(i<=data.rating_value)
                        {
                            stars =stars+'<i class="fa fa-star text-warning"></i>';
                        }else
                        {
                            stars =stars+'<i class="fa fa-star text-muted"></i>';

                        }


                    }


                    $('.tour_rating').append('<p>'+stars+'</p>')
                }else
                {
                    alertify.myAlert('لطفا مجددا تلاش کنید')
                }
            },
            async: false
        });

    })


    $('.deal-comment__score-btn').click(function(){
        var hotel_id=$('.hotel_id').text();
        var customer_id=$('.customer_id').text();
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: '/hotel/ifComment',
            method: 'POST',

            data: {hotel_id:hotel_id , customer_id:customer_id},
            success: function(data) {
                console.log(data);
                if(data.data ==='ok'){

                    $('#commentModal').modal('show');
                }else{
                    alertify.myAlert(data.msg);
                }
            },

        });
    });


    /* mask input */

    $('.traveler_code').mask('0000000000');
    setTimeout(function(){ $('.alert').fadeOut(); }, 3000);
    //setTimeout(function(){ location.reload(); }, 40000);
    $('.sign_code').mask('0000000000');

    $( ".sign_code" ).focusout(function() {
        if($(this).val().replace(/\s/g, '').length !=10){
            alert('تعداد اعداد کد ملی باید 10 رقم باشد')
            $('.sign_code').val('');

        }});
    $('.sign_mobile,.traveler_mobile').mask('09000000000');


    $("#email").focusout(function() {
        if ($(this).is(':valid')) {}else {$(this).val(''); alert('آدرس پست الکترونیک معتبری وارد کنید')}
    })

    //mask input
    //	$('[data-rel="chosen"],[rel="chosen"]').chosen();
    //     	$('.date').persianDatepicker();

    $('.traveler_code').mask('0000000000');
    setTimeout(function(){ $('.alert').fadeOut(); }, 3000);
    //setTimeout(function(){ location.reload(); }, 40000);
    $('.sign_code').mask('0000000000');

    $( ".sign_code" ).focusout(function() {
        if($(this).val().replace(/\s/g, '').length !=10){
            alert('تعداد اعداد کد ملی باید 10 رقم باشد')
            $('.sign_code').val('');

        }});
    $('.sign_mobile,.traveler_mobile').mask('09000000000');


    $("#email").focusout(function() {
        if ($(this).is(':valid')) {}else {$(this).val(''); alert('آدرس پست الکترونیک معتبری وارد کنید')}
    })


    //add order


    // selling and factor
    var customer_id;
    var hotel_id=$('#hotel_id').val();
    var error_ajax;

    if(!alertify.myAlert){
        //define a new dialog
        alertify.dialog('myAlert',function(){
            return{
                main:function(message){
                    this.message = message;
                },
                setup:function(){
                    return {
                        buttons:[{text: "تایید", key:27/*Esc*/}],
                        focus: { element:0 }
                    };
                },
                prepare:function(){
                    this.setContent(this.message);
                }
            }});
    }
    //launch it.

    $('.btn-coupon').click(function(){
        var c=$('.coupon_code').val();
        var coupon_id=$('.coupon_id').val();
        var order_total=$('.order_total');


        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: 'http://localhost:8000/order/coupon',
            method: 'POST',
            data: {coupon_code:c,tour_id:tour_id,coupon_id:coupon_id},
            success: function(data) {


                if(data.result!=''){

                    var price=parseInt($('.total_price').text())-(data.result.coupon_price *( parseInt($('.order_table_traveler').find('tr').length)-1));


                    var coupon= data.result.coupon_description+' به مبلغ '+data.result.coupon_price+'تومان';
                    coupon=coupon+'<br/>'+'<span class="hidden  coupon_id">'+data.result.coupon_id+'</span>';
                    coupon=coupon+'<br/>'+'<span class="hidden  price_after_coupon">'+price+'</span>';
                    coupon='<br/>'+coupon+' مبلغ نهایی سفارش شما '+ price +'تومان';

                    $('.price_detail').html(coupon);


                }else
                {
                    alertify.myAlert(data.msg);
                    $('.price_detail').html('');
                }

            },
            async: false
        });



    })

    $('input[name="agent_type"]').click(function () {
        var type;
        $('.form_agent').removeClass('show_form');
        if ($(this).is(':checked')) {
            type = $(this).val();
            $('.part' + type).addClass('show_form');
        }
    });



    function order_user() {
        if( $('input[name="agent_type"]:radio').is(':checked')) {
            var form=$('.show_form');
            form.find('input, textarea').each(function(){
                if($(this).prop('required') && $(this).val()=='') {
                    error_ajax=1;
                    $(this).css('background-color','rgba(255,0,0,0.1)');
                }
            });

            form.find('textarea').each(function(){
                if($(this).prop('required') && $(this).text()=='') {

                    error_ajax=1;
                    $(this).css('background-color','rgba(255,0,0,0.1)');
                }
            });
            var val=$( "input[name=agent_type]:checked" ).val();


            if(val==1) {

                var email= $("#customer_email").val();
                var password= $("#customer_password").val();
                var result;
                return $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: 'http://localhost:8000/order_user/login',
                    method: 'POST',
                    data: {customer_email:email,customer_password:password},
                    success: function(data) {

                        error_ajax=data.error;
                        customer_id=data.customer_id;

                        if(error_ajax==1){
                            alertify.myAlert('رمز عبور شما نادرست است. مجددا تلاش کنید.')
                        }
                    },
                    async: false

                });

            }
            if(val==2 ) {

                var email= $("#email").val();
                var name= $("#name").val();
                var lname1= $("#lname").val();
                var phone= $("#phone").val();
                var code= $("#code").val();
                var password= $("#password").val();
                var repassword= $("#repassword").val();
                var address= $("#address").val();
                // var sheba= $("#sheba").val();

                // alert(email+'-'+name+'-'+lname1+'-'+phone+'-'+code+'-'+password+'-'+repassword+'-'+address+'-'+val);

                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: 'http://localhost:8000/order_user/register',
                    method: 'POST',
                    data: {'customer_email':email,'customer_password':password,'repassword':repassword,'customer_name':name,'customer_lname':lname1,'customer_phone':phone,'customer_code':code,'customer_address':address,'customer_type':val},
                    success: function(data) {
                        console.log(data);

                        $.each(data, function(index,val) {
                            customer_id=data.customer_id;


                            if(index=='error')
                            {
                                error_ajax = val;

                            }
                            if(index=='msg')
                            {
                                if(data.customer_id>0)
                                {
                                    $('#myModal_activate').modal({ show: 'true' });
                                    error_ajax=1;

                                }else{
                                    alert(data.msg);

                                }


                            }
                        })
                    },
                    async: false
                });
            }
            if(val==3 ) {

                var email= $("#email_g").val();
                var name= $("#name_g").val();
                var lname= $("#lname_g").val();
                var phone= $("#phone_g").val();
                var code= $("#code_g").val();
                var address= $("#address_g").val();


                return $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: 'http://localhost:8000/order_user/register_guest',
                    method: 'POST',
                    data: {customer_email:email,customer_name:name,customer_lname:lname,customer_phone:phone,customer_code:code,customer_address:address,customer_type:val},
                    success: function(data) {
                        console.log(data);
                        error_ajax=data.error;
                        customer_id=data.customer_id;

                    },
                    async: false

                });
            }
        }
        else {

            alertify.myAlert("لطفا یک مورد را انتخاب کنید.");
            error_ajax=1;
        }
    }
    function activate_user (customer_id){
        var code=$('.activate_user').val();

        $.ajax({
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            url: 'http://localhost:8000/order_user/activate/',
            method: 'POST',
            data:{'code':code,'customer_id':customer_id},
            success: function(data) {
                console.log(data);
                if(data.error==0){
                    error_ajax=0;
                    $('#myModal_activate').modal("hide");

                }else
                {
                    error_ajax=1;
                    alertify.myAlert(data.c);

                }
            },
            async: false
        });


    }
    function order_traveler() {

        error_ajax=0;
        var form=$('.passenger-room');

        form.find('input').each(function(){
            if($(this).prop('required') && $(this).val()=='') {
                error_ajax=1;
                $(this).css('background-color','rgba(255,0,0,0.1)');
            }else {$(this).css('background-color','rgba(255,255,255,1)');}
        });
        form.find('select').each(function(){
            if($(this).prop('required') && $(this).val()=='0'){
                error_ajax=1;
                $(this).css('background-color','rgba(255,0,0,0.1)');
                alertify.myAlert('اطلا عات مسافران را به درستی وارد کنید')
            }

        });

        // order report

        $('.order_table_traveler').empty();
        $('.order_table_traveler').append("<tr><td>ردیف</td><td>نام مسافر</td><td>نام خانوادگی</td><td>سن</td><td>جنسیت</td><td>موبایل</td></tr>");

        var index=0;
        var room_count=0;


        $('.passengers-box').each(function(){

            if($(this).prev().attr('class')== 'room__header'){
                room_count=room_count+1;


                var traveler_mobile=$(this).find('.traveler_mobile').val();
                var traveler_name=$(this).find('.traveler_name').val()+'<br/>'+'سرپرست';

                var room_name=$('.room__name').eq(room_count-1).text();
                var room_id=$('.room__id').eq(room_count-1).text();
                //var room_id="";

                $('.order_table_traveler').append('<tr class=" bg-primary text-white text-center"><td colspan="7">'+'<br/><p class="room_id"><span class="invisible">'+room_id+'</span>'+room_name+'</p></td></tr>');
            }else{
                var traveler_mobile='-';
                var traveler_name=$(this).find('.traveler_name').val();
            }

            index=index+1;

            var traveler_age=$(this).find('.traveler_age').val();
            if(traveler_age==undefined){ traveler_age='-'}

            var traveler_lname=$(this).find('.traveler_lname').val();

            var traveler_room='';
            var room_price=1;
            var traveler_gender=$(this).find('.traveler_gender').val();
            if(traveler_gender=='1')
            {
                traveler_gender='مرد';
            }else if(traveler_gender=='2'){
                traveler_gender='زن';
            }
            $('.order_table_traveler').append('<tr class="traveler_row"><td>'+index+'</td><td>'+traveler_name+'</td><td>'+traveler_lname+'</td><td>'+traveler_age+'</td><td>'+traveler_gender+'</td><td>'+traveler_mobile+'</td></tr>');
        })
    }

    function add_order()  {


        if($('input[name="accept_rule"]'). is(":checked")) {

            var hotel_id = $('.hotel_id').text();
            var room1 = $('.room1').text();
            var room2 = $('.room2').text();
            var room3 = $('.room3').text();
            var room4 = $('.room4').text();
            var customer_id = $('.customer_id').text();
            var inDate = $('.inDate').text();
            var outDate = $('.outDate').text();
            var total_price = $('.total_price').text();
            var coupon_id = 0;

            if ($('.price_after_coupon').length > 0) {
                total_price = $('.price_after_coupon').text();
                coupon_id = $('.coupon_id').text();
            }
            var order_id = 0;
            alert(hotel_id + '_' + total_price + '_' + order_id + '_' + customer_id + '-' + inDate + '-' + outDate + '-' + coupon_id);


            // ajax for add in database
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: 'http://localhost:8000/add_order/',
                method: 'POST',
                data: {
                    'hotel_id': hotel_id,
                    'order_total': total_price,
                    'customer_id': customer_id,
                    "coupon_id": coupon_id,
                    'inDate': inDate,
                    'outDate': outDate
                },
                success: function (data) {
                    console.log(data);
                    order_id = data.order_id;
                    error_ajax = 1
                },
                async: false
            });

            var data1 = [];
            var data = [];
            var i, j;
            var adults = $('.adults').text();
            var adults = adults.replace("[", "").replace("]", "").split(',');
            var children = $('.children').text();
            var children = children.replace("[", "").replace("]", "").split(',');


            for (i = 0; i < $('.room__header').length; i++) {
                for (j = 0; j < adults[i]; j++) {

                    data1['name'] = $('input[name="traveler_name[' + i + '][' + j + ']"]').val();
                    data1['lname'] = $('input[name="traveler_lname[' + i + '][' + j + ']"]').val();
                    data1['gender'] = $('select[name="traveler_gender[' + i + '][' + j + ']"]').val();
                    alert($('input[name="traveler_mobile[' + i + '][' + j + ']"]').val());
                    if ($('input[name="traveler_mobile[' + i + '][' + j + ']"]').length > 0) {
                        data1['mobile'] = $('input[name="traveler_mobile[' + i + '][' + j + ']"]').val();
                    } else {
                        data1['mobile'] = '';
                    }

                    data1['traveler_factor_num'] = (i + 1) + '/' + hotel_id + '/' + order_id;
                    data1['traveler_type'] = 1;
                    data1['room_id'] = $('.room__id').eq(i).text();

                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: 'http://localhost:8000/order_room/add_traveler',
                        method: 'POST',
                        contentType: "json",
                        processData: false,
                        data: JSON.stringify({
                            "traveler_name": data1['name'],
                            "traveler_lname": data1['lname'],
                            "traveler_gender": data1['gender'],
                            "traveler_mobile": data1['mobile'],
                            "order_id": order_id,
                            'room_type': data1['room_type'],
                            'traveler_type': data1['traveler_type'],
                            'room_id': data1['room_id'],
                            'traveler_factor_num': data1['traveler_factor_num']
                        }),
                        success: function (data) {
                            error_traveler = data.error;
                            console.log(data);
                        },
                        contentType: 'application/json; charset=utf-8',
                        async: false
                    });
                }

            }
            for (i = 0; i < $('.room__header').length; i++) {
                for (j = 0; j < children[i]; j++) {

                    data1['name'] = $('input[name="traveler_child_name[' + i + '][' + j + ']"]').val();
                    data1['lname'] = $('input[name="traveler_child_lname[' + i + '][' + j + ']"]').val();
                    data1['gender'] = $('select[name="traveler_child_gender[' + i + '][' + j + ']"]').val();
                    data1['mobile'] = '';
                    data1['age'] = $('input[name="traveler_child_age[' + i + '][' + j + ']"]').val()


                    data1['traveler_factor_num'] = (i + 1) + '/' + hotel_id + '/' + order_id;
                    data1['traveler_type'] = 2;
                    data1['room_id'] = $('.room__id').eq(i).text();

                    console.log('data1');
                    console.log(data1);

                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: 'http://localhost:8000/order_room/add_traveler',
                        method: 'POST',
                        contentType: "json",
                        processData: false,
                        data: JSON.stringify({
                            "traveler_name": data1['name'],
                            "traveler_lname": data1['lname'],
                            "traveler_gender": data1['gender'],
                            "traveler_age": data1['age'],
                            "order_id": order_id,
                            'room_type': data1['room_type'],
                            'traveler_type': data1['traveler_type'],
                            'room_id': data1['room_id'],
                            'traveler_factor_num': data1['traveler_factor_num']
                        }),
                        success: function (data) {
                            error_traveler = data.error;
                        },
                        contentType: 'application/json; charset=utf-8',
                        async: false
                    });
                }

            }

            // ajax for addbooked room in database
            var rooms = $('.rooms_id').text();
            rooms = rooms.replace("[", "").replace("]", "").split(',');
            for (i = 0; i < rooms.length; i++) {
                if(rooms[i] !=0){
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: 'http://localhost:8000/order_room/add_room',
                        method: 'POST',
                        contentType: "json",
                        processData: false,
                        data: JSON.stringify({
                            "hotel_id": hotel_id,
                            "room_id": rooms[i],
                            "order_id": order_id,
                            "br_inDate": inDate,
                            'br_outDate': outDate,
                        }),
                        success: function (data) {
                            error_traveler = data.error;
                        },
                        contentType: 'application/json; charset=utf-8',
                        async: false
                    });
                }

            }

            alert(customer_id+'-'+total_price+'-'+order_id+'-'+hotel_id);
            // send for payment
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: 'http://localhost:8000/order/payment',
                method: 'POST',
                data: {"customer_id":customer_id,"total_price":total_price,"order_id":order_id,"hotel_id":hotel_id},
                success: function(data) {
                    console.log(data);

                    $('.bank_direct').html(data);


                },
                async: false
            });

        }
        else
        {
            alertify.myAlert('قوانین و مقررات سایت را مطالعه کرده و بپذیرید.');
            error_ajax=1;
            $('input[name="accept_rule"]').parent().css('background-color','rgba(255,0,0,0.3)')


        }

    }


   //jQuery time
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches
        $(".next").click(function(event){

            var id = event.target.id;
            if(id==1){order_user(); }
            if(id==1.5){activate_user(customer_id);}
            if(id==2){ order_traveler(); }
            if(id==3){ add_order(customer_id);}

            if(error_ajax==0) {
                if(animating){   return false;}
                animating = true;
                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                if($(this).hasClass('activate_btn'))
                {
                    alert('activate');
                    current_fs =$('.add_user_btn').parent();
                    next_fs = $('.add_user_btn').parent().next();
                }
                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                //show the next fieldset
                next_fs.show();
                //hide the current fieldset with style
                current_fs.animate({opacity: 0}, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale current_fs down to 80%
                        scale = 1 - (1 - now) * 0.2;
                        //2. bring next_fs from the right(50%)
                        left = (now * 50)+"%";
                        //3. increase opacity of next_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({
                            'transform': 'scale('+scale+')',
                            'position': 'absolute'
                        });
                        next_fs.css({'left': left, 'opacity': opacity});
                    },
                    duration: 800,
                    complete: function(){
                        current_fs.hide();
                        animating = false;
                    },
                    //this comes from the custom easing plugin
                    easing: 'easeInOutBack'
                });
            }else{
                // alertify.myAlert('خطایی رخ داده است. لطفا اطلاعات را بررسی کرده و مجددا امتحان کنید')
            }

        });
        $(".previous").click(function(){
            if(animating) return false;
            animating = true;

            current_fs = $(this).parent();
            previous_fs = $(this).parent().prev();

            //de-activate current step on progressbar
            $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

            //show the previous fieldset
            previous_fs.show();
            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function(now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale previous_fs from 80% to 100%
                    scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%
                    left = ((1-now) * 50)+"%";
                    //3. increase opacity of previous_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'left': left});
                    previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
                },
                duration: 800,
                complete: function(){
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });
        $(".submit").click(function(){
            return false;
        });
})

