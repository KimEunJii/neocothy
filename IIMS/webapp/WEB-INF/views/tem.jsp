<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Bootstrap 3 Admin</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<link href="/assets/css/styles.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Dashboard</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						data-toggle="dropdown" href="#"><i
							class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
						<ul id="g-account-menu" class="dropdown-menu" role="menu">
							<li><a href="#">My Profile</a></li>
						</ul></li>
					<li><a href="/user/logout.do"><i
							class="glyphicon glyphicon-lock"></i> Logout</a></li>
				</ul>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /Header -->

	<!-- Main -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<!-- Left column -->
				<a href="#"><strong><i
						class="glyphicon glyphicon-wrench"></i> Tools</strong></a>

				<hr>

				<ul class="nav nav-stacked margin-top2" >
					<li class="nav-header"><a href="#" data-toggle="collapse"
						data-target="#userMenu">Menu
						 <i	class="glyphicon glyphicon-chevron-down"></i></a>
						<ul class="nav nav-stacked collapse in" id="userMenu">
							<li class="active"><a href="/user/main.do"><i
									class="glyphicon glyphicon-home"></i> HOME</a></li>
							<li class="active"><a href="/ipinfo/list.do"><i
									class="glyphicon glyphicon-home"></i> IP 정보관리</a></li>
							<li class="active"><a href="/ipinfohistory/list.do">
							<i	class="glyphicon glyphicon-home"></i> IP 이력관리</a></li>
							<li><a href="/address/list.do"><i
									class="glyphicon glyphicon-envelope"></i> 긴급 연락처</a></li>
							<li><a href="/management/work_list.do"><i
									class="glyphicon glyphicon-cog"></i> 작업 이력관리</a></li>
							<li><a href="/management/error_list.do"><i
									class="glyphicon glyphicon-comment"></i> 장애 이력관리</a></li>
							<li><a href="/management/daily_list.do"><i
									class="glyphicon glyphicon-user"></i> 일지 관리</a></li>
							<li><a href="/management/maintain_list.do"><i
									class="glyphicon glyphicon-flag"></i> 정기점검 관리</a></li>
							<li><a href="#"><i
									class="glyphicon glyphicon-exclamation-sign"></i> 자료실</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-off"></i>
									보안계 업무관리</a></li>
						</ul></li>
					<li class="nav-header"><a href="#" data-toggle="collapse"
						data-target="#menu2"> Reports <i
							class="glyphicon glyphicon-chevron-right"></i></a>

						<ul class="nav nav-stacked collapse" id="menu2">
							<li><a href="#">Information &amp; Stats</a></li>
							<li><a href="#">Views</a></li>
							<li><a href="#">Requests</a></li>
							<li><a href="#">Timetable</a></li>
							<li><a href="#">Alerts</a></li>
						</ul></li>
					<li class="nav-header"><a href="#" data-toggle="collapse"
						data-target="#menu3"> Social Media <i
							class="glyphicon glyphicon-chevron-right"></i></a>
						<ul class="nav nav-stacked collapse" id="menu3">
							<li><a href=""><i class="glyphicon glyphicon-circle"></i>
									Facebook</a></li>
							<li><a href=""><i class="glyphicon glyphicon-circle"></i>
									Twitter</a></li>
						</ul></li>
				</ul>


			</div>
			<!-- /col-3 -->
			<div class="col-sm-10">

				<!-- column 2 -->
				<ul class="list-inline pull-right">
					<li><a href="#"><i class="glyphicon glyphicon-cog"></i></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="glyphicon glyphicon-comment"></i><span
							class="count">3</span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">1. Is there a way..</a></li>
							<li><a href="#">2. Hello, admin. I would..</a></li>
							<li><a href="#"><strong>All messages</strong></a></li>
						</ul></li>
					<li><a href="#"><i class="glyphicon glyphicon-user"></i></a></li>
					<li><a title="Add Widget" data-toggle="modal"
						href="#addWidgetModal"><span
							class="glyphicon glyphicon-plus-sign"></span> Add Widget</a></li>
				</ul>
				<a href="#"><strong><i
						class="glyphicon glyphicon-dashboard"></i> My Dashboard</strong></a>
				<hr>
			</div>

			<!-- /.modal -->
			<!-- script references -->
			<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
			<script src="/assets/js/bootstrap.min.js"></script>
			<script src="/assets/js/scripts.js"></script>
			<jsp:include page="${param.nextPage}"></jsp:include>

			<footer class="text-center footer">
				<div class="margin-top">
				This Bootstrap 3 dashboard layout is compliments of 
				<a href="http://www.bootply.com/85850"><strong>Bootply.com</strong></a>
				</div>
			</footer>

			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">
							<p>Add a widget stuff here..</p>
						</div>
						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a> <a
								href="#" class="btn btn-primary">Save changes</a>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dalog -->
			</div>
</body>
</html>