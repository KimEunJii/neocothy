<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	UserVo vo = (UserVo) session.getAttribute("userFlag");
	String hostName = (String)session.getAttribute("hostName");
	String hostAddress = (String)session.getAttribute("hostAddress");
%>

<head>
	
    
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-route.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-resource.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-cookies.min.js"></script>     
    
    <link href="/assets/css/styles.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Notice</title>

</head>
 <style>
  paginationclass{
    
margin: 19px 28px;    
}
.paginationclass span{
    margin-left:15px;
    display:inline-block;
}
.pagination-controle li{
    display: inline-block;
}
.pagination-controle button{
    font-size: 12px;
    margin-top: -26px;
    cursor:pointer;
    
}
.pagination{
    margin:5px 12px !important;
}
</style>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
     width: 70%;
     margin: auto;
  }
  </style>

<body>

	
	<div class="panel container">  	
		<div class="input-group" id = "table1" ng-app="myApp" ng-controller="UserCtrl">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
        <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide [900x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDkwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzkwMHg1MDAvYXV0by8jNzc3OiM1NTUvdGV4dDpGaXJzdCBzbGlkZQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE0ZmIwYmQzOTA3IHRleHQgeyBmaWxsOiM1NTU7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NDVwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTRmYjBiZDM5MDciPjxyZWN0IHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIiBmaWxsPSIjNzc3Ii8+PGc+PHRleHQgeD0iMzA4LjI5Njg3NSIgeT0iMjcwLjEiPkZpcnN0IHNsaWRlPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true">
        </div>
        <div class="item active">
          <img data-src="holder.js/900x500/auto/#666:#444/text:Second slide" alt="Second slide [900x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDkwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzkwMHg1MDAvYXV0by8jNjY2OiM0NDQvdGV4dDpTZWNvbmQgc2xpZGUKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNGZiMGJkNWM5ZCB0ZXh0IHsgZmlsbDojNDQ0O2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjQ1cHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE0ZmIwYmQ1YzlkIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzY2NiIvPjxnPjx0ZXh0IHg9IjI2NC45NTMxMjUiIHk9IjI3MC4xIj5TZWNvbmQgc2xpZGU8L3RleHQ+PC9nPjwvZz48L3N2Zz4=" data-holder-rendered="true">
        </div>
        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide [900x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDkwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzkwMHg1MDAvYXV0by8jNTU1OiMzMzMvdGV4dDpUaGlyZCBzbGlkZQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE0ZmIwYmQ0YjMzIHRleHQgeyBmaWxsOiMzMzM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NDVwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTRmYjBiZDRiMzMiPjxyZWN0IHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIiBmaWxsPSIjNTU1Ii8+PGc+PHRleHQgeD0iMjk4LjMyMDMxMjUiIHk9IjI3MC4xIj5UaGlyZCBzbGlkZTwvdGV4dD48L2c+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
		
		<center>
			<h1>Notice</h1>
		</center>
		<b><%=vo.getId()%>님</b>의 사용기간 만료 공지 내역입니다.	<br><br>
		<%=hostName %> / <%=hostAddress %>
			<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>
			
				<table class="table table-striped">
					<tr>
					  	<th>분류</th>
						<th>망 구분</th>
						<th>IP</th>
						<th>Mask</th>
						<th>용도(부서)</th>
						<th>장비명(사용자)</th>
						<th>모델명</th>
						<th>사용여부</th>
						<th>OS</th>
						<th>사용부서</th>
						<th>사용자</th>
						<th>사용기간</th>
						<th>승인일자</th>
						<th>수정일자</th>
						<th>비고</th>
						<th>작성자</th>
					</tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
						
				
					<tr ng-repeat="x in ipinfo | pagination: curPage * pageSize | limitTo: pageSize | filter:test"
					data-toggle="modal" ng-click="do_some_action(x)" id="ipinfotable">

						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.category}}</nobr></div></td>
						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.network}}</nobr></div></td>
						<td>{{x.ip}}</td>
						<td>{{x.mask}}</td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.usages}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.equipment}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.model}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.used}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.os}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.use_dept}}</nobr></div></td>
						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.user}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.use_term}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.per_date}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.mody_date}}</nobr></div></td>
						<td><div style="position:relative; width:80px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.note}}</nobr></div></td>
						<td>{{x.user_id}}</td>
					</tr>
				</table>
				<br>
				
				<center>
					<div class="pagination pagination-centered" ng-show="ipinfo.length">
						<ul class="pagination-controle pagination">
							<li>
								<button type="button" class="btn btn-primary"
									ng-disabled="curPage == 0" ng-click="curPage=curPage-1">
									&lt; PREV</button>
							</li>
							<li><span>Page {{curPage + 1}} of {{ numberOfPages()
									}}</span></li>
							<li>
								<button type="button" class="btn btn-primary"
									ng-disabled="curPage >= ipinfo.length/pageSize - 1"
									ng-click="curPage = curPage+1">NEXT &gt;</button>
							</li>
						</ul>
					</div>

				</center>
				<br><br>

			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">세부사항</h4>
						</div>
						<div class="modal-body">
						id: {{x.id}} <br>
						분류:{{x.category}}<br>
						망구분:{{x.network}}<br>
						아이피:{{x.ip}}<br>
						mask:{{x.mask}}<br>
						용도(부서):{{x.usages}}<br>
						장비명(사용자):<pre>{{x.equipment}}</pre><br>
						모델명:{{x.model}}<br>
						사용여부:{{x.used}}<br>
						OS:{{x.os}}<br>
						사용부서:{{x.use_dept}}<br>
						사용자:{{x.user}}<br>
						사용기간:{{x.use_term}}<br>
						승인일자:{{x.per_date}}<br>
						수정일자:{{x.mody_date}}<br>
						비고:<pre>{{x.note}}</pre><br>
						등록자:{{x.user_id}}<br>
						</div>
					
						
						<div class="modal-footer">
							
								<a href="#" data-dismiss="modal" class="btn">Close</a>
							<%
								if ("master".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}"
								class="btn btn-primary">삭제</a>
							<%
								} else if ("admin".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}"
								class="btn btn-primary">삭제</a>
							<%
								} else
							%>
						</div>
					</div>
				</div>
			</div>
			
			
			
				<div class="modal" id="addWidgetModal2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">수정</h4>
						</div>
						<div class="modal-body margin1">
						
							<form action="update.do">
							<input type="hidden" class="form-control" name="id" value="{{x.id}}" />
							<label>분류</label>
		<select name="category" class="form-control">
			<option value="전체">전체</option>
			<option value="대역">대역</option>
			<option value="host">host</option>		
		</select>
		<br>
		<label>망구분</label>
		<select name="network" class="form-control"  size=1>
			<option value="내부망">내부망</option>
			<option value="대국민망">대국민망</option>
		</select>
		<br>
							<label>아이피</label>
							<input type="text" class="form-control" name="ip" value="{{x.ip}}" /><br> 
							<label>mask</label> 
							<input type="text" class="form-control" name="mask" value="{{x.mask}}"/><br>
							<label>용도(부서)</label> 
							<input type="text" class="form-control"  name="usages" value="{{x.usages}}"/><br>
							<label>장비명(사용자)</label>
							<textarea class="form-control" name="equipment">{{x.equipment}}</textarea><br>
							<label>모델명</label>
							<input type="text" class="form-control" name="model" value="{{x.model}}"/><br>
							<label>사용여부</label>
	    <select  name="used" class="form-control"  size=1>
	    	<option value="사용">사용</option>
	    	<option value="미사용">미사용</option>  
	    </select>
	    <br>
							<label>OS</label>
							<input type="text" class="form-control" name="os" value="{{x.os}}"/><br>
							<label>사용부서</label>
							<input type="text" class="form-control" name="use_dept" value="{{x.use_dept}}"/><br>
							<label>사용자</label>
							<input type="text" class="form-control" name="user" value="{{x.user}}"/><br>
							<label>사용기간</label>
							<input type="text" class="form-control" name="use_term" value="{{x.use_term}}"/><br>
							<label>승인일자</label>
							<input type="text" class="form-control" name="per_date" value="{{x.per_date}}"/><br>
							<label>수정일자</label>
							<input type="text" class="form-control" name="mody_date" value="{{x.mody_date}}"/><br>
							<label>비고</label>
							<textarea class="form-control" name="note">{{x.note}}</textarea><br>
							<label>등록자</label>
							<input type="text" class="form-control" name="user_id" value="{{x.user_id}}"/><br>																
						
						</div>
						
					
					<br><br><br>	
					<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="완료" /> 
							<a href="#" class="btn btn-primary" data-dismiss="modal">취소</a>

							</form>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<script>
			var myApp = angular.module('myApp', []);
			myApp.controller('UserCtrl', [ '$scope', '$http',
					function($scope, $http) {

						//
						$scope.ipinfo = '';
						$scope.x = '';

						$scope.do_some_action = function(x) {
							$scope.x = x;
							$("#addWidgetModal").modal('show', function() {

							});
						}
						
						$scope.do_some_action2 = function(x) {
							$scope.x = x;
							$("#addWidgetModal2").modal('show', function() {

							});
						}
						
					

						//서버에 사용자 이름 요청
						$http({
							method : 'GET',
							url : 'expiredipinfotest.do',
							headers : {
								'Content-type' : 'application/json'
							}
					}).success(function(data, status, headers, config) {
							
							$scope.curPage = 0;
							$scope.pageSize = 10;
							$scope.ipinfo = data;
						    $scope.numberOfPages = function() {
								return Math.ceil($scope.ipinfo.length / $scope.pageSize);
							};
							
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
					
			}]);
			
				angular.module('myApp').filter('pagination', function()
					{
					 return function(input, start)
					 {
					  start = +start;
					  return input.slice(start);
					 };
					});

			</script> 			
					
	<script type="text/javascript">
	
	</script>
		


</body>
</html>