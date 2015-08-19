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

  <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
  <script data-require="angular.js@1.3.0" data-semver="1.3.0" src="https://code.angularjs.org/1.3.0/angular.js"></script>
  <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css" />
  <script src="script.js"></script>
  <script src="/assets/js/dirPagination.js"></script>

<head>


<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-route.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-resource.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-cookies.min.js"></script>

<link href="/assets/css/styles.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>작업 이력 관리</title>
</head>

<body>


	<div class="panel container">

		<div class="input-group " id="table1" ng-app="myApp"
			ng-controller="UserCtrl">
			<center>
				<h1>작업 이력 관리</h1>
			</center>
			<div id="table1">

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
			
			
			
			<!--  -->
				
	  <div ng-controller="MyController" class="my-controller">
        

          <div class="row">
            <div class="col-xs-4">
              <h3>Meals Page: {{ currentPage }}</h3>
            </div>
            <div class="col-xs-4">
              <label for="search">Search:</label>
              <input ng-model="q" id="search" class="form-control" placeholder="Filter text">
            </div>
            <div class="col-xs-4">
              <label for="search">items per page:</label>
              <input type="number" min="1" max="100" class="form-control" ng-model="pageSize">
            </div>
          </div>
          <br>
          <div class="panel panel-default">
            <div class="panel-body">

              <ul>
                <li dir-paginate="meal in meals | filter:q | itemsPerPage: pageSize" current-page="currentPage">{{ meal }}</li>
                
              </ul>
            </div>
          </div>
        </div>

        <div ng-controller="OtherController" class="other-controller">
          <small>this is in "OtherController"</small>
          <div class="text-center">
          <dir-pagination-controls boundary-links="true" on-page-change="pageChangeHandler(newPageNumber)" template-url="/WEB_INF/views/dirPagination.tpl.html"></dir-pagination-controls>
          </div>
        </div>
	
	
			
			
			
			<!--  -->


			<div class="modal" id="addWidgetModal3">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">
						<form action="insert.do" method="post" id="eventForm" name="myForm">
							<label>작업일자</label>
							<input type="date"  name="date" ng-model="example.value" class="form-control"
      						 placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>대상장비</label> 
							<input type="text" class="form-control" name="equipment" /> <br> 
							<label>작업명</label>
							<input type="text" class="form-control" name="title" /><br>
							<label>내용</label>
							<textarea name="contents" class="form-control" rows="8" id="a"></textarea><br> 
							<label>비고</label>
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="work">
						</div>

						<div class="modal-footer">

							<a href="#" data-dismiss="modal" class="btn">Close</a> <input
								type="submit" class="btn btn-primary" value="등록" />
							</form>
						</div>
					</div>
				</div>


			</div>



			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label>작업일자:</label> {{x.date}}<br> 
								<label>대상장비:</label>{{x.equipment}}<br> 
								<label>작업명:</label> {{x.title}}<br>
								<label>내용:</label> {{x.contents}} <br> 
								<label>비고:</label>{{x.note}} 
								<input type="hidden" name="category" value="work">
							</div>

						</div>


						<div class="modal-footer">

							<a href="#" data-dismiss="modal" class="btn">Close</a>
							<%
								if ("master".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=work"
								class="btn btn-primary">삭제</a>
							<%
								} else if ("admin".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=work"
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
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Add Widget</h4>
						</div>
						<div class="modal-body margin1">

							<form action="update.do" name="write" >
								<input type="hidden" class="form-control" name="id" value="{{x.id}}" /> 
								<label>작업일자</label> 
								<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
								<label>대상장비</label> 
								<input type="text" class="form-control"	name="equipment" value="{{x.equipment}}" /> <br> 
								<label>작업명</label>
								<input type="text" class="form-control" name="title" value="{{x.title}}"  wrap="hard"/><br> 
								<label>내용</label>
								<textarea  rows="8" name="contents" class="form-control" >{{x.contents}}</textarea>
								<br> <label>비고</label>
							
								<textarea  name="note" class="form-control" >{{x.note}}</textarea>
								<input type="hidden" name="category" value="work">
						</div>


						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a> 
							<input type="submit" class="btn btn-primary" value="완료" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	
	
	
	


	<script>
		var id;
		var myApp = angular.module('myApp',  ['angularUtils.directives.dirPagination']);
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
					
					
					
					function MyController($scope) {

						  $scope.currentPage = 1;
						  $scope.pageSize = 10;
						  $scope.meals = [];

						  var dishes = [
						    'noodles',
						    'sausage',
						    'beans on toast',
						    'cheeseburger',
						    'battered mars bar',
						    'crisp butty',
						    'yorkshire pudding',
						    'wiener schnitzel',
						    'sauerkraut mit ei',
						    'salad',
						    'onion soup',
						    'bak choi',
						    'avacado maki'
						  ];
						  var sides = [
						    'with chips',
						    'a la king',
						    'drizzled with cheese sauce',
						    'with a side salad',
						    'on toast',
						    'with ketchup',
						    'on a bed of cabbage',
						    'wrapped in streaky bacon',
						    'on a stick with cheese',
						    'in pitta bread'
						  ];
						  for (var i = 1; i <= 100; i++) {
						    var dish = dishes[Math.floor(Math.random() * dishes.length)];
						    var side = sides[Math.floor(Math.random() * sides.length)];
						    $scope.meals.push('meal ' + i + ': ' + dish + ' ' + side);
						  }
						  
						  $scope.pageChangeHandler = function(num) {
						      console.log('meals page changed to ' + num);
						  };
						}

						function OtherController($scope) {
						  $scope.pageChangeHandler = function(num) {
						    console.log('going to page ' + num);
						  };
						}	
									
		} ]);
		
		

		myApp.controller('MyController', MyController);
		myApp.controller('OtherController', OtherController);
		

		
	</script>
	



