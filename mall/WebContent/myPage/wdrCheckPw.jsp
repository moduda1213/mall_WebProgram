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
		//2. 회원 탈퇴 / 취소 요청
		//N값이 오면 탈퇴신청 -> Y변경, Y값이 오면 탈퇴신청취소 -> N변경
		//탈퇴하는 회원의 아이디도 가져와야 함
		
		boolean ck = false; // 비밀번호 불일치 시  true -> "다시 한번 입력" 문구 출력
		
		Users user =new Users();
		UsersDao usersDao = new UsersDao();
		user = usersDao.selectUserId((String)session.getAttribute("userId"));
		
		String userPwCheck = request.getParameter("userPwCheck"); //비밀번호 확인 입력값
		
		System.out.println(userPwCheck+"<-userPwCheck"); //비밀번호 확인 입력값 디버깅
		System.out.println(user.getUsersPw()+"<-user.getUsersPw()"); //현재 비밀번호 디버깅
		
		if(!user.getUsersPw().equals(userPwCheck)){//비번 일치 여부 확인
			ck = true;
		}
		
		String userWdr= null;//회원 탈퇴 Y, 회원 탈퇴 취소/초기값 N
		
		if(request.getParameter("userWdr")!=null){//탈퇴신청
			userWdr=request.getParameter("userWdr");
		
			if(userWdr.equals("N")){
				user.setUsersWithdrawal("Y");
				usersDao.wdrUser(user);
				response.sendRedirect(request.getContextPath()+"/myPage/myPageForm.jsp");
			}else{
			user.setUsersWithdrawal("N");
			usersDao.wdrUser(user);
			response.sendRedirect(request.getContextPath()+"/myPage/myPageForm.jsp");
			}
		}
	%>
	
</body>
</html>