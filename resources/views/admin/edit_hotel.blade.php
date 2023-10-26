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
					<a href="{{URL::to('/okAdminShod/hotel/add')}}">بروزرسانی هتل </a>
				</li>
			</ul>

				<?php 
						// Alert for success add new hotel
							if (Session::get('msg')) {
								echo '<p class="alert alert-success">';
								echo Session::get('msg');
								echo '</p>';

								Session::put('msg',null);
							}
						?>
						
			
			<div class="row-fluid sortable" dir="rtl">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span> بروزرسانی هتل</h2>
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
								'/okAdminShod/hotel/'.$hotel_infos->hotel_id.'/edit/done'
							)
						}}
							" method="POST" enctype="multipart/form-data" id="myform">
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="hotel_pname">
							       نام هتل (فارسی)
							       
							        <span>*</span>
							        </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="hotel_pname" name="hotel_pName" value="{{$hotel_infos->hotel_pName}}" required>
							  </div>
							</div>
							<div class="control-group">
									<label class="control-label" for="hotel_ename">
									    نام هتل (لاتین)
									     <span>*</span>
									</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="hotel_ename" name="hotel_eName" value="{{$hotel_infos->hotel_eName}}"  required>
									</div>


								</div>
							<div class="control-group">
							  <label class="control-label" for="slug">عنوان سئو<span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="slug" name="slug" value="{{$hotel_infos->slug}}"  required>
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="slug">کلمات کلیدی   <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="keywords" name="keywords" value="{{$hotel_infos->keywords}}"  required>
								<small>بین هر کلمه از کاما استفاده کنید</small>
							  </div>
							</div>
							 <div class="control-group">
							  <label class="control-label" for="seo_description">توضیحات  سئو      <span>*</span> </label>
							  <div class="controls">
																<textarea class="input-xlarge" id="seo_description" name="seo_description" required>{{$hotel_infos->seo_description}}</textarea>

								<small>حداکثر 180 کاراکتر وارد نمایید</small>
							  </div>
							</div>
							 <div class="control-group">
								    <label class="control-label" for="category_parent2">موقعیت <span>*</span></label>
										<div class="controls_cat">
											<label class="control-label" for="category_parent1">دسته بندی سطح اول<span>*</span></label>

											<select id="category_parent1" name="category_parent1" data-rel="chosen" required>
												<option value="0">بدون دسته بندی سطح اول</option>
												@foreach($cat_parent1 as $category)
													@if($category->publication_status)
														@if($hotel_infos->category_parent1 == $category->category_id)
															<option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>
														@else
														<option value="{{$category->category_id}}" >{{$category->category_name}}</option>
														@endif

													@endif
												@endforeach
											</select>
										</div>
										<div class="controls_cat">
											<label class="control-label" for="category_parent2">دسته بندی سطح دوم<span>*</span></label>
											<div id="category_parent22">
												<select id="category_parent2" name="category_parent2" data-rel="chosen"  required>
													<option value="0">بدون دسته بندی سطح دوم</option>
													@foreach($cat_parent2 as $category)
														@if($category->publication_status)
															@if($hotel_infos->category_parent2== $category->category_id)
																<option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>

															@else
																<option value="{{$category->category_id}}" >{{$category->category_name}}</option>
															@endif
														@endif
													@endforeach
												</select>
											</div>
										</div>

										<div class="controls_cat">
											<label class="control-label" for="category_parent2">دسته بندی سطح سوم</label>
											<div id="category_parent33">
												<select id="category_parent3" name="category_parent3" data-rel="chosen" >
													<option value="0">بدون دسته بندی سطح سوم</option>
													@foreach($cat_parent3 as $category)
														@if($category->publication_status)
															@if($hotel_infos->category_parent3== $category->category_id)
																<option value="{{$category->category_id}}" selected >{{$category->category_name}}</option>

															@else
																<option value="{{$category->category_id}}" >{{$category->category_name}}</option>
															@endif
														 @endif
													@endforeach
												</select>
											</div>
										</div>


									</div>
							 <div class="control-group">
									<label class="control-label" for="hotel_name">درجه هتل (تعداد ستاره)  <span>*</span> </label>
									<div class="controls">
										<input type="number" id="hotel_rate" name="hotel_rate" required value="{{$hotel_infos->hotel_rate}}" min="1" max="5" step="1">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="hotel_type">نوع خدمت  <span>*</span> </label>
									<div class="controls">

												<select name="hotel_type" required data-rel="chosen">
													<option value="0">لطفا انتخاب کنید.</option>
													@foreach($all_conditions as $condition)
														<option value="{{$condition->condition_id}}" @if($condition->condition_id == $hotel_infos->hotel_type) selected @endif >{{$condition->condition_name}}</option>
													@endforeach
												</select>

									</div>
								</div>
							  <div class="control-group">
								  <label class="control-label" for="hotel_phone">تلفن<span>*</span> </label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="hotel_phone" name="hotel_phone" value="{{$hotel_infos->hotel_phone}}" required>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="hotel_website">وب سایت </label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="hotel_website" name="hotel_website"  value="{{$hotel_infos->hotel_website}}">
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="hotel_map">نقشه هتل  <span>*</span> </label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="hotel_map" name="hotel_map" value="{{$hotel_infos->hotel_map}}">
									  <span>ادرس نقشه هتل را از
										  <a href="https://www.google.com/maps" target="_blank">سایت گوگل </a>
										  دریافت نمایید</span>
								  </div>
							  </div>

							  <div class="control-group">
								  <label class="control-label" for="hotel_name">آدرس هتل  <span>*</span> </label>
								  <div class="controls">
									  <textarea class="input-xlarge" id="hotel_address" name="hotel_address" required>{{$hotel_infos->hotel_address}}</textarea>
								  </div>
							  </div>

							  <div class="control-group">
								  <label class="control-label" for="hotel_name">کمیسیون نماینده مسافرین (تومان)  <span>*</span> </label>
								  <div class="controls">
									  <input type="number" id="hotel_rate" name="hotel_comision" required min="1" max="5" step="1" value="{{$hotel_infos->hotel_comision}}">
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="hotel_name">کمیسیون معرف مسافرین (تومان)  <span>*</span> </label>
								  <div class="controls">
									  <input type="number"  name="hotel_ref_comision" required min="1" max="5" step="1" value="{{$hotel_infos->hotel_ref_comision}}">
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="hotel_image">تصویر هتل <span>*</span></label>
								  <div class="controls">

									  @if (file_exists( public_path() . '/images/hotels/' . $hotel_infos->hotel_id . '.jpg'))
										  <input type="file" name="hotel_image" id="hotel_image"  onchange="findSize(this)" >
										  <img src="{{'/images/hotels/' . $hotel_infos->hotel_id . '.jpg'}}" class="hotel_img"><input type="text" required name="alt_image" placeholder="عنوان تصویر را وارد نمایید *" class="input-xlarg" value="{{$hotel_infos->alt_image}}">
										  	  <small>اندازه تصویر ارسالی نباید بالاتر از 2مگابایت باشد.</small>
										@else
										  <input type="file" name="hotel_image" id="hotel_image"  onchange="findSize(this)"  required><input type="text" required name="alt_image" placeholder="عنوان تصویر را وارد نمایید *" class="input-xlarg">
										  	  <small>اندازه تصویر ارسالی نباید بالاتر از 2مگابایت باشد.</small>
									  @endif

								  </div>
							
							  </div>

							  <div class="control-group" >
								  <label class="control-label" for="tour_gallery">گالری تصاویر تور <span>*</span></label>
								  <img  onclick="add_gallery()" src="{{asset('backend/img/add.png')}}" class="img_add" title="افزودن گالری تصاویر">
								  <img  onclick="remove_gallery()" src="{{asset('backend/img/minus.png')}}" class="img_add" title="حذف گالری تصاویر">

                            <input type="file" name="hotel_gallery[1]" id="hotel_gallery"><input type="text" name="alt[1]" placeholder="عنوان تصویر را وارد نمایید *" >					
								  <div class="controls" id="gallery" >
									  @php($i=0)
									
									  @foreach($all_hgs as $hg)
										  <div id="{{$hg->hg_id}}">
											  @php($i=$i+1)
											  @if (file_exists( public_path() . '/images/hotels/gallery/' . $hg->hotel_id .'/'.$i. '.jpg'))
											    
												  <img  onclick="remove_hotel_gallery_exist({{$hg->hg_id}})" src="{{asset('backend/img/minus.png')}}" class="img_add" title="حذف گالری تصاویر">
												  <img src="{{url($hg->hotel_gallery)}}" class="hotel_img" >
												  <input type="text" value=" {{$hg->alt}}" required name="old_alt[{{$i}}][{{$hg->hg_id}}]" placeholder="نام تصویر را وارد کنید *">
												  <br>
											  @endif
										  </div>
									  @endforeach
								  </div>

							  </div>


							  <div class="control-group hidden-phone">
							  <label class="control-label" for="hotel_description">توضیحات</label>
							  <div class="controls">
								<textarea class="cleditor" id="hotel_description" name="hotel_description" rows="3">
									{{$hotel_infos->hotel_description}}
								</textarea>
							  </div>
							</div>


							<div class="control-group hidden-phone">
							  <label class="control-label" for="hotel_publish">وضعیت</label>
							  <div class="controls">

								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" 
								@if($hotel_infos->publication_status)
								checked 
								@endif 
								/>

							  </div>
							</div>

								<h4 class="title text-right">امکانات هتل</h4>
								<hr>


								<div class="control-group attr hidden-phone row">
									@foreach($hotel_attr as $hotel_attr)
										<div class="col-sm-3">
											<label class="control-label" for="attr_freenet"><i class="icon icon-globe"></i>اینترنت رایگان</label>
											<div class="controls">

												<input type="checkbox" class="cleditor" id="attr_freenet" name="attr_freenet"
													   @if($hotel_attr->attr_freenet)
													   checked
														@endif
												/>
											</div>
										</div>
									@endforeach
									<div class="col-sm-3">
										<label class="control-label" for="attr_freenet"><i class="icon icon-globe"></i>اینترنت رایگان</label>
										<div class="controls">

											<input type="checkbox" class="cleditor" id="attr_freenet" name="attr_freenet"
												   @if($hotel_attr->attr_freenet)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_safebox"><i class="fa fa-box "></i>صندوق امانات</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_safebox" name="attr_safebox"
												   @if($hotel_attr->attr_safebox)
												      checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_transfer"><i class="fa fa-plane "></i>ترانسفر فرودگاهی</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_transfer" name="attr_transfer"
												   @if($hotel_attr->attr_transfer)
												    checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_laundry"><i class="fa fa-socks"></i>خشکشویی</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_laundry" name="attr_laundry"
												   @if($hotel_attr->attr_laundry)
												     checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_animal"><i class="fa fa-dog "></i>ورود حیوانات</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_animal" name="attr_animal"
												   @if($hotel_attr->attr_animal)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_child"><i class="fa fa-child "></i>نگهداری کودک</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_child" name="attr_child"
												   @if($hotel_attr->attr_child)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_fire"><i class="fa fa-fire "></i>اعلام حریق</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_fire" name="attr_fire"
												   @if($hotel_attr->attr_fire)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_hair"><i class="fa fa-cut "></i>آرایشگاه</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_hair" name="attr_hair"
												   @if($hotel_attr->attr_hair)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_car"><i class="fa fa-car "></i>اجاره خودرو</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_car" name="attr_car"
												   @if($hotel_attr->attr_car)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_indoorpool"><i class="fa fa-swimming-pool "></i>استخر سرپوشیده</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_indoorpool" name="attr_indoorpool"
												   @if($hotel_attr->attr_indoorpool)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_outdoorpool"><i class="fa fa-swimmer "></i>استخر سرباز</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_outdoorpool" name="attr_outdoorpool"
												   @if($hotel_attr->attr_outdoorpool)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_sonia"><i class="fa fa-umbrella"></i>سونا</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_sonia" name="attr_sonia"
												   @if($hotel_attr->attr_sonia)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_massage"><i class="fa fa-smile-o"></i>ماساژ</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_massage" name="attr_massage"
												   @if($hotel_attr->attr_massage)
												   checked
													@endif
											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_gym"><i class="fa fa-dumbbell"></i>باشگاه ورزشی</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_gym" name="attr_gym"
												   @if($hotel_attr->attr_gym)
												   checked
													@endif

											/>
										</div>
									</div>
									<div class="col-sm-3">
										<label class="control-label" for="attr_coffeshop"><i class="fa fa-box "></i>کافی شاپ</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_coffeshop" name="attr_coffeshop"
												   @if($hotel_attr->attr_coffeshop)
												   checked
													@endif

											/>
										</div>
									</div>

									<div class="col-sm-3">
										<label class="control-label" for="attr_restaurant"><i class="fa fa-box "></i>رستوران</label>
										<div class="controls">
											<input type="checkbox" class="cleditor" id="attr_restaurant" name="attr_restaurant"
												   @if($hotel_attr->attr_restaurant)
												   checked
													@endif

											/>
										</div>
									</div>



</div>

									<div class="form-actions">
							  <button type="button" onclick="validate_hotel()" class="btn btn-success">بروزرسانی</button>
							  <a href="{{URL::to('/okAdminShod/hotel/all')}}" class="btn">انصراف</a>
							</div>

						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


@endsection