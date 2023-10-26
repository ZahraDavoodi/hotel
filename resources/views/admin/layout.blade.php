<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- start: Meta -->

    <title>پنل کاربری مدیریت</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword"  content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- end: Meta -->

    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->
    <!-- start: CSS -->
    <link id="bootstrap-style" href="{{asset('backend/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('backend/css/bootstrap-responsive.min.css')}}" rel="stylesheet">
    <link href="{{asset('frontend/css/bootstrap-rtl.min.css')}}" rel="stylesheet">
    <link id="base-style" href="{{asset('backend/css/style.css')}}" rel="stylesheet">
    <link id="base-style-responsive" href="{{asset('backend/css/style-responsive.css')}}" rel="stylesheet">
    <link id="base-style-responsive" href="{{asset('backend/css/font-awesome.min.css')}}" rel="stylesheet">
    <link id="base-style-responsive" href="{{asset('backend/css/persianDatepicker-default.css')}}" rel="stylesheet">
    <link id="base-style-responsive" href="{{asset('backend/css/wbbtheme.css')}}" rel="stylesheet">
    <link id="base-style-responsive" href="{{asset('backend/css/style-forms.css')}}" rel="stylesheet">

    <!-- end: CSS -->


    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link id="ie-style" href="{{asset('backend/css/ie.css')}}" rel="stylesheet">
    <![endif]-->

    <!--[if IE 9]>
    <link id="ie9style" href="{{asset('backend/css/ie9.css')}}" rel="stylesheet">
    <![endif]-->
    <!-- start: Favicon -->
    <link rel="shortcut icon" href="{{asset('backend/img/favicon.ico')}}">
    <!-- end: Favicon -->
    <style>
        #sidebar-left {
            z-index: 100;
        }

        #content {
            /*margin-right: 14.422% !important;*/
            margin-left: auto !important;
        }
        .box-content input
        {
            height: 30px;
            float:right;
        }
        .form-horizontal .control-label , label {
            float: right;
        }

        .table th, .table td {
            text-align: right;
        }
        .controls{
            float: right;
        }
        .attr .controls{
            margin:0px !important;
        }
        .chzn-container .chzn-results
        {
            float: right;
            text-align: right;
        }
    </style>


</head>

