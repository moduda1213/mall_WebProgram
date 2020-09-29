<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
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
<title>Insert title here</title>
</head>
<body>
	<%
		/*
			myPage -> 비밀번호 변경 , 회원 탈퇴 과정에서 이 페이지를 거쳐감
		*/
		request.setCharacterEncoding("utf-8");
	
		String userPwCheck=null; 	// 현재 회원의 비밀번호와 맞게 입력해야하는 입력값
		String usersPw =null; 		// 현재 회원의 비밀번호
		boolean ck = false; 		// true가 될 때 "다시 입력" 문구 출력
		System.out.println(request.getParameter("userWdr")+"<---userWdr");
		
		
		if(request.getParameter("userPwCheck")!=null && request.getParameter("usersPw")!=null){
			usersPw = request.getParameter("usersPw"); // 현재 회원의 비밀번호
			userPwCheck = request.getParameter("userPwCheck"); // 입력한 비밀번호
			System.out.println(usersPw+"<--usersPw");
			System.out.println(userPwCheck+"<---userPwCheck");
			
			//1. 회원 PW 변경할 때
			if(userPwCheck.equals(usersPw)){ // 입력한 비밀번호 == 현재 회원의 비밀번호
				System.out.println("성공");
				response.sendRedirect(request.getContextPath()+"/login/updateUserPw.jsp?usersId="+(String)session.getAttribute("userId"));
			}else{							 //불일치 시
				System.out.println("실패");
				ck = true;
			}
		}
	%>
	
	<div class ="container">
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h3>PW 확인</h3>
		
		<%
			if(ck){
		%>
				<h3>다시 한번 확인해주세요.</h3>
		<%
			}
		%>
		
		<form method="post" action ="<%=request.getContextPath() %>/myPage/checkPw.jsp?usersPw=<%=request.getParameter("usersPw")%>">
			<label for="pwd">비밀번호 확인:</label>
			<input type ="password" class="form-control" id="pwd" name = "userPwCheck" style="width:300px;">
			<div>&nbsp;</div>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
</body>
</html>