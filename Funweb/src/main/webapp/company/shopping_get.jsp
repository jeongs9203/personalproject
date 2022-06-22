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

int allPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/shopping_get.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />
		<article class="min">
			<h2>장바구니</h2>
			<%
			for (ShopBean shopBean : shopList) {
				int price = (int)shopBean.getPrice();
				allPrice += price; 
			%>
			<table class="line">
				<tr>
					<%
					ArrayList<ShopBean> photoList = shopDAO.selectPhotoList(shopBean.getProduct_id());
					for (ShopBean photoBean : photoList) {
					%>
					<td rowspan="4" class="im"><img src="<%=photoBean.getPhoto()%>" width="140"
						height="120"></td>
					<%
					}
					%>
					<td colspan="2"  class ="pb"><%=shopBean.getProduct_id()%></td>
<!-- 				<tr>	 -->
					<td class="shop">
						수량
						<span>
							<%=shopBean.getQty()%>개
						</span>
					</td>
<!-- 				</tr> -->
<!-- 				<tr>	 -->
					<td class="shop">
						금액
						<span>
							<%=shopBean.getPrice()%>원
						</span>
					</td>
<!-- 				</tr> -->
<!-- 				<tr> -->
					<td class="shop"><input type="button" value="삭제" onclick="location.href = 'shopDelete.jsp?id=<%=id%>&product_id=<%=shopBean.getProduct_id()%>'"></td> 
				</tr>
			</table>
			<%
			}
			%>
			<hr>
			<p class="pr">
				총 금액
				<span class="ap">
					<%=allPrice %>원
				</span>
			</p>
		</article>
		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>