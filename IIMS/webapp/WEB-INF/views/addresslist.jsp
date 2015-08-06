<%@page import="com.netcruz.iims.vo.AddressVo" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<title>긴급 연락처 [NETCRUZ]</title>
</head>

<style>
	table, th, td{
		border: 1px solid grey;
		border-collapse: collapse;
		padding: 5px;
	}
	table tr:nth-child(odd){
		background-color:#b0e0e6
	}
	table tr:bth-child(even){
		background-color:#f0fff0
	}
</style>

<body>
	<h1>list</h1>
		<table>
			<tr ng-repeat="x in address">
				<td>{{x.id}}</td>
				<td>{{x.category}}</td>
				<td>{{x.partner}}</td>
				<td>{{x.pm}}</td>
				<td>{{x.pm_phone}}</td>
				<td>{{x.pm_email}}</td>
				<td>{{x.task}}</td>
				<td>{{x.equipment}}</td>
				<td>{{x.engineer}}</td>
				<td>{{x.engineer_phone}}</td>
				<td>{{x.engineer_email}}</td>
				<td>{{x.test_date}}</td>
				<td>{{x.test_type}}</td>
				<td>{{x.manager}}</td>
				<td>{{x.note}}</td>
				<td>{{x.user_id}}</td>
			</tr>
		</table>
		
		<br><br>
		<form action="insert.do">
			id : <input type="text" name="id"/><br><br>
			category : <input type="text" name="category"/><br><br>
			partner : <input type="text" name="partner"/><br><br>
			pm : <input type="text" name="pm"/><br><br>
			pm_phone : <input type="text" name="pm_phone"/><br><br>
			pm_email : <input type="text" name="pm_email"/><br><br>
			task : <input type="text" name="task"/><br><br>
			equipment : <input type="text" name="equipment"/><br><br>
			engineer : <input type="text" name="engineer"/><br><br>
			engineer_phone : <input type="text" name="engineer_phone"/><br><br>
			engineer_email : <input type="text" name="engineer_email"/><br><br>
			test_date : <input type="text" name="test_date"/><br><br>
			test_type : <input type="text" name="test_type"/><br><br>
			manager : <input type="text" name="manager"/><br><br>
			note : <input type="text" name="note"/><br><br>
			user_id : <input type="text" name="user_id"/><br><br>
			
			<input type="submit"><br><br>
			
		</form>
		
		<div ng-app="myApp" ng-controller="UserCtrl">
			{{address.ADDRLIST}}
		</div>
		
		<script>
		
			var myApp = angular.module('myApp', []);
			myApp.controller('UserCtrl', ['$scope', '$http', function($scope, $http){
				
				//
				$scope.address='';
				$scope.addr='';
				
				//서버에 사용자 이름 요청
				$http({
					method:'GET',
					url:'addresstest.do',
					headers:{'Content-type':'application/json'}
				})
				.success(function(data, status, headers, config){
					$scope.address = data;
				})
				.error(function(data, status, headers, config){
				 window.alert(status);					
				});	
			}]);
		
		</script>
		
	</body>
</html>