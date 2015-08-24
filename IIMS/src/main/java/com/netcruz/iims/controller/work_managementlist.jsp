<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
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
	
	
	<div class="panel container" >  
	
		<div class="input-group "  id="table1" ng-app="myApp" ng-controller="UserCtrl" >
		<center>
			<h1>작업 이력 관리</h1>
		</center>
			<div id="table1">
				<!-- 		 <input type="text" class="form-control" id="table1"/> -->


				<!--                 <button class="btn btn-default" ng-click="addNewItem(actionText)"> -->
				<!--                     	검색 -->
				<!--                 </button> -->



				<table class="table table-striped center">
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

							
							<label>작업일자</label> 
							<input type="text" class="form-control" name="date" /> <br> 
							<label>대상장비</label> 
							<input type="text" class="form-control" name="equipment"   /> <br>
							<label>작업명</label>
							<input type="text" class="form-control" name="title" /><br> 
							<label>내용</label> 
							<textarea name="contents" class="form-control" rows="8"></textarea> <br>
							<label>비고</label> 
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="work"> 						
							</div>				
						
						<div class="modal-footer">
							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<input type="submit" class="btn btn-primary" value="등록" />
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
							<% if("master".equals(vo.getRole())){ %>				
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=work" class="btn btn-primary">삭제</a>
							<%}else if("admin".equals(vo.getRole())){  %>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=work" class="btn btn-primary">삭제</a>
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
							url : 'getWorkManagement.do',
							headers : {
								'Content-type' : 'application/json'
							}
						}).success(function(data, status, headers, config) {
							$scope.management = data;
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
			
					
						}]);
		
			
		
			
		</script>
		


</body>
</html>