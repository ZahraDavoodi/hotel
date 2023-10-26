@extends('admin.layout')
@section('admin_area')

		<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminShod/dashboard')}}">پیشخوان</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="{{URL::to('/okAdminShod/orders/all')}}">همه ی سفارش ها</a></li>
			</ul>
						 <?php 
						// Alert for success add new order
							if (Session::get('msg')) {
								echo '<p class="alert alert-success text-right">';
								echo Session::get('msg');
								echo '</p>';

								Session::put('msg',null);
							}
							?>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>همه ی سفارش ها</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>ردیف</th>
								  <th>نام نماینده </th>
							  	  <th>مبلغ سفارش (تومان)</th>
								  <th>تاریخ سفارش</th>
								  <th>وضعیت</th>
								  <th>عملیات</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <?php $i=0;
						  	foreach($all_orders as $order){
						  	    $customer_name='';
						  	 foreach($all_customers as $customer){
								if($customer->customer_id==$order->customer_id){
								 $customer_name=$customer->customer_name;
								}}
								$i=$i+1;
						?>		
								<tr>
								<td>{{ $i}}</td>
								<td>{{$customer_name}}</td>
								<td>{{ $order->order_total}}</td>
								<td>{{ $order->order_inDate}}- {{ $order->order_outDate }}</td>
								<td>
								    @if($order->order_status==1)
								    {{'در انتظار بررسی'}}
								    @endif
								    @if($order->order_status==2)
								    {{'برداخت شده'}}
								    @endif
								     @if($order->order_status==3)
								     {{'تکمیل شده'}}
								    @endif
				
								</td>
								<td class="center">
									


									<a class="btn btn-info" title="ویرایش" href="{{URL::to('/okAdminShod/order/'.$order->order_id.'/edit')}}">
										<i class="halflings-icon white edit"></i>  
									</a>

									<a 
									class="btn btn-danger" title="حذف"
									href="{{URL::to('/okAdminShod/order/'.$order->order_id.'/delete')}}"
									onclick="return confirm('آیا مطمئن هستید ؟  ')"
									>
										<i class="halflings-icon white trash"></i> 
									</a>
								</td>
							</tr>
							<?php } ?>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
@endsection