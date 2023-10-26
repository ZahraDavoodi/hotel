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
					<a href="{{URL::to('/okAdminShod/add_category')}}">بروزرسانی دسته بندی </a>
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span> بروزرسانی دسته بندی</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="
						{{
							URL::to(
								'/okAdminShod/category/'.$category_infos->category_id.'/done_update'
							)
						}}
							" method="POST" >
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="category_name">نام</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="category_name" name="category_name" value="{{$category_infos->category_name}}">
							  </div>
							</div>
							
								<div class="control-group">
							  <label class="control-label" for="slug">عنوان سئو</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="slug" name="slug" value="{{$category_infos->slug}}">
							  </div>
							</div>
							
							  <div class="control-group">
								  <label class="control-label" for="category_parent1">دسته بندی سطح اول<span>*</span></label>
								  <div class="controls">
									  <select id="category_parent1" name="category_parent1" data-rel="chosen" required>
										  <option value="0">بدون دسته بندی سطح دوم</option>
										  @foreach($cat_parent1 as $category)
											  @if($category->publication_status)
												  @if($category->category_id == $category_infos->category_parent1){
												  <option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>
												  @else
													  <option value="{{$category->category_id}}">{{$category->category_name}}</option>
												  @endif

											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>

							  <div class="control-group">
								  <label class="control-label" for="category_parent2">دسته بندی سطح دوم<span>*</span></label>
								  <div class="controls">
									  <select id="category_parent2" name="category_parent2" data-rel="chosen" required>

										  <option value="0">بدون دسته بندی سطح دوم</option>
										  @foreach($cat_parent2 as $category)
											  @if($category->publication_status)
												@if($category->category_id == $category_infos->category_parent2){
													 	 <option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>
													@else
												 		 <option value="{{$category->category_id}}">{{$category->category_name}}</option>
												@endif

											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>
							<div class="control-group hidden-phone">
							  <label class="control-label" for="category_description">توضیحات</label>
							  <div class="controls">
								<textarea class="cleditor" id="category_description" name="category_description" rows="3">
									{{$category_infos->category_description}}
								</textarea>
							  </div>
							</div>


							<div class="control-group hidden-phone">
							  <label class="control-label" for="category_publish">وضعیت</label>
							  <div class="controls">

								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" 
								@if($category_infos->publication_status)
								checked 
								@endif 
								/>

							  </div>
							</div>


							<div class="form-actions">
							  <button type="submit" class="btn btn-success">بروزرسانی</button>
							  <a href="{{URL::to('/okAdminShod/all_categories')}}" class="btn">انصراف</a>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


@endsection