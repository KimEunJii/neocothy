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

<title>IP 정보관리 [NETCRUZ]</title>

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

<body>
	
	<div class="panel container">  
		<div class="input-group" id = "table1" ng-app="myApp" ng-controller="UserCtrl">
		<center>
			<h1>IP 정보관리</h1>
		</center>
			
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

				<div align="right">
					<%
						if ("master".equals(vo.getRole())) {
					%>
					<p>
						<button class="btn btn-default" id="plus"
							ng-click="do_some_action3()">등록</button>
					</p>
					<%
						} else if ("admin".equals(vo.getRole())) {
					%>
					<p>
						<button class="btn btn-default" id="plus"
							ng-click="do_some_action3()">등록</button>
					</p>
					<%
						}
					%>
					<br><br>
					
				</div>
			
			
			<div class="modal" id="addWidgetModal3">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">추가</h4>
						</div>
						<div class="modal-body">
							<form action="insert.do" method="post">


								<label>분류</label> <input type="text" class="form-control"
									name="category" /><br> <label>망구분</label> <input
									type="text" class="form-control" name="network" /><br> <label>아이피</label>
								<input type="text" class="form-control" name="ip" /><br> <label>mask</label>
								<input type="text" class="form-control" name="mask" /><br>
								<label>용도(부서)</label> <input type="text" class="form-control"
									name="usages" /><br> <label>장비명(사용자)</label> <input
									type="text" class="form-control" name="equipment" /><br>
								<label>모델명</label> <input type="text" class="form-control"
									name="model" /><br> <label>사용여부</label> <input
									type="text" class="form-control" name="used" /><br> <label>OS</label>
								<input type="text" class="form-control" name="os" /><br> <label>사용부서</label>
								<input type="text" class="form-control" name="use_dept" /><br>
								<label>사용자</label> <input type="text" class="form-control"
									name="user" /><br> <label>사용기간</label> <input type="text"
									class="form-control" name="use_term" /><br> <label>승인일자</label>
								<input type="text" class="form-control" name="per_date" /><br>
								<label>수정일자</label> <input type="text" class="form-control"
									name="mody_date" /><br> <label>비고</label> <input
									type="text" class="form-control" name="note" /><br> <label>등록자</label>
								<input type="text" class="form-control" name="user_id" /><br>
								<br><br><br>
								
								
								<div class="modal-footer">
									<a href="#" data-dismiss="modal" class="btn">Close</a> 
									<input type="submit" class="btn btn-primary" value="등록" />
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>



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
							<input type="text" class="form-control" name="category" value="{{x.category}}" /> <br> 
							<label>망구분</label> 
							<input type="text" class="form-control" name="network" value="{{x.network}}"  /> <br>
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
							<input type="text" class=form-control name="used" value="{{x.used}}"/><br>
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
						
						$scope.do_some_action3 = function() {
							
							$("#addWidgetModal3").modal('show', function() {

							});
						}

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
							url : 'ipinfotest.do',
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
					

		


</body>
</html>