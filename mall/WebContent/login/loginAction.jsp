<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("userId") != null){
		System.out.println("로그인 되어있는 상태입니다.");
		response.sendRedirect("/mall/index.jsp");
	}

	request.setCharacterEncoding("utf-8");

	String usersId = request.getParameter("usersId"); //goodee@naver.com
	String usersPw = request.getParameter("usersPw"); // 1234
	
	
	Users paraUser = new Users(); // 요청한 데이터 값을 저장하는 데이터 타입
	paraUser.setUsersId(usersId);
	paraUser.setUsersPw(usersPw);
	
	System.out.println(paraUser.getUsersId());
	
	UsersDao usersDao = new UsersDao();
	String userId = usersDao.usersLogin(paraUser); // 세션에 저장할 아이디 //goodee@naver.com
	System.out.println(userId);
	
	if(userId == null){
		response.sendRedirect("/mall/login/login.jsp");
		System.out.println("로그인에 실패하였습니다.");
	}else{
		System.out.println(userId); // goodee@naver.com
		session.setAttribute("userId", userId);
		
		System.out.println(session.getAttribute("userId"));
		System.out.println("로그인에 성공하였습니다......");
		response.sendRedirect("/mall/index.jsp");
	}
%>