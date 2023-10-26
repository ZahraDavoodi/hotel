@extends('admin.layout')
@section('admin_area')

		<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="{{URL::to('/okAdminShod/dashboard')}}">پیشخوان</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="{{URL::to('/okAdminShod/comments/all')}}">همه ی نظر ها</a></li>
			</ul>
						 <?php 
						// Alert for success add new comment
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
						<h2><i class="halflings-icon user"></i><span class="break"></span>همه ی نظر ها</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					<div class="box-content ">
						<table class="table table-striped table-bcommented bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>ردیف</th>
								  <th>عنوان پیام </th>
							  	  <th> نام نویسنده </th>
							  	  <th>تاریخ </th>
							  	  <th>دسته بندی</th>
								  <th>وضعیت</th>
								  <th>عملیات</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <?php $i=0;
						  	foreach($all_comments as $comment){
						  	 
						?>		
								<tr>
								<td>{{ $i}}</td>
							
								<td>

								    @if($comment->hotel_id !=0 )
								        @foreach($all_hotels as $hotel)
								          @if($comment->hotel_id == $hotel->hotel_id)
								             هتل {{$hotel->hotel_pName}} /{{$hotel->hotel_eName}}
								          @endif
								        @endforeach   
								    @else
								        {{ $comment->comment_subject}}
								    @endif    
								    </td>
								<td>
								     @if($comment->customer_id !=0)
								        @foreach($all_customers as $customer)
								          @if($customer->customer_id == $comment->customer_id)
								             {{$customer->customer_name}} {{$customer->customer_lname}}
								          @endif
								        @endforeach
								    @else
								    {{ $comment->comment_name}}
								@endif
								</td>
								<td>
								    {{$comment->comment_date}}
								</td>
								<td>
								    @if($comment->comment_type ==1)
								        پیشنهادات و انتقادات

								    @elseif($comment->comment_type==3)
								      هتل
								    @endif
					
								</td>
							
									<td class="center">
									@if($comment->publication_status)
									<span class="label label-success">فعال</span>

									@else
									<span class="label label-unsuccess">غیرفعال</span>
									@endif 


								</td>
								<td class="center">
									
                            	@if($comment->publication_status)
									<a class="btn btn-unsuccess" title="  تغییر وضعیت به حالت  غیر فعال" href="{{URL::to('/okAdminShod/comment/'.$comment->comment_id.'/unactive')}}">
										<i class="halflings-icon white remove"></i>  
									</a>
									@else
									<a class="btn btn-success" title="تغییر وضعیت به حالت  فعال" href="{{URL::to('/okAdminShod/comment/'.$comment->comment_id.'/active')}}">
										<i class="halflings-icon white ok"></i>  
									</a>
									@endif

									<a class="btn btn-info" title="ویرایش" href="{{URL::to('/okAdminShod/comment/'.$comment->comment_id.'/edit')}}">
										<i class="halflings-icon white edit"></i>  
									</a>

									<a class="btn btn-danger" title="حذف" href="{{URL::to('/okAdminShod/comment/'.$comment->comment_id.'/delete')}}" onclick="return confirm('آیا مطمئن هستید ؟  ')">
										<i class="halflings-icon white trash"></i> 
									</a>
								</td>
							</tr>
							<?php  $i++; } ?>
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
@endsection