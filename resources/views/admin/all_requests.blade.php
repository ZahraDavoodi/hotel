@extends('admin.layout')
@section('admin_area')

		<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminShod/dashboard')}}">پیشخوان</a>
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="{{URL::to('/okAdminShod/request/all')}}">همه ی درخواست واریز ها</a></li>
			</ul>
						 <?php 
						// Alert for success add new request
							if (Session::get('msg')) {
								echo '<p class="alert alert-success text-left">';
								echo Session::get('msg');
								echo '</p>';

								Session::put('msg',null);
							}
							?>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>همه ی درخواست واریز ها</h2>
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
								  <th>نوع درخواست</th>
								  <th>تاریخ درخواست</th>
								  <th>هزینه سفارش (تومان)								  </th>
								  <th>وضعیت</th>
								 
							  </tr>
						  </thead>   
						  <tbody>
						  @php($i=0)
						  @php($sum=0)
						  	@foreach($all_requests as $request)
								@php($i=$i+1)
								<tr>
									<td>{{ $i}}</td>
									<td> در خواست
									  @if($request->customer_id !=0)
											@foreach($all_customers as $customer)
												@if($customer->customer_id == $request->customer_id)
													  کاربر -{{$customer->customer_name}}
												@endif
											@endforeach

									  @elseif($request->hotel_id !=0)
											@foreach($all_hotels as $hotel)
												@if($hotel->hotel_id == $request->hotel_id)
													 اپراتورهتل -{{$hotel->hotel_pName}}
												@endif
											@endforeach

										@elseif($request->ref_id !=0)
											@foreach($all_agents as $agent)
												@if($agent->ref_id == $request->ref_id)
													  معرف -  {{$agent->ref_name}}
												@endif
											@endforeach

								      @endif
									</td>

								<td class="center">{{ $request->request_date}}</td>
								<td class="center">{{ $request->total_price}} <?php $sum+=$request->total_price; ?></td>
								<td class="center">
								    @if($request->request_status==0)
								     <a class="btn btn-info " href="{{URL::to('/okAdminShod/request/edit/'.$request->request_id)}}">پرداخت </a>
								    @else
								       <?php echo 'پرداخت شده در '.$request->request_pay_date; ?>
								     @endif
								</td>
								
							
								
							</tr>
							@endforeach
							
						  </tbody>
					  </table>
					  
					  <p class="text-left">{{$sum}} تومان</p>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
@endsection