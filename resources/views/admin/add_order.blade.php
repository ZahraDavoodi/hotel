@extends('admin.layout')
@section('admin_area')

			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminshod/dashboard')}}">پیشخوان</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="{{URL::to('/okAdminshod/order/add')}}"> افزودن سفارش</a>
				</li>
			</ul>

				<?php 
						// Alert for success add new order
							if (Session::get('msg')) {
								echo '<p class="alert alert-success">';
								echo Session::get('msg');
								echo '</p>';

								Session::put('msg',null);
							}
						?>
						
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span>افزودن سفارش جدید</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminshod/order/save')}}" method="POST">
							{{csrf_field()}}
						  <fieldset>

							  <div class="control-group">
								  <label class="control-label" for="tour_id">نام تور<span>*</span> </label>
								  <div class="controls">
									  <select id="order_tour_id" name="tour_id" data-rel="chosen" required>
										  @foreach($all_tours as $tour)
											  @if($tour->publication_status)
												  <option value="{{$tour->tour_id}}">{{$tour->tour_name}}</option>
											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="customer_id">نام مشترک<span>*</span> </label>
								  <div class="controls">
									  <select id="customer_id" name="customer_id" data-rel="chosen" required>
										  @foreach($all_customers as $customer)
											  @if($customer->publication_status)
												  <option value="{{$customer->customer_id}}">{{$customer->customer_name}}</option>
											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>

							  <div class="control-group">
								  <label class="control-label" for="order_price">هزینه سفارش<span>*</span> </label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="order_price" name="order_price" required>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="payment_method">روش پرداخت<span>*</span> </label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="payment_method" name="payment_method"  value="زرین پال" required>
								  </div>
							  </div>


							  <div class="control-group">
								  <label class="control-label" for="order_status">وضعیت سفارش<span>*</span> </label>
								  <div class="controls">
									  <select id="order_status" name="order_status" data-rel="chosen" required>
										  @foreach($order_status as $order_status)
											  @if($order_status->publication_status)
												  <option value="{{$order_status->os_id}}">{{$order_status->os_name}}</option>
											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>

							  <div class="control-group">
								  <label class="control-label" for="order_description">توضیحات سفارش  </label>
								  <div class="controls">
									  <textarea class="cleditor" id="order_description" name="order_description" ></textarea>
								  </div>
							  </div>




							  <h4>لیست اتاق های رزرو شده</h4>

							  <div class="control-group">
								  <div class="controls_cat">
									  <label class="control-label" for="singleRoom_num">تعداد اتاق های یک تخته  </label>
									  <input type="number" class="input-small" id="singleRoom_num" value="0" name="singleRoom_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="doubleRoom_num">تعداد اتاق های دو تخته  </label>
									  <input type="number" class="input-small" id="doubleRoom_num" name="doubleRoom_num" value="0" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="doublePlusRoom_num">تعداد اتاق های دو تخته با تخت اضافه  </label>
									  <input type="number" class="input-small" id="doublePlusRoom_num" name="doublePlusRoom_num" value="0" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="tripleRoom_num">تعداد اتاق های سه تخته  </label>
									  <input type="number" class="input-small" id="tripleRoom_num" name="tripleRoom_num" value="0" required>
								  </div>

							  </div>
							  <div class="control-group">
								  <div class="controls_cat">
									  <label class="control-label" for="triplePlusRoom_num">تعداد اتاق های سه تخته با تخت اضافه  </label>
									  <input type="number" class="input-small" id="triplePlusRoom_num" name="triplePlusRoom_num" value="0" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="withoutRoom_num">بدون تخت (مخصوص کودکان 0 تا دو سال)  </label>
									  <input type="number" class="input-small" id="withoutRoom_num" name="withoutRoom_num" value="0" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="suites4_num">تعداد سوئیت چهار نفره </label>
									  <input type="number" class="input-small" id="suites4_num" value="0" name="suites4_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="suites5_num">تعداد سوئیت پنج نفره </label>
									  <input type="number" class="input-small" id="suites5_num" value="0" name="suites5_num" required>
								  </div>
							  </div>
							  <div class="control-group">


								  <div class="controls_cat">
									  <label class="control-label" for="suites6_num">تعداد سوئیت شش نفره </label>
									  <input type="number" class="input-small" id="suites6_num" value="0" name="suites6_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="suites7_num">تعداد سویئت هفت نفره  </label>
									  <input type="number" class="input-small" id="suites7_num" value="0" name="suites7_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="suites8_num">تعداد سوئیت هشت نفره  </label>
									  <input type="number" class="input-small" id="suites8_num" value="0" name="suites8_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="suites9_num">تعداد سوئیت نه نفره  </label>
									  <input type="number" class="input-small" id="suites9_num" value="0" name="suites9_num" required>
								  </div>
							  </div>


							  <h4>اطلاعات مسافرین</h4>
							  <div class="control-group">
								  <div class="controls_cat">
									  <label class="control-label" for="baby02_num">تعداد افراد 0تا2 سال </label>
									  <input type="number" class="input-small" id="baby02_num" name="baby02_num" value="0" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="baby26_num">تعداد افراد 2تا6 سال </label>\
									  <input type="number" class="input-small" id="baby26_num" value="0" name="baby26_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="baby612_num">تعداد افراد 6تا12 سال </label>
									  <input type="number" class="input-small" value="0" id="baby612_num" name="baby612_num" required>
								  </div>
								  <div class="controls_cat">
									  <label class="control-label" for="man_num">تعداد افراد بزرگسال  </label>
									  <input type="number" class="input-small" id="man_num" value="0" name="man_num" required>
								  </div>
							  </div>

							  <h4>لیست مسافران</h4>
							  <div class="control-group">

								  <div>

									  <img id="add_row"  onclick="add_traveler_row({{$tour_rooms .','.$traveler_age}})" src="{{asset('backend/img/add.png')}}">
									  <img id="add_row"  onclick="remove_traveler_row()" src="{{asset('backend/img/minus.png')}}">
									  <table class="table  table-hover table-responsive" id="add_traveler_row">
										  <thead>
										  <th>نام و نام خانوادگی<span>*</span></th>

										  <th>کد ملی<span>*</span></th>

										  <th>سن<span>*</span></th>
										  <th>نوع اتاق<span>*</span></th>
										  </thead>
										  <tbody>

										  <tr>
											  <td>
												  <input type="text" name="traveler_name[1]" required >
											  </td>
											  <td>
												  <input type="number" name="traveler_code[1]" required >
											  </td>

											  <td>
												  <select name="traveler_age[1]">
													  <option value="0">لطفا یک مورد را انتخاب کنید</option>
													  @foreach($traveler_age as $age)
															  <option value="{{$age->age_id}}" >{{$age->age_name}}</option>
													  @endforeach
												  </select>
											  </td>
											  <td>
												  <select class="order_room_type" name="room_type[1]">
													  @foreach($tour_rooms as $tour_room)

															  <option value="{{$tour_room->room_id}}">{{$tour_room->room_name}}</option>

													  @endforeach


												  </select>
											  </td>
										  </tr>


										  </tbody>
									  </table>

								  </div>
							  </div>


							<div class="control-group hidden-phone">
							  <label class="control-label" for="order_publish">وضعیت انتشار </label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>



							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">افزودن</button>
							  <button type="reset" class="btn">انصراف</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


    
@endsection