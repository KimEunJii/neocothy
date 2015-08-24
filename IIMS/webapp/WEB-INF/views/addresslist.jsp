<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="./js/angular.js"></script>

<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-route.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-resource.min.js"></script>
<script src="//code.angularjs.org/1.3.1/angular-cookies.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<title>긴급 연락처 [NETCRUZ]</title>
</head>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<center>
		<h1>긴급 연락처</h1>
	</center>

	<div class="panel">

		<div class="input-group">
			<input class="form-control" ng-model="actionText" /> <span
				class="input-group-btn">
				<button class="btn btn-default" ng-click="addNewItem(actionText)">
					검색</button>
			</span>
		</div>

		<div class="input-group" ng-app="myApp" ng-controller="UserCtrl">
			<table class="table table-striped" st-table="address">
				<tr>
					<th>index</th>
					<th>구분</th>
					<th>업체명</th>
					<th>담당자 PM</th>
					<th>연락처</th>
					<th>e-mail</th>
					<th>담당 업무</th>
					<th>담당 장비</th>
					<th>담당 엔지니어</th>
					<th>연락처</th>
					<th>엔지니어 e-mail</th>
					<th>정기점검</th>
					<th>점검방식</th>
					<th>담당자</th>
					<th>비고</th>
					<th>작성자</th>
				</tr>
				
				<tbody>
				<tr ng-repeat="x in address" data-toggle="modal"
					ng-dblclick="detailpopup(x)">
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
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="text-center">
							<div st-pagination="" st-items-by-page="itemByPage" st-displayed-pages="7"></div>
						</td>
					</tr>
				</tfoot>
			</table>



			<p align="right">
				<button class="btn btn-default">+</button>
			</p>

			<br> <br>

			<form action="insert.do" method="post">
				id : <input type="text" name="id" />&nbsp category : <input
					type="text" name="category" />&nbsp partner : <input type="text"
					name="partner" />&nbsp pm : <input type="text" name="pm" />&nbsp
				pm_phone : <input type="text" name="pm_phone" />&nbsp pm_email : <input
					type="text" name="pm_email" />&nbsp task : <input type="text"
					name="task" /><br> <br> equipment : <input type="text"
					name="equipment" />&nbsp engineer : <input type="text"
					name="engineer" />&nbsp engineer_phone : <input type="text"
					name="engineer_phone" />&nbsp engineer_email : <input type="text"
					name="engineer_email" />&nbsp test_date : <input type="text"
					name="test_date" /><br> <br> test_type : <input
					type="text" name="test_type" />&nbsp manager : <input type="text"
					name="manager" />&nbsp note : <input type="text" name="note" />&nbsp
				user_id : <input type="text" name="user_id" />&nbsp <input
					type="submit" value="등록"><br> <br>
			</form>

			<!-- modal -->
			<div class="modal detailModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Details</h4>
						</div>
						<div class="modal-body">

							index : {{selected.id}} <br> 구분 : {{selected.category}} <br>
							업체명 : {{selected.partner}} <br> 담당자 PM : {{selected.pm}} <br>
							연락처 : {{selected.pm_phone}} <br> e-mail :
							{{selected.pm_email}} <br> 담당 업무 : {{selected.task}} <br>
							담당 장비 : {{selected.equipment}} <br> 담당 엔지니어 :
							{{selected.engineer}} <br> 연락처 : {{selected.engineer_phone}}
							<br> 엔지니어 e-mail : {{selected.engineer_email}} <br>
							정기점검 : {{selected.test_date}} <br> 점검방식 :
							{{selected.test_type}} <br> 담당자 : {{selected.manager}} <br>
							비고 : {{selected.note}} <br> 작성자 : {{selected.user_id}} <br>

						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" ng-click="editpopup(selected)">수정</button>
							<a href="delete.do?id={{selected.id}}" class="btn btn-primary">삭제</a>
							<a href="#" class="btn btn-primary" data-dismiss="modal">취소</a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal editModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">Edit</h4>
						</div>
						<div class="modal-body">

							<form action="updateWork.do">
								<input type="hidden" name="id" value="{{edit.id}}" /> <br>
								구분 : <input type="text" name="category"
									value="{{edit.category}}" /> <br> 업체명 : <input
									type="text" name="partner" value="{{edit.partner}}" /> <br>
								담당자 PM : <input type="text" name="pm" value="{{edit.pm}}" /> <br>
								연락처 : <input type="text" name="pm_phone"
									value="{{edit.pm_phone}}" /> <br> E-mail : <input
									type="text" name="pm_email" value="{{edit.pm_email}}" /> <br>
								담당 업무 : <input type="text" name="task" value="{{edit.task}}" />
								<br> 담당 장비 : <input type="text" name="equipment"
									value="{{edit.equipment}}" /> <br> 담당 엔지니어 : <input
									type="text" name="engineer" value="{{edit.engineer}}" /> <br>
								연락처 : <input type="text" name="engineer_phone"
									value="{{edit.engineer_phone}}" /> <br> 엔지니어 E-mail : <input
									type="text" name="engineer_email"
									value="{{edit.engineer_email}}" /> <br> 정기점검 : <input
									type="text" name="test_date" value="{{edit.test_date}}" /> <br>
								점검방식 : <input type="text" name="test_type"
									value="{{edit.test_type}}" /> <br> 담당자 : <input
									type="text" name="manager" value="{{edit.maanger}}" /> <br>
								비고 : <input type="text" name="note" value="{{edit.note}}" /> <br>
								작성자 : <input type="text" name="user_id" value="{{edit.user_id}}" />
								<br>
						</div>

						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="완료" /> <a
								href="#" class="btn btn-primary" data-dismiss="modal">취소</a>

							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		var myApp = angular.module('myApp', []);

		myApp.controller('UserCtrl', [ '$scope', '$http',
				function($scope, $http) {
			
					//
					$scope.address = '';
					$scope.selected = '';
					$scope.edit = '';
					$scope.itemByPage = 15;

					$scope.detailpopup = function(x) {

						$scope.selected = x;

						$('.detailModal').modal('show', function() {

						});
					}

					$scope.editpopup = function(selected) {
						$scope.edit = selected;
						$('.editModal').modal('show', function() {
							
						});
					}

					//서버에 사용자 이름 요청
					$http({
						method : 'GET',
						url : 'addresstest.do',
						headers : {
							'Content-type' : 'application/json',
						}
					}).success(function(data, status, headers, config) {
						$scope.address = data;
						
					}).error(function(data, status, headers, config) {
						window.alert(status);
					});

				}]);
	</script>

</body>
</html>