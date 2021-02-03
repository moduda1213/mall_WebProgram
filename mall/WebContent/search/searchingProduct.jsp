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
<title>Searching</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String searchingText = null;
		if(request.getParameter("searchingText")!=null){
			searchingText = request.getParameter("searchingText");
			System.out.println(searchingText+"<-searchingText");
		}
		
		ArrayList<Product> st = new ArrayList<Product>(); // 정보 받을 곳
		ProductDao productDao = new ProductDao();
		st = productDao.searchingProduct(searchingText);
		
		
	%>
	<div class = "container">
		<div>
			<jsp:include page = "/inc/menu.jsp"></jsp:include> 
		</div>
		
		<table class = "table table-hover">
			<tr>
				<th>상품 사진</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>품절 여부</th>
			</tr>
			<%
				for(Product p : st){
			%>
					<tr>
						<td>
							<img src="<%=request.getContextPath()%>/image/<%=p.getProductPic()%>">
						</td>
						<td><a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName() %></a></td>
						<td><%=p.getProductPrice() %></td>
						<td><%=p.getProductSoldout() %></td>
					</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>