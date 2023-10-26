@extends('layout')
@section('content')

    <main>

    @foreach($hotel as $hotel)
            @if(Illuminate\Support\Facades\Input::has('detail') && Illuminate\Support\Facades\Input::get('detail') ==true)
                @php (print ('<ol class="breadcrumb"><li class="breadcrumb-item"><a href="'.url('/').'"> خانه </a></li><li class="breadcrumb-item"><span class="text-muted" > ‌ هتل های '.$cat->category_name.'</span></li> <li class="text-muted">/ هتل  '.$hotel->hotel_pName.'</li></ol>') )
            @else
                @php (print ('<ol class="breadcrumb"><li class="breadcrumb-item"><a href="'.url('/').'"> خانه </a></li><li class="breadcrumb-item"><a href="'.url()->previous().'"> هتل های '.$cat->category_name.'</a></li> <li class="text-muted">/ هتل  '.$hotel->hotel_pName.'</li></ol>') )
            @endif


{{--       {{ Breadcrumbs::render('hotel_info',$hotel,$cat) }}--}}
 @if($hotel->publication_status==1)
    <div class="container mt-5" id="result-board">
                <div class="row">
                    <div class="col-md-3 sidebar">
                        <div class="sticky-top">
                            <div class="hotel_page_content_holder">
                                <div class="card shadow">
                                    <div class="card-body">

                                        <h3 class="title text-center">{{$hotel->hotel_pName}}<br>{{$hotel->hotel_eName}}</h3>

                                        <p class="text-center">
                                            @for($i=0;$i<$hotel->hotel_rate;$i++)
                                                <i class="fa fa-star text-warning"></i>
                                            @endfor
                                        </p>

                                        <label> <i class="fa fa-road"></i> <span>{{$hotel->hotel_address}}</span></label>
                                        <p><i class=" fa fa-location-arrow"></i><a data-toggle="modal" href="#map{{$hotel->hotel_id}}">نمایش روی نقشه</a></p>

                                        <label><i class="fa fa-phone"></i><span dir="ltr">{{$hotel->hotel_phone}}</span></label>
                                        @if( ! Illuminate\Support\Facades\Input::has('detail') && Illuminate\Support\Facades\Input::get('detail') !=true)
                                        <div>

                                            <p class="label-weigh"><label><i class="fa fa-calendar"></i>از :</label><?php  if (Session::get('search_inDate')) { echo  Session::get('search_inDate');} ?></p>

                                            <p class="label-weigh"><label ><i class="fa fa-calendar"></i>تا:</label><?php  if (Session::get('search_outDate')) { echo  Session::get('search_outDate');} ?></p>
                                            <span class="label-weigh"><i class="fa fa-moon-o"></i>&nbsp;<?php echo ltrim(session::get('search_stayDay'), '0'); ?> &nbsp;شب</span>
                                            @php($count_child=0) @for($i=0;$i<count(Session::get('search_childNumber'));$i++) @if(Session::get('search_childNumber')[$i] !=0) @php($count_child +=1) @endif @endfor

                                            <span><i class="fa fa-user"></i><?php  if (Session::get('search_adultNumber')) { echo  count(Session::get('search_adultNumber')) + $count_child ;} ?> مهمان</span>
                                         <a class="btn btn-block btn-primary my-2" href="@php( print(url('/') . '?' . http_build_query(['section' => 'search-box', 'type' => 'internal_hotel']))) " >جستجوی هتل</a>
                                        
                                        </div>
                                        @endif

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-12">

                                <div class="xzoom-container">
                                    <img class="xzoom img-fluid" id="xzoom-default" src="{{'/images/hotels/' . $hotel->hotel_id . '.jpg'}}" xoriginal="{{'/images/hotels/' . $hotel->hotel_id . '.jpg'}}" />
                                    @php($i=0)
                                    @if(count($all_galleries)!=0)
                                    <div class="xzoom-thumbs">
                                        <a href="{{'/images/hotels/' . $hotel->hotel_id . '.jpg'}}"><img class="xzoom-gallery" width="80" src="{{'/images/hotels/' . $hotel->hotel_id . '.jpg'}}" alt="{{$hotel->alt_image}}"></a>
                                        @foreach($all_galleries as $gallery)
                                        <a href="/{{$gallery->hotel_gallery}}"><img class="xzoom-gallery" width="80" src="/{{$gallery->hotel_gallery}}" alt="{{$gallery->alt}}"></a>
                                        @endforeach
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row my-3">
                            <div class="col-12 shadow p-4">
                                <h2 class="title"> درباره هتل </h2>
                                <p class="text-justify">
                                  @php( print($hotel->hotel_description))
                                </p>
                            </div>
                        </div>
                        <div class="row my-3 ">
                            <div class="container shadow p-4">

                                    <h4 class="title"> خدمات  هتل</h4>
                                    @foreach($all_attr as $attr)
                                        <div  class="table ">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-4 col-6">

                                                    <i class="fa fa-globe"></i>
                                                    @if($attr->attr_freenet)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif
                                                    اینترنت رایگان
                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-desktop"></i>

                                                    @if($attr->attr_safebox)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif


                                                    صندوق امانات
                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-plane"></i>
                                                    @if($attr->attr_transfer)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif

                                                    ترانسفر فرودگاهی

                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-male"></i>
                                                    @if($attr->attr_laundry)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif

                                                    خشکشویی

                                                </div>


                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-paw"></i>
                                                    @if($attr->attr_animal)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif

                                                    ورود حیوانات

                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-child"></i>
                                                    @if($attr->attr_child)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif


                                                    نگهداری کودک

                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-fire"></i>
                                                    @if($attr->attr_fire)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif

                                                    اعلام حریق


                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-cut"></i>
                                                    @if($attr->attr_hair)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif


                                                    آرایشگاه

                                                </div>

                                                <div class="col-md-3 col-sm-4 col-6">
                                                    <i class="fa fa-car"></i>
                                                    @if($attr->attr_car)
                                                        <span class="fa  fa-check text-success pull-left"></span>
                                                    @else
                                                        <span class="fa  fa-remove text-danger pull-left"></span>
                                                    @endif

                                                    اجاره ماشین


                                                </div>

                                            </div>
                                        </div>

                                        <h4 class="title"> خدمات  ورزشی</h4>
                                        <div class="col-12" >
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-4 col-6">
                                                        <i class="fa fa-university"></i>
                                                        @if($attr->attr_indoorpool)
                                                            <span class="fa  fa-check text-success pull-left"></span>
                                                        @else
                                                            <span class="fa  fa-remove text-danger pull-left"></span>
                                                        @endif

                                                        استخر سرپوشیده
                                                    </div>

                                                    <div class="col-md-3 col-sm-4 col-6">
                                                        <i class="fa fa-tint"></i>
                                                        @if($attr->attr_outdoorpool)
                                                            <span class="fa  fa-check text-success pull-left"></span>
                                                        @else
                                                            <span class="fa  fa-remove text-danger pull-left"></span>
                                                        @endif

                                                        استخر رو باز
                                                    </div>



                                                    <div class="col-md-3 col-sm-4 col-6">
                                                        <i class="fa fa-umbrella"></i>
                                                        @if($attr->attr_sonia)
                                                            <span class="fa  fa-check text-success pull-left"></span>
                                                        @else
                                                            <span class="fa  fa-remove text-danger pull-left"></span>
                                                        @endif

                                                        سونای خشک

                                                    </div>

                                                    <div class="col-md-3 col-sm-4 col-6">
                                                        <i class="fa fa-smile-o"></i>
                                                        @if($attr->attr_massage)
                                                            <span class="fa  fa-check text-success pull-left"></span>
                                                        @else
                                                            <span class="fa  fa-remove text-danger pull-left"></span>
                                                        @endif

                                                        ماساژ

                                                    </div>
                                                    <div class="col-md-3 col-sm-4 col-6">
                                                        <i class="fa fa-futbol-o"></i>
                                                        @if($attr->attr_gym)
                                                            <span class="fa  fa-check text-success pull-left"></span>
                                                        @else
                                                            <span class="fa  fa-remove text-danger pull-left"></span>
                                                        @endif

                                                        باشگاه بدنسازی

                                                    </div>



                                                </div>
                                        </div>
                                        <h4 class="title"> رستوران و کافی شاپ</h4>
                                        <div  class="col-12">

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-4 col-6">
                                                            <i class="fa fa-coffee"></i>
                                                            @if($attr->attr_coffeshop)
                                                                <span class="fa  fa-check text-success pull-left"></span>
                                                            @else
                                                                <span class="fa  fa-remove text-danger pull-left"></span>
                                                            @endif

                                                            کافی شاپ


                                                        </div>

                                                        <div class="col-md-3 col-sm-4 col-6">
                                                            <i class="fa fa-cutlery"></i>
                                                            @if($attr->attr_restaurant)
                                                                <span class="fa  fa-check text-success pull-left"></span>
                                                            @else
                                                                <span class="fa  fa-remove text-danger pull-left"></span>
                                                            @endif

                                                            رستوران

                                                        </div>
                                                    </div>


                                                </div>

                                                @endforeach
                                            </div>
                        </div>
                        
                        

                        @if(!Illuminate\Support\Facades\Input::has('detail') && Illuminate\Support\Facades\Input::get('detail') !=true)
                        <div class="row my-3 p-4 rooms shadow">


                            <h4 class="title ">اتاق های قابل رزرو</h4>
                            <?php

                            $all_rooms= session::get('search_allRooms');
                            $all_price= session::get('search_allPrices');

                            $array_price=array();
                            $removed_room=array();
                            
                              for($j=0;$j<count($all_rooms);$j++){
                                  for($i=0;$i<count($all_rooms[$j][0]);$i++){
                                      $e=-1;
                                      foreach($all_rooms[$j][0][$i] as $a )
                                      {
                                          $e+=1;
                                          if($all_price[$j][0][$e]==0){ array_push($removed_room,$a->room_id);}
                                          array_push($array_price, [$a->room_id => $all_price[$j][0][$e]]);
                                      }
                                  }
                              }


                             

                              //i is hotels number
                            $show_room=array();
                                $k=0;
                                for($i=0;$i<count($all_rooms);$i++){
                                    //$j is room number that enter customer
                                    for($j=0;$j<count($all_rooms[$i]); $j++){
                                    //$z in number of room_selected for every room customer is selected
                                     $k=$k+1;
                                    $show_room[$k]=array();

                                        for($z=0;$z<count($all_rooms[$i][$j]);$z++){
                                            if($z<=session::get('search_roomNumber')){
                                                 for($n=0;$n<count($all_rooms[$i][$j][$z]);$n++){
                                                 if($all_rooms[$i][$j][$z][$n]->hotel_id == $hotel->hotel_id ){
                                                    if(!in_array($all_rooms[$i][$j][$z][$n]->room_id,$removed_room)){
                                                        array_push($show_room[$k],$all_rooms[$i][$j][$z][$n]);
                                                    }



                                                }
                                                }
                                            }
                                        }
                                     }
                                }
     $j=0;
     $arr1=array();
     $arr2=array();
     $arr3=array();
     $arr4=array();


     for($i=1;$i<=count($show_room);$i++){
         if(!empty($show_room[$i]) ){
             $j=$j+1;
             if($j==1){array_push($arr1,$show_room[$i]);}
             else if($j==2){array_push($arr2,$show_room[$i]);}
             else if($j==3){array_push($arr3,$show_room[$i]);}
             else if($j==4){array_push($arr4,$show_room[$i]);}
         }
     }


     if(empty($arr2) && empty($arr3) && empty($arr4) ){

         for($i=0; $i<count($arr1[0]); $i++){

          ?>
                            <div class="col-12 border p-1 my-2">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="col-12  border-bottom">

                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr1[0][$i]->room_name}}
                                                    </div>
                                                    <div class="col-6 text-center text-primary">
                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr1[0][$i]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>
                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-0-0-0">
                                                    {{$arr1[0][$i]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-3 border-right text-center">
                                        <p class="price_box">
                                            <?php
                                            $p=0;

                                            for($w=0;$w<count($array_price);$w++){
                                                if($arr1[0][$i]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                            }
                                        echo $p  ?> تومان</p>
                                        <p > برای {{ltrim(session::get('search_stayDay'), '0')}}  شب</p>
                                        <p class="state mx-auto mb-2"  data-toggle="collapse" data-target="#cancel{{$i}}-0-0-0">شرایط کنسلی </p>
                                        <a href="{{URL::to('/order/'.$arr1[0][$i]->hotel_id.'/'.$arr1[0][$i]->room_id.'/0/0/0')}}"   class="btn btn-outline-primary" >رزرو کنید</a>

                                        {{--href="{{ route('order_room', [ $arr1[0][$i]->hotel_id,  $arr1[0][$i]->room_id , $arr1[0][$j]->room_id,0,0 ])}}"--}}


                                    </div>
                                </div>
                            </div>
          <?php
         }
     }

     else if(empty($arr3) && empty($arr4)){

         for($i=0;$i<count($arr1[0]);$i++){
             for($j=0;$j<count($arr2[0]);$j++){
                 ?>
                   <div class="col-12 border p-1 my-2">
                       <div class="row">
                            <div class="col-9">
                           <div class="col-12  border-bottom">

                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-6">
                                           {{$arr1[0][$i]->room_name}}

                                       </div>
                                       <div class="col-6 text-center text-primary">

                                           @foreach($conditions as $con)
                                               @if($con->condition_id == $arr1[0][$i]->room_condition)
                                                   {{$con->condition_name}}
                                               @endif
                                           @endforeach
                                       </div>

                                   </div>
                                   <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-0-0">
                                       {{$arr1[0][$i]->room_cancel}}
                                   </div>
                               </div>
                           </div>
                           <div class=" col-12 border-bottom">
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-6">
                                           {{$arr2[0][$j]->room_name}}

                                       </div>
                                       <div class="col-6 text-center text-primary">

                                           @foreach($conditions as $con)
                                               @if($con->condition_id == $arr2[0][$j]->room_condition)
                                                   {{$con->condition_name}}
                                               @endif
                                           @endforeach
                                       </div>

                                   </div>
                                   <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-0-0">
                                       {{$arr2[0][$j]->room_cancel}}
                                   </div>
                               </div>
                           </div>
                       </div>
                            <div class="col-3 border-right text-center text-center">
                                    <p class="price_box">
                                        <?php
                                        $p=0;
                                          for($w=0;$w<count($array_price);$w++){
                                              if($arr1[0][$i]->room_id == array_keys($array_price[$w])[0]){

                                                  $p=$p+array_values($array_price[$w])[0];
                                              }
                                              if($arr2[0][$j]->room_id == array_keys($array_price[$w])[0]){

                                                  $p=$p+array_values($array_price[$w])[0];
                                              }

                                          }



                                    echo $p  ?> تومان</p>
                                  <p > برای {{ltrim(session::get('search_stayDay'), '0')}}  شب</p>
                                <p class="state mx-auto mb-2"  data-toggle="collapse" data-target="#cancel{{$i}}-{{$j}}-0-0">شرایط کنسلی </p>
                                    <a href="{{URL::to('/order/'.$arr1[0][$i]->hotel_id.'/'.$arr1[0][$i]->room_id.'/'.$arr2[0][$j]->room_id.'/0/0')}}"   class="btn btn-outline-primary" >رزرو کنید</a>

                                {{--href="{{ route('order_room', [ $arr1[0][$i]->hotel_id,  $arr1[0][$i]->room_id , $arr1[0][$j]->room_id,0,0 ])}}"--}}


                            </div>
                       </div>
                   </div>
            <?php
             }
         }
     }

     else if(empty($arr4)){

                            for($i=0;$i<count($arr1[0]);$i++){
                            for($j=0;$j<count($arr2[0]);$j++){
                                for($z=0;$z<count($arr3[0]);$z++){
                            ?>
                            <div class="col-12 border p-1 my-2">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr1[0][$i]->room_name}}

                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr1[0][$i]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr1[0][$i]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr2[0][$j]->room_name}}

                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr2[0][$j]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr2[0][$j]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr2[0][$z]->room_name}}

                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr2[0][$z]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr2[0][$z]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 border-right text-center text-center ">
                                        <p class="price_box">
                                            <?php
                                            $p=0;
                                            for($w=0;$w<count($array_price);$w++){
                                                if($arr1[0][$i]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                                if($arr2[0][$j]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                                if($arr3[0][$z]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                            }



                                            echo $p    ?> تومان</p>
                                        <p > برای {{ltrim(session::get('search_stayDay'), '0')}}  شب</p>
                                        <p class="state mx-auto mb-2"  data-toggle="collapse" data-target="#cancel{{$i}}-{{$j}}-{{$z}}-0">شرایط کنسلی </p>
                                        <a href="{{URL::to('/order/'.$arr1[0][$i]->hotel_id.'/'.$arr1[0][$i]->room_id.'/'.$arr2[0][$j]->room_id.'/'.$arr3[0][$z]->room_id.'/0')}}"   class="btn btn-outline-primary" >رزرو کنید</a>

                                        {{--href="{{ route('order_room', [ $arr1[0][$i]->hotel_id,  $arr1[0][$i]->room_id , $arr1[0][$j]->room_id,0,0 ])}}"--}}
                                    </div>
                                </div>
                            </div>
                            <?php
                            }
                            }
                            }
     }

     else {
                            for($i=0;$i<count($arr1[0]);$i++){
                            for($j=0;$j<count($arr2[0]);$j++){
                            for($z=0;$z<count($arr3[0]);$z++){
                                for($k=0;$k<count($arr4[0]);$k++){

                            ?>
                            <div class="col-12 border p-1 my-2">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr1[0][$i]->room_name}}

                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr1[0][$i]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr1[0][$i]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr2[0][$j]->room_name}}

                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr2[0][$j]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr2[0][$j]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr2[0][$z]->room_name}}
                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr2[0][$z]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-0">
                                                    {{$arr2[0][$z]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-12 border-bottom">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        {{$arr2[0][$k]->room_name}}
                                                    </div>
                                                    <div class="col-6 text-center text-primary">

                                                        @foreach($conditions as $con)
                                                            @if($con->condition_id == $arr2[0][$k]->room_condition)
                                                                {{$con->condition_name}}
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                </div>
                                                <div class="collapse mfp-auto-cursor" id="cancel{{$i}}-{{$j}}-{{$z}}-{{$k}}">
                                                    {{$arr4[0][$k]->room_cancel}}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 border-right text-center">
                                        <p class="price_box">
                                            <?php
                                            $p=0;
                                            for($w=0;$w<count($array_price);$w++){
                                                if($arr1[0][$i]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                                if($arr2[0][$j]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                                if($arr3[0][$z]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                                if($arr4[0][$k]->room_id == array_keys($array_price[$w])[0]){

                                                    $p=$p+array_values($array_price[$w])[0];
                                                }
                                            }
                                        echo number_format($p);     ?> تومان</p>
                                        <p > برای {{ltrim(session::get('search_stayDay'), '0')}} شب</p>
                                        <p class="state mx-auto mb-2"  data-toggle="collapse" data-target="#cancel{{$i}}-{{$j}}-{{$z}}-0">شرایط کنسلی </p>
                                        <a href="{{URL::to('/order/'.$arr1[0][$i]->hotel_id.'/'.$arr1[0][$i]->room_id.'/'.$arr2[0][$j]->room_id.'/'.$arr3[0][$z]->room_id.'/'.$arr4[0][$k]->room_id)}}"   class="btn btn-outline-primary" >رزرو کنید</a>
                                        {{--href="{{ route('order_room', [ $arr1[0][$i]->hotel_id,  $arr1[0][$i]->room_id , $arr1[0][$j]->room_id,0,0 ])}}"--}}
                                    </div>
                                </div>
                            </div>
                            <?php
                            }
                                }
                            }
                            }
                            }

                            ?>

                        </div>
                        @endif
                    </div>
                 </div>
                    <section>
                        <div class="row">
                            <section  class="shadow container  p-4">
                                <h2 class="title">نظرات کاربران درباره  {{$hotel->hotel_pName}} </h2>
                                <span class="customer_id invisible">{{Session::get('customer_id')}}</span>
                                <span class="hotel_id invisible">{{$hotel->hotel_id}}</span>
                                <div class="row">
                                    <div class="col-12 comment-list">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-sm-4 deal-comment__rate-display text-center">
                                                    <div class="deal-comment__rate-star">
                                                             <span>
                                                                <p itemprop="ratingValue">{{$rate_value }} <span>از 5 </span>ستاره </p>
                                                                 <?php for ($r=1; $r<=5;$r++){

                                                                     if($r<=$rate_value){ print('<i class="fa fa-star text-warning"></i>');}else{ print('<i class="fa fa-star text-muted"></i>');}  }?>

                                                              </span>
                                                    </div>
                                                    <span class="deal-comment__rate-count">{{$counter_num }}رای </span></div>
                                                <div class="col-sm-8 deal-comment__save-score"><span class="deal-comment__p-style">برای ثبت نظر، ابتدا وارد حساب کاربری خود شوید. </span><span
                                                            class="deal-comment__p-style">اگر در یک هفته گذشته در این تور شرکت کردید ، نظر بدهید.</span>
                                                    <div class="deal-comment__btn-container">
                                                        <?php if (Session::get('customer_name')){ ?>
                                                        <button class="deal-comment__score-btn button m-2"  >ثبت امتیاز و نظر</button>
                                                        <?php   } else{ ?>
                                                        <button   data-toggle="modal" class="button" id="customer_login_btn" data-target="#myModal" href="" title="">ثبت امتیاز و نظر</button>
                                                        <?php } ?>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-box  ">
                                                @foreach($all_comments as $comment)
                                                    @if($comment->comment_reply==0)
                                                    <div class="media border p-2 col-12 my-3">
                                                    <div class="m-2">
                                                        <span class="fa fa-user fa-2x m-2"></span>
                                                        {{--<img src="{{url('images/user.jpg')}}" class="rounded-circle media-object">--}}
                                                    </div>
                                                    <div class="media-body">
                                                        <h5 class="media-heading my-2">
                                                            @foreach($all_customers as $customer)
                                                                @if($customer->customer_id == $comment->customer_id)
                                                                    {{$customer->customer_name}} {{$customer->customer_lname}}
                                                                @endif
                                                            @endforeach
                                                        </h5>
                                                        <p>{{$comment->comment_message}}</p>

                                                        @foreach($all_comments as $comment1)
                                                            @if($comment1->comment_reply == $comment->comment_id)

                                                                <div class="media border p-2 col-12 my-3">
                                                                    <div class="m-2">
                                                                        <img src="images/user.jpg" class="rounded-circle media-object">
                                                                    </div>
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">پشتیبان سایت</h4>
                                                                        <p>{{$comment1->comment_message}}</p>


                                                                    </div>

                                                                </div>
                                                            @endif
                                                        @endforeach
                                                    </div>

                                                    </div>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section id="latest" class="shadow container p-4 my-3">

                                <h2 class="title">هتل های مشابه</h2>
                                <div class="">
                                    <div class="owl-carousel" id="best">
                                        @php($a=-1)

                                        @foreach($all_hotels as $hotel1)

                                            @if($hotel->category_parent1==$hotel1->category_parent1)
                                                @php($a=$a+1)
                                                <div class="item card" dir="rtl">

                                            <img class="card-img" src="{{'/images/hotels/thumbnail/' . $hotel1->hotel_id . '.jpg'}}" class="hotel_img" alt="{{$hotel1->alt_image}}">
                                            <div class="info col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left"><span class="fa fa-eye mx-2"></span><span>{{$hotel1->hotel_views}}</span></div>
                                                    <div class="col-6 text-right"><span class="fa fa-star mx-2"></span><span><?php echo $rates[$a] ?></span></div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <h3 class="card-title">{{$hotel1->hotel_pName}} / {{$hotel1->hotel_eName}}</h3>

                                                <div class="col-sm-12 border-top pt-2">
                                                    <a href="{{URL::to('/hotel_info/'.$hotel1->slug) . '?' . http_build_query(['detail' => 'true'])}}"><div class="col-xs-12 more"><button class="btn btn-primary btn-block">جزئیات بیشتر</button></div></a>
                                                </div>
                                            </div>
                                        </div>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>


                            </section>
                        </div>
                    </section>
                </div>
    </div>

   @else

        <section class="container shadow text-center">این هتل غیر فعال میباشد</section>

            @endif
        @endforeach
