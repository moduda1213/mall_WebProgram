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
	<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include> 
	</div>
	
	<div class="row"> <!-- 전체 카테고리3 / 이미지 배너9 -->
		<div class="col-sm-3"> <!-- 전체 카테고리 -->
			<div class="btn-group-vertical">
				<div class="btn btn-primary" style="width:200px;">전체 카테고리</div>
				<%
					for(Category c : categoryList1 ){
				%>
						<div class="btn btn-light" style="width:200px;"><%=c.getCategoryName() %></div>
				<%
					}
				%>
			</div>
		</div>
		<div class="col-sm-8">
			<div id="demo" class="carousel slide" data-ride="carousel"> <!-- 슬라이드 이미지 -->

			    <img src="<%=request.getContextPath() %>/image/Thanksgiving.jpeg" style = "width:800px;" alt="Thanksgiving">
			</div>
		</div>
	</div>
	
	<div>&nbsp;</div>
	
	<div class="row"> <!-- 추천 카테고리 이미지 링크 -->
		<%
			for(Category c : categoryList2){
		%>
				<div class="col-sm-3"><a href=""><img src="<%=request.getContextPath() %>/image/<%=c.getCategoryPic() %>" class="rounded-circle" alt="Cinque Terre"></a></div>
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
	  		<button type="button" class="btn btn-light"><%=p.getProductName() %></button>
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
						<img class="card-img-top" src="<%=request.getContextPath()%>/image/<%=p.getProductPic() %>">
							<div class="card-body">
								<h4 class="card-title">
									<a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>">
										<%=p.getProductName() %>
									</a>
								</h4>
								<p class="card-text"><%=p.getProductPrice() %></p>
							</div>
						</div>
						<span>&nbsp;</span>
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
	
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<!-- 최근 공지 2개 -->
	<div>
		<table>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
			</tr>
			<%
				for(Notice n : noticeList){
			%>
					<tr>
						<td><a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId() %>"><%=n.getNoticeId() %></a></td>
						<td><%=n.getNoticeTitle() %></td>
					</tr>
			<%
				}
			%>
		</table>
	</div>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
</div>
</body>
</html>