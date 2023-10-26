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
					<a href="{{URL::to('/okAdminShod/plan/add')}}"> افزودن طرح</a>
				</li>
			</ul>

				<?php 
						// Alert for success add new plan
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>افزودن طرح جدید</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<form class="form-horizontal" action="{{URL::to('/okAdminShod/plan/save')}}" method="POST">
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="plan_name">نام طرح <span>*</span> </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="plan_name" name="plan_name" required>
							  </div>
							</div>
							  <div class="control-group">
								  <label class="control-label" for="plan_price">قیمت<span>*</span> </label>
								  <div class="controls">
									  <input type="number" class="input-xlarge" id="plan_price" name="plan_price" required>
								  </div>
							  </div>




							<div class="control-group hidden-phone">
							  <label class="control-label" for="plan_publish">وضعیت انتشار </label>
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