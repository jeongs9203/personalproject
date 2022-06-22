<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li><a href="welcome.jsp">HOLLYS</a></li>
				<li><a href="history.jsp">History</a></li>
				<li><a href="brand_identity.jsp">BI 소개</a></li>
				<li><a href="#">Public Policy</a></li>
			</ul>
		</nav>
		<article>
			<h1 class ="welcom">BI 소개</h1>
			<figure class="ceo">
				<img src="../images/company/img_bilogo.jpg">
			</figure>
			<hr>
			<p class = "crown">
				HOLLYS CROWN<br>
				커피의 즐거움을 만드는 작은 차이의 미학
			</p>
			<p class ="history">	
				CROWN(왕관) 형상은 할리스를 매개로 고객과 바리스타가 손을 맞잡고 있는 형태를 상징합니다.<br>
				이는 할리스를 방문하시는 고객의 이야기에 귀 기울이고 진심을 담아 서비스하는 마음을 담고 있습니다.
			</p>
			<hr>
			<p class = "crown">
				HISTORY OF HOLLYS LOGO
			</p>
			<img src="../images/company/img_bi_history.jpg">
			<hr>
			<div class = "red">
				<p class = "crown">
					HOLLYS RED
				</p>
				<p class ="history">	
					할리스 레드는<br>
					할리스의 열정과 신뢰 그리고 서비스 정신을 의미합니다.
				</p>
			</div>
			<img src="../images/company/holly_color.png">
			<hr>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
