<?php

Route::get("/sitemap.xml", array(
    "as"   => "sitemap",
    "uses" => "HomeController@sitemap",
));



Auth::routes();
Route::get('/mail', 'MailController@mail');
Route::get('/changePassword','HomeController@showChangePasswordForm');
Route::post('/change/password','HomeController@changePassword');
Route::get('/recovery/{type}/{customer_id}/{code}', 'HomeController@recovery');
Route::post('/updatePass', 'HomeController@updatePass');
Route::get('/activate/{customer_id}/{code}', 'HomeController@activate');
// ------------------- FRONEND  -------------------------------------------
Route::get('/', ['as' => 'home', 'uses' => 'HomeController@index']);
Route::post('/hotel/rating','HomeController@rating');
Route::get('/hotel_info/{hotel_id}',['as' => 'hotel_info','uses' =>'HomeController@hotel_info']);
Route::get('/hotels/{cat_id}', ['as' => 'hotels','uses' =>'HomeController@hotels']);
Route::get('/contact', ['as' => 'contact','uses' =>'HomeController@contact']);
Route::get('/about', ['as' => 'about','uses' =>'HomeController@about']);
Route::get('/help', ['as' => 'help','uses' =>'HomeController@help']);
Route::get('/cooperation', ['as' => 'cooperation','uses' =>'HomeController@cooperation']);


Route::get('/comments',['as' => 'comment','uses' =>'HomeController@comments']);
Route::post('/save_comment','HomeController@save_comment');

Route::get('/order/{hotel_id}/{room1}/{room2}/{room3}/{room4}', ['uses' =>'HomeController@order']);
Route::get('/rules/',['as' => 'rules','uses' =>'HomeController@rules']);



//customer controller
Route::post('/login','CustomerController@login');
Route::post('/register','CustomerController@register');
Route::get('customer/logout','CustomerController@logout');
//order
Route::post('/order_user/login','OrderController@order_login');
Route::post('/order_user/register','OrderController@order_register');
Route::post('/order_user/register_guest','OrderController@order_register_guest');
Route::post('/order_user/activate','CustomerController@ajax_activate');
Route::post('/order_room/hotel_info','OrderController@order_hotel_info');
Route::post('/order_room/tour_info','OrderController@order_tour_info');
Route::post('/order_room/add_traveler','OrderController@add_traveler');
Route::post('/order_room/add_room','OrderController@add_room');
Route::post('/add_order','OrderController@add_order');
Route::post('/order_room','OrderController@add_rooms');
Route::post('/order_report','OrderController@order_report');


Route::post('/order/coupon','OrderController@coupon1');
Route::post('/order/payment','OrderController@payment');
Route::post('/callback','OrderController@callback');
Route::get('/callback','OrderController@callback');

//search box
Route::post('/hotel/search','SearchController@search');
Route::get('/hotel/search','SearchController@search');

Route::POST('/hotel/search_ajax','SearchController@search_ajax');

//comment
Route::post('/hotel/ifComment','CommentController@ifComment');
Route::post('/comment/save','CommentController@save');

// ------------------- BACKEND  -------------------------------------------
Route::get('/okAdminShod','AdminController@login');
Route::post('/okAdminShod/dashboard','AdminController@dashboard'); // when post admin_email admin_password 
Route::get('/okAdminShod/dashboard','AdminController@dashboard'); // when nothing posted 
Route::get('/okAdminShod/destroy',function(){
	Session::flush();
});

// E 07 ---------
Route::get('/logout','SuperAdminController@logout');

Route::get('/userHotel','UserController@login');
Route::post('/userHotel/dashboard','UserController@dashboard'); // when post admin_email admin_password
Route::get('/userHotel/dashboard','UserController@dashboard'); // when nothing posted
Route::get('/userHotel/destroy',function(){
    Session::flush();
});

// CATEGORY ROUTES
// E 08 
Route::get('/okAdminShod/category/add','CategoryController@add'); // Edited in E 17 -- 
// E 09
Route::get('/okAdminShod/category/all','CategoryController@all_categories');
// E 10 
Route::post('/okAdminShod/save_new_category','CategoryController@save_category');
//E 13
Route::get('/okAdminShod/category/{category_id}/unactive','CategoryController@unactive');
Route::get('/okAdminShod/category/{category_id}/active','CategoryController@active');
//E 14
Route::get('/okAdminShod/category/{category_id}/edit','CategoryController@edit');
Route::post('/okAdminShod/category/{category_id}/done_update/','CategoryController@done_update');
//E 15
Route::get('/okAdminShod/category/{category_id}/delete','CategoryController@delete');
Route::post('/okAdminshod/category/select_ajax','CategoryController@select_ajax');
Route::post('/okAdminShod/category/select_ajax2','CategoryController@select_ajax2');

