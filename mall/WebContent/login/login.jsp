<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userId") != null){
		System.out.println("로그인 되어있는 상태입니다.");
		response.sendRedirect("/mall/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>login</title>
</head>
<body>
<div class="container">

	<div class="jumbotron">
	  <h1>로그인</h1>
	</div>
	
	<div class="form-group">
		<form method="post" action="/mall/login/loginAction.jsp"><!-- 절대 주소 -->
			<label for="usr">email ID:</label>
			<input type ="text" class="form-control" id="usr" name = "usersId" style="width:300px;">
				
			<label for="pwd">PW:</label>
			<input type ="password" class="form-control" id="pwd" name = "usersPw" style="width:300px;">
			<div>&nbsp;</div>
			<button type = "submit" class="btn btn-secondary">로그인 </button>
			<button type = "submit" class="btn btn-secondary"> ID/PW찾기</button>
		</form>
	</div>
</div>
</body>
</html>