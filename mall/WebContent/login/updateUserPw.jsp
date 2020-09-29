<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>updateUserPw</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String usersPw = null;
		String usersPwCk = null;
		Users users = null;
		
		if(request.getParameter("usersPw")!=null && request.getParameter("usersPwCk")!=null){ // 변경할 비밀번호가 입력되었을 때 
			String usersId = request.getParameter("usersId");
			usersPw = request.getParameter("usersPw");
			usersPwCk = request.getParameter("usersPwCk");
			users = new Users();
			users.setUsersId(usersId); 
			users.setUsersPw(usersPw);
			System.out.println(users.getUsersId() +"<--users.getUsersId()"); // 디버깅*--------
			System.out.println(users.getUsersPw() +"<--users.getUsersPw()");
			System.out.println(usersPwCk +"<--usersPwCk"); // 변경할 pw 확인
		}
	%>
	
	<div class = "container">
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
		</div>
		<%
			if(request.getParameter("usersId")!=null && usersPw == null){//처음 비밀번호 입력할 인터페이스
				System.out.println("처음 인터페이스"); // 디버깅*--------
		%>
		
				<form method="post" action ="<%=request.getContextPath() %>/login/updateUserPw.jsp?usersId=<%=request.getParameter("usersId")%>">
					<label for="pwd">PW 변경:</label>
					<input type ="text" class="form-control" id="pwd" name = "usersPw" style="width:300px;">
					<label for="pwd">PW 확인:</label>
					<input type ="text" class="form-control" id="pwd" name = "usersPwCk" style="width:300px;">
					<button type="submit">비밀번호 변경</button>
				</form>
				
		<%
			}else if(request.getParameter("usersId")!=null && !usersPw.equals(usersPwCk)){ // 아이디 정보를 사용하여 비밀번호 변경
				System.out.println("pw / pwCk 불일치 인터페이스"); // 디버깅*--------
		%>
		
				<h3>비밀번호를 다시 확인해주세요.</h3>
				<form method="post" action ="<%=request.getContextPath() %>/login/updateUserPw.jsp?usersId=<%=request.getParameter("usersId")%>">
					<label for="pwd">PW 변경:</label>
					<input type ="password" class="form-control" id="pwd" name = "usersPw" style="width:300px;">
					<label for="pwd">PW 확인:</label>
					<input type ="password" class="form-control" id="pwd" name = "usersPwCk" style="width:300px;">
					<button type="submit">비밀번호 변경</button>
				</form>
				
		<%
		
			}else{ // 아이디 정보를 사용하여 비밀번호 변경
				System.out.println("성공");
				UsersDao usersDao = new UsersDao();
				usersDao.updateUsersPw(users);
				response.sendRedirect(request.getContextPath()+"/login/login.jsp");
			}
		%>
	</div>
</body>
</html>