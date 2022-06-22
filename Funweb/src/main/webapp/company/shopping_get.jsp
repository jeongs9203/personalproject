<%@page import="food.FoodBean"%>
<%@page import="shop.ShopBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("sId");

ShopDAO shopDAO = new ShopDAO();
ArrayList<ShopBean> shopList = shopDAO.selectShopList(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />
		<article class="get">
			<h2>장바구니</h2>
			<%
			for (ShopBean shopBean : shopList) {
			%>
			<table>
				<tr>
					<%
					ArrayList<ShopBean> photoList = shopDAO.selectPhotoList(shopBean.getProduct_id());
					for (ShopBean photoBean : photoList) {
					%>
					<td><img src="<%=photoBean.getPhoto()%>" width="140"
						height="120"></td>
					<%
					}
					%>
					<td>상품명</td>
					<td><%=shopBean.getProduct_id()%></td>
					<td>수량</td>
					<td><%=shopBean.getQty()%>개</td>
					<td>금액</td>
					<td><%=shopBean.getPrice()%>원</td>
				</tr>
			</table>
			<%
			}
			%>
			<hr>
			<table>
				<tr>
					<td>총 금액</td>
					<td>원</td>
				</tr>
			</table>
		</article>
		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>