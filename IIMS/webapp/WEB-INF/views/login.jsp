<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Neocothy</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/assets/css/cover.css" type="text/css">
<link rel="stylesheet" href="/assets/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="/assets/css/style.css" type="text/css">
<!-- jQuery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<%
	//out.print("<p>접속 IP : " + request.getRemoteAddr() + "</p>");
	//out.print("<p>접속자 : " + request.getRemoteHost() + "</p>");
	//out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>");
			
	String hostAddress =  request.getRemoteAddr();
	String hostName = request.getRemoteHost();
	
	session.setAttribute("hostAddress", hostAddress);
	session.setAttribute("hostName", hostName);
%>
</head>

<body>

	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">NETCRUZ</h3>
						<nav>
							<ul class="nav masthead-nav">
								<li class="active"><a href="#">Home</a></li>
								<li><a href="#">Features</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>

				<div class="inner cover">
					
					<h1 class="cover-heading"> IIMS LOGIN</h1>

					<p class="lead">
					<form class="form-inline" action="/user/login.do">
						<div class="form-group">
							<label class="sr-only" for="exampleInputEmail3">ID</label> 
							<input type="text" class="form-control" name="user_id" placeholder="ID">
						</div>
						<br>
						<div class="form-group">
							<label class="sr-only" for="exampleInputPassword3">Password</label>
							<input type="password" class="form-control"	name="pw" placeholder="Password">
						</div>

						<br><br>
						<div class="swpm-login-submit">
							<input type="submit" name="swpm-login" value="Login">
						</div>
					</form>
					</p>
				</div>

				<div class="mastfoot">
					<div class="inner">
						<p>
							Cover template for <a href="http://getbootstrap.com">Bootstrap</a>,
							by <a href="https://twitter.com/mdo">@mdo</a>
						</p>
						
						<p>
							<%
								out.print("<p>접속 IP : " + request.getRemoteAddr() + "</p>");
								out.print("<p>접속자 : " + request.getRemoteHost() + "</p>");
							%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
