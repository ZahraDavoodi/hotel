<section class="bg-light my-3" id="blog">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <h2 class="title">گالری تصاویر</h2>
                <div class="row image_gallery">

                    <?php
                    //Feed URLs
                    $feeds = array("https://blog.okshod.com/pictures-gallery/feed/");
                    //Read each feed's items
                    $entries = array();
                    foreach($feeds as $feed) {
                        $xml = simplexml_load_file($feed);
                        $entries = array_merge($entries, $xml->xpath("//item"));
                    }

                    //Sort feed entries by pubDate
                    usort($entries, function ($feed1, $feed2) {
                        return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);
                    });

                    ?>


                    <?php
                    $i=0;

                    foreach($entries as $entry){
                    $i=$i+1;
                    if($i<9)
                    {            ?>
                    <div class="col-4">

                        <a href="<?= $entry->link ?>" title="<?= $entry->title ?>" >
                            <?php print( $entry->description); ?>
                        </a>
                    </div>

                    <?php } }?>
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal1.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images/gal2.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal3.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal4.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal5.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal6.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal7.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal8.jpg')}}" class="img-fluid"/></div>--}}
                    {{--<div class="col-4"><img  src="{{url('/frontend/images//gal9.jpg')}}" class="img-fluid"/></div>--}}

                </div>
            </div>
            <div class="col-sm-4">
                <h2 class="title">گالری ویدیو</h2>
            <?php
            //Feed URLs
            $feeds = array("https://blog.okshod.com/videos-gallery/feed/");

            //Read each feed's items
            $entries = array();
            foreach($feeds as $feed) {
                $xml = simplexml_load_file($feed);
                $entries = array_merge($entries, $xml->xpath("//item"));
            }

            //Sort feed entries by pubDate
            usort($entries, function ($feed1, $feed2) {
                return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);
            });

            ?>


            <?php
            $i=0;

            foreach($entries as $entry){
            $i=$i+1;
            if($i<2)
            {
            ?>

            <?php print('<p class="video_gallery">'.$entry->children("content", true).'</p>') ?>

            <!--<video src="blog_video.mp4" controls></video>-->
                <!--<p class="text-justify p-2">-->
                <!--    تل بلوط تهران واقع در منطقه خوش آب و هوای ولنجک، در سال 1395 برای میزبانی از مسافران گرامی افتتاح شد. این هتل با قرار گرفتن در روبروی سالن اجلاس سران (مرکز همایش های بین المللی جمهوری اسلامی)، موجب دسترسی آسان مهمانان می شود. هتل سه ستاره بلوط تهران با محوطه چشم نواز، دارای 16 باب اتاق می باشد. شایان ذکر است-->

                <!--</p>-->
                <?php } } ?>
            </div>
            <div class="col-sm-4">
                <h2 class="title">آخرین نوشته ها</h2>

                <div class="row ">
                    <?php
                    //Feed URLs
                    $feeds = array("https://blog.okshod.com/feed/");

                    //Read each feed's items
                    $entries = array();
                    foreach($feeds as $feed) {
                        $xml = simplexml_load_file($feed);
                        $entries = array_merge($entries, $xml->xpath("//item"));
                    }

                    //Sort feed entries by pubDate
                    usort($entries, function ($feed1, $feed2) {
                        return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);
                    });

                    ?>


                    <?php
                    $i=0;

                    foreach($entries as $entry){
                    $i=$i+1;
                    if($i<3)
                    {            ?>
                    <div class="row blog_item">

                        <div class="col-12">
                            <h3> <?= $entry->title ?></h3>
                            <p class="d-md-block d-sm-none "> <?= $entry->description ?></p>
                            <a href="<?= $entry->link ?>" >بیشتر</a>
                        </div>
                    </div>
                    <?php
                    }
                    }
                    ?>
                    </ul>
                </div>



                <a href="#" class="button">مشاهده همه نوشته ها</a>
            </div>
        </div>
    </div>

</section>