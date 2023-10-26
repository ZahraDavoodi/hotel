@extends('layout')

@section('content')
    <main>
        <form id="msform" method="post" action="" novalidate>

            {{csrf_field()}}
            <input type="hidden" name="hotel_id" id="hotel_id" value="{{$hotel_id}}">


            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">مشخصات نماینده</li>
                <li>اطلاعات مسافرین</li>
                <li>فاکتور نهایی</li>
                <li>ثبت سفارش</li>
            </ul>
            <!-- fieldsets -->
            <div class="bg_trans">
                <fieldset>

                    <!--<div class="col-12">-->
                    <!--<div class="col-sm-4"></div>-->
                    <!--<div class="col-sm-4 text-center">-->

                    <!--<input id="first" placeholder="کد کاربری" class="form-control" name="fname" >-->
                    <!--<span class="help-block text-center">اگر از قبل در سایت عضو بوده اید، با وارد کردن کد کاربری نیازی به ورود اطلاعات دیگر ندارید</span>-->

                    <!--</div>-->
                    <!--<div class="col-sm-4"></div>-->
                    <!--</div>-->
                    <p class="col-12 text-justify">
                    <p class="text-right"> پر کردن موارد ستاره دار الزامیست</p>
                    <ul class="notes">

                        <li>
                            صرفا افرادی که عضو این سایت هستند، قادرند به عنوان نماینده مسافرین ، اقدام به خرید خدمات از
                            این سایت بنمایند
                        </li>
                        <li>
                            رزرو کننده هتل (نماینده مسافرین) میتواند جز لیست مسافرین باشد یا نباشد
                        </li>
                        <li>
                            تخفیف ویژه فقط به نماینده مسافرین تعلق میگیرد، مبلغ آن در پایان هر دوره یک ماهه به حساب
                            نماینده مسافرین واریز میشود.

                    </ul>

                    </p>
                    <div class="col-12">
                        <label class="form-control-label agent_type">
                            <input type="radio" name="agent_type" value="1">
                            <span>عضو سایت هستم</span>
                        </label>
                        <label class="form-control-label agent_type">
                            <input type="radio" name="agent_type" value="3">
                            <span>تمایل به عضویت و دریافت تخفیف ویژه نماینده مسافرین ندارم.</span>

                        </label>
                        <label class="form-control-label agent_type">
                            <input type="radio" name="agent_type" value="2">
                            <span>تمایل به عضویت و دریافت تخفیف ویژه نماینده مسافرین دارم.</span>

                        </label>

                    </div>
                    <div class="row form_agent part1">

                        <legend>خرید هتل توسط اعضا(مشمول دریافت تخفیف ویژه)</legend>
                        <?php
                        if (Session::get('customer_email')) {

                            $email = Session::get('customer_email');
                        } else {
                            $email = '';
                        }
                        ?>
                        <div class="row">

                            <div class="col-sm-4"><label>نام کاربری <span>*</span></label><input
                                        placeholder="آدرس پست الکترونیک" name="customer_email" id="customer_email"
                                        value="{{$email}}" class="form-control" type="email" required></div>
                            <div class="col-sm-4"><label>رمز عبور<span>*</span></label><input placeholder="رمز عبور"
                                                                                              class="form-control"
                                                                                              id="customer_password"
                                                                                              name="customer_password"
                                                                                              type="password" value=""
                                                                                              required></div>
                        </div>
                    </div>
                    <div class="row form_agent part2">

                        <legend>ثبت نام در سایت جهت دریافت تخفیف ویژه مسافرین</legend>
                        <div class="row">

                            <div class="col-sm-4"><label>نام <span>*</span></label><input placeholder=" نام" name="name" id="name" class="form-control" required></div>
                            <div class="col-sm-4"><label>نام خانوادگی<span>*</span></label><input placeholder="نام خانوادگی" class="form-control" name="lname" id="lname" required></div>
                            <div class="col-sm-4"><label>کد ملی<span>*</span></label><input placeholder="کد ملی" name="code" id="code" class="form-control sign_code" required type="number"></div>
                            <div class="col-sm-4"><label>شماره تلفن همراه<span>*</span></label><input placeholder="شماره تلفن همراه" class="form-control sign_mobile" name="phone"      id="phone" required></div>
                            <div class="col-sm-4"><label>پست الکترونیک<span>*</span></label><input type="email"
                                                                                                   required></div>
                            <div class="col-sm-4"><label>رمز عبور<span>*</span></label><input type="password" /></div>
                            <div class="col-sm-4"><label> تکراررمز عبور<span>*</span></label><input type="password" required></div>
                            <!--<div class="col-sm-4"><label> شماره شبا<span>*</span></label><input type="text" placeholder="شماره شبا" name="sheba" id="sheba" class="form-control" required></div>-->
                            <div class="col-sm-4"><label>آدرس پستی<span>*</span> </label><textarea
                                        placeholder="آدرس پستی" name="address" id="address" class="form-control"
                                        required></textarea></div>
                        </div>
                    </div>
                    <div class="row form_agent part3">
                        <legend>ثبت اطلاعات نماینده</legend>
                        <div class="row">

                            <div class="col-sm-4"><label>نام <span>*</span></label><input placeholder=" نام" name="name" id="name_g" class="form-control" required></div>
                            <div class="col-sm-4"><label>نام خانوادگی<span>*</span></label><input placeholder="نام خانوادگی" class="form-control" name="lname" id="lname_g"         required></div>
                            <div class="col-sm-4"><label>کد ملی<span>*</span></label><input placeholder="کد ملی" name="code" id="code_g" class="form-control" required type="number"></div>
                            <div class="col-sm-4"><label>شماره تلفن همراه<span>*</span></label><input                       placeholder="شماره تلفن همراه" class="form-control" name="phone" id="phone_g" required></div>
                            <div class="col-sm-4"><label>آدرس ایمیل <span>*</span></label><input type="email"
                                                                                                 placeholder="آدرس ایمیل"
                                                                                                 name="email"
                                                                                                 id="email_g"
                                                                                                 class="form-control">
                            </div>
                            <div class="col-sm-4"><label>آدرس پستی</label><textarea placeholder="آدرس پستی"
                                                                                    name="address" id="address_g"
                                                                                    class="form-control"></textarea>
                            </div>
                        </div>
                    </div>

                    <input type="button" name="next" id="1" class="next action-button add_user_btn" value="بعدی"/>
                </fieldset>
                <fieldset>

                    <div class="table table-hover table-stripped traveler_table">


                        <div class="mb-3">
                            <div class="passenger-room">
                                <?php
                                $rooms_id=Session::get('rooms');
                                echo "<span class='invisible customer_id'>".Session::get('customer_id')."</span>";
                                echo "<span class='invisible outDate'>".Session::get('search_inDate')."</span>";
                                echo "<span class='invisible inDate'>".Session::get('search_outDate')."</span>";

                                ?>
                                    <span class='invisible adults'><?php $adults=Session::get('search_adultNumber'); $n='['; for($i=0; $i<count($adults);$i++){$n=$n.$adults[$i].','; } $n=$n.']'; echo $n; ?></span>
                                    <span class='invisible children'><?php $children=Session::get('search_childNumber'); $m='['; for($i=0; $i<count($children);$i++){$m=$m.$children[$i].','; } $m=$m.']'; echo $m; ?></span>
                                    <span class='invisible rooms_id'><?php $rooms_id=Session::get('rooms'); $m='['; for($i=0; $i<count($rooms_id);$i++){$m=$m.$rooms_id[$i].','; } $m=$m.']'; echo $m; ?></span>



                                <?php
                                    $adults=Session::get('search_adultNumber');
                                    $children=Session::get('search_childNumber');
                                    $ages=Session::get('search_childrenAge');
                                    $room_name=Session::get('rooms_name');
                                    $rooms_id=Session::get('rooms');



                                for($i=0; $i<(int)Session::get('search_roomNumber'); $i++){
                                ?>

                                <div>
                                    <div class="room__header">
                                        <span class="font-18 w-bold my-0 mx-1"><span class="fa fa-home"></span> اتاق {{$i+1}}</span>
                                        <h4 class="inline-block ltr">
                                            <span class="text-left room__name font-en ltr"><?php echo $room_name[$i];  ?> </span>
                                            <span class="text-left room__id font-en ltr invisible"><?php echo $rooms_id[$i];  ?> </span>
                                        </h4>
                                    </div>
                                    <?php  for($j=0; $j<$adults[$i]; $j++){ ?>
                                        <div class="passengers-box">
                                        <header class="passengers-box__header clearfix">
                                            <h4>
                                                بزرگسال {{$j+1}}
                                                @if(($j+1)==1)
                                                <small>(سرپرست)</small>
                                                @endif
                                            </h4>
                                        </header>
                                        <div class="row passenger-form-area">
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label >جنسیت</label>
                                                <select name="traveler_gender[{{$i}}][{{$j}}]"  class="form-control traveler_gender" required>
                                                    <option value="0">لطفا انتخاب کنید</option>
                                                    <option value="1">زن</option>
                                                    <option value="2">مرد</option>
                                                </select>
                                            </div>
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label  class="block">نام به لاتین</label>
                                                <input name="traveler_name[{{$i}}][{{$j}}]" type="text" class="col-md-12 form-control traveler_name" required />
                                            </div>
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label  >نام خانوادگی به لاتین</label>
                                                <input name="traveler_lname[{{$i}}][{{$j}}]" type="text" class="col-md-12 form-control traveler_lname" required />
                                            </div>
                                            @if(($j+1)==1)

                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label >تلفن همراه</label>
                                                <input name="traveler_mobile[{{$i}}][{{$j}}]" type="text" class="col-md-12 form-control traveler_mobile " required />
                                            </div>

                                            @endif
                                        </div>
                                    </div>
                                    <?php }   ?>
                                    <?php  for($j=0; $j<$children[$i]; $j++){ ?>
                                        <div class="passengers-box">
                                        <header class="passengers-box__header clearfix">
                                            <h4>کودک  {{$j+1 }}</h4>
                                            <?php $ages=Session::get('search_childrenAge'); echo $ages[$i+1][$j].' ساله ';  ?>
                                        </header>
                                        <div class="row passenger-form-area">
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label >جنسیت</label>
                                                <select  name="traveler_child_gender[{{$i}}][{{$j}}]"  class="form-control traveler_gender" required >
                                                    <option value="0">انتخاب کنید</option>
                                                    <option value="1">زن</option>
                                                    <option value="2">مرد</option>
                                                </select>
                                            </div>
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label class="block">نام به لاتین</label>
                                                <input type="text" class="col-md-12 form-control traveler_name" name="traveler_child_name[{{$i}}][{{$j}}]" required  />
                                            </div>
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label >نام خانوادگی به لاتین</label>
                                                <input  type="text" class="col-md-12 form-control traveler_lname" name="traveler_child_lname[{{$i}}][{{$j}}]" required />
                                            </div>
                                            <div  class="col-md-3 col-sm-6 col-12 form-group">
                                                <label >سن</label>
                                                <input  type="number" min="1" max="12" class="col-md-12 form-control traveler_age" name="traveler_child_age[{{$i}}][{{$j}}]" required />
                                            </div>

                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div>
                        </div>

                    </div>

                    <input type="button" name="previous" class="previous action-button" value="قبلی"/>
                    <input type="button" name="next" id="2" class="next action-button" value="بعدی"/>
                </fieldset>

                <fieldset>

                    <h2 class="title"> پیش فاکتور  </h2>

                    <h3 class="tour_name">هتل  {{$hotel_name}}</h3>
                    <span class="hotel_id invisible">{{$hotel_id}}</span>

                    <div class="row">
                        <div class="col-sm-6 ">
                            <!--کد پیگیری :-->
                            <!--<span class="tracking_code"></span>-->
                        </div>

                        <div class="col-sm-6 ">
                            <!-- تاریخ صدور فاکهتل :-->
                            <!--    <span class="order_date"></span>-->
                        </div>
                    </div>

                    <table class="table table-bordered">
                        <tr>
                            <td> : تعداد افراد بزرگسال<span class="adult_number"><?php echo(array_sum(Session::get('search_adultNumber'))); ?></span>  </td>

                            <td >تعداد کودکان :<span class="child_number"><?php echo(array_sum(Session::get('search_childNumber'))); ?></span> </td>
                            <td class="room_fromDate">از تاریخ : {{Session::get('search_inDate')}}</td>
                            <td class="room_toDate">تا تاریخ : {{Session::get('search_outDate')}}</td>
                            <td>هزینه کل :<span class="total_price"> {{Session::get('total_price')}} </span> تومان</td>
                        </tr>

                    </table>

                    <h3 class="title">اطلاعات مسافرین</h3>
                    <div class="table-responsive">
                        <table class="table table-stripped table-hover order_table_traveler">
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 coupon-container">
                            <label class="text-right">اگر کد تخفیفی دارید ، در کادر زیر وارد نمایید. </label>
                            <div class="input-group">
                                <input type="text" class="form-control coupon_code" name="coupon_code">
                                <span class="input-group-btn">
                              <button class="btn btn-success btn-coupon w-100" type="button">
                                 تایید
                              </button>
                           </span>

                            </div>

                        </div>
                        <div class="col-sm-6 text-center price_detail"></div>


                    </div>

                    <div class="row text-right">
                        <label>
                            <input name="accept_rule" type="checkbox">
                            <a href="{{url('/rules')}}" target="_blank"> قوانین سایت را مطالعه نمودم و
                                پذیرفتم.</a>

                        </label>
                    </div>
                    <input type="button" name="previous" class="previous action-button" value="قبلی"/>
                    <input type="button" name="next" id="3" class="next action-button" value="پرداخت"/>

                </fieldset>

                <fieldset>

                    <h2>ارسال به صفحه درگاه پرداخت</h2>
                    <div class="bank_direct"></div>

                </fieldset>


        </form>
    </main>

@endsection