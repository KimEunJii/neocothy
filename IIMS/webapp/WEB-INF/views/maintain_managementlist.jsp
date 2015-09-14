<%@page import="com.netcruz.iims.vo.UserVo"%>
<%@page import="com.netcruz.iims.vo.ManagementVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.netcruz.iims.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
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
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	
	
	<div class="panel container">  
		<div class="input-group" id="table1" ng-app="myApp" ng-controller="UserCtrl">
		<center>
			<h1>정기점검 관리</h1>
		</center>
<!-- 		 <div> -->
<!-- 		 <input type="text" class="form-control"/> -->
<!--          <button class="btn btn-default" ng-click="addNewItem(actionText)">검색 </button> -->
<!--          </div> -->
			<div id="table1">
			<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>
				<table class="table table-striped">
					<tr>

						<th>일자</th>
						<th>회사명</th>
						<th>점검명</th>
						<th>점검장비</th>
						<th>특이사항</th>
						<th>비고</th>

					</tr>

					<tr ng-repeat="x in management | pagination: curPage * pageSize | limitTo: pageSize | filter:test"
					data-toggle="modal" ng-dblclick="do_some_action(x)" id="managementtable">

						<td>{{x.date}}</td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.company}}</nobr></div></td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.title}}</nobr></div></td>
						<td><div style="position:relative; width:200px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.equipment}}</nobr></div></td>
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
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">추가</h4>
						</div>
						<div class="modal-body">
						<form action="insert.do" method="post">

							
							<label>일자</label> 
							<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>회사명</label> 
							<input type="text" class="form-control" name="company" id="company" /> <br> 
							<label>점검명</label>
							<input type="text" class="form-control" name="title" id="title" /><br> 
							<label>점검장비</label>
							<textarea class="form-control" name="equipment" ></textarea><br> 	
							<label>특이사항</label>
							<textarea class="form-control" name="contents" ></textarea><br> 						
							<label>비고</label> 
							<textarea name="note" class="form-control" ></textarea>
							<input type="hidden" name="category" value="maintain"> 						
							</div>				
						
						<br><br><br>
						<div class="modal-footer">							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<input type="submit" class="btn btn-primary" value="등록" id="insert"/>
							</form>
						</div></div>
		</div></div>
			


			
			<div class="modal" id="addWidgetModal">
				<div class="modal-dialog modal-size">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">Detail</h4>
						</div>
						<div class="modal-body">
							
								<div class="form-group">
									 <label>일자:</label> 				 
									 {{x.date}}<br>
									 <label >회사명:</label> 
									 {{x.company}}<br>
									  <label >점검명:</label>
									 {{x.title}}<br>
									 <label>점검장비:</label>
									<pre>{{x.equipment}}</pre><br>									
									 <label>특이사항:</label> 
									 <pre>{{x.contents}}</pre> <br>
									 <label>비고:</label> 
									  <pre>{{x.note}}</pre>
									<input type="hidden" name="category" value="maintain">
								</div>
							
							</div>
					
						
						<div class="modal-footer">
							
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<% if("master".equals(vo.getRole())){ %>				
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=maintain" class="btn btn-primary">삭제</a>
							<%}else if("admin".equals(vo.getRole())){  %>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}&category=maintain" class="btn btn-primary">삭제</a>
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
							<h4 class="modal-title">수정</h4>
						</div>
						<div class="modal-body margin1">
						
							<form action="update.do">
							<input type="hidden" class="form-control" name="id" value="{{x.id}}" />
							<label>일자</label> 
							<input type="date"  name="date" ng-model="example.value" class="form-control"  
      						 	placeholder="yyyy-MM-dd" min="1999-01-01" max="2500-12-31" required /><br>
							<label>회사명</label> 
							<input type="text" class="form-control" name="company" id="company" value="{{x.company}}" required/> <br> 
							<label>점검명</label>
							<input type="text" class="form-control" name="title" id="title" value="{{x.title}}" required/><br> 
							<label>점검장비</label> 
							<textarea class="form-control" name="equipment" >{{x.equipment}}</textarea> <br>							
							<label>특이사항</label> 
							<textarea name="contents" class="form-control" rows="8">{{x.contents}}</textarea> <br>
							<label>비고</label> 
							<textarea name="note" class="form-control" >{{x.note}}</textarea>
							<input type="hidden" name="category" value="maintain"> 
						
						</div>
						
						<br><br><br>
						<div class="modal-footer">
							<a href="#" data-dismiss="modal" class="btn">Close</a>							
							<input type="submit" class="btn btn-primary"  value="완료" id="update"/>
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
							url : 'getMaintainManagement.do',
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
		
		<script type="text/javascript">
			$("#insert").on('click', function(){
				if($("#company").val()==""){
					alert("회사명을 입력해 주세요");
					$("#company").focus();
					return false;
				}	
				if($("#title").val()==""){
					alert("정검명을 입력해 주세요");
					$("#title").focus();
					return false;
				}	
			});
	
		</script>
		


</body>
</html>