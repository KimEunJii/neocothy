<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<script src="./js/angular.js"></script>
    
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-route.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-resource.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-cookies.min.js"></script>
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<title>장애 이력 관리</title>
</head>

<body>
	<center>
		<h1>장애 이력 관리</h1>
	</center>
	
	<div class="panel">
	
		<div class="input-group">
            <input class="form-control" ng-model="actionText" />
            <span class="input-group-btn">
                <button class="btn btn-default"
                        ng-click="addNewItem(actionText)">
                    	검색
                </button>
            </span>
       </div>
	
			<div class="input-group">
		<table class="table table-striped" ng-app="myApp" ng-controller="UserCtrl">
			<tr>
				
				<td>장애일자</td>
				<td>장애장비</td>
				<td>장애명</td>
				<td>장애내용</td>
				<td>비고</td>
			
			</tr>

			<tr ng-repeat="x in management">
			
				<td>{{x.date}}</td>
				<td>{{x.equipment}}</td>
				<td>{{x.title}}</td>
				<td>{{x.contents}}</td>
				<td>{{x.note}}</td>			
			</tr>
		</table>



	
	<p align="right">
		<button class="btn btn-default">
    		+
    	</button>
    </p>
    
    <br>
    <br>


	<form action="insert.do">
		 date : <input type="text" name="date" /> &nbsp; 
		 equipment : <input type="text" name="equipment" />&nbsp; 
		 title : <input type="text" name="title" />&nbsp;
		contents : <input type="text" name="contents" />&nbsp; 
		note : <input type="text" name="note" />&nbsp;
		<input type="submit" value="등록"/>
		
	</form>
</div>
	<script>
		
			var myApp = angular.module('myApp', []);
			myApp.controller('UserCtrl', ['$scope', '$http', function($scope, $http){
				
				//
				$scope.management='';
				
				//서버에 사용자 이름 요청
				$http({
					method:'GET',
					url:'getErrorManagement.do',
					headers:{'Content-type':'application/json'}
				})
				.success(function(data, status, headers, config){
					$scope.management = data;
				})
				.error(function(data, status, headers, config){
				 window.alert(status);					
				});	
			}]);
		
		</script>

</body>
</html>