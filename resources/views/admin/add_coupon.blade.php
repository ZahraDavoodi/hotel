@extends('admin.layout')
@section('admin_area')

			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminShod/dashboard')}}">پیشخوان</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="{{URL::to('/okAdminShod/coupon/add')}}">افزودن کد تخفیف</a>
				</li>
			</ul>

				<?php 
						// Alert for success add new Category
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>افزودن کد تخفیف جدید</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/coupon/save')}}" method="POST"  enctype="multipart/form-data">
							{{csrf_field()}}
						  <fieldset>

						  	<div class="control-group">
								<label class="control-label" for="coupon_code">عنوان <span>*</span> </label>
								<div class="controls">
								  <input type="text" name="coupon_code" id="coupon_code" required>
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="coupon_title">توضیح<span>*</span> </label>
								<div class="controls">
								  <input type="text" name="coupon_description" id="coupon_description" required>
								</div>
							</div>

						  	<div class="control-group">
								<label class="control-label" for="coupon_price">قیمت  (تومان<span>*</span> </label>
								<div class="controls">
								  <input type="number" name="coupon_price" id="coupon_price" required>
								</div>
							</div>

					  		

							<div class="control-group">
								<label class="control-label" for="coupon_start_date">تاریخ شروع <span>*</span> </label>
								<div class="controls">
								  <input type="text" class="date" name="coupon_start_date" id="coupon_start_date" required>
								</div>
							</div>

								<div class="control-group">
								<label class="control-label" for="coupon_end_date">تاریخ پایان <span>*</span> </label>
								<div class="controls">
								  <input type="text" class="date" name="coupon_end_date" id="coupon_end_date" required>
								</div>
							</div>

                    	<div class="control_group">
											<label class="control-label" for="category_parent1">دسته بندی هتل</label>

											<select  name="category_id[]" data-rel="chosen" multiple>
												<option value="0">بدون دسته بندی</option>
												@foreach($all_categories as $category)
													@if($category->publication_status)
													
														<option value="{{$category->category_id}}" >{{$category->category_name}}</option>
													

													@endif
												@endforeach
											</select>
											<small>نام دسته هایی که قصد دارید ، این کد تخفیف فقط مخصوص آنها باشد را انتخاب کنید</small>
										</div>
										<br/>
						<div class="control_group">
											<label class="control-label" for="category_parent1">نام هتل</label>

											<select name="hotel_id[]" data-rel="chosen" multiple>
												<option value="0">نام هتل </option>
												@foreach($all_hotels as $hotel)
													@if($hotel->publication_status)
													
														<option value="{{$category->category_id}}" >{{$hotel->hotel_pName}}</option>
													

													@endif
												@endforeach
											</select>
											<small>نام هتلهایی که قصد دارید ، این کد تخفیف فقط مخصوص آنها باشد را انتخاب کنید.</small>
										</div>				
										
							<div class="control-group">
							  <label class="control-label" for="publication_status">وضعیت انتشار</label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>

							
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">افزودن کد تخفیف</button>
							  <button type="reset" class="btn">انصراف</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

			
    
@endsection