// desinition ROUTES
//E 17
Route::get('/okAdminShod/desinition/add','DesinitionController@add');
Route::post('/okAdminShod/desinition/save','DesinitionController@save');
Route::get('/okAdminShod/desinition/all','DesinitionController@all');
Route::get('/okAdminShod/desinition/{desinition_id}/delete','DesinitionController@delete');
Route::get('/okAdminShod/desinition/{desinition_id}/active','DesinitionController@active');
Route::get('/okAdminShod/desinition/{desinition_id}/unactive','DesinitionController@unactive');
Route::get('/okAdminShod/desinition/{desinition_id}/edit','DesinitionController@edit');
Route::post('/okAdminShod/desinition/{desinition_id}/edit/done','DesinitionController@done_edit');


Route::get('/okAdminShod/question/add','QuestionController@add');
Route::post('/okAdminShod/question/save','QuestionController@save');
Route::get('/okAdminShod/question/all','QuestionController@all');
Route::get('/okAdminShod/question/{question_id}/delete','QuestionController@delete');
Route::get('/okAdminShod/question/{question_id}/active','QuestionController@active');
Route::get('/okAdminShod/question/{question_id}/unactive','QuestionController@unactive');
Route::get('/okAdminShod/question/{question_id}/edit','QuestionController@edit');
Route::post('/okAdminShod/question/{question_id}/edit/done','QuestionController@done_edit');

// hotels ROUTES
//E 17
Route::get('/okAdminShod/hotel/add','HotelController@add');
Route::post('/okAdminShod/hotel/save','HotelController@save');
Route::get('/okAdminShod/hotel/all','HotelController@all');
Route::get('/okAdminShod/hotel/{hotel_id}/delete','HotelController@delete');
Route::get('/okAdminShod/hotel/{hotel_id}/active','HotelController@active');
Route::get('/okAdminShod/hotel/{hotel_id}/unactive','HotelController@unactive');
Route::get('/okAdminShod/hotel/{hotel_id}/edit','HotelController@edit');
Route::post('/okAdminShod/hotel/{hotel_id}/edit/done','HotelController@done_edit');
Route::post('/okAdminShod/hotel/remove_gallery','HotelController@remove_gallery');
//room Routes
Route::get('/okAdminShod/room/add','RoomController@add');
Route::post('/okAdminShod/room/save','RoomController@save');
Route::get('/okAdminShod/room/all','RoomController@all');
Route::get('/okAdminShod/room/{room_id}/delete','RoomController@delete');
Route::get('/okAdminShod/room/{room_id}/active','RoomController@active');
Route::get('/okAdminShod/room/{room_id}/unactive','RoomController@unactive');
Route::get('/okAdminShod/room/{room_id}/edit','RoomController@edit');
Route::post('/okAdminShod/room/{room_id}/edit/done','RoomController@done_edit');



// customers ROUTES
//E 17
Route::get('/okAdminShod/customer/add','CustomerController@add');
Route::post('/okAdminShod/customer/save','CustomerController@save');
Route::get('/okAdminShod/customer/all','CustomerController@all');

//E 18
Route::get('/okAdminShod/customer/{customers_id}/delete','CustomerController@delete');
Route::get('/okAdminShod/customer/{customers_id}/active','CustomerController@active');
Route::get('/okAdminShod/customer/{customers_id}/unactive','CustomerController@unactive');
Route::get('/okAdminShod/customer/{customers_id}/edit','CustomerController@edit');
Route::post('/okAdminShod/customer/{customers_id}/edit/done','CustomerController@done_edit');

// E 25
Route::get('/okAdminShod/order/add','OrderController@add');
Route::get('/okAdminShod/order/all','OrderController@all');
Route::post('/okAdminShod/order/save','OrderController@save');

//E 27
Route::get('/okAdminShod/order/{order_id}/active','OrderController@active');
Route::get('/okAdminShod/order/{order_id}/unactive','OrderController@unactive');
Route::get('/okAdminShod/order/{order_id}/delete','OrderController@delete');
Route::get('/okAdminShod/order/{order_id}/edit','OrderController@edit');
Route::post('/okAdminShod/order/{order_id}/edit/done','OrderController@done_edit');

// E 25
Route::get('/okAdminShod/slider/add','SliderController@add');
Route::get('/okAdminShod/slider/all','SliderController@all');
Route::post('/okAdminShod/slider/save','SliderController@save');

//E 27
Route::get('/okAdminShod/slider/{slider_id}/active','SliderController@active');
Route::get('/okAdminShod/slider/{slider_id}/unactive','SliderController@unactive');
Route::get('/okAdminShod/slider/{slider_id}/delete','SliderController@delete');

Route::get('/okAdminShod/slider/{slider_id}/edit','SliderController@edit');
Route::post('/okAdminShod/slider/{slider_id}/edit/done','SliderController@done_edit');

