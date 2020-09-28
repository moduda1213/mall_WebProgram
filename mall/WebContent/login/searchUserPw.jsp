<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
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
<title>searchUserPw</title>
</head>
<body>
	<%
	/*
		ID 질문 입력
		* 둘다 일치할 때
		1) 둘다 일치한다면 비밀번호 변경  --> updateUserPw.jsp
		 -> 다시 비번 만들어 보완성도 챙기기
		 -> select user_pw from user where user_id=? and user_check=?
		 -> update user set user_pw=? where user_id=?
		2) 불일치 시 비번 찾기 페이지 그대로 유지
	*/
		request.setCharacterEncoding("utf-8");
		
		
		String usersId = request.getParameter("usersId"); // 아이디 
		String usersCheck = request.getParameter("usersCheck"); // 질문
		
		Users users = new Users();
		users.setUsersId(usersId);
		users.setUsersCheck(usersCheck);
		System.out.println(users.getUsersId()+"<---users.getUsersId()");//디버깅------------
		System.out.println(users.getUsersCheck()+"<---users.getUsersCheck()");
		
		UsersDao usersDao = new UsersDao();
		boolean ck = usersDao.searchIdCheck(users); // ck -> true / false
	%>
	
	<div class ="container">
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h3>PW 찾기</h3>
		
			<%
				if(ck){ // ck == true 일 때 즉 아이디 질문 둘다 일치 했을 때 비번 변경 허용 -> updateUserPw.jsp
					System.out.println(users.getUsersId() +"<--users.getUsersId()전송");
					response.sendRedirect(request.getContextPath()+"/login/updateUserPw.jsp?usersId="+users.getUsersId());//유저 아이디를 사용하여 비밀번호 수정할것
				}else{	//처음보여주는 인터페이스 or 불일치 일 경우
			%>
				<form method="post" action ="<%=request.getContextPath() %>/login/searchUserPw.jsp">
					<label for="usr">ID:</label>
					<input type ="text" class="form-control" id="usr" name = "usersId" style="width:300px;">
					<div>&nbsp;</div>
					<label for="usr">나의 질문:</label>
					<input type ="text" class="form-control" id="usr" name = "usersCheck" style="width:300px;">
					<div>&nbsp;</div>
					<button type="submit" class="btn btn-primary">검색</button>
				</form>
			<%
				}
			%>
	</div>
</body>
</html>