<body dir="rtl">
<!-- start: Header -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse"
               data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="index.html"><span>پنل مدیریت</span></a>

            <!-- start: Header Menu -->
            <!--<div class="nav-no-collapse header-nav">-->
            <!--	<ul class="nav pull-right">-->
            <!--		<li class="dropdown hidden-phone">-->
            <!--			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">-->
            <!--				<i class="halflings-icon white warning-sign"></i>-->
            <!--			</a>-->
            <!--			<ul class="dropdown-menu notifications">-->
            <!--				<li class="dropdown-menu-title">-->
            <!--						<span>You have 11 notifications</span>-->
            <!--					<a href="#refresh"><i class="icon-repeat"></i></a>-->
            <!--				</li>	-->
            <!--                        	<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon blue"><i class="icon-user"></i></span>-->
            <!--						<span class="message">New user registration</span>-->
            <!--						<span class="time">1 min</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon green"><i class="icon-comment-alt"></i></span>-->
            <!--						<span class="message">New comment</span>-->
            <!--						<span class="time">7 min</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon green"><i class="icon-comment-alt"></i></span>-->
            <!--						<span class="message">New comment</span>-->
            <!--						<span class="time">8 min</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon green"><i class="icon-comment-alt"></i></span>-->
            <!--						<span class="message">New comment</span>-->
            <!--						<span class="time">16 min</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon blue"><i class="icon-user"></i></span>-->
            <!--						<span class="message">New user registration</span>-->
            <!--						<span class="time">36 min</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon yellow"><i class="icon-shopping-cart"></i></span>-->
            <!--						<span class="message">2 items sold</span>-->
            <!--						<span class="time">1 hour</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li class="warning">-->
            <!--                                <a href="#">-->
            <!--						<span class="icon red"><i class="icon-user"></i></span>-->
            <!--						<span class="message">User deleted account</span>-->
            <!--						<span class="time">2 hour</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li class="warning">-->
            <!--                                <a href="#">-->
            <!--						<span class="icon red"><i class="icon-shopping-cart"></i></span>-->
            <!--						<span class="message">New comment</span>-->
            <!--						<span class="time">6 hour</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon green"><i class="icon-comment-alt"></i></span>-->
            <!--						<span class="message">New comment</span>-->
            <!--						<span class="time">yesterday</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="icon blue"><i class="icon-user"></i></span>-->
            <!--						<span class="message">New user registration</span>-->
            <!--						<span class="time">yesterday</span> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li class="dropdown-menu-sub-footer">-->
            <!--                        		<a>View all notifications</a>-->
            <!--				</li>	-->
            <!--			</ul>-->
            <!--		</li>-->
            <!-- start: Notifications Dropdown -->
            <!--		<li class="dropdown hidden-phone">-->
            <!--			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">-->
            <!--				<i class="halflings-icon white tasks"></i>-->
            <!--			</a>-->
            <!--			<ul class="dropdown-menu tasks">-->
            <!--				<li class="dropdown-menu-title">-->
            <!--						<span>You have 17 tasks in progress</span>-->
            <!--					<a href="#refresh"><i class="icon-repeat"></i></a>-->
            <!--				</li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="header">-->
            <!--							<span class="title">iOS Development</span>-->
            <!--							<span class="percent"></span>-->
            <!--						</span>-->
            <!--                                    <div class="taskProgress progressSlim red">80</div> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
            <!--						<span class="header">-->
            <!--							<span class="title">Android Development</span>-->
            <!--							<span class="percent"></span>-->
            <!--						</span>-->
            <!--                                    <div class="taskProgress progressSlim green">47</div> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
            <!--						<span class="header">-->
            <!--							<span class="title">ARM Development</span>-->
            <!--							<span class="percent"></span>-->
            <!--						</span>-->
            <!--                                    <div class="taskProgress progressSlim yellow">32</div> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
            <!--						<span class="header">-->
            <!--							<span class="title">ARM Development</span>-->
            <!--							<span class="percent"></span>-->
            <!--						</span>-->
            <!--                                    <div class="taskProgress progressSlim greenLight">63</div> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
            <!--						<span class="header">-->
            <!--							<span class="title">ARM Development</span>-->
            <!--							<span class="percent"></span>-->
            <!--						</span>-->
            <!--                                    <div class="taskProgress progressSlim orange">80</div> -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                        		<a class="dropdown-menu-sub-footer">View all tasks</a>-->
            <!--				</li>	-->
            <!--			</ul>-->
            <!--		</li>-->
            <!-- end: Notifications Dropdown -->
            <!-- start: Message Dropdown -->
            <!--		<li class="dropdown hidden-phone">-->
            <!--			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">-->
            <!--				<i class="halflings-icon white envelope"></i>-->
            <!--			</a>-->
            <!--			<ul class="dropdown-menu messages">-->
            <!--				<li class="dropdown-menu-title">-->
            <!--						<span>You have 9 messages</span>-->
            <!--					<a href="#refresh"><i class="icon-repeat"></i></a>-->
            <!--				</li>	-->
            <!--                        	<li>-->
            <!--                                <a href="#">-->
        <!--						<span class="avatar"><img src="{{asset('backend/img/avatar.jpg')}}" alt="Avatar"></span>-->
            <!--						<span class="header">-->
            <!--							<span class="from">-->
            <!--						    	Dennis Ji-->
            <!--						     </span>-->
            <!--							<span class="time">-->
            <!--						    	6 min-->
            <!--						    </span>-->
            <!--						</span>-->
            <!--                                    <span class="message">-->
            <!--                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore-->
            <!--                                    </span>  -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
        <!--						<span class="avatar"><img src="{{asset('backend/img/avatar.jpg')}}" alt="Avatar"></span>-->
            <!--						<span class="header">-->
            <!--							<span class="from">-->
            <!--						    	Dennis Ji-->
            <!--						     </span>-->
            <!--							<span class="time">-->
            <!--						    	56 min-->
            <!--						    </span>-->
            <!--						</span>-->
            <!--                                    <span class="message">-->
            <!--                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore-->
            <!--                                    </span>  -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
        <!--						<span class="avatar"><img src="{{asset('backend/img/avatar.jpg')}}" alt="Avatar"></span>-->
            <!--						<span class="header">-->
            <!--							<span class="from">-->
            <!--						    	Dennis Ji-->
            <!--						     </span>-->
            <!--							<span class="time">-->
            <!--						    	3 hours-->
            <!--						    </span>-->
            <!--						</span>-->
            <!--                                    <span class="message">-->
            <!--                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore-->
            <!--                                    </span>  -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                                <a href="#">-->
        <!--						<span class="avatar"><img src="{{asset('backend/img/avatar.jpg')}}" alt="Avatar"></span>-->
            <!--						<span class="header">-->
            <!--							<span class="from">-->
            <!--						    	Dennis Ji-->
            <!--						     </span>-->
            <!--							<span class="time">-->
            <!--						    	yesterday-->
            <!--						    </span>-->
            <!--						</span>-->
            <!--                                    <span class="message">-->
            <!--                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore-->
            <!--                                    </span>  -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--                            <li>-->
            <!--                                <a href="#">-->
        <!--						<span class="avatar"><img src="{{asset('backend/img/avatar.jpg')}}" alt="Avatar"></span>-->
            <!--						<span class="header">-->
            <!--							<span class="from">-->
            <!--						    	Dennis Ji-->
            <!--						     </span>-->
            <!--							<span class="time">-->
            <!--						    	Jul 25, 2012-->
            <!--						    </span>-->
            <!--						</span>-->
            <!--                                    <span class="message">-->
            <!--                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore-->
            <!--                                    </span>  -->
            <!--                                </a>-->
            <!--                            </li>-->
            <!--				<li>-->
            <!--                        		<a class="dropdown-menu-sub-footer">View all messages</a>-->
            <!--				</li>	-->
            <!--			</ul>-->
            <!--		</li>-->
            <!-- end: Message Dropdown -->
            <!--		<li>-->
            <!--			<a class="btn" href="#">-->
            <!--				<i class="halflings-icon white wrench"></i>-->
            <!--			</a>-->
            <!--		</li>-->
            <!-- start: User Dropdown -->
            <!--		<li class="dropdown">-->
            <!--			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">-->
            <!--				<i class="halflings-icon white user"></i> -->
        <!--				{{ Session::get('admin_name') }}-->
            <!--				<span class="caret"></span>-->
            <!--			</a>-->
            <!--			<ul class="dropdown-menu">-->
            <!--				<li class="dropdown-menu-title">-->
            <!--						<span>تنظیمات حساب</span>-->
            <!--				</li>-->
        <!--				{{--<li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>--}}-->
        <!--				<li><a href="{{URL::to('/logout')}}"><i class="halflings-icon off"></i> خروج</a></li>-->
            <!--			</ul>-->
            <!--		</li>-->
            <!-- end: User Dropdown -->
            <!--	</ul>-->
            <!--</div>-->
            <!-- end: Header Menu -->

        </div>
    </div>
