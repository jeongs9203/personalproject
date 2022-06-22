<%@page import="food.FoodDAO"%>
<%@page import="food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = "";

if(session.getAttribute("sId") != null) {
	id = (String)session.getAttribute("sId");
}

String name = request.getParameter("name");

FoodDAO foodDAO = new FoodDAO();
FoodBean foodBean = foodDAO.selectEachFood(name);

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
			<form action="shopping_set.jsp" name="fr" onsubmit="return checkLogin()">
				<input type="hidden" name="product_id" value="<%=name %>">
				<input type="hidden" name="price" value="<%=foodBean.getPrice() %>">
				<table>
					<tr>
						<td>
							<img src="<%=foodBean.getPhoto() %>">
						</td>
						<td>
							<div>
								<p class="mss"><%=name %></p>
								<p class="cof">
								구매수량 : <input type="text" name="qty" value="1"  class = "id">
								<input type="button" value="▲" onclick="plusQty()">
								<input type="button" value="▼" onclick="minusQty()">
								</p>
								<p class="cof">판매가격 : <%=foodBean.getPrice() %> 원</p>
								<p>
								<input type="submit" value="구매하기">
								<input type="button" value="목록" onclick="location.href = 'shop.jsp'">
								</p>
							</div>
						</td>	
					</tr>
				</table>
			</form>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
