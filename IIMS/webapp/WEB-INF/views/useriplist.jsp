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

<title>hostIP Management</title>
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
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">


	<div class="panel container">

		<div class="input-group " id="table1" ng-app="myApp">
		<div ng-controller="UserCtrl" >
		
			<center>
				<h1>Ip Log</h1>		
			</center>		
		
			<div id="table1">
		
			<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>
            
            
				<table class="table table-striped">
					<tr>

						<th>hostIp</th>
						<th>hostName</th>
						<th>sysDate</th>
						<th>userId</th>
						<th></th>
						

					</tr>

					<tr ng-repeat="x in userIp | pagination: curPage * pageSize | limitTo: pageSize | filter:test "
					  id="userIptable" >

						<td>{{x.host_ip}}</td>
						<td>{{x.host_name}}</td>
						<td>{{x.reg_date}}</td>
						<td>{{x.user_id}}</td>
						<td><button class="btn btn-default" id="plus" ng-click="do_some_action(x)">차단</button></td>
	

					</tr>
				</table>
				
				<center>
				<div class="pagination pagination-centered" ng-show="userIp.length">
					<ul class="pagination-controle pagination">
	 					<li>
	  						<button type="button" class="btn btn-primary" ng-disabled="curPage == 0" ng-click="curPage=curPage-1"> &lt; PREV</button>
	 					</li>	 					
	 					<li>
	 						<span>Page {{curPage + 1}} of {{ numberOfPages() }}</span>
	 					</li>	 					
	 					<li>
	 						<button type="button" class="btn btn-primary" ng-disabled="curPage >= userIp.length/pageSize - 1" ng-click="curPage = curPage+1">NEXT &gt;</button>
	 					</li>
					</ul>
				</div>
				</center>


				
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

							<div class="form-group">
									 <form action="blockIp.do">
									 <input type="hidden" name="id" value="{{x.id}}" />
										<center>차단하시겠습니까?</center>
							</div>

						</div>


						<div class="modal-footer">

							<a href="#" data-dismiss="modal" class="btn">Close</a>
						
							<input type="submit" class="btn btn-primary" value="차단"/>
							</form>
						

						</div>
					</div>
				</div>
			</div>




	</div>

	</div>
	</div>
	


	<script>
	
	
	var id;
	var myApp = angular.module('myApp',[]);
	
			function UserCtrl($scope, $http) {
				//
				$scope.userIp = '';
				$scope.x = '';			
				
				
				$scope.do_some_action = function(x) {
					$scope.x = x;
					$("#addWidgetModal").modal('show', function() {
						
					});
				}
	

			
				//서버에 사용자 이름 요청
				$http({
					method : 'GET',
					url : 'getUserIpList.do',
					headers : {
						'Content-type' : 'application/json'
					}
				}).success(function(data, status, headers, config) {
					$scope.userIp = data;
					$scope.curPage = 0;
					$scope.pageSize = 10;					
				    $scope.numberOfPages = function() {
					return Math.ceil($scope.userIp.length / $scope.pageSize);
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
	




