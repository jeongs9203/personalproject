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
				<li><a href="welcome.jsp">ABOUT</a></li>
				<li><a href="history.jsp">History</a></li>
				<li><a href="brand_identity.jsp">BI 소개</a></li>
				<li><a href="about.jsp">자기소개</a></li>
			</ul>
		</nav>
		<article>
			<h1 class ="welcom">ABOUT</h1>
			<figure class="ceo">
				<img src="../images/company/hollys.png" width="100%">
			</figure>
			<p>
				다양한 토양과 기후에서 자란 커피 원두는 그 속에 각기 다른 맛과 향의 비밀을 숨기고 있습니다.<br>
				생두를 로스팅하여 에스프레소를 만드는 과정은 단순하고 평범해 보이지만, 사실은 로스팅과 추출법 등의 <br> 미묘하고 작은 차이가
				커피 맛을 변화시킵니다.
			</p>
			<p>
				원두에 숨겨진 이러한 커피의 비밀을 하나 하나 밝혀가면서 많은 사람들이 커피와 함께 소중한 순간을<br> 즐기도록 해주는 것이
				바로 할리스가 추구하는 ‘커피의 즐거움’입니다.
			</p>
			<p>
				오늘도 할리스는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등<br> 다양한
				노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록,<br> 매 순간 의미 있는 작은 차이를
				만들어가는 할리스가 되겠습니다.
			</p>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


