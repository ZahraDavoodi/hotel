@extends('layout')

@section('content')

    <main>

{{--        {{ Breadcrumbs::render('hotels',Session::get('cat')) }}--}}

        <div class="container-fluid search_box">
            <div class="col-12">
                <header>
                    @include('items.main_searchbox')
                </header>
            </div>
        </div>
        <section id="hotel_lists">
            <div class="container">

                <div class="row">
                    <div class="col-md-3 col-12">
                        {{--<button class="btn btn-primary col-12" data-toggle="modal" href="#show_full_map"><i class="fa fa-map-marker"></i>نمایش روی نقشه</button>--}}
                        <div class="modal fade" id="show_full_map">
                            <div class="modal-dialog map-modal" style="width: 750px;margin: auto;margin-top: 100px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">نقشه</h4>
                                    </div>
                                    <div class="modal-body" style="padding-bottom: 20px;">
                                        <div id="mapFull" style="width: 100%; height: 400px; position: relative; overflow: hidden;"><div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);"><div style="overflow: hidden;"></div><div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;"><div tabindex="0" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: pan-x pan-y;"><div style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 990; transform: matrix(1, 0, 0, 1, -110, -232);"><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; z-index: 990; transform: matrix(1, 0, 0, 1, -110, -232);"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><canvas draggable="false" width="320" height="320" style="user-select: none; position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;"></canvas></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"></div></div><div class="gm-style-pbc" style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;"><p class="gm-style-pbt"></p></div><div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"><div style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div></div><iframe aria-hidden="true" frameborder="0" style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;"></iframe></div></div></div>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->

                        <div class="">
                            <div class="">

                                    <div class=" border my-3 p-3">
                                        <label class="text-primary">جستجوی هتل</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control hotel_name" name="hotel_name" value="" id="hotel-search-text" placeholder="نام هتل را وارد کنید..." required>
                                            <div class="input-group-append">
                                                <button onclick="filter_ajax()" class="btn btn-primary rounded-0 rounded-left"><span class="fa fa-search"></span></button>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="accordion">

                                        <div class="card">
                                            <div class="card-header"><a class="card-link" data-toggle="collapse" href="#collapseTwo">فیلتر براساس قیمت</a></div>
                                            <div id="collapseTwo" class="collapse show" >
                                                <div class="card-body">
                                                    <div class=" my-2">

                                                        <input type="text" id="range_slider" name="range_slider" data-min="{{min(session::get('search_minPrice'))}}" data-max="{{max(session::get('search_minPrice'))}}"  />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header"><a class="card-link" data-toggle="collapse" href="#collapseOne">دسته بندی</a></div>
                                            <div id="collapseOne" class=" card-body collapse show">
                                                <div class=" my-2">

                                                    <div class="filter-item" id="rate_all" style="cursor: pointer">
                                                        <input type="checkbox" name="rate" value="0" >
                                                        <span>همه</span>
                                                    </div>
                                                    <div class="filter-item filter-item-rate">
                                                        <input type="checkbox" name="rate[]" value="1" onchange="filter_ajax()">
                                                        <span class="fa fa-star text-warning"></span>
                                                    </div>
                                                    <div class="filter-item filter-item-rate" >
                                                        <input type="checkbox" name="rate[]" value="2" onchange="filter_ajax()">
                                                        <span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span>
                                                    </div>
                                                    <div class="filter-item filter-item-rate" style="cursor: pointer">
                                                        <input type="checkbox" name="rate[]" value="3" onchange="filter_ajax()">
                                                        <span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span>
                                                    </div>
                                                    <div class="filter-item filter-item-rate" style="cursor: pointer">
                                                        <input type="checkbox" name="rate[]" value="4" onchange="filter_ajax()">
                                                        <span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span>
                                                    </div>
                                                    <div class="filter-item filter-item-rate" style="cursor: pointer">
                                                        <input type="checkbox" name="rate[]" value="5" onchange="filter_ajax()">
                                                        <span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <input type="submit" class="btn btn-default2 col-md-12 btn-apply-filter" value="Clear filter" style="display: none">
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-9 col-12" id="result-board">
                        <div class="col-12 " >
                            <div class="panel-body" >
                                <div class="row">
                                    <div class="col-md-3 col-6 result-filters" >
                                        <select class="form-control" onchange="filter_ajax()">
                                            <option value="0">ترتیب</option>
                                            <option value="name">نام</option>
                                            <option value="price">افزایش قیمت</option>
                                            <option value="priceDesc">کاهش قیمت</option>
                                        </select>
                                    </div>

                                                                    </div>
                            </div>
                        </div>
                        <div class="result-holder">
                            @php($a=-1)
                            @php($final_hotels=array())
                            @if($all_hotels && count($all_hotels)>0)
                            @foreach($all_hotels as $hotel)
                             <?php array_push($final_hotels,$hotel) ?>
                            @php($a=$a+1)
                              @if(session::get('search_minPrice')[$a] !=0)
                                    <div class="search-result-box border rounded ">

                                            <div class="row">

                                            <div class="col-md-3 col-4">
                                                <img src="{{'/images/hotels/thumbnail/' . $hotel->hotel_id . '.jpg'}}"  alt="{{$hotel->alt_image}}" class="img-fluid" />
                                            </div>
                                            <div class="col-md-9 col-8">
                                                <h2 class="my-2">{{$hotel->hotel_pName}} / {{$hotel->hotel_eName}}
                                                    <br/>
                                                    @for($k=0;$k<$hotel->hotel_rate;$k++)
                                                        <i class="fa fa-star text-warning my-2"></i>
                                                    @endfor
                                                </h2>
                                                <span class="hotel-rate"><b>امتیاز کاربران</b><label> <?php  echo ' '.$rates[$a].' '?></label></span>
                                                <p class="address-search-box text-muted"><i class="fa fa-map-marker"></i>&nbsp;{{$hotel->hotel_address}}</p>
                                                <p ><a class="text-danger" data-toggle="modal" href="#map{{$hotel->hotel_id}}"><i class=" fa fa-location-arrow mx-1"></i>نمایش روی نقشه</a></p>

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
                                                <div class="row border-top  py-1">
                                                    <div class="col-12 text-left">
                                                <span class="hotel-price my-2">
                                                    شروع قیمت برای
                                                    {{ltrim(session::get('search_stayDay'), '0')}}
                                                    شب
                                                    <?php $min1=session::get('search_minPrice'); echo number_format($min1[$a]); ?>
                                                    تومان
                                                    &nbsp;</span>
                                                        <a href="{{URL::to('/hotel_info/'.$hotel->slug)}}" class="btn btn-outline-primary float-left  my-2">مشاهده لیست اتاق ها</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                             @endif
                             @endforeach
                             @else
                                <div class="search-result-box border rounded ">
                                    <p class="text-center"> موردی یافت نشد</p>
                                </div>
                             @endif
                            <div class="row justify-content-center pagination ">
                                {{$all_hotels->appends(request()->query())->links() }}




                            </div>

                        </div>

                        <div class="pagination">

                        </div>


                    </div>
                </div>
            </div>
            </div>
        </section>

    </main>

@endsection