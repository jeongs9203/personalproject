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
shopDAO.insertShop(shopBean);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function foodMove() {
		// 자식창(나)에서 부모창(나를 연 창)을 제어하려면 window.opener.xxx 형태로 제어
		window.opener.location.href = "shop.jsp";
		window.close();
	}
	
	function shoppingMove() {
		// 자식창(나)에서 부모창(나를 연 창)을 제어하려면 window.opener.xxx 형태로 제어
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