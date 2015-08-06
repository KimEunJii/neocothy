<%@page import="com.netcruz.iims.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<h1>list</h1>
	${list}
	<form action="insert.do">
	no :<input type="text" name="no" /> <br>
	title :<input type="text" name="title" />
	<input type="submit">
	</form>
	
	<div ng-app="myApp">
<div ng-controller="UserCtrl" >

{{board.a}}


</div>
</div>


<script>
var myApp = angular.module('myApp', []);
myApp.controller('UserCtrl', ['$scope', '$http', function ($scope, $http){

//   빈 문자열로 초기화
  $scope.board = '';

  // 서버에 사용자 이름을 요청
  $http({
    method: 'GET',
    url: 'test2.do',
    headers : {'Content-type' : 'application/json'}

  })  
  .success(function (data, status, headers, config) {
    // 서버로부터 받아온 사용자 이름을 모델에 할당!
    $scope.board = data;
//     window.alert($scope.board.a);
  })
  .error(function (data, status, headers, config) {
    // 이런. 뭔가 잘못되었음! :(
	  window.alert("fail");
  });
 }]);
  

  </script>
	
	
</body>
</html>