@extends('admin.layout')

@section('admin_area')

			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminshod')}}">پیشخوان</a>
					<i class="icon-angle-right"></i>
				</li>

			</ul>


			<div class="row-fluid">

				<a class="quick-button metro yellow span2" href="{{URL::to('/okAdminShod/comment/all')}}">
					<i class="fa fa-comment"></i>
					<p>نظرات</p>
					{{--<span class="badge">237</span>--}}
				</a>
				<a class="quick-button metro red span2" href="{{URL::to('/okAdminShod/question/all')}}">
					<i class="fa fa-question"></i>
					<p>سوالات متداول</p>
					{{--<span class="badge">46</span>--}}
				</a>
				<a class="quick-button metro green span2" href="{{URL::to('/okAdminShod/category/all')}}">
					<i class="fa fa-file-text"></i>
					<p>دسته بندی</p>
					{{--<span class="badge">13</span>--}}
				</a>
				<a class="quick-button metro blue span2" href="{{URL::to('/okAdminShod/customer/all')}}">
					<i class="fa fa-user"></i>
					<p>مشترکین</p>
				</a>
				<a class="quick-button metro pink span2" href="{{URL::to('/okAdminShod/order/all')}}">
					<i class="fa fa-shopping-cart"></i>
					<p>سفارشات</p>

				</a>
				<a class="quick-button metro black span2" href="{{URL::to('/okAdminShod/hotel/all')}}">
					<i class="fa fa-suitcase"></i>
					<p>هتل ها</p>
				</a>

				<div class="clearfix"></div>

			</div>
			<div class="row-fluid">
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white list"></i><span class="break"></span>اخرین پیام ها</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">
						   @foreach($all_comments as $comment)
								<li class="text-left">
								<a href="#">
									<i class="icon-arrow-up blue"></i>                               
									<strong>{{$comment->comment_date}}</strong>
									<strong>{{$comment->comment_subject}}</strong>
								</a>
							</li>
						   @endforeach

						</ul>
					</div>
				</div><!--/span-->
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white user"></i><span class="break"></span>آخرین سفارشات</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">

							@php($i=0)
							@php ($class='')




							@foreach($all_orders as $order)
									@php($i=$i+1)
									@if($i%2==0)
										@php($class='black')
									@elseif($i%2==1)
										@php($class='blue')
									@else
										@php($class='yellow')
									@endif

								<li class="{{$class}} text-left">
									@foreach($all_customers as $customer)
										@if($customer->customer_id==$order->customer_id)

									<strong>نام: {{$customer->customer_name}}</strong>
										@endif
									@endforeach


									<strong>

										تاریخ:
										<br>
										<br>
										{{$order->created_at}}
									</strong>
									@foreach($all_status as $status)
										@if($status->os_id==$order->order_status)
											<strong>وضعیت: {{ $status->os_name }}</strong>
										@endif
									@endforeach
								</li>
							@endforeach
						</ul>
					</div>
				</div><!--/span-->
				
				<div class="box black span4 noMargin" onTablet="span12" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white check"></i><span class="break"></span>لیست هتل ها</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div class="todo metro">
							<ul class="todo-list text-left">
								@php($i=0)
								@php ($class='')
								@foreach($all_hotels as $hotel)
								   	@php($i=$i+1)
									@if($i%2==0)
										@php($class='black')
									@elseif($i%2==1)
										@php($class='blue')
									@else
										@php($class='yellow')
									@endif



								<li class="{{$class}} text-left">
									<a  href="{{URL::to('/hotel_info/'.$hotel->slug)}}">
									{{$hotel->hotel_pName}}
									</a>
									{{--<strong>{{$hotel->hotel_wentTime}}</strong>--}}

								</li>
								@endforeach


							</ul>
						</div>	
					</div>
				</div>
			
			</div>
			
			<!--/row-->
			
       

	

@endsection

