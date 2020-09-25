<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
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
		int productId = Integer.parseInt(request.getParameter("productId")); // 상품 하나 검색을 위해

		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
	%>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>

		<h1>상품상세보기</h1>
			<div class ="row">
				<div class ="col-sm-6">
					<table class="table">
						<tr>
							<th>product_id</th>
							<td><%=product.getProductId()%></td>
						</tr>
						<tr>
							<th>product_name</th>
							<td><%=product.getProductName()%></td>
						</tr>
						<tr>
							<th>prduct_price</th>
							<td><%=product.getProductPrice()%></td>
						</tr>
						<tr>
							<th>prduct_content</th>
							<td><%=product.getProductContent()%></td>
						</tr>
						<tr>
							<th>product_pic</th>
							<td><img
								src="<%=request.getContextPath()%>/image/<%=product.getProductPic()%>"></td>
						</tr>
						<tr>
							<th>product_soldout</th>
							<td><%=product.getProductSoldout()%></td>
						</tr>
					</table>
				</div>
				<%
					/*
						주소
						--------------
						수량 up down
						--------------
						구매 버튼
					*/
				%>
				<div class ="col-sm-6">
					<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
						<input type="hidden" value="<%=product.getProductId()%>" name="productId"> 
						<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
						<div class ="form-group">
							<label for="usr">배송주소: </label>
							<input type="text" name="ordersAddr" class="form-control" id="usr">
						</div>
						<div>
							<select name="ordersAmount"> <!-- 구매할 상품 수량 -->
								<%
									for (int i = 1; i < 11; i++) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								%>
							</select>개
						</div>
						<button type="submit" type="button" class="btn btn-light">주문</button>
					</form>
				</div>		
		</div>
	</div>
</body>
</html>