</div>
<!-- start: Header -->

<div class="container-fluid-full">
    <div class="row-fluid">

        <!-- start: Main Menu -->
        <div id="sidebar-left" class="span2">
            <div class="nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li><a href="{{URL::to('/okAdminShod/dashboard')}}"><i class="icon-bar-chart"></i><span
                                    class="hidden-tablet"> پیشخوان </span></a></li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet">مشترکین</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/customer/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/customer/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="{{URL::to('/okAdminShod/request/all')}}"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet">درخواست های واریز</span></a>

                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span class="hidden-tablet">ُسفارشات</span></a>
                        <ul>
                        <!--<li><a class="submenu" href="{{URL::to('/okAdminShod/order/add')}}"><i class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a></li>-->
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/order/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet"> هتل ها</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/hotel/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>

                            <li><a class="submenu" href="{{URL::to('/okAdminShod/hotel/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet"> اتاق ها</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/room/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>

                            <li><a class="submenu" href="{{URL::to('/okAdminShod/room/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet">دسته بندی ها</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/category/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>

                            <li><a class="submenu" href="{{URL::to('/okAdminShod/category/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="{{URL::to('/okAdminShod/comment/all')}}"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet"> نظرات </span></a></li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span class="hidden-tablet"> کد تخفیف </span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/coupon/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/coupon/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet">معرف <span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/reference/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/reference/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet">سوالات متداول</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/question/add')}}"><i class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a></li>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/question/all')}}"><i class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="dropmenu" href="#"><i class="fa fa-angle-left"></i><span class="hidden-tablet"> اسلایدر اصلی</span></a>
                        <ul>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/slider/add')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">+افزودن</span></a>
                            </li>
                            <li><a class="submenu" href="{{URL::to('/okAdminShod/slider/all')}}"><i
                                            class="icon-file-alt"></i><span class="hidden-tablet">همه</span></a></li>
                        </ul>
                    </li>
                    <li><a href="{{URL::to('/okAdminShod/rule/edit')}}"><i class="fa fa-angle-left"></i><span
                                    class="hidden-tablet"> اطلاعات سایت </span></a></li>
                    <li><a href="{{URL::to('/okAdminShod/exit')}}"><i class="fa fa-angle-left"></i><span class="hidden-tablet"> خروج </span></a></li>

                </ul>
            </div>
        </div>
        <!-- end: Main Menu -->

        <noscript>
            <div class="alert alert-block span10">
                <h4 class="alert-heading">Warning!</h4>
                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>
        <!-- start: Content -->
        <div id="content" class="span10">
            @yield('admin_area')
        </div><!--/.fluid-container-->
        <!-- end: Content -->
    </div><!--/#content.span10-->
