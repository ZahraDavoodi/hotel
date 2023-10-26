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
					<a href="{{URL::to('/okAdminShod/customer/all')}}">بروزرسانی مشترک </a>
				</li>
			</ul>
				<?php 
						// Alert for success add new customer
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span> بروزرسانی مشترک</h2>
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
								'/okAdminShod/customer/'.$customer_infos->customer_id.'/edit/done'
							)
						}}
							" method="POST" >
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="customer_name">نام<span>*</span></label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="customer_name" name="customer_name" value="{{$customer_infos->customer_name}}" required></div>

							</div>

							  <div class="control-group">
								  <label class="control-label" for="customer_code">کد ملی<span>*</span></label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="customer_code" name="customer_code" value="{{$customer_infos->customer_code}}">

									</div>
							  </div>
							  <div class="control-group">
									  <label class="control-label" for="customer_password">رمز عبور<span>*</span></label>
									  <div class="controls">
										  <input type="password" class="input-xlarge" id="customer_password" name="customer_password" value="{{$customer_infos->customer_password}}">
									  </div>
							  </div>
							<div class="control-group">
									  <label class="control-label" for="customer_email">ایمیل<span>*</span></label>
									  <div class="controls">
										  <input type="email" class="input-xlarge" id="customer_email" name="customer_email" value="{{$customer_infos->customer_email}}">
										</div>
                          </div>
							 <div class="control-group">
								  <label class="control-label" for="customer_phone">تلفن<span>*</span></label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="customer_phone" name="customer_phone" value="{{$customer_infos->customer_phone}}" required>
								  </div>
							  </div>
<div class="control-group">
								  <label class="control-label" for="customer_sheba">َشماره شبا</label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="customer_sheba" name="customer_sheba" value="{{$customer_infos->customer_sheba}}" >
								  </div>
							  </div>


							<div class="control-group">
								  <label class="control-label" for="customer_phone">آدرس</label>
								  <div class="controls">
									  <input type="text" class="input-xlarge" id="customer_address" name="customer_address" value="{{$customer_infos->customer_address}}" >
								  </div>
							  </div>


							<div class="control-group hidden-phone">
							  <label class="control-label" for="customer_publish">وضعیت</label>
							  <div class="controls">

								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" 
								@if($customer_infos->publication_status)
								checked 
								@endif 
								/>

							  </div>
							</div>


							<div class="form-actions">
							  <button type="submit" class="btn btn-success">بروزرسانی</button>
							  <a href="{{URL::to('/okAdminShod/customer/all')}}" class="btn">انصراف</a>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


@endsection