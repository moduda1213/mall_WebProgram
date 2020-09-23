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
<title>Index</title>
</head>
<body>
<%
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList(); //전체 카테고리 리스트
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList(); // 추천 카테고리 이미지 리스트
%>


<div class = "container">
	<div>&nbsp;</div>
	<div>&nbsp;</div>

	<div class="row"><!-- 최상단 검색바 -->
	  <div class="col"><h1>Goodee Shop</h1></div>
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
			</div>
	<%
		}else{ 										// 로그인 상태일 때만 보이는 인터페이스
	%>
			<div class="col">
			  	<div class ="row">
			  		<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3"><i class='fas fa-user-alt' style='font-size:48px;color:black'></i></div>
					<div class="col-sm-3"><i class='fas fa-shopping-cart' style='font-size:48px;color:black'></i></div>
			  	</div>
			  </div>
			</div>
	<%
		}
	%>
	<div>&nbsp;</div>
	
	<%
		if(session.getAttribute("userId") == null){
	%>
		<div><!-- 로그인/회원가입 메뉴바  (비로그인 상태일 때)-->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
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
				      <a class="nav-link" href="/mall/login/logoutAction.jsp">Sign Out</a>
				    </li>
				  </ul>
				</nav>
			</div>
	<%
		}
	%>
	<div>&nbsp;</div>
	
	<div class="row"> <!-- 전체 카테고리3 / 이미지 배너9 -->
		<div class="col-sm-3"> <!-- 전체 카테고리 -->
			<div class="btn-group-vertical">
				<div class="btn btn-primary">전체 카테고리</div>
				<%
					for(Category c : categoryList1 ){
				%>
						<div class="btn btn-light" style="width:250px;"><%=c.CategoryName %></div>
				<%
					}
				%>
			</div>
		</div>
		<div class="col-sm-9">
			<img src="<%=request.getContextPath() %>/image/Thanksgiving.jpeg"style = width:825px;><!-- request.getContextPath : 프로젝트 명을 리턴한다. -->
		</div>
	</div>
	
	<div>&nbsp;</div>
	
	<div class="row"> <!-- 추천 카테고리 이미지 링크 -->
		<%
			for(Category c : categoryList2){
		%>
				<div class="col-sm-3"><a href=""><img src="<%=request.getContextPath() %>/image/<%=c.CategoryPic %>" class="rounded-circle" alt="Cinque Terre"></a></div>
		<%
			}
		%>
	</div>
	
	<div>&nbsp;</div>
	
	<%
		Calendar today = Calendar.getInstance();
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
	<!-- 카테고리별 추천상품 -->
	<h3>오늘의 추천상품 <span class="badge badge-primary"><%=today.get(Calendar.YEAR) %>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DAY_OF_MONTH) %></span></h3>
	
	<div>&nbsp;</div>
	
	<div class="btn-group btn-group-lg">  <!-- 카테고리별 추천상품 메뉴 -->
		<%
			for(Product p : productList){
		%>
	  		<button type="button" class="btn btn-light"><%=p.productName %></button>
	  	<%
	  		}
	  	%>
	</div>
	
	<div>&nbsp;</div>
	
	<table> <!-- 카테고리별 추천상품 메뉴별 상품 목록 -->
		<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i=i+1;
			%>
					<td>
						<div class="card" style="width:375px">
						<img class="card-img-top" src="<%=request.getContextPath()%>/image/<%=p.productPic%>">
							<div class="card-body">
								<h4 class="card-title"><%=p.productName %></h4>
								<p class="card-text"><%=p.productPrice %></p>
							</div>
						</div>
					</td>
			<%
					if(i%3==0){
			%>
						</tr><tr>
			<%
					}
				}
			%>
	</table>
	
</div>
</body>
</html>