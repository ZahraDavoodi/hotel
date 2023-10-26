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
					<a href="{{URL::to('/okAdminShod/reference/add')}}">افزودن معرف </a>
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>افزودن معرف جدید</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/reference/save')}}" method="POST"  enctype="multipart/form-data">
							{{csrf_field()}}
						  <fieldset>

						  	<div class="control-group">
								<label class="control-label" for="ref_code">عنوان <span>*</span> </label>
								<div class="controls">
								  <input type="text" name="ref_code" id="ref_code" required>
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="ref_name">نام<span>*</span> </label>
								<div class="controls">
								  <input type="text" name="ref_name" id="ref_name" required>
								</div>
							</div>
							
							
								<div class="control-group">
								<label class="control-label" for="reference_email">پست الکترونیک <span>*</span> </label>
								<div class="controls">
								  <input type="email" name="ref_email" id="ref_email"  required>
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="reference_phone">تلفن <span>*</span> </label>
								<div class="controls">
								  <input type="text" name="ref_phone" id="ref_phone"  required>
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="reference_password">رمز عبور <span>*</span> </label>
								<div class="controls">
								  <input type="password" name="ref_password" id="ref_password"  required>
								</div>
							</div>

						  	<div class="control-group">
								<label class="control-label" for="ref_money">درآمد (تومان)</span>*</span> </label>
								<div class="controls">
								  <input type="number" name="ref_money" id="ref_money" required value="0">
								</div>
							</div>

					  		<div class="control-group">
								<label class="control-label" for="ref_used_number">تعداد فروش</span>*</span> </label>
								<div class="controls">
								  <input type="number" name="ref_used_number" id="ref_used_number" required value="0">
								</div>
							</div>
	                    	<div class="control-group">
								<label class="control-label" for="reference_shaba">شماره شبا </label>
								<div class="controls">
								  <input type="text" name="ref_sheba" id="ref_sheba">
								</div>
							</div>
                    				
										
							<div class="control-group">
							  <label class="control-label" for="publication_status">وضعیت انتشار</label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>

							
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">افزودن </button>
							  <a class="btn" href="{{URL::to('/okAdminShod/reference/all')}}">انصراف</a>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

			
    
@endsection