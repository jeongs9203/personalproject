<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopBean"%>
<%@page import="food.FoodDAO"%>
<%@page import="food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// boolean isInsertResult = false ;
String id = "";

if(session.getAttribute("sId") != null) {
	id = (String)session.getAttribute("sId");
}

int price = Integer.parseInt(request.getParameter("price"));
String product_id = request.getParameter("product_id");
int qty = Integer.parseInt(request.getParameter("qty"));

if(qty > 0) {
	price *= qty;
}

session.setAttribute("price", price);
session.setAttribute("product_id", product_id);
session.setAttribute("qty", qty);

// if(isInsertResult) {
	
// }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function plusQty() {
	//		var qty = document.fr.qty.value;
		
		var qtyElem = document.fr.qty;
		var qty = qtyElem.value;
		// 폼 데이터 접근하여 value 값 가져오면 string 타입이므로 연산 시 정수형으로 변환 필요
		qtyElem.value = Number(qty) + 1; // 1만큼 증가시킨 값을 다시 표시
	}
	
	function minusQty() {
		var qtyElem = document.fr.qty;
		var qty = qtyElem.value;
		
		// 현재 수량이 1보다 클 경우에만 감소
		if(qty > 1) {
			qtyElem.value = Number(qty) - 1; // 1만큼 감소시킨 값을 다시 표시
		}
	}

	function checkLogin() {
		<%
		if(id.equals("")) {
		%>	
			alert("로그인 후 이용 가능합니다.");
			location.href = "../member/login.jsp";
			return false;
		<%	
		}
		%>
	}
	
	function openShoppingwindow() {
		window.open("shopping.jsp", "", "width = 500, height = 180");
<%-- 		<% --%>
// 		isInsertResult = true; 
<%-- 		%> --%>
	}
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />

		<div id="sub_img"></div>
		<nav id="sub_menu">
			<ul>
				<li><a href="shop.jsp">ALL FOOD</a></li>
				<li><a href="coffee.jsp">COFFEE</a></li>
				<li><a href="beverage.jsp">BEVERAGE</a></li>
				<li><a href="dessert.jsp">DESSERT</a></li>
			</ul>
		</nav>
		<article>
			<h1 class ="welcom">할리스콘</h1>
			<table>
				<tr>
					<td>상품명</td>
					<td><%=product_id %></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><%=qty %>개</td>
				</tr>
				<tr>
					<td>가격</td>
					<td><%=price %>원</td>
				</tr>
				<tr>
					<td colspan="2">
<%-- 						<input type="hidden" name="price" value="<%=price %>"> --%>
						<input type="button" value="장바구니 담기" onclick="openShoppingwindow()" >
						<input type="button" value="취소" onclick="history.back()" >
					</td>
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
