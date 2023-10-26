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
					درخواست
					</a>
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>درخواست واریز</h2>
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
								'/okAdminShod/request/'.$request->request_id.'/edit/done'
							)
						}}
							" method="POST" >
							{{csrf_field()}}
						  <fieldset>

							<div class="control-group">
							  <label class="control-label" for="name">نام</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="name" name="name" value="{{$name}}" readonly>
							  </div>
							</div>
							
								<div class="control-group">
							  <label class="control-label" for="sheba">مبلغ</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="total_price" name="total_price" value="{{$request->total_price}}" readonly>
							  </div>
							</div>
								<div class="control-group">
							  <label class="control-label" for="sheba">شماره شبا</label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="sheba" name="sheba" value="{{$sheba}}" readonly>
							  </div>
							</div>
                           
                           	<div class="control-group">
							  <label class="control-label" for="paid">مبلغ قابل پرداخت </label>
							  <div class="controls">
								<input type="text" class="input-xlarge" id="paid" name="request_paid" value="{{$request->request_paid}}">
							  </div>
							</div>
                           
								<div class="control-group">
							  <label class="control-label" for="sheba">توضیحات لازم</label>
							  <div class="controls">
								<textarea class="input-xlarge" name="description">{{$request->request_description}}</textarea>
							  </div>
							</div>
                           
                           
							<div class="control-group hidden-phone">
							    
							    	@if($request->request_pay>0)
                           	  پرداخت شده در تاریخ : 
                           	   {{$request->request_pay_date}}
                           	@else
							  <label class="control-label" for="request_pay">وضعیت پرداخت </label>
							  <div class="controls">

								<input type="checkbox" class="cleditor" id="request_pay" name="request_pay" 
								@if($request->request_pay)
								checked 
								@endif 
								/>

							  </div>
							  
							   @endif
							</div>

                          
                            
                           
    

							<div class="form-actions">
							  <button type="submit" class="btn btn-success">بروزرسانی</button>
							  <a href="{{URL::to('/okAdminShod/request/all')}}" class="btn">انصراف</a>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->


@endsection