</div><!--/fluid-row-->

<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>تنظیمات</h3>
    </div>
    <div class="modal-body">
        <p>Here settings can be configured...</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">بستن</a>
        <a href="#" class="btn btn-primary">ذخیره</a>
    </div>
</div>

<div class="clearfix"></div>

<footer>


</footer>

<!-- start: JavaScript-->

<script src="{{asset('backend/js/jquery-1.9.1.min.js')}}"></script>
<script src="{{asset('backend/js/jquery-migrate-1.0.0.min.js')}}"></script>

<script src="{{asset('backend/js/jquery-ui-1.10.0.custom.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.ui.touch-punch.js')}}"></script>

<script src="{{asset('backend/js/modernizr.js')}}"></script>

<script src="{{asset('backend/js/bootstrap.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.cookie.js')}}"></script>

<script src="{{asset('backend/js/fullcalendar.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.dataTables.min.js')}}"></script>

<script src="{{asset('backend/js/excanvas.js')}}"></script>
<script src="{{asset('backend/js/jquery.flot.js')}}"></script>
<script src="{{asset('backend/js/jquery.flot.pie.js')}}"></script>
<script src="{{asset('backend/js/jquery.flot.stack.js')}}"></script>
<script src="{{asset('backend/js/jquery.flot.resize.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.chosen.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.uniform.min.js')}}"></script>
<script src="{{asset('backend/js/jquery.uniform.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.cleditor.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.noty.js')}}"></script>

<script src="{{asset('backend/js/jquery.elfinder.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.raty.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.iphone.toggle.js')}}"></script>

