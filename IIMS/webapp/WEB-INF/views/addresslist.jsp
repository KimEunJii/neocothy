<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- in angularjs section 
"https://cdnjs.cloudflare.com/ajax/libs/ng-grid/2.0.11/ng-grid-flexible-height.js"-->

<!-- Content/css section
"https://cdnjs.cloudflare.com/ajax/libs/ng-grid/2.0.11/ng-grid.css" -->

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
<title>긴급 연락처 [NETCRUZ]</title>
</head>

<body>
	<center>
		<h1>긴급 연락처</h1>
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
	
		<table class="table table-striped" ng-app="myApp" ng-controller="UserCtrl">
			<tr>
				<td>index</td>
				<td>구분</td>
				<td>업체명</td>
				<td>담당자 PM</td>
				<td>연락처</td>
				<td>e-mail</td>
				<td>담당 업무</td>
				<td>담당 장비</td>
				<td>담당 엔지니어</td>
				<td>연락처</td>
				<td>엔지니어 e-mail</td>
				<td>정기점검</td>
				<td>점검방식</td>
				<td>담당자</td>
				<td>비고</td>
				<td>작성자</td>
			</tr>

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
	</div>

	<br>
	<br>
	
	
	
	
	<form action="insert.do">
		id : <input type="text" name="id" />&nbsp category : <input
			type="text" name="category" />&nbsp partner : <input type="text"
			name="partner" />&nbsp pm : <input type="text" name="pm" />&nbsp
		pm_phone : <input type="text" name="pm_phone" />&nbsp pm_email : <input
			type="text" name="pm_email" />&nbsp task : <input type="text"
			name="task" /><br>
		<br> equipment : <input type="text" name="equipment" />&nbsp
		engineer : <input type="text" name="engineer" />&nbsp engineer_phone :
		<input type="text" name="engineer_phone" />&nbsp engineer_email : <input
			type="text" name="engineer_email" />&nbsp test_date : <input
			type="text" name="test_date" /><br>
		<br> test_type : <input type="text" name="test_type" />&nbsp
		manager : <input type="text" name="manager" />&nbsp note : <input
			type="text" name="note" />&nbsp user_id : <input type="text"
			name="user_id" />&nbsp <input type="submit"><br>
		<br>
	</form>

	<script>
		
			var myApp = angular.module('myApp', []);
			myApp.controller('UserCtrl', ['$scope', '$http', function($scope, $http){
				
				//
				$scope.address='';
				
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