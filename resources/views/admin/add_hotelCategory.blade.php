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
					<a href="{{URL::to('/okAdminShod/category/add')}}"> افزودن دسته بندی هتل</a>
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>افزودن دسته بندی جدید</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/hotelCategory/save_new_category')}}" method="POST">
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="category_name">نام دسته <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="category_name" name="category_name" required>
							  </div>
							</div>
								<div class="control-group">
							  <label class="control-label" for="slug">عنوان سئو  <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="slug" name="slug" required>
							  </div>
							</div>


							<div class="control-group">
								  <label class="control-label" for="category_parent1">دسته بندی سطح اول<span>*</span></label>
								  <div class="controls">
									  <select id="category_parent1" name="category_parent1" data-rel="chosen" required>
										  <option value="0">بدون دسته بندی سطح اول</option>
										  @foreach($cat_parent1 as $category)
											  @if($category->publication_status)
												  <option value="{{$category->category_id}}">{{$category->category_name}}</option>
											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>

							  <div class="control-group"  >
								  <label class="control-label" for="category_parent2">دسته بندی سطح دوم<span>*</span></label>
								  <div class="controls" id="category_parent22">
									  <select id="category_parent2" name="category_parent2" data-rel="chosen" required>
										  <option value="0">بدون دسته بندی سطح دوم</option>
										  @foreach($cat_parent2 as $category)
											  @if($category->publication_status)
												  <option value="{{$category->category_id}}">{{$category->category_name}}</option>
											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>


							  <div class="control-group hidden-phone">
							  <label class="control-label" for="category_description">توضیحات دسته  </label>
							  <div class="controls">
								<textarea class="cleditor" id="category_description" name="category_description" rows="3"></textarea>
							  </div>
							</div>


							<div class="control-group hidden-phone">
							  <label class="control-label" for="category_publish">وضعیت انتشار </label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>


							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">افزودن دسته بندی</button>
							  <button type="reset" class="btn">انصراف</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


    
@endsection