<script src="{{asset('backend/js/jquery.uploadify-3.1.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.gritter.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.imagesloaded.js')}}"></script>

<script src="{{asset('backend/js/jquery.masonry.min.js')}}"></script>

<script src="{{asset('backend/js/jquery.knob.modified.js')}}"></script>

<script src="{{asset('backend/js/jquery.sparkline.min.js')}}"></script>

<script src="{{asset('backend/js/counter.js')}}"></script>
<script src="{{asset('backend/js/jquery.maskedinput.js')}}"></script>

<!--<script src="{{asset('backend/js/retina.js')}}"></script>-->
<script src="{{asset('backend/js/persianDatepicker.min.js')}}"></script>
<script src="{{asset('backend/js/jquery.wysibb.min.js')}}"></script>
<script src="{{asset('backend/js/custom.js')}}"></script>


<!-- end: JavaScript-->


<script type="text/javascript">
    $('.date,.datepicker').persianDatepicker({
        formatDate: "YYYY-0M-0D"
    });


    // $('.date,.datepicker').mask("9999/99/99",{autoclear: false});

    $( "body" ).on( "click", "tr", function() { datePicker1 ()});


    function datePicker1 () {
        console.log($(".datepicker").length);
        $(".date,.datepicker").persianDatepicker({
            startDate: "today",
            endDate:"",
            formatDate: "YYYY-0M-0D"
        });
        $('.date,.datepicker').mask("9999/99/99",{autoclear: false});
    }

    // setInterval(datePicker1,1000)

    function findSize(sel) {
        var file_size = $('#hotel_image')[0].files[0].size;
        alert(file_size);
        if (file_size > 2097152) {
            $('#hotel_image').after().append("File size is greater than 2MB");

            return false;
        }
    }
</script>

