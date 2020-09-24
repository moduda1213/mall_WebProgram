<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	if(session.getAttribute("userId") != null){
		System.out.println("로그인 되어있는 상태입니다.");
		response.sendRedirect("/mall/index.jsp");
	}
%>

<%
	request.setCharacterEncoding("utf-8");

	String addr = request.getParameter("addr"); // 현재 주소 가져오기
	System.out.print(addr);
	String usersId = request.getParameter("uesersId");
	String usersPw = request.getParameter("usersPw");
	
	Users paraUser = new Users();
	paraUser.usersId = usersId;
	paraUser.usersPw = usersPw;
	
	UsersDao usersDao = new UsersDao();
	Users usersLogin = usersDao.usersLogin(paraUser);
	
	if(usersLogin == null){
		response.sendRedirect("/mall/login/login.jsp");
		System.out.println("로그인에 실패하였습니다.");
	}else{
		session.setAttribute("userId", usersLogin.usersId);
		System.out.println("로그인에 성공하였습니다.");
		response.sendRedirect("/mall/index.jsp");
	}
%>