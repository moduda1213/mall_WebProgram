<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<div class = "container">

	<div>&nbsp;</div>
	<div>&nbsp;</div>

	<div class="row"><!-- 최상단 검색바 -->
	  <div class="col">
	  	<h1><a href="<%=request.getContextPath() %>/index.jsp" data-toggle="tooltip" title="HOME으로" style= "color:black;">Goodee Shop</a></h1>
	  </div>
	  <div class="col">
			<form>
				<input type ="text" style= "width:290px; height:39px;">
				<button type="submit"><i class='fas fa-search' style='font-size:25px; height:30px;'></i></button>
			</form>
	  </div>
	  
	 <%
		if(session.getAttribute("userId") == null){  // 비로그인 상태일 때만 보이는 인터페이스
	 %>		
	 		<div class="col">
			  	<div class ="row">
			  		<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
			  	</div>
			</div>
	<%
		}else{ 										// 로그인 상태일 때만 보이는 인터페이스
	%>
			<div class="col">
			  	<div class ="row">
			  		<div class="col-sm-3"></div>
			  		<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<a href="#" class='fas fa-user-alt' style='font-size:48px;color:black' data-toggle="tooltip" title="마이페이지"></a>
					</div>
					<div class="col-sm-3">
						<a href="#" class='fas fa-shopping-cart' style='font-size:48px;color:black' data-toggle="tooltip" title="장바구니"></a>
					</div>
			  	</div>
			  </div>
	<%
		}
	%>
	</div>
	<div>&nbsp;</div>
	
	<%
		if(session.getAttribute("userId") == null){
	%>
		<div><!-- 로그인/회원가입 메뉴바  (비로그인 상태일 때)-->
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			  <!-- Links -->
			  <ul class="navbar-nav">
			    <li class="nav-item" >
			      <a class="nav-link" href="/mall/login/login.jsp">Sign In</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/mall/login/signUp.jsp">회원가입</a>
			    </li>
			  </ul>
			</nav>
		</div>
	<%
		}else{
	%>
			<div><!-- 로그인/회원가입 메뉴바  (로그인 상태일 때)-->
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				  <!-- Links -->
				  <ul class="navbar-nav">
				    <li class="nav-item" >
				      <a class="nav-link" href="/mall/login/logoutAction.jsp?">Sign Out</a>
				    </li>
				  </ul>
				</nav>
			</div>
	<%
		}
	%>
	<div>&nbsp;</div>
</div>