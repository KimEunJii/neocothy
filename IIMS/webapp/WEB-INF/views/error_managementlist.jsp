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
		<div class="input-group" id="table1" ng-app="myApp" ng-controller="UserCtrl">
		<center>
			<h1>장애 이력 관리</h1>
		</center>
<!-- 		 <div> -->
<!-- 		 <input type="text" class="form-control"/> -->
<!--          <button class="btn btn-default" ng-click="addNewItem(actionText)">검색 </button> -->
<!--          </div> -->
			<div id="table1">
				<table class="table table-striped center">
					<tr>

						<td>장애일자</td>
						<td>장애장비</td>
						<td>장애명</td>
						<td>장애내용</td>
						<td>비고</td>

					</tr>

					<tr ng-repeat="x in management | pagination: curPage * pageSize | limitTo: pageSize"
					data-toggle="modal" ng-click="do_some_action(x)" >
					
						<td>{{x.date}}</td>
						<td>{{x.equipment}}</td>
						<td>{{x.title}}</td>
						<td>{{x.contents}}</td>
						<td>{{x.note}}</td>
					</tr>
				</table>

				<center>
				<div class="pagination pagination-centered" ng-show="management.length">
					<ul class="pagination-controle pagination">
	 					<li>
	  						<button type="button" class="btn btn-primary" ng-disabled="curPage == 0" ng-click="curPage=curPage-1"> &lt; PREV</button>
	 					</li>	 					
	 					<li>
	 						<span>Page {{curPage + 1}} of {{ numberOfPages() }}</span>
	 					</li>	 					
	 					<li>
	 						<button type="button" class="btn btn-primary" ng-disabled="curPage >= management.length/pageSize - 1" ng-click="curPage = curPage+1">NEXT &gt;</button>
	 					</li>
					</ul>
				</div>
				</center>

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

							
							<label>장애일자</label> 
							<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>장애장비</label> 
							<input type="text" class="form-control" name="equipment"   /> <br>
							<label>장애내용</label>
							<input type="text" class="form-control" name="title" /><br> 						
							<label>비고</label> 
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="error"> 						
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
									 <label >장애일자:</label> 
									 {{x.date}}<br>
									 <label>장애장비:</label>
									{{x.equipment}}<br>
									 <label >장애명:</label>
									 {{x.title}}<br>
									 <label>장애내용:</label> 
									 {{x.contents}} <br>
									 <label>비고:</label> 
									  {{x.note}}
									<input type="hidden" name="category" value="error">
								</div>
							
							</div>
					
						
						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a>			
							<% if("master".equals(vo.getRole())){ %>				
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=error" class="btn btn-primary">삭제</a>
							<%}else if("admin".equals(vo.getRole())){  %>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=error" class="btn btn-primary">삭제</a>
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
							<label>장애일자</label> 
							<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>장애장비</label> 
							<input type="text" class="form-control" name="equipment" value="{{x.equipment}}"  /> <br>
							<label>장애명</label>
							<input type="text" class="form-control" name="title" value="{{x.title}}" /><br> 
							<label>장애내용</label> 
							<textarea name="contents" class="form-control" rows="8">{{x.contents}}</textarea> <br>
							<label>비고</label> 
							<textarea name="note" class="form-control" >{{x.note}}</textarea>
							<input type="hidden" name="category" value="error"> 
						
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
							url : 'getErrorManagement.do',
							headers : {
								'Content-type' : 'application/json'
							}
						}).success(function(data, status, headers, config) {
							$scope.management = data;
							$scope.curPage = 0;
							$scope.pageSize = 10;					
						    $scope.numberOfPages = function() {
							return Math.ceil($scope.management.length / $scope.pageSize);
						    };	
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
					} ]);
			
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