<footer>


    <div class="container-fluid">
        <div class="row " dir="ltr">
            <ul class="social-icons icon-circle list-unstyled list-inline icon-zoom ">
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-pinterest"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-linkedin"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-youtube-play"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><i class="fa fa-tumblr"></i></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><img  src="{{url('/frontend/images/social/telegram.png')}}"></a></li>
                <li class="list-inline-item"> <a target="_blank" href=""><img  src="{{url('/frontend/images/social/aparat.png')}}"></a></li>
            </ul>

        </div>

        <div class="row">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 col-sm-12 DoRFlt">
                        <div class="footer_col">
                            <div class="title">
                               هتل ها
                            </div>
                            <ul>
                                <li>
                                    <a href="@php( print(url('/') . '?' . http_build_query(['section' => 'search-box', 'type' => 'internal_hotel']))) " >هتل های داخلی</a>
                                </li>
                                <li>
                                    <a href="@php( print(url('/') . '?' . http_build_query(['section' => 'search-box', 'type' => 'external_hotel']))) " >هتل های خارجی</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2  col-sm-12 DoRFlt">
                        <div class="footer_col text-center">
                            <div class="title">
                                لینک های مسافران
                            </div>
                            <ul>
                                <li>
                                    <a href="blog.okshod.com" target="_blank">مجله گردشگری</a>
                                </li>


                                <li>
                                    <a href="{{URL('/comments')}}" target="_blank">ثبت نظرات و شکایات</a>
                                </li>

                                <li>
                                    <a href="{{URL('/help')}}" target="_blank">راهنمای خرید از سایت</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12 DoRFlt">
                        <div class="footer_col text-center">
                            <div class="title text-center">
                                لینک های هتل
                            </div>
                            <ul>
                                <li>
                                    <a href="{{url('/userHotel')}}" target="_blank">پنل کاربری</a>
                                </li>
                                <li>
                                    <a id="reagent_modal" data-toggle="modal" data-target="#myModal" href="">  پنل کاربری معرف </a>
                                </li>
                                <!--<li>-->
                                <!--    <a href="#" target="_blank">پشیبانی</a>-->
                                <!--</li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12 DoRFlt">
                        <div class="footer_col text-center">
                            <div class="title">
                                لینک های عمومی
                            </div>
                            <ul>
                                <li>
                                    <a href="{{URL('/cooperation')}}" target="_blank">فرصت شغلی </a>

                                </li><li>
                                    <a href="{{URL('/contact')}}" target="_blank">تماس با ما</a>
                                </li>
                                <li>
                                    <a href="{{URL('/about')}}" target="_blank">درباره ما</a>
                                </li>
                                <li>
                                    <a href="{{URL('/rules')}}" target="_blank">قوانین و مقررات</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12 DoRFlt">


                        <div class="footer_col">
                            <div class="title">
                                اطلاعات تماس
                            </div>

                            <ul>
                                <li><i class="fa fa-phone"></i>021-77990930</li>
                                <li><i class="fa fa-mobile"></i>0912-7070210</li>

                                <li><span class="fa fa-home"></span>


                                    تهران ، محله نارمک، خیابان شهید اسماعیل بزرگیان، خیابان آیت الله
                                    شهید مدنی، ساختمان پالمیرا، واحد 326

                                    <br>
                                    کدپستی :
                                    1645661797
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12 DoRFlt">
                        <div class="footer_col">
                            <a class="enamd" target="_blank" href="https://trustseal.enamad.ir/?id=133350&amp;Code=YZX4KYw143OFQsgUiEj4">
                                <img src="https://Trustseal.eNamad.ir/logo.aspx?id=133350&amp;Code=YZX4KYw143OFQsgUiEj4" alt="" style="cursor:pointer" id="YZX4KYw143OFQsgUiEj4">
                            </a>
                        </div>
                    </div>

                </div>


            </div>

        </div>

    </div>

</footer>