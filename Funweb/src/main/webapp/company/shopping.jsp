<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = (String)session.getAttribute("sId");
int price = (int)session.getAttribute("price");
String product_id = (String)session.getAttribute("product_id");
int qty = (int)session.getAttribute("qty");

ShopBean shopBean = new ShopBean();
shopBean.setId(id);
shopBean.setProduct_id(product_id);
shopBean.setPrice(price);
shopBean.setQty(qty);

ShopDAO shopDAO = new ShopDAO();
shopDAO.insertShop(shopBean, product_id, id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/shopping.jsp</title>
<script type="text/javascript">
	function foodMove() {
		window.opener.location.href = "shop.jsp";
		window.close();
	}
	
	function shoppingMove() {
		window.opener.location.href = "shopping_get.jsp";
		window.close();
	}
</script>
</head>
<body>
	<h1>장바구니 담기가 완료되었습니다.</h1>
	<input type="button" value="장바구니 이동" onclick="shoppingMove()">
	<input type="button" value="음식 계속 담기" onclick="foodMove()">
</body>
</html>