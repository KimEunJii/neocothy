<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
	
	
	<div class="panel">  
		<div class="input-group" ng-app="myApp" ng-controller="UserCtrl">
		<center>
			<h1>작업 이력 관리</h1>
		</center>
		 <div>
		 <input type="text" class="form-control"/>
         <button class="btn btn-default" ng-click="addNewItem(actionText)">검색 </button>
         </div>
			<table class="table table-striped">
				<tr>

					<td>작업일자</td>
					<td>대상장비</td>
					<td>작업명</td>
					<td>주요내용</td>
					<td>비고</td>

				</tr>

				<tr ng-repeat="x in management" data-toggle="modal"
					ng-click="do_some_action(x)" id="managementtable">
					
					<td>{{x.date}}</td>
					<td>{{x.equipment}}</td>
					<td>{{x.title}}</td>
					<td>{{x.contents}}</td>
					<td>{{x.note}}</td>
				</tr>
			</table>




			<p align="right">
				<button class="btn btn-default" id="plus">+</button>
			</p>

			<br> <br>


<!-- 			<form action="insert.do" method="post"> -->

				작업일자 : <input type="text" name="date"  id="date" />&nbsp; 
				대상장비 : <input type="text" name="equipment" id="equipment"/>&nbsp; 
				작업명 : <input type="text" name="title"  id="title" />&nbsp; 
				주요내용 : <input type="text" name="contents" id="contents"/>&nbsp; 
				비고 : <input type="text" name="note" id="note"/>&nbsp;
				<input type="hidden" name="category" value="work" id="category"> 
				<button  ng-click="plus()">plus</button>
<!-- 			<input type="submit" class="btn btn-primary" value="등록" /> -->

<!-- 			</form> -->


			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">
							
								<div class="form-group">
									 <label >작업일자:</label> 
									 {{x.date}}<br>
									 <label>대상장비:</label>
									{{x.equipment}}<br>
									 <label >작업명:</label>
									 {{x.title}}<br>
									 <label>내용:</label> 
									 {{x.contents}} <br>
									 <label>비고:</label> 
									  {{x.note}}
									<input type="hidden" name="category" value="work">
								</div>
							
							</div>
					
						
						<div class="modal-footer">
							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=work" class="btn btn-primary">삭제</a>
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
							<label>작업일자</label> 
							<input type="text" class="form-control" name="date" value="{{x.date}}" /> <br> 
							<label>대상장비</label> 
							<input type="text" class="form-control" name="equipment" value="{{x.equipment}}"  /> <br>
							<label>작업명</label>
							<input type="text" class="form-control" name="title" value="{{x.title}}" /><br> 
							<label>내용</label> 
							<textarea name="contents" class="form-control" rows="8">{{x.contents}}</textarea> <br>
							<label>비고</label> 
							<textarea name="note" class="form-control" >{{x.note}}</textarea>
							<input type="hidden" name="category" value="work"> 
						
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
							url : 'getWorkManagement.do',
							headers : {
								'Content-type' : 'application/json'
							}
						}).success(function(data, status, headers, config) {
							$scope.management = data;
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
					
			
					
						$scope.plus = function($scope, $http) {
					
						$http({
							method : 'POST',
							url : 'insert.do',
							type : "get",
							dataType : "json",
							data : {
								date : $("#date").val(),
								equipment : $("#equipment").val(),
								title : $("#title").val(),
								contents : $("#contents").val(),
								note : $("#note").val(),
								category : $("#category").val()
							},						
							contentType : "application/json; charset=utf-8"
						}).success(function(data, status, headers, config) {					
								$("#managementtable").after(
										
									"<tr><td><center>" + data.date							
									+ "</center></td><td><center>"+ data.equipment
									+ "</center></td><td><center>"+ data.title
									+ "</center></td><td><center>"+ data.contents
									+ "</center></td><td><center>"+ data.note
									+ "</center></td></tr>"
									);
						}).error(function(data, status, headers, config) {
							window.alert("error");
						});
					
						}}]);
		
			
		
			
		</script>
		


</body>
</html>