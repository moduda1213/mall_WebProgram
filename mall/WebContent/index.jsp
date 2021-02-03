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
		<div class="col-sm-3 px-4"> <!-- 전체 카테고리 -->
			<div class="btn-group-vertical">
				<div class="btn btn-primary" style="width:230px;height:50px;">전체 카테고리</div>
				<%
					for(Category c : categoryList1 ){
				%>
						<div class="btn btn-light" style="width:230px;height:50px"><%=c.getCategoryName() %></div>
						<div></div>
				<%
					}
				%>
			</div>
		</div>
		<div class="col-sm-8">
			<div id="demo" class="carousel slide" data-ride="carousel"> <!-- 슬라이드 이미지 -->

			    <img src="<%=request.getContextPath() %>/image/newYear.jpg" style = "width:800px;height:500px" alt="event">
			</div>
		</div>
	</div>
	
	<br>
	
	<%
		Calendar today = Calendar.getInstance();
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
	<!-- 카테고리별 추천상품 -->
	<h3>오늘의 추천상품 <span class="badge badge-primary"><%=today.get(Calendar.YEAR) %>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DAY_OF_MONTH) %></span></h3>
	
	<br>
	
	<table> <!-- 카테고리별 추천상품 메뉴별 상품 목록 -->
		<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i=i+1;
			%>
					<td>
						<div class="card" style="width:375px; height:485px;">
						<img class="card-img-top" src="<%=request.getContextPath()%>/image/<%=p.getProductPic() %>"
							style="width:370px;height:310px">
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
		<div class="text-right"><a href="<%=request.getContextPath()%>/notice/noticeList.jsp" style="color:black"><strong>전체 공지</strong></a></div>
		
		<table class="table table-hover">
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
	<span>아직 익숙하지 않아서 속도도 느려 사진넣고, 장바구니 기능 못만들었어.. 그리고 기능 몇몇은 완벽하게 만들지 못해서 만족스럽지가 않아.
	특히 코드가 너무 더러워. 먼저 생각하고 그림을 그리고 어느정도 틀이 잡혔을 때 만들었으면 코드도 깔끔했을 거 같은데 .. 나름 그림그리고 했다지만 머리속으로만
	생각하고 코드짜는건 확실히 비효율적인것 같아. 다음에는 오래걸리더라도 하나쯤은 제대로 머리속으로만 생각하지말고 적어보고 하자. oven으로.. 그래도 처음보다
	주석이 많이 써서 좋았어. 나름 신경쓰고 있었는데 귀찮더라도 했던게 만들고 보니까 좀 괜찮더라. 그래도 코드가 더러워서 주석이 잘 않읽혀..
	다음에는 생각한걸 그려보고 주석도 좀더 간단하게 적어보자.</span>
</div>
</body>
</html>