</main>

<!-- The Modal -->

    <div class="modal" id="commentModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>


            </div>
            <div class="modal-body">
                <form  action="{{URL::to('/comment/save')}}" method="POST" id="product_comment">
                    {{csrf_field()}}
                    <input type="hidden" name="type" value="3"/>
                    <input type="hidden" name="customer_id" value="{{Session::get('customer_id')}}"/>
                    <input type="hidden" name="hotel_id" value="{{$hotel->hotel_id}}" />
                <div class="text-center hotel_rating" itemprop="aggregateRating" itemscopeitemtype="http://schema.org/AggregateRating">
                    @if(Session::get('customer_id')!=0)
                        @isset($if_rate)
                        @if($if_rate!=='none')
                            @if($if_rate===0)
                                <span>
                                  <p itemprop="ratingValue">{{$rate_value }} <span>از 5 </span>ستاره </p>
                                    <?php

                                    echo 'امتیاز این تور '.$if_rate.' از 5';
                                    ?>
                                 </span>
                                <fieldset class="rating">
                                    <input type="radio" id="star5" name="rating"
                                           value="5" required/><label
                                            class="full" for="star5" title="عالی"></label>
                                    <input type="radio" id="star4" name="rating"
                                           value="4"/><label
                                            class="full" for="star4" title="خیلی  خوب"></label>
                                    <input type="radio" id="star3" name="rating"
                                           value="3"/><label
                                            class="full" for="star3" title="خوب"></label>
                                    <input type="radio" id="star2" name="rating"
                                           value="2"/>
                                    <label class="full" for="star2" title="متوسط"></label>
                                    <input type="radio" id="star1" name="rating"
                                           value="1"/><label
                                            class="full" for="star1" title="بد"></label>
                                </fieldset>
                                        @else
                                            امتیاز شما به این تور :
                                            {{$if_rate}}

                                            <br>
                                            <span>

                                 <?php for ($r=1; $r<=5;$r++){


                                                    if($r<=$rate_value){
                                                        print('<i class="fa fa-star text-warning"></i>');}else{ print('<i
                                         class="fa fa-star text-muted"></i>');}  }
                                                echo'<p>'. 'امتیاز این تور '.$if_rate.' از 5'.'</p>'; ?>


                                 </span>
                                            <br>

                                        @endif
                                        @else
                                            <p itemprop="ratingValue"> {{$rate_value }} <span>از 5 </span>ستاره </p>
                                            <span>

                                 <?php for ($r=1; $r<=5;$r++){

                                                    if($r<=$rate_value){ print('<i class="fa fa-star text-warning"></i>');}else{ print('<i
                                      class="fa fa-star text-muted"></i>');}  }
                                                ?>
                                 </span>


                                        @endif
                                        @endisset
                                        @else

                                            <span>
                                <p itemprop="ratingValue">{{$rate_value }} <span>از 5 </span>ستاره </p>
                                                <?php for ($r=1; $r<=5;$r++){

                                                    if($r<=$rate_value){ print('<i class="fa fa-star text-warning"></i>');}else{ print('<i
                                      class="fa fa-star text-muted"></i>');}  }?>

                              </span>
                                            <br>

                            @endif
                </div>

                    <textarea class="form-control mb-2" name="comment_message" placeholder="نظر خود را وارد کنید " required></textarea>
                    <button type="submit" class="btn btn-primary m-auto d-block" > ارسال</button>
                </form>
            </div>

        </div>

    </div>
</div>
    <div class="modal fade" id="map{{$hotel->hotel_id}}">
        <div class="modal-dialog map-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-right"> نقشه هتل  {{$hotel->hotel_pName}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    @php(print_r($hotel->hotel_map))
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@endsection