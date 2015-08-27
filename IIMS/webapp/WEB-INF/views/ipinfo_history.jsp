<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.IpinfohistoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8"%>
	
<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@page import="com.netcruz.iims.vo.ManagementVo"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	UserVo vo = (UserVo)session.getAttribute("userFlag");
%>
<html>

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
    <script src="http://bradleytrager.github.io/angular-combo-box/bower_components/angular-combo-box/dist/angular-combo-box.min.js"></script>
    
        
  
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>IP 이력관리 [NETCRUZ]</title>


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
		<div class="input-group" id = "table1" ng-app="myApp" ng-controller="UserCtrl">

		<center>
			<h1>IP 이력관리</h1>
		</center>	
				
				<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>	 			 		 


		    <table class="table table-striped center"> 
			<tr>
				
				<th>분류</th>
				<th>망 구분</th>
				<th>IP</th>
				<th>Mask</th>
				<th>용도(부서)</th>
				<th>장비명(사용자)</th>
				<th>모델명</th>
				<th>사용여부</th>
				<th>반납일자</th>

			</tr>			
				<tr ng-repeat="x in ipinfohistory | pagination: curPage * pageSize | limitTo: pageSize"
					data-toggle="modal" ng-click="do_some_action(x)" id="ipinfohistorytable">
					
				
					<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.category}}</nobr></div></td>
					<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.network}}</nobr></div></td>
					<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.ip}}</nobr></div></td>
					<td>{{x.mask}}</td>
					<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.usages}}</nobr></div></td>
					<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.equipment}}</nobr></div></td>
					<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.model}}</nobr></div></td>
					<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.used}}</nobr></div></td>
					<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.mody_date}}</nobr></div></td>

			</tr>		
		</table>
		
<div class="pagination pagination-centered" ng-show="ipinfohistory.length">
	<ul class="pagination-controle pagination">
 	<li>
  	<button type="button" class="btn btn-primary" ng-disabled="curPage == 0"
 		ng-click="curPage=curPage-1"> &lt; PREV</button>
 	</li>
 	<li>
 	<span>Page {{curPage + 1}} of {{ numberOfPages() }}</span>
 	</li>
 	<li>
 	<button type="button" class="btn btn-primary"
 		ng-disabled="curPage >= ipinfohistory.length/pageSize - 1"
 		ng-click="curPage = curPage+1">NEXT &gt;</button>
 	</li>
	</ul>
</div>
 

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
					<br><br>
					
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
		
		
		<label>분류</label>
		<select name="category" class="form-control">
			<option value="전체">전체</option>
			<option value="대역">대역</option>
			<option value="host">host</option>		
		</select>
		<br>
		<label>망구분</label>
		<select name="network" class="form-control"  size=1>
			<option value="내부망">내부망</option>
			<option value="대국민망">대국민망</option>
		</select>
		<br>
		<label>아이피</label> 
		<input type="text" class="form-control" name="ip"/><br>
		<label>mask</label>
		<input type="text" class="form-control" name="mask"/><br>
		<label>용도(부서)</label>
		<input type="text" class="form-control" name="usages"/><br>
		<label>장비명(사용자)</label>
		<input type="text" class="form-control" name="equipment" /><br>
		<label>모델명</label>
	    <input type="text" class="form-control" name="model" /><br>    
	    <label>사용여부</label>
	    <select  name="used" class="form-control"  size=1>
	    	<option value="사용">사용</option>
	    	<option value="미사용">미사용</option>  
	    </select>
	    <br>
	    <label>OS</label>
		<input type="text" class="form-control" name="os" /><br>
		<label>사용부서</label>
		<input type="text" class="form-control" name="use_dept" /><br>
		<label>사용자</label>
		<input type="text" class="form-control" name="user" /><br>
		<label>사용기간</label>
		<input type="text" class="form-control"  name="use_term" /><br>
		<label>승인일자</label> 
		<input type="text" class="form-control" name="per_date" /><br>
		<label>수정일자</label> 
		<input type="text" class="form-control" name="mody_date" /><br>
		비고
		<textarea name="note" class="form-control" ></textarea><br>		
		<label>등록자</label>
		<input type="text" class="form-control" name="user_id"/><br>
		
	
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
							<h4 class="modal-title">세부사항</h4>
						</div>
						<div class="modal-body">
						id: {{x.id}} <br>
						분류:{{x.category}}<br>
						망구분:{{x.network}}<br>
						아이피:{{x.ip}}<br>
						mask:{{x.mask}}<br>
						용도(부서):{{x.usages}}<br>
						장비명(사용자):{{x.equipment}}<br>
						모델명:{{x.model}}<br>
						사용여부:{{x.used}}<br>
						OS:{{x.os}}<br>
						사용부서:{{x.use_dept}}<br>
						사용자:{{x.user}}<br>
						사용기간:{{x.use_term}}<br>
						승인일자:{{x.per_date}}<br>
						수정일자:{{x.mody_date}}<br>
						비고:{{x.note}}<br>
						등록자:{{x.user_id}}<br>
					
						</div>
					
						
						<div class="modal-footer">
							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}" class="btn btn-primary">삭제</a>
						</div>
					</div>
				</div>
			</div>
			
			
			
			

		<script>
			var myApp = angular.module('myApp',  []);
			
		

			
			myApp.controller('UserCtrl', [ '$scope', '$http',
					function($scope, $http) {
				

						
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
						
						$http({
							method : 'GET',
							url : 'ipinfohistorytest.do',
							headers : {
								'Content-type' : 'application/json'
							}
						}).success(function(data, status, headers, config) {
							
							$scope.curPage = 0;
							$scope.pageSize = 10;
							$scope.ipinfohistory = data;
						    $scope.numberOfPages = function() {
								return Math.ceil($scope.ipinfohistory.length / $scope.pageSize);
							};
							
						
						}).error(function(data, status, headers, config) {
							window.alert(status);
						});
						
					
			}]);		
			
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