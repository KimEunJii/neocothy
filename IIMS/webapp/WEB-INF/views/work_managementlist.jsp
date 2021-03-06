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
  <script data-require="angular.js@1.3.0" data-semver="1.3.0" src="https://code.angularjs.org/1.3.0/angular.js"></script>
  <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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

		<div class="input-group " id="table1" ng-app="myApp">
		<div ng-controller="UserCtrl" >
		
			<center>
				<h1>작업 이력 관리</h1>		
			</center>		
		
			<div id="table1">
		
			<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>
            
            
				<table class="table table-striped">
					<tr>

						<th>작업일자</th>
						<th>대상장비</th>
						<th>작업명</th>
						<th>주요내용</th>
						<th>비고</th>

					</tr>

					<tr ng-repeat="x in management | pagination: curPage * pageSize | limitTo: pageSize | filter:test "
					data-toggle="modal" ng-click="do_some_action(x)" id="managementtable" >

						<td>{{x.date}}</td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.equipment}}</nobr></div></td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.title}}</nobr></div></td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.contents}}</nobr></div></td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.note}}</nobr></div></td>

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
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Detail</h4>
						</div>
						<div class="modal-body">
						<form action="insert.do" method="post" id="eventForm" name="myForm">
							<label>작업일자</label>
							<input type="date"  name="date" ng-model="example.value" class="form-control"
      						 placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>대상장비</label> 
							<input type="text" class="form-control" name="equipment" id="equipment" /> <br> 
							<label>작업명</label>
							<input type="text" class="form-control" name="title" /><br>
							<label>내용</label>
							<textarea name="contents" class="form-control" rows="8" id="a"></textarea><br> 
							<label>비고</label>
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="work">
						</div><br><br><br>

						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a>
							<input	type="submit" class="btn btn-primary" value="등록" id="insert"/>
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
							<h4 class="modal-title">Detail</h4>
						</div>
						<div class="modal-body">
							
								<label>작업일자:</label> {{x.date}}<br> 
								<label>대상장비:</label>{{x.equipment}}<br> 
								<label>작업명:</label> {{x.title}}<br>
								<label>내용:</label> <pre>{{x.contents}}</pre> <br> 
								<label>비고:</label><pre>{{x.note}}</pre> 
								<input type="hidden" name="category" value="work">						

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
							<h4 class="modal-title">수정</h4>
						</div>
						<div class="modal-body margin1">

							<form action="update.do" name="write" >
								<input type="hidden" class="form-control" name="id" value="{{x.id}}" /> 
								<label>작업일자</label> 
								<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
								<label>대상장비</label> 
								<input type="text" class="form-control"	name="equipment" id="equipment" 
								value="{{x.equipment}}" required/> <br> 
								<label>작업명</label>
								<input type="text" class="form-control" name="title" value="{{x.title}}"  wrap="hard"/><br> 
								<label>주요내용</label>
								<textarea  rows="8" name="contents" class="form-control" >{{x.contents}}</textarea>	<br>
						    	 <label>비고</label>
							
								<textarea rows="8" name="note" class="form-control" >{{x.note}}</textarea>
								<input type="hidden" name="category" value="work"><br><br><br><br><br><br><br><br>
						</div>

						<br><br><br>
						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a> 
							<input type="submit" class="btn btn-primary" value="완료" id="update"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		
	
	<!--  -->

 	

	</div>

	</div>
	</div>
	


	<script>
	
	
	var id;
	var myApp = angular.module('myApp',[]);
	
			function UserCtrl($scope, $http) {
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
					$scope.curPage = 0;
					$scope.pageSize = 10;					
				    $scope.numberOfPages = function() {
					return Math.ceil($scope.management.length / $scope.pageSize);
				    };	
						
				}).error(function(data, status, headers, config) {
					window.alert(status);
				});
													
			}
			
			angular.module('myApp').filter('pagination', function()
					{
					 return function(input, start)
					 {
					  start = +start;
					  return input.slice(start);
					 };
			});
			
		
	
	myApp.controller('UserCtrl', UserCtrl);
		
	</script>
	
		<script type="text/javascript">
		$("#insert").on('click', function(){
			if($("#equipment").val()==""){
				alert("대상장비를 입력해 주세요");
				$("#equipment").focus();
				return false;
			}	
		});
		
		</script>
	



