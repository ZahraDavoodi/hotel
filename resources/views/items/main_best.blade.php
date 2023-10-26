<section id="best">
    <div class="owl-slider container" >
        <h2 class="title">محبوب ترین هتل ها</h2>
        <div id="best_carousel" class="owl-carousel" style="direction: ltr !important;">
            @php($a=-1)
            @foreach($all_hotels as $hotel)
            @php($a=$a+1)
            <div class="item card">

                <img class="card-img "  src="{{url('/images/hotels/thumbnail/' . $hotel->hotel_id . '.jpg')}}" alt="{{$hotel->alt_image}}">
                <div class="info col-12">
                    <div class="row">
                        <div class="col-6 text-right"><span class="fa fa-eye"></span><span>{{$hotel->hotel_views}}</span></div>
                        <div class="col-6 text-left"><span class="fa fa-star"></span><span><?php echo $rate_value[$a] ?></span></div>
                    </div>
                </div>
                <div class="card-body">
                    <h3 class="card-title">{{$hotel->hotel_pName}} </h3>
                    <div class="row item_detail">
                        <div class="col-sm-12 border-top pt-2">
                            <a href="{{URL::to('/hotel_info/'.$hotel->slug) . '?' . http_build_query(['detail' => 'true'])}}"><div class="col-xs-12 more"><button class="btn btn-primary btn-block">جزئیات بیشتر</button></div></a>
                        </div>
                    </div>



                </div>
            </div>

            @endforeach



        </div>
    </div>
</section>