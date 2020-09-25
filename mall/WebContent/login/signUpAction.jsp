<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("newUsersId");
	String userPw = request.getParameter("newUsersPw");
	String userPwCheck = request.getParameter("newUsersPwCheck");
	String userCheck = request.getParameter("newUsersCheck");
	String userName = request.getParameter("newUsersName");
	
	if(!userPw.equals(userPwCheck)){
		System.out.println("비밀번호가 일치하지 않습니다.");
		response.sendRedirect("/mall/login/signUp.jsp");
	}
	
	Users paraNewUser =new Users();
	paraNewUser.setUsersId(userId);
	paraNewUser.setUsersPw(userPw);
	paraNewUser.setUsersCheck(userCheck);
	paraNewUser.setUsersName(userName);
	
	UsersDao usersDao = new UsersDao();
	usersDao.signUpUser(paraNewUser);
	
	response.sendRedirect("/mall/login/login.jsp");
%>