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
	<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include> 
	</div>
	<div class="jumbotron">
	  <h1>로그인</h1>
	</div>
	
	<div class="form-group">
		<form method="post" action="<%=request.getContextPath() %>/login/loginAction.jsp"><!-- 절대 주소 -->
			<label for="usr">email ID:</label>
			<input type ="text" class="form-control" id="usr" name = "usersId" style="width:300px;" value="goodee@naver.com">
				
			<label for="pwd">PW:</label>
			<input type ="password" class="form-control" id="pwd" name = "usersPw" style="width:300px;" value="1">
			<div>&nbsp;</div>
			<button type = "submit" class="btn btn-secondary">로그인 </button>
			<a href="<%=request.getContextPath() %>/login/searchUserForm.jsp" class="btn btn-secondary">ID/PW찾기</a>
		</form>
	</div>
</div>
</body>
</html>