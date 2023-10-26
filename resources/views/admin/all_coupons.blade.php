@extends('admin.layout')
@section('admin_area')

		<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminShod/dashboard')}}">پیشخوان</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="{{URL::to('/okAdminShod/coupon/all')}}">کدهای تخفیف</a></li>
			</ul>
						 <?php 
						// Alert for success add new coupon
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
						<h2><i class="halflings-icon user"></i><span class="break"></span>کدهای تخفیف</h2>
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
							  	  <th>کد تخفیف</td>
							  	  <th>توضیح</th>
							  	   <th>قیمت</th>
							  	  <th>تاریخ شروع و پایان</th>

								  <th>وضعیت انتشار</th>
								  <th>عملیات</th>
							  </tr>
						  </thead>   
						  <tbody>
						  @php($i=0)
						  	@foreach($all_coupons as $coupon)
								@php($i=$i+1)
								<tr>
									<td>{{ $i}}</td>
								<td class="center">{{ $coupon->coupon_code}}</td>
							
								<td class="center">{{ $coupon->coupon_description}}</td>
								<td class="center">{{ $coupon->coupon_price}}</td>
								<td class="center">{{ $coupon->coupon_start_date}}-{{ $coupon->coupon_end_date}}</td>


								<td class="center">
									@if($coupon->publication_status)
									<span class="label label-success">فعال</span>

									@else
									<span class="label label-unsuccess">غیرفعال</span>
									@endif 


								</td>
								<td class="center">
									
									@if($coupon->publication_status)
									<a class="btn btn-unsuccess" title="  تغییر وضعیت به حالت  غیرفعال" href="{{URL::to('/okAdminShod/coupon/'.$coupon->coupon_id.'/unactive')}}">
										<i class="halflings-icon white remove"></i>  
									</a>
									@else
									<a class="btn btn-success" title="تغییر وضعیت به حالت فعال" href="{{URL::to('/okAdminShod/coupon/'.$coupon->coupon_id.'/active')}}">
										<i class="halflings-icon white ok"></i>  
									</a>
									@endif
									


									<a class="btn btn-info" title="ویرایش" href="{{URL::to('/okAdminShod/coupon/'.$coupon->coupon_id.'/edit')}}">
										<i class="halflings-icon white edit"></i>  
									</a>

									<a 
									class="btn btn-danger" title="حذف"
									href="{{URL::to('/okAdminShod/coupon/'.$coupon->coupon_id.'/delete')}}"
									onclick="return confirm('آیا مطمئن هستید ؟  ')"
									>
										<i class="halflings-icon white trash"></i> 
									</a>
								</td>
							</tr>
							@endforeach
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
@endsection