<script type="text/javascript">




    function remove_hotel_gallery_exist(gallery_id) {
        alert(gallery_id);
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: '/okAdminShod/hotel/remove_gallery',
            method: 'POST',
            data: {gallery_id: gallery_id},
            success: function (data) {
                if (data.data == 'ok') {
                    $('#' + gallery_id).remove();
                }
            }
        });
    }


    function remove_gallery_exist(gallery_id) {


        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: '/okAdminShod/tour/remove_gallery',
            method: 'POST',
            data: {gallery_id: gallery_id},
            success: function (data) {

                if (data.data == 'ok') {
                    $('#' + gallery_id).remove();
                }
            }

        });
    }

    $(document).ready(function () {


        $('.main-menu').find('li').removeClass('active')

        $("select[name='category_parent1']").change(function () {

            var cat_id = $(this).val();
            var travel_id = $("select[name='travel_id']").val();
            alert(travel_id);
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                },
                url: '/okAdminshod/category/select_ajax',
                method: 'POST',
                data: {cat_id: cat_id, travel_id: travel_id},
                success: function (data) {


                    if (data) {

                        $('#category_parent22').html('');
                        $('#category_parent22').append('<select  id="category_parent2" name="category_parent2" data-rel="chosen" required><option value="0">یک دسته بندی انتخاب کنید</option> </select>');


                        $.each(data.damage, function (index, val) {


                            $('#tour_damage').val(val.damage_price + ' تومان ');


                        });


                        $.each(data.options, function (index, val) {

                            console.log(val.category_name);
                            var option = '<option value="' + val.category_id + '">' + val.category_name + '</option>';
                            $('#category_parent2').append(option);

                        });
                    } else {
                        alert('مرورگر از اجکس پشتیبانی نمیکند');
                    }
                }

            });
        });

        $("#category_parent22").change(function () {
            var cat_id = $("select[name='category_parent2']").val();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                },
                url: '/okAdminShod/category/select_ajax2',
                method: 'POST',
                data: {cat_id: cat_id},
                success: function (data) {

                    if (data) {

                        $('#category_parent33').html('');
                        $('#category_parent33').append('<select  id="category_parent3" name="category_parent3" data-rel="chosen" ><option value="0">یک دسته بندی انتخاب کنید</option></select>');


                        $.each(data, function (index, val) {

                            for (k = 0; k < val.length; k++) {
                                //console.log(val[k].category_name);
                                var option = '<option value="' + val[k].category_id + '">' + val[k].category_name + '</option>';
                                $('#category_parent3').append(option);
                            }
                        });
                    } else {
                        alert('مرورگر از اجکس پشتیبانی نمیکند');
                    }
                }

            });

        });


        $("select[name='hotel_category_parent1']").change(function () {

            var cat_id = $(this).val();
            var travel_id = $("select[name='travel_id']").val();
            alert(travel_id);
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                },
                url: '/okAdminshod/hotel_category/select_ajax',
                method: 'POST',
                data: {cat_id: cat_id, travel_id: travel_id},
                success: function (data) {


                    if (data) {

                        $('#category_parent22').html('');
                        $('#category_parent22').append('<select  id="category_parent2" name="category_parent2" data-rel="chosen" required><option value="0">یک دسته بندی انتخاب کنید</option> </select>');


                        $.each(data.options, function (index, val) {

                            console.log(val.category_name);
                            var option = '<option value="' + val.category_id + '">' + val.category_name + '</option>';
                            $('#category_parent2').append(option);

                        });
                    } else {
                        alert('مرورگر از اجکس پشتیبانی نمیکند');
                    }
                }

            });
        });
        $("#category_parent22").change(function () {
            var cat_id = $("select[name='category_parent2']").val();
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                },
                url: '/okAdminShod/hotel_category/select_ajax2',
                method: 'POST',
                data: {cat_id: cat_id},
                success: function (data) {

                    if (data) {

                        $('#category_parent33').html('');
                        $('#category_parent33').append('<select  id="category_parent3" name="category_parent3" data-rel="chosen" ><option value="0">یک دسته بندی انتخاب کنید</option></select>');


                        $.each(data, function (index, val) {

                            for (k = 0; k < val.length; k++) {
                                //console.log(val[k].category_name);
                                var option = '<option value="' + val[k].category_id + '">' + val[k].category_name + '</option>';
                                $('#category_parent3').append(option);
                            }
                        });
                    } else {
                        alert('مرورگر از اجکس پشتیبانی نمیکند');
                    }
                }

            });

        });

        if ($("select[name='travel_id']").val() != 1) {
            $('.tour_Device').css('display', 'block');
            $('select[name="airLineWent_id"]').parent().css('display', 'none');
            $('select[name="airLineback_id"]').parent().css('display', 'none');
        }

        $("select[name='travel_id']").change(function () {

            var cat_id = $("select[name='category_parent1']").val();
            var travel_id = $("select[name='travel_id']").val();

            if (travel_id != 1) {
                $('select[name="airLineWent_id"]').parent().css('display', 'none');
                $('select[name="airLineback_id"]').parent().css('display', 'none');
                $('.tour_Device').css('display', 'block');


            } else {
                $('select[name="airLineWent_id"]').parent().css('display', 'block');
                $('select[name="airLineback_id"]').parent().css('display', 'block');
                $('.tour_Device').css('display', 'none');


            }
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                },
                url: '/okAdminShod/category/select_ajax',
                method: 'POST',
                data: {cat_id: cat_id, travel_id: travel_id},
                success: function (data) {


                    if (data) {


                        $.each(data.damage, function (index, val) {


                            $('#tour_damage').val(val.damage_price + ' تومان ');


                        });


                        $.each(data.options, function (index, val) {

                            console.log(val.category_name);
                            var option = '<option value="' + val.category_id + '">' + val.category_name + '</option>';
                            $('#category_parent2').append(option);

                        });
                    } else {
                        alert('مرورگر از اجکس پشتیبانی نمیکند');
                    }
                }

            });
        });

    });
</script>
</body>
</html>
