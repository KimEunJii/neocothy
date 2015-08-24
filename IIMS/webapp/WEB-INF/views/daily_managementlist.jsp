<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% UserVo vo = (UserVo)session.getAttribute("userFlag"); %>
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

<title>작업 이력 관리</title>

</head>

<body>
	
	
	<div class="panel container">  
		<div class="input-group" id="table1" ng-app="myApp" ng-controller="UserCtrl">
		<center>
			<h1>일지 관리</h1>
		</center>
<!-- 		 <div> -->
<!-- 		 <input type="text" class="form-control"/> -->
<!--          <button class="btn btn-default" ng-click="addNewItem(actionText)">검색 </button> -->
<!--          </div> -->
			<div id="table1">
			<table class="table table-striped center">
				<tr>

					<td>일자</td>
					<td>구분</td>
					<td>주요업무</td>
					<td>특이사항</td>
					<td>비고</td>

				</tr>

				<tr ng-repeat="x in management" data-toggle="modal"
					ng-click="do_some_action(x)">
					
					<td>{{x.date}}</td>
					<td>{{x.period_type}}</td>
					<td>{{x.title}}</td>
					<td>{{x.contents}}</td>
					<td>{{x.note}}</td>
				</tr>
			</table>


			<div align="right">
			 <% if("master".equals(vo.getRole())){ %>
				<p>
					<button class="btn btn-default"  ng-click="do_some_action3()">등록</button>				
				</p>
			<%}else if("admin".equals(vo.getRole())) { %>
				<p>
					<button class="btn btn-default"  ng-click="do_some_action3()">등록</button>				
				</p>
			<%} %>

			<br> <br>
	</div>
</div>

			
			   <div class="modal" id="addWidgetModal3">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">
						<form action="insert.do" method="post">

							
							<label>일자</label> 
							<input type="text" class="form-control" name="date" /> <br> 
							<label>구분</label> 
								<select name="period_type">
								  <option>일일 업무일지</option>
								  <option>주간 업무일지</option>
								  <option>월간 업무일지</option>					  
								</select><br>
							<label>주요업무</label>
							<input type="text" class="form-control" name="title" /><br> 
							<label>특이사항</label>
							<input type="text" class="form-control" name="contents" /><br> 						
							<label>비고</label> 
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="daily"> 						
							</div>				
						
						<div class="modal-footer">							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<input type="submit" class="btn btn-primary" value="등록" />
							</form>
						</div></div>
		</div></div>
			


			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">
							
								<div class="form-group">
									 <label >일자:</label> 
									 {{x.date}}<br>
									 <label>구분:</label>
									{{x.period_type}}<br>
									 <label >주요업무:</label>
									 {{x.title}}<br>
									 <label>특이사항:</label> 
									 {{x.contents}} <br>
									 <label>비고:</label> 
									  {{x.note}}
									<input type="hidden" name="category" value="work">
								</div>
							
							</div>
					
						
						<div class="modal-footer">
							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<% if("master".equals(vo.getRole())){ %>				
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=daily" class="btn btn-primary">삭제</a>
							<%}else if("admin".equals(vo.getRole())){  %>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=daily" class="btn btn-primary">삭제</a>
							<%}else %>
						</div>
					</div>
				</div>
			</div>
			
			
			
				<div class="modal" id="addWidgetModal2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body margin1">
						
							<form action="update.do">
							<input type="hidden" class="form-control" name="id" value="{{x.id}}" />
							<label>일지</label> 
							<input type="text" class="form-control" name="date" value="{{x.date}}" /> <br> 
							<label>구분</label><br>
							<select name="period_type" class="form-control" >
								  <option>일일 업무일지</option>
								  <option>주간 업무일지</option>
								  <option>월간 업무일지</option>					  
							</select><br>
							
							<label>주요업무</label>
							<input type="text" class="form-control" name="title" value="{{x.title}}" /><br> 
							<label>특이사항</label> 
							<textarea name="contents" class="form-control" rows="8">{{x.contents}}</textarea> <br>
							<label>비고</label> 
							<textarea name="note" class="form-control" >{{x.note}}</textarea>
							<input type="hidden" name="category" value="daily"> 
						
						</div>
						
						
						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<input type="submit" class="btn btn-primary"  value="완료"/>
							</form>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
			

		<script>
			var id;
			var myApp = angular.module('myApp', []);
			myApp.controller('UserCtrl', [ '$scope', '$http',
					function($scope, $http) {

						//
						$scope.management = '';
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
							url : 'getDailyManagement.do',
							headers : {
								'Content-type' : 'application/json'
							}
						}).success(function(data, status, headers, config) {
							$scope.management = data;
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
					} ]);
			
		</script>
		


</body>
</html>