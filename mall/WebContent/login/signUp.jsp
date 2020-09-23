<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<form method="post" action="/mall/login/signUpAction.jsp"><!-- 절대 주소 -->
			<label for="usr">ID:</label>
			<input type ="text" class="form-control" id="usr" name = "newUsersId" style="width:200px;">
				
			<label for="pwd">PW:</label>
			<input type ="password" class="form-control" id="pwd" name = "newUsersPw" style="width:200px;">
			
			<label for="pwd">PW Check:</label>
			<input type ="password" class="form-control" id="pwd" name = "newUsersPwCheck" style="width:200px;">
			
			<label for="usr">아무단어:</label>
			<input type ="text" class="form-control" id="usr" name = "newUsersCheck" style="width:200px;">
			<div>&nbsp;</div>
			<button type = "submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
</div>
</body>
</html>