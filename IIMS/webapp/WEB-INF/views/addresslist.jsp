<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	UserVo vo = (UserVo) session.getAttribute("userFlag");
%>

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

<!-- Style -->
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
	<center>
		<h1>긴급 연락처</h1>
	</center>

	<div class="panel container">
		<div class="input-group" id="table1" ng-app="myApp" ng-controller="UserCtrl">
		<div class="input-group">
			<input class="form-control" ng-model="actionText" /> <span
				class="input-group-btn">
				<button class="btn btn-default" ng-click="addNewItem(actionText)">
					검색</button>
			</span>
		</div>

		
			<table class="table table-striped">
				<tr>
				
					<th>구분</th>
					<th>업체명</th>
					<th>담당자 PM</th>
					<th>연락처</th>
					<th>e-mail</th>
					<th>담당업무</th>
					<th>담당장비</th>
					<th>담당엔지니어</th>
					<th>연락처</th>
					<th>엔지니어 e-mail</th>
					<th>정기점검</th>
					<th>점검방식</th>
					<th>담당자</th>
					<th>비고</th>
					<th>작성자</th>
				</tr>
				
				<tbody>
				<tr ng-repeat="x in address  | pagination: curPage * pageSize | limitTo: pageSize" st-table="address" data-toggle="modal" ng-dblclick="detailpopup(x)">
					
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
					<td><pre>{{x.note}}</pre></td>
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
			
			<center>
				<div class="pagination pagination-centered" ng-show="address.length">
					<ul class="pagination-controle pagination">
	 					<li>
	  						<button type="button" class="btn btn-primary" ng-disabled="curPage == 0" ng-click="curPage=curPage-1"> &lt; PREV</button>
	 					</li>
	 					
	 					<li>
	 						<span>Page {{curPage + 1}} of {{ numberOfPages() }}</span>
	 					</li>
	 					
	 					<li>
	 						<button type="button" class="btn btn-primary" ng-disabled="curPage >= address.length/pageSize - 1" ng-click="curPage = curPage+1">NEXT &gt;</button>
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
							ng-click="addpopup()">등록</button>
					</p>
					<%
						} else if ("admin".equals(vo.getRole())) {
					%>
					<p>
						<button class="btn btn-default" id="plus"
							ng-click="addpopup()">등록</button>
					</p>
					<%
						}
					%>

					<br> <br>
				</div>

			<br> <br>

			<!-- detail Modal -->
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
							<br> 엔지니어 E-mail : {{selected.engineer_email}} <br>
							정기점검 : {{selected.test_date}} <br> 점검방식 :
							{{selected.test_type}} <br> 담당자 : {{selected.manager}} <br>
							비고 : <pre>{{selected.note}}</pre> 작성자 : {{selected.user_id}} <br>

						</div>

						<div class="modal-footer">

							<a href="#" data-dismiss="modal" class="btn">Close</a>
							<%
								if ("master".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="editpopup(selected)">수정</button>
							<a href="delete.do?id={{selected.id}}"
								class="btn btn-primary">삭제</a>
							<%
								} else if ("admin".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="editpopup(selected)">수정</button>
							<a href="delete.do?id={{x.id}}"
								class="btn btn-primary">삭제</a>
							<%
								} else
							%>

						</div>
					</div>
				</div>
			</div>

			<!-- edit Modal -->
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
								비고 : <textarea name="note" class="form-control" rows="8" value="{{edit.note}}"></textarea> <br>
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
			
			
			<!-- add Modal -->
			<div class="modal addDataModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Add Data</h4>
						</div>
						
						<div class="modal-body">
							<form action="insert.do" method="post">
								<label>Category</label>
								<input type="text" class="form-control" name="category"/><br><br>
								
								<label>Partner</label>
								<input type="text" class="form-control" name="partner"/><br><br>
								
								<label>PM</label>
								<input type="text" class="form-control" name="pm"/><br><br>
								
								<label>PM_Phone</label>
								<input type="text" class="form-control" name="pm_phone"/><br><br>
								
								<label>PM_Email</label>
								<input type="text" class="form-control" name="pm_email"/><br><br>
								
								<label>Task</label>
								<input type="text" class="form-control" name="task"/><br><br>
								
								<label>Equipment</label>
								<input type="text" class="form-control" name="equipment"/><br><br>
								
								<label>Engineer</label>
								<input type="text" class="form-control" name="engineer"/><br><br>
								
								<label>Engineer_phone</label>
								<input type="text" class="form-control" name="engineer_phone"/><br><br>
								
								<label>Engineer_email</label>
								<input type="text" class="form-control" name="engineer_email"/><br><br>
								
								<label>Test_Date</label>
								<input type="text" class="form-control" name="test_date"/><br><br>
								
								<label>Test_Type</label>
								<input type="text" class="form-control" name="test_type"/><br><br>
								
								<label>Manager</label>
								<input type="text" class="form-control" name="manager"/><br><br>
								
								<label>NOTE</label>
								<textarea name="note" class="form-control" rows="8"></textarea><br><br>
								
								<label>User_ID</label>
								<input type="text" class="form-control" name="user_id"/><br><br><br><br>
								
								<!-- Button -->
								<p align="right">
									<input type="submit" class="btn btn-primary" value="등록"/>
									<a href="#" class="btn btn-primary" data-dismiss="modal" class="btn">취소</a>
								</p>
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
					$scope.testbr="abcd\nefg";
					
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
					
					$scope.addpopup = function(){
						$(".addDataModal").modal('show', function(){
							
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
						$scope.curPage = 0;
						$scope.pageSize = 10;
						$scope.address = data;
						$scope.numberOfPages = function() {
							return Math.ceil($scope.address.length / $scope.pageSize);
						};
						
					}).error(function(data, status, headers, config) {
						window.alert(status);
					});

				}]);
		
				angular.module('myApp').filter('pagination', function(){
				 	return function(input, start){
				  		start = +start;
				  		return input.slice(start);
				 		};
					});
	</script>

</body>
</html>