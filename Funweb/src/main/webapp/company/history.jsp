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
			<h1 class ="welcom">HISTOTY</h1>
			<figure class="ceo">
					<figcaption>할리스의 탄생 그리고 오늘</figcaption>
			</figure>
		
			<p class = "history">
				할리스(Hollys)는 1998년 6월 서울 강남에 한국 최초로 에스프레소 전문점을 오픈한 커피 브랜드 입니다.
				부드럽고 깊은 커피 맛을 선호하는 한국 사람들의 입맛에 맞게 오픈 초창기부터 원두를 독자적으로 로스팅해 고객들의 사랑을 받고 있습니다.
				할리스만의 시그니처 메뉴 확립은 물론, 소비자가 시간대별로 다양하게 즐길 수 있는 베이커리나 플레이트 등 메뉴 라인업을 확장하고 있습니다.
				또한 소비자 이용행태를 반영해 상권 별로 1인 좌석, 그룹석, 드라이브 스루 등 맞춤화된 매장을 선보이고 있습니다.
				현재 약 510개의 매장을 운영하고 있으며, 트렌드를 선도하는 다양한 활동으로 해마다 두 자릿수 성장을 이어가며 대한민국 대표 커피전문기업으로
				자리매김하고 있습니다.
			</p>
			<img src="../images/company/hollys_history.jpg">
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
