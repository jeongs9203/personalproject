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

FoodDAO foodDAO = new FoodDAO();
ArrayList<FoodBean> foodList = 	foodDAO.selectFoodList();
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
			<%for(FoodBean foodBean : foodList) {%>
			<table id = "all">
				<tr onclick="location.href = 'foodDetail.jsp?name=<%=foodBean.getName()%>'">
					<td>
						<img src="<%=foodBean.getPhoto() %>" width="140" height="130">
						<div>
							<p class="name"><%=foodBean.getName() %></p>
							<p class="price"><%=foodBean.getPrice() %>원</p>
						</div>
					</td>
				</tr>
			</table>
			<%} %>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
