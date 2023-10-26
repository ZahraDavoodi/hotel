<section  class="shadow-sm" id="search-box">

    <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#internal_hotel">هتل داخلی</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#external_hotel">هتل خارجی</a>
            </li>

        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active container" id="internal_hotel">
                <form method="get" action="{{URL::to('/hotel/search')}}"  class="form-search">

                    <div class="row">
                        <div class="form-group col-md-6 col-12" ><label><span class="fa fa-map-marker"></span><span>مقصد </span></label>
                            <select class="form-control custom-select" name="desinition" required>

                                <option value="0">همه مقصدها</option>
                                @foreach($internal_categories as $desinition)
                                    <option value="{{$desinition->category_id}}"  @php  if (Session::get('search_desinition')==$desinition->category_id) { echo 'selected';} @endphp>{{$desinition->category_name}}</option>
                                @endforeach

                            </select>
                        </div>

                        <div class="form-group col-md-3"><label><span class="fa fa-calendar"></span><span>تاریخ رفت </span></label><input type="text" name="inDate" class="inDate date form-control" value="@php  if (Session::get('search_inDate')) { echo  Session::get('search_inDate');} @endphp" required /> </div>
                        <div class="form-group col-md-3"><label><span class="fa fa-calendar"></span><span>تاریخ برگشت </span></label><input type="text" name="outDate" class="outDate date form-control" value="@php  if (Session::get('search_outDate')) { echo  Session::get('search_outDate');} @endphp" required/> </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-3"><label><span class="fa fa-list"></span><span>تعداد اتاق</span></label><input type="number"  min="1" max="3" name="room_number" class="room_number form-control" @php  if (Session::get('search_roomNumber')) { echo  "value=".Session::get('search_roomNumber');} @endphp required  /> </div>
                    </div>
                    <div class="row room_list">

                        @php
                            $adults=session::get('search_adultNumber');
                            $children=session::get('search_childNumber');
                            $ages=session::get('search_childrenAge');

                                if (Session::get('search_roomNumber')){
                                for($i=0;$i<(int)Session::get('search_roomNumber');$i++){


                                 if(empty($ages[$i+1])){
                                    echo  '<div class="col-12 room_row"><label> اتاق'.($i+1).' :</label><label>بزرگسال <div class="form-group"><input  class="adult_number form-control" name="adult_number['.($i+1).']" value="'.$adults[$i].'" type="number" min="1" max="6" value="1" required  /></div></label><label>تعداد کودک<div class="form-group"><input type="number" class="form-control child_number" name="child_number['.($i+1).']" min="0" max="4" value="'.$children[$i].'" required /></div></label></div>';
                                 }else{

                                 echo  '<div class="col-12 room_row"><label> اتاق'.($i+1).' :</label><label>بزرگسال <div class="form-group"><input  class="adult_number form-control" name="adult_number['.($i+1).']" value="'.$adults[$i].'" type="number" min="1" max="6" value="1" required  /></div></label><label>تعداد کودک<div class="form-group"><input type="number" class="form-control child_number" name="child_number['.($i+1).']" min="0" max="4" value="'.$children[$i].'" required /></div></label>';

                                 for($j=0;$j<count($ages[$i+1]);$j++){

                                    echo '<label> سن کودک '.$j.' <div class="form-group"><input type="number" class="form-control child_age" name="child_age['.($i+1).']['.($j+1).']" min="1" max="12" value="'.$ages[$i+1][$j].'" required /></div></label>';
                                 }

                                 echo '</div>';
                                 }


                                }
                             }
                        @endphp
                    </div>

                    <div class="row">
                        <button type="submit" class="button">جستجو</button>
                    </div>



                </form>
            </div>
            <div class="tab-pane container" id="external_hotel">
                <form method="get" action="{{URL::to('/hotel/search')}}"  class="form-search">

                    <div class="row">
                        <div class="form-group col-sm-6" ><label><span class="fa fa-map-marker"></span><span>مقصد </span></label>
                            <select class="form-control custom-select" name="desinition" required >

                                <option value="0">همه مقصدها</option>
                                @foreach($external_categories as $desinition)
                                    <option value="{{$desinition->category_id}}"  @php  if (Session::get('search_desinition')==$desinition->category_id) { echo 'selected';} @endphp>{{$desinition->category_name}}</option>
                                @endforeach

                            </select>
                        </div>
                        <div class="form-group col-sm-3"><label><span class="fa fa-calendar"></span><span>تاریخ رفت </span></label><input type="text" name="inDate" class="inDate form-control" value="@php  if (Session::get('search_inDate')) { echo  Session::get('search_inDate');} @endphp" required /> </div>
                        <div class="form-group col-sm-3"><label><span class="fa fa-calendar"></span><span>تاریخ برگشت </span></label><input type="text" name="outDate" class="outDate form-control" value="@php  if (Session::get('search_outDate')) { echo  Session::get('search_outDate');} @endphp" required/> </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-3"><label><span class="fa fa-list"></span><span>تعداد اتاق</span></label><input type="number"  min="1" max="3" name="room_number" class="room_number form-control" @php  if (Session::get('search_roomNumber')) { echo  "value=".Session::get('search_roomNumber');} @endphp required  /> </div>
                    </div>
                    <div class="row room_list">

                        @php
                            $adults=session::get('search_adultNumber');
                            $children=session::get('search_childNumber');
                            $ages=session::get('search_childrenAge');

                                if (Session::get('search_roomNumber')){
                                for($i=0;$i<(int)Session::get('search_roomNumber');$i++){


                                 if(empty($ages[$i+1])){
                                    echo  '<div class="col-12 room_row"><label> اتاق'.($i+1).' :</label><label>بزرگسال <div class="form-group"><input  class="adult_number form-control" name="adult_number['.($i+1).']" value="'.$adults[$i].'" type="number" min="1" max="6" value="1" required  /></div></label><label>تعداد کودک<div class="form-group"><input type="number" class="form-control child_number" name="child_number['.($i+1).']" min="0" max="4" value="'.$children[$i].'" required /></div></label></div>';
                                 }else{

                                 echo  '<div class="col-12 room_row"><label> اتاق'.($i+1).' :</label><label>بزرگسال <div class="form-group"><input  class="adult_number form-control" name="adult_number['.($i+1).']" value="'.$adults[$i].'" type="number" min="1" max="6" value="1" required  /></div></label><label>تعداد کودک<div class="form-group"><input type="number" class="form-control child_number" name="child_number['.($i+1).']" min="0" max="4" value="'.$children[$i].'" required /></div></label>';

                                 for($j=0;$j<count($ages[$i+1]);$j++){

                                    echo '<label> سن کودک '.$j.' <div class="form-group"><input type="number" class="form-control child_age" name="child_age['.($i+1).']['.($j+1).']" min="1" max="12" value="'.$ages[$i+1][$j].'" required /></div></label>';
                                 }

                                 echo '</div>';
                                 }


                                }
                             }
                        @endphp
                    </div>

                    <div class="row">
                        <button type="submit" class="button">جستجو</button>
                    </div>



                </form>
            </div>

        </div>


    </div>
</section>