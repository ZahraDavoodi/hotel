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
					<a href="{{URL::to('/okAdminShod/add_popular')}}">بروزرسانی محبوب ترین تور </a>
				</li>
			</ul>

				<?php 
						// Alert for success add new popular
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span> بروزرسانی محبوب ترین تور</h2>
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
								'/okAdminShod/popular/'.$popular_infos->popular_id.'/edit/done'
							)
						}}
							" method="POST" enctype="multipart/form-data" >
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="popular_name">نام</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="popular_name" name="popular_name" value="{{$popular_infos->popular_name}}">
							  </div>
							</div>
							
								<div class="control-group">
							  <label class="control-label" for="popular_name">عنوان سئو <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="slug" name="slug" value="{{$popular_infos->slug}}" required>
								<small>این گزینه را طبق عنوان سئو دسته بندی مورد نظر وارد نمایید</small>
							  </div>
							</div>
							  <div class="control-group">
								  <label class="control-label" for="category_id">موقعیت <span>*</span></label>
								  <div class="controls">
									  <select id="category_id" name="category_id" required data-rel="chosen">
										  <option value="0">بدون دسته بندی سطح اول</option>
										  @foreach($all_categories as $category)
											  @if($category->publication_status)
												  @if($popular_infos->category_id== $category->category_id)
													  <option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>

												  @else
													  <option value="{{$category->category_id}}" >{{$category->category_name}}</option>
												  @endif

											  @endif
										  @endforeach
									  </select>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="popular_image">تصویر <span>*</span></label>
								  <div class="controls">


								  @if (file_exists( public_path() . '/images/populars/' . $popular_infos->popular_id . '.jpg'))
										  <input type="file" name="popular_image" id="popular_image" >
										  <img src="{{'/images/populars/' . $popular_infos->popular_id . '.jpg'}}" class="hotel_img">
								  @else
										  <input type="file" name="popular_image" id="popular_image" required>

									  @endif

								  </div>
							  </div>
							<div class="control-group hidden-phone">
							  <label class="control-label" for="popular_description">توضیحات</label>
							  <div class="controls">
								<textarea class="cleditor" id="popular_description" name="popular_description" rows="3">
									{{$popular_infos->popular_description}}
								</textarea>
							  </div>
							</div>

								  <div class="control-group hidden-phone">
							  <label class="control-label" for="popular_publish">وضعیت</label>
							  <div class="controls">

								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" 
								@if($popular_infos->publication_status)
								checked 
								@endif 
								/>

							  </div>
							</div>


							<div class="form-actions">
							  <button type="submit" class="btn btn-success">بروزرسانی</button>
							  <a href="{{URL::to('/okAdminShod/popular/all')}}" class="btn">انصراف</a>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


@endsection