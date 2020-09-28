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
<title>searchUserId</title>
</head>
<body>
	
	<%
		/*
			이름과 일치하는 아이디를 불러오기 -> 여러명일 수 있으니 while(rs.next())
			조건으로 데이터가 있을 때 와 없을 때 나오는 인터페이스가 다르게
			있을 경우 아이디가 나오고 비번을 찾을 수 있도록  searchUserPwForm.jsp 로 이동
		*/
		
		request.setCharacterEncoding("utf-8");
			
		String usersName = null;
		ArrayList<String> usersId = null;
		if(request.getParameter("usersName") != null){ // 회원 이름 입력 시 검색
			
			usersName = request.getParameter("usersName"); //회원 이름 불러오기
			System.out.println(usersName +"<--usersName");// ----디버깅-----
			
			UsersDao usersDao = new UsersDao();
			
			usersId = usersDao.findUserId(usersName); // 회원 이름으로 된 아이디 불러오기
		}
		
		
	%>
	
	<div class ="container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include> 
		</div>
		<%
			if(usersName == null){ // 처음 or 이름 입력을 하지 않았을 때
				System.out.println("첫 화면");
		%>
			<h3>ID 찾기</h3>
			<form method="post" action ="<%=request.getContextPath() %>/login/searchUserId.jsp">
				<label for="usr">이름:</label>
				<input type ="text" class="form-control" id="usr" name = "usersName" style="width:300px;">
				<div>&nbsp;</div>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		<%
			}else{ // 검색 했을 경우
				System.out.println("검색 성공");
				for(String s : usersId){
		%>
				<div class ="row">
					<div class="col-sm-3">
						<input type ="text" class="form-control" id="usr" style="width:300px;" readonly="readonly" value ="<%=s %>">
					</div>
					<div class="col-sm-3">
						<a href ="<%=request.getContextPath() %>/login/searchUserPw.jsp" class="btn btn-secondary">PW찾기</a>
					</div>
				</div>
				<div>&nbsp;</div>
		<%
				}
			}
		%>
	</div>
</body>
</html>