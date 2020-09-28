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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include>
		</div>
		<h3>ID/PW찾기</h3>
		<div>&nbsp;</div>
		<div class = "row">
			<div class="col-sm-6" >
				<a href="<%=request.getContextPath() %>/login/searchUserId.jsp" class="btn btn-secondary">ID 찾기</a>
			</div>
			
			<div class="col-sm-6">
				<a href="<%=request.getContextPath() %>/login/searchUserPw.jsp" class="btn btn-secondary">PW 찾기</a>
			</div>
		</div>
	</div>
	
</body>
</html>