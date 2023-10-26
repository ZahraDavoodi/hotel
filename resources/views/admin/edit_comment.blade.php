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
					<a href="{{URL::to('/okAdminShod/comment')}}">بروزرسانی  </a>
				</li>
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
						<h2><i class="halflings-icon edit"></i><span class="break"></span>به روز رسانی نظرات</h2>
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
								'/okAdminShod/comment/'.$comment_infos->comment_id.'/edit/done'
							)
						}}
							" method="POST" enctype="multipart/form-data" >
							{{csrf_field()}}
							 <fieldset>
                             <input type="hidden" name="comment_id" value={{$comment_infos->comment_id}} />
						  	<div class="control-group">
								<label class="control-label" for="comment_code">  عنوان پیام <span>*</span> </label>
								<div class="controls">
								    
								    @if($comment_infos->hotel_id !=0 )
								        @foreach($all_hotels as $hotel)
								          @if($hotel->hotel_id == $comment_infos->hotel_id)
								                  @php( $subject= 'هتل '.$hotel->hotel_pName)
								          @endif
								        @endforeach   
								    @else
								        @php($subject=$comment_infos->comment_subject)
								    @endif  
								    
								    {{$subject}}
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="comment_code"> نام نویسنده <span>*</span> </label>
								<div class="controls">
								  
								     @if($comment_infos->customer_id !=0)
								        @foreach($all_customers as $customer)
								          @if($customer->customer_id == $comment_infos->customer_id)
								             {{$customer->customer_name}} {{$customer->customer_lname}}
								          @endif
								        @endforeach
								    @else
								    {{ $comment_infos->comment_name}}
								@endif
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="comment_code">  تاریخ پیام<span>*</span> </label>
								<div class="controls">
								  {{$comment_infos->comment_date}}
								</div>
							</div>
								<div class="control-group">
								<label class="control-label" for="comment_message">متن پیام <span>*</span> </label>
								<div class="controls">
								  <textarea class="form-control"  name="comment_message" id="comment_message" required> {{$comment_infos->comment_message}}</textarea>
								</div>
							</div>
							
							
							

							<div class="control-group">
							  <label class="control-label" for="publication_status">وضعیت انتشار</label>
							  <div class="controls">
								<input type="checkbox" class="cleditor" id="publication_status" name="publication_status" checked />
							  </div>
							</div>

							
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">ویرایش</button>
							  @if( $comment_infos->hotel_id !=0) <a  class="btn btn-warning" data-toggle="modal" id="customer_login_btn" data-target="#commentModal" href="" title="">پاسخ دادن </a>@endif
							   <a class="btn" href={{URL::to('/okAdminShod/comment/all')}}>انصراف</a>
							</div>
						  </fieldset>
						 
						</form>   
						


					</div>
				</div><!--/span-->

			</div><!--/row-->

<div class="modal" id="commentModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                

            </div>
            <div class="modal-body">
              <form  action="{{URL::to('/comment/save')}}" method="POST" id="product_comment">
                  	{{csrf_field()}}
                  <input type="hidden" name="type" value={{$comment_infos->comment_type}} />
                  <input type="hidden" name="comment_reply" value="{{$comment_infos->comment_id}}"/>

                  
                   <input type="hidden" name="hotel_id" value="{{$comment_infos->hotel_id}}" />
                  
                  <textarea class="form-control" name="comment_message" placeholder="نظر خود را وارد کنید "></textarea>
                  <button type="submit" class="btn btn-primary btn-block"> ارسال</button>
              </form>
            </div>

        </div>

    </div>
</div>

@endsection