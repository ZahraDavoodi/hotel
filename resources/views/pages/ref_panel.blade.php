@extends('layout')

@section('content')

<main>
    <?php
    // Alert for success add new Category
    if (Session::get('msg')) {
        echo '<p class="alert alert-success text-right">';
        echo Session::get('msg');
        echo '</p>';

        Session::put('msg',null);
    }
    ?>
    <section class="container bg_white">
        <ul class="nav nav-pills">
            <li class="nav-item "><a class="nav-link active " data-toggle="tab" href="#home">لیست سفارشات</a></li>

            <li class="nav-item"><a class="nav-link " data-toggle="tab" href="#menu1">درخواست واریز</a></li>
            <li class="nav-item"><a  class="nav-link " data-toggle="tab" href="#menu2">تغییر رمز عبور</a></li>
            <li class="nav-item"><a   class="nav-link " href="{{URL::to('/reagent/logout')}}">خروج</a></li>

        </ul>
        <div class="tab-content ref_panel p-4">
            <div id="home" class="ref_order tab-pane active table-responsive">

                <table class="table table-hover table-responsive datatable text-center table-bordered">
                    <thead>
                    <tr class="bg-primary">
                        <th>شماره فاکتور</th>
                        <th class="text-center">نام هتل</th>
                        <th class="text-center">تعداد مسافران</th>
                        <th class="text-center">وضعیت پرداخت</th>
                        <th class="text-center">تاریخ ثبت سفارش</th>

                        <th class="text-center">تخفیف ویژه سفارش (تومان)</th>
                        <th class="text-center">وضعیت نهایی </th>
                        <th class="text-center">نمایش مسافرین</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($all_orders as $order )
                        <tr>
                            <td>{{$order->order_factorNum}}</td>
                            <td>

                                @foreach($all_hotels as $hotel)
                                    @if($order->hotel_id==$hotel->hotel_id)
                                        {{$hotel->hotel_pName}}


                                    @endif
                                @endforeach
                            </td>



                            <td>
                                @if($order->order_payment==1)
                                    <span class="text-success fa fa-check"></span>
                                @else
                                    <span class="text-danger fa fa-remove"></span>
                                @endif
                            </td>
                            <td>
                                @if($order->order_status==1)
                                    در انتظار بررسی
                                @elseif ($order->order_status==2)
                                    پرداخت شده
                                @elseif ($order->order_status==3)
                                    تکمیل شده
                                @elseif ($order->order_status==4)
                                    لغو شده
                                @endif
                            </td>
                            <td>{{$order->created_at}}</td>

                            <td>
                                @php($i=0)
                                @foreach($all_travelers as $traveler)
                                    @if($traveler->order_id == $order->order_id)
                                        @php($i=$i+1)
                                    @endif
                                @endforeach
                                    @foreach($all_hotels as $hotel)
                                    @if($hotel->hotel_id ==$order->hotel_id)
                                        {{$hotel->hotel_ref_comision *$i}}

                                    @endif
                                @endforeach
                            </td>
                            <td>
                                @if($order->order_status!=0)
                                    قطعی
                                @else
                                    غیر قطعی
                                @endif
                            </td>
                            <td>
                                <div  class="btn-group-vertical">
                                    <a class="btn btn-warning"  data-toggle="collapse" data-target="#order_{{$order->order_id}}">نمایش لیست مسافرین</a>
                               {{--@if($order->order_confirm==0) <a class="btn btn-success" href="{{URL::to('/ref/order/edit/'.$order->order_id)}}" >ویرایش سفارش</a>@endif--}}



                        @php($checked=0)
                                @foreach($all_requests as $request)
                                    @if($request->order_id==$order->order_id)
                                        @if($request->ref_id == session::get('ref_id'))
                                        @php($checked=1)
                                        @endif
                                    @endif
                                @endforeach

                                @if($checked != 0)
                                    @if($order->order_confirm>0)
                                        @if($order->order_status==3)
                                            <a class="btn btn-success" href="{{URL::to('/reagent/request/'.$order->order_id)}}" >درخواست تسویه</a>
                         @endif
                                    @endif
                                @else
                                    درخواست واریز ارسال شده است
                                   @endif

                                        </div>
                                        </td>
                                    </tr>
                                    <tr  id="order_{{$order->order_id}}" class="collapse">
                    <td colspan="13" >
                    <div class="table-responsive">
                        <table class="table  table-stripped">
                    <tr>
                      <td>شماره فاکتور</td>
                      <td>نام مسافر</td>
                      <td>نام خانوادگی</td>
                      <td>سن مسافر</td>


                      <td>وضعیت تایید </td>

                   </tr>

                   @foreach($all_travelers as $traveler)
                                    @if($traveler->order_id == $order->order_id)
                                        <tr>
                                            <td>{{$traveler->traveler_factor_num}}</td>
                         <td>{{$traveler->traveler_name}}</td>
                         <td>{{$traveler->traveler_lname}}</td>
                         <td>{{$traveler->traveler_age}}</td>



                                             <td>
                                                 @if($traveler->traveler_submit==1)
                                            تایید
                                            @else
                                            عدم تایید
                                          @endif
                                                </td>

                                             </tr>
                                           @endif
                                @endforeach
                                        </table>
                                        </td>

                                    </tr>

                                  @endforeach
                                        </tbody>
                                    </table>
                                      </div>
                                      <div id="menu1" class="tab-pane fade">
                                      <div class="table-responsive">
                                          <table class="table  table-hover  datatable text-center table-bordered ">

                                                <thead>
                                            <tr class="bg-primary">
                                                <th>شناسه سفارش</th>
                                                <th>هزینه سفارش</th>
                                                <th>وضعیت درخواست</th>
                                                <th>تاریخ پرداخت</th>
                                                <th>توضیحات </th>

                                            </tr>
                                        </thead>
                                                <tbody>
                                           @foreach($all_requests as $request )
                                    <tr>
                                        <td>
                                          {{$order->order_id}}
                                        </td>
                                        <td>{{$request->total_price}}</td>
                    <td>
                        @if($request->request_status==0)
                                        در انتظار بررسی
                                      @else
                                        تایید شده
                                       @endif
                                            </td>
                                        <td>@if($request->request_pay) {{$request->request_pay_date}} @else - @endif</td>

                    <td>{{$request->request_description}}</td>

                </tr>
              @endforeach
                                        </tbody>
                                    </table>
                                    </div>
                                    </div>

                                      <div id="menu2" class="tab-pane fade">
                                        <form role="form" class=" form-group col-12"  method="POST" action="{{URL::to('/reagent/updatePass')}}">
                           {{ csrf_field() }}
                                        <input type="hidden" name="id" value="{{$ref_id}}">
                           <input type="hidden" name="type" value="ref">
                            <div class="form-group ">
                                <label for="username">آدرس ایمیل</label>
                                <input type="email" class="form-control" id="username" placeholder="نام کاربری خود را وارد نمایید" name="ref_email" value="{{$ref}}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="pwd">رمز عبور</label>
                                <input type="password" class="form-control" id="pwd1" name="ref_password">
                            </div>
                           <div class="form-group">
                                <label for="pwd">تکرار رمز عبور</label>
                                <input type="password" class="form-control" id="pwd2" name="ref_repassword">
                            </div>

                            <button type="submit" class="">تایید</button>
                        </form>
          </div>
        </div>
    </section>

   <div class="modal" id="myModal_travelers">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <p class="float-right"></p>
                           </div>
            <div class="modal-body">
               <tabel class="table  table-responsive">
                   <tr>
                      <td>نام مسافر</td>
                      <td>کد ملی</td>
                      <td>سن مسافر</td>
                   </tr>
               </tabel>
            </div>

        </div>

    </div>
</div>
</main>

@endsection