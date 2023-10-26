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
					<a href="{{URL::to('/okAdminShod/desinition/all')}}"> مشاهده مقصد ها</a>
				</li>
			</ul>

				<?php 
						// Alert for success add new desinition
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>ویرایش مقصد</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/desinition/'.$desinition_infos->des_id.'/edit/done')}}" method="POST">
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="desinition_name">نام مقصد <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="desinition_name" name="desinition_name" value="{{$desinition_infos->des_name}}" required>
							  </div>
							</div>
                		<div class="control-group">
								    	
							  <label class="control-label" for="category_id">موقعیت <span>*</span> </label>
							  <div class="controls">
										<select id="category_id" name="category_id" data-rel="chosen"  required>
													<option value="0">بدون دسته بندی سطح دوم</option>
													@foreach($all_categories as $category)
														@if($category->publication_status)
														 @if($category->category_id == $desinition_infos->category_id) 
																<option value="{{$category->category_id}}" selected>{{$category->category_name}}</option>
														 
														 @else
																<option value="{{$category->category_id}}" >{{$category->category_name}}</option>

														 @endif
														
														@endif
													@endforeach
												</select>
								</div>				
                                </div>

							<div class="control-group hidden-phone">
							  <label class="control-label" for="desinition_publish">وضعیت انتشار </label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>


							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">ویرایش</button>
							  <button type="reset" class="btn">انصراف</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

			
    
@endsection