Route::get('/okAdminShod/rule/edit','RuleController@edit');
Route::post('/okAdminShod/rule/edit/done','RuleController@done_edit');


Route::get('/okAdminShod/request/all','RequestController@all');
Route::get('/okAdminShod/request/edit/{request_id}','RequestController@edit');
Route::post('/okAdminShod/request/{request_id}/edit/done','RequestController@done_edit');


Route::get('/okAdminShod/coupon/add','CouponController@add');
Route::get('/okAdminShod/coupon/all','CouponController@all');
Route::post('/okAdminShod/coupon/save','CouponController@save');
Route::get('/okAdminShod/coupon/{coupon_id}/edit','CouponController@edit');
Route::post('/okAdminShod/coupon/{coupon_id}/edit/done','CouponController@done_edit');
Route::get('/okAdminShod/coupon/{coupon_id}/active','CouponController@active');
Route::get('/okAdminShod/coupon/{coupon_id}/unactive','CouponController@unactive');
Route::get('/okAdminShod/coupon/{coupon_id}/delete','CouponController@delete');

Route::get('/okAdminShod/comment/add','CommentController@add');
Route::get('/okAdminShod/comment/all','CommentController@all');
Route::post('/okAdminShod/comment/save','CommentController@save');
Route::get('/okAdminShod/comment/{comment_id}/edit','CommentController@edit');
Route::post('/okAdminShod/comment/{comment_id}/edit/done','CommentController@done_edit');
Route::get('/okAdminShod/comment/{comment_id}/active','CommentController@active');
Route::get('/okAdminShod/comment/{comment_id}/unactive','CommentController@unactive');
Route::get('/okAdminShod/comment/{comment_id}/delete','CommentController@delete');
Route::get('/okAdminShod/comment/all','CommentController@all');
Route::get('/okAdminShod/exit','AdminController@logout');

//userOkShodOkShod panel ( hotelemployee )

Route::get('/userHotel/order/all','OrderUserController@all');
Route::get('/userHotel/order/{order_id}/edit','OrderUserController@edit');
Route::post('/userHotel/order/{order_id}/edit/done','OrderUserController@done_edit');
Route::get('/userHotel/order/{order_id}/unactive','OrderUserController@unactive');
Route::get('/userHotel/order/{order_id}/active','OrderUserController@active');
Route::get('/userHotel/order/{order_id}/delete','OrderUserController@delete');
Route::get('/userHotel/order/{order_id}/confirm','OrderUserController@confirm');
Route::get('/userHotel/order/{order_id}/sendMail','OrderUserController@sendMail');


Route::get('/userHotel/room/{hotel_id}/all','RoomUserController@edit');
Route::post('/userHotel/room/{hotel_id}/edit/done','RoomUserController@done_edit');
Route::get('/userHotel/room/{hotel_id}/unactive','RoomUserController@unactive');
Route::get('/userHotel/room/{hotel_id}/active','RoomUserController@active');
Route::get('/userHotel/room/{hotel_id}/delete','RoomUserController@delete');


Route::get('/userHotel/requests/all','RequestUserController@all');
Route::get('/userHotel/request/{order_id}/{hotel_id}/{order_total}','RequestUserController@add');

Route::get('/userHotel/exit','UserController@logout');
Route::get('/userHotel/changePasswrod','UserController@changePassword');
Route::post('/userHotel/changePasswrod/done','UserController@done_changePassword');

///customer panel
Route::get('/customer/panel','CustomerController@dashboard');
Route::get('/customer/request/{order_id}','CustomerController@request');
Route::get('/customer/request/{order_id}/all','CustomerController@cancel_order');
Route::get('/customer/order/edit/{order_id}','CustomerController@edit_order');
Route::post('/customer/order/{order_id}/edit/done','CustomerController@done_edit_customer');

/// reagent panel

Route::post('/reagent/login','ReagentController@login');
Route::get('/reagent/panel','ReagentController@dashboard');
Route::get('/reagent/request/{order_id}','ReagentController@request');
Route::get('/reagent/request/{order_id}/all','ReagentController@cancel_order');
Route::get('/reagent/logout','ReagentController@logout');
Route::post('/reagent/updatePass', 'ReagentController@updatePass');
Route::get('/okAdminShod/reference/add','ReagentController@add');
Route::get('/okAdminShod/reference/all','ReagentController@all');
Route::post('/okAdminShod/reference/save','ReagentController@save');
Route::get('/okAdminShod/reference/{reference_id}/edit','ReagentController@edit');
Route::post('/okAdminShod/reference/{reference_id}/edit/done','ReagentController@done_edit');
Route::get('/okAdminShod/reference/{reference_id}/active','ReagentController@active');
Route::get('/okAdminShod/reference/{reference_id}/unactive','ReagentController@unactive');
Route::get('/okAdminShod/reference/{reference_id}/delete','ReagentController@delete');
