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
	
    
    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/assets/js/require.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-route.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-resource.min.js"></script>
    <script src="//code.angularjs.org/1.3.1/angular-cookies.min.js"></script>     
    
    <link href="/assets/css/styles.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>IP 정보관리 [NETCRUZ]</title>

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
			<h1>IP 정보관리</h1>
		</center>
			
			<div class="col-ms-3" >              
              Search <input ng-model="test" id="search" class="form-control" placeholder="Filter text">
            </div>
			
				<table class="table table-striped">
					<tr>
					  	<th>분류</th>
						<th>망 구분</th>
						<th>IP</th>
						<th>Mask</th>
						<th>용도(부서)</th>
						<th>장비명(사용자)</th>
						<th>모델명</th>
						<th>사용여부</th>
						<th>OS</th>
						<th>사용부서</th>
						<th>사용자</th>
						<th>사용기간</th>
						<th>승인일자</th>
						<th>수정일자</th>
						<th>비고</th>
						<th>작성자</th>
					</tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
						
				
					<tr ng-repeat="x in ipinfo | pagination: curPage * pageSize | limitTo: pageSize | filter:test"
					data-toggle="modal" ng-click="do_some_action(x)" id="ipinfotable">

						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.category}}</nobr></div></td>
						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.network}}</nobr></div></td>
						<td>{{x.ip}}</td>
						<td>{{x.mask}}</td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.usages}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.equipment}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.model}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.used}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.os}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.use_dept}}</nobr></div></td>
						<td><div style="position:relative; width:50px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.user}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.use_term}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.per_date}}</nobr></div></td>
						<td><div style="position:relative; width:100px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.mody_date}}</nobr></div></td>
						<td><div style="position:relative; width:80px; text-overflow:ellipsis; overflow:hidden; cursor:hand"><nobr>{{x.note}}</nobr></div></td>
						<td>{{x.user_id}}</td>
					</tr>
				</table>
				<br>
				
				<center>
					<div class="pagination pagination-centered" ng-show="ipinfo.length">
						<ul class="pagination-controle pagination">
							<li>
								<button type="button" class="btn btn-primary"
									ng-disabled="curPage == 0" ng-click="curPage=curPage-1">
									&lt; PREV</button>
							</li>
							<li><span>Page {{curPage + 1}} of {{ numberOfPages()
									}}</span></li>
							<li>
								<button type="button" class="btn btn-primary"
									ng-disabled="curPage >= ipinfo.length/pageSize - 1"
									ng-click="curPage = curPage+1">NEXT &gt;</button>
							</li>
						</ul>
					</div>

				</center>
				<br><br>

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
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">추가</h4>
						</div>
						<div class="modal-body">
							<form action="insert.do" method="post">

								<label>분류</label> 
									<select name="category" id="category" class="form-control">
									<option value="전체">전체</option>
									<option value="대역">대역</option>
									<option value="host">host</option>		
								</select><br>
								<label>망구분</label> 
								<select name="network" class="form-control"  size=1>
									<option value="내부망">내부망</option>
									<option value="대국민망">대국민망</option>
								</select><br> 
								<label>아이피</label>
								<input type="text" class="form-control" name="ip" id="ip" /><br> 
								<label>mask</label>
								<input type="text" class="form-control" name="mask" id="mask"/><br>
								<label>용도(부서)</label> 
								<input type="text" class="form-control"	name="usages" id="usages"/><br> 
								<label>장비명(사용자)</label> 
								<input type="text" class="form-control" name="equipment" id="equipment"/><br>
								<label>모델명</label>
								<input type="text" class="form-control"	name="model" /><br> 
								<label>사용여부</label>
								<select class="form-control" name="used">
									 <option value="사용">사용</option>
									 <option value="미사용">미사용</option>
								</select> <br> 
								<label>OS</label>
								<input type="text" class="form-control" name="os" /><br> 
								<label>사용부서</label>
								<input type="text" class="form-control" name="use_dept" id="use_dept" /><br>
								<label>사용자</label> 
								<input type="text" class="form-control"	name="user" /><br> 
								<label>사용기간</label> 
								<input type="text" class="form-control" name="use_term" /><br> 
								<label>승인일자</label>
								<input type="text" class="form-control" name="per_date" id="per_date"/><br>
								<label>수정일자</label> 
								<input type="text" class="form-control"	name="mody_date" /><br> 
								<label>비고</label> 
								<input type="text" class="form-control" name="note" /><br> 
								<label>등록자</label>
								<input type="text" class="form-control" name="user_id" /><br>
								<br><br><br>
								
								
								<div class="modal-footer">
									<a href="#" data-dismiss="modal" class="btn">Close</a> 
									<input type="submit" class="btn btn-primary" value="등록"  id="insert"/>
								</div>
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
						장비명(사용자):<pre>{{x.equipment}}</pre><br>
						모델명:{{x.model}}<br>
						사용여부:{{x.used}}<br>
						OS:{{x.os}}<br>
						사용부서:{{x.use_dept}}<br>
						사용자:{{x.user}}<br>
						사용기간:{{x.use_term}}<br>
						승인일자:{{x.per_date}}<br>
						수정일자:{{x.mody_date}}<br>
						비고:<pre>{{x.note}}</pre><br>
						등록자:{{x.user_id}}<br>
					
						</div>
					
						
						<div class="modal-footer">
							
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">close</button>
							<%
								if ("master".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}"
								class="btn btn-primary">삭제</a>
							<%
								} else if ("admin".equals(vo.getRole())) {
							%>
							<button class="btn btn-primary" ng-click="do_some_action2(x)">수정</button>
							<a href="delete.do?id={{x.id}}"
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
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title">수정</h4>
						</div>
						<div class="modal-body margin1">
						
							<form action="update.do">
							<input type="hidden" class="form-control" name="id" value="{{x.id}}" />
							<label>분류</label> 
							<select name="category" class="form-control">
								<option value="전체">전체</option>
								<option value="대역">대역</option>
								<option value="host">host</option>		
							</select> <br> 
							<label>망구분</label> 
							<select name="network" class="form-control"  size=1>
								<option value="내부망">내부망</option>
								<option value="대국민망">대국민망</option>
							</select> <br>
							<label>아이피</label>
							<input type="text" class="form-control" name="ip" id="ip" value="{{x.ip}}" required/><br> 
							<label>mask</label> 
							<input type="text" class="form-control" name="mask"  id="mask" value="{{x.mask}}" required/><br>
							<label>용도(부서)</label> 
							<input type="text" class="form-control"  name="usages" id="usages" value="{{x.usages}}" required/><br>
							<label>장비명(사용자)</label>
							<textarea class="form-control" name="equipment" id="equipment" required>{{x.equipment}}</textarea><br>
							<label>모델명</label>
							<input type="text" class="form-control" name="model" value="{{x.model}}" /><br>
							<label>사용여부</label>							
							<select name="used" class="form-control" >
									 	<option value="사용">사용</option>
									 	<option value="미사용">미사용</option>
							</select><br>
							<label>OS</label>
							<input type="text" class="form-control" name="os" value="{{x.os}}"/><br>
							<label>사용부서</label>
							<input type="text" class="form-control" name="use_dept" id="use_dept"  value="{{x.use_dept}}" required/><br>
							<label>사용자</label>
							<input type="text" class="form-control" name="user" value="{{x.user}}"/><br>
							<label>사용기간</label>
							<input type="text" class="form-control" name="use_term" value="{{x.use_term}}"/><br>
							<label>승인일자</label>
							<input type="text" class="form-control" name="per_date" id="per_date"  value="{{x.per_date}}" required/><br>
							<label>수정일자</label>
							<input type="text" class="form-control" name="mody_date" value="{{x.mody_date}}"/><br>
							<label>비고</label>
							<textarea class="form-control" name="note">{{x.note}}</textarea><br>
							<label>등록자</label>
							<input type="text" class="form-control" name="user_id" value="{{x.user_id}}"/><br>																
						
						</div>
						
					
					<br><br><br>	
					<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="완료" id="update"/> 
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">close</button>

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
						$scope.ipinfo = '';
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
							url : 'ipinfotest.do',
							headers : {
								'Content-type' : 'application/json'
							}
					}).success(function(data, status, headers, config) {
							
							$scope.curPage = 0;
							$scope.pageSize = 10;
							$scope.ipinfo = data;
						    $scope.numberOfPages = function() {
								return Math.ceil($scope.ipinfo.length / $scope.pageSize);
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
					

		<script type="text/javascript">
		$("#insert").on('click', function(){
			if($("#ip").val()==""){
				alert("ip를 입력해 주세요");
				$("#ip").focus();
				return false;
			}
			if($("#mask").val()==""){
				alert("mask를 입력해 주세요");
				$("#mask").focus();
				return false;
			}
			if($("#usages").val()==""){
				alert("용도(부서)를 입력해 주세요");
				$("#usages").focus();
				return false;
			}
			if($("#equipment").val()==""){
				alert("장비(사용자)를 입력해 주세요");
				$("#equipment").focus();
				return false;
			}
		
			if($("#use_dept").val()==""){
				alert("사용부서를 입력해 주세요");
				$("#use_dept").focus();
				return false;
			}
			if($("#per_date").val()==""){
				alert("승인일자 입력해 주세요");
				$("#per_date").focus();
				return false;
			}
			
			if($("#category").val()=="전체"){
				if($("#mask").val()<1 || $("#mask").val()>27){
					alert("mask는 1~27만 허용됩니다.");
					$("#mask").focus();
					return false;
				}
			}
			if($("#category").val()=="대역"){
				if($("#mask").val()<24 || $("#mask").val()>34){
					alert("mask는 24~34만 허용됩니다.");
					$("#mask").focus();
					return false;
				}
			}
			if($("#category").val()=="host"){
				if($("#mask").val()!=32){
					alert("mask는 32만 허용됩니다.");
					$("#mask").focus();
					return false;
				}
			}
		});
		
// 		$("#update").on('click', function(){

// 			if($("#category").val()=="전체"){
// 				if($("#mask").val()<1 || $("#mask").val()>27){
// 					alert("mask는 1~27만 허용됩니다.");
// 					$("#mask").focus();
// 					return false;
// 				}
// 			}
// 			if($("#category").val()=="대역"){
// 				if($("#mask").val()<24 || $("#mask").val()>34){
// 					alert("mask는 24~34만 허용됩니다.");
// 					$("#mask").focus();
// 					return false;
// 				}
// 			}
// 			if($("#category").val()=="host"){
// 				if($("#mask").val()!=32){
// 					alert("mask는 32만 허용됩니다.");
// 					$("#mask").focus();
// 					return false;
// 				}
// 			}
// 		});
		</script>


</body>
</html>