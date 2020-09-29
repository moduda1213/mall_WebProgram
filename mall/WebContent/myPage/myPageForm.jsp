<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%
	if(session.getAttribute("userId") == null){
		System.out.println("로그인 상태가 아닙니다.");
		response.sendRedirect("/mall/login/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>myPageForm</title>
</head>
<body>
	<%
		/*
			비밀번호 변경 -> 비밀번호 변경 jsp로 이동
			회원 탈퇴 -> 비밀번호 확인 -> 승인대기 -> admin승인 -> 탈퇴(id를 통해 delete)
			
		*/
		String userId = (String)session.getAttribute("userId"); // 로그인 되어잇는 아이디/이메일
		System.out.println(userId+"<--userId");
		UsersDao usersDao = new UsersDao();
		Users user = new Users();
		user = usersDao.selectUserId(userId); //
		System.out.println(user.getUsersName()+"<--user.getUsersName()");
	%>
	<div class ="container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include> 
		</div>
		<h3>회원 정보</h3>
		<table class="table">
			<tr>
				<th>이름</th>
				<td><%=user.getUsersName() %></td>
			</tr>
			<tr>
				<th>비밀번호 변경</th>
				<td><a href="<%=request.getContextPath()%>/myPage/checkPw.jsp?usersPw=<%=user.getUsersPw() %>" class="btn btn-light">변경</a></td>
			</tr>
			<tr>
				<th>회원탈퇴</th>
				<%
					if(user.getUsersWithdrawal().equals("N")){
				%>
						<td><a href="<%=request.getContextPath() %>/myPage/wdrCheckPw.jsp?userWdr=<%=user.getUsersWithdrawal() %>" class="btn btn-light">탈퇴</a></td>
				<%
					}else{
				%>
						<td>승인 중... &nbsp; <a href="<%=request.getContextPath() %>/myPage/wdrCheckPw.jsp?userWdr=<%=user.getUsersWithdrawal() %>" class="btn btn-light">탈퇴 취소</a></td>
						
				<%
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>