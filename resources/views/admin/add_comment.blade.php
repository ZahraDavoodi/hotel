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
					<a href="{{URL::to('/okAdminShod/comment/add')}}">افزودن کد تخفیف</a>
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
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/comment/save')}}" method="POST"  enctype="multipart/form-data">
							{{csrf_field()}}
						  <fieldset>

						  	<div class="control-group">
								<label class="control-label" for="comment_code">عنوان <span>*</span> </label>
								<div class="controls">
								  <input type="text" name="comment_code" id="comment_code" required>
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="comment_title">توضیح<span>*</span> </label>
								<div class="controls">
								  <input type="text" name="comment_description" id="comment_description" required>
								</div>
							</div>

						  	<div class="control-group">
								<label class="control-label" for="comment_price">قیمت  (تومان<span>*</span> </label>
								<div class="controls">
								  <input type="number" name="comment_price" id="comment_price" required>
								</div>
							</div>

					  		

							<div class="control-group">
								<label class="control-label" for="comment_start_date">تاریخ شروع <span>*</span> </label>
								<div class="controls">
								  <input type="text" class="date" name="comment_start_date" id="comment_start_date" required>
								</div>
							</div>

								<div class="control-group">
								<label class="control-label" for="comment_end_date">تاریخ پایان <span>*</span> </label>
								<div class="controls">
								  <input type="text" class="date" name="comment_end_date" id="comment_end_date" required>
								</div>
							</div>

                    	<div class="control_group">
											<label class="control-label" for="category_parent1">دسته بندی تور</label>

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
											<label class="control-label" for="category_parent1">نام تور</label>

											<select name="tour_id[]" data-rel="chosen" multiple>
												<option value="0">نام تور </option>
												@foreach($all_tours as $tour)
													@if($tour->publication_status)
													
														<option value="{{$category->category_id}}" >{{$tour->tour_name}}</option>
													

													@endif
												@endforeach
											</select>
											<small>نام تورهایی که قصد دارید ، این کد تخفیف فقط مخصوص آنها باشد را انتخاب کنید.</small>
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