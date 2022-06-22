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
		<article id = "ab">
			<h1 class ="welcom">자기소개</h1>
			<div class ="ou">
				<table>
					<tr>
						<td class = "info">상세정보</td>
					</tr>
				</table>
				<table class = "oh">
					<tr>
						<th>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
						<td>소정완</td>
					</tr>
					<tr>
						<th>생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</th>
						<td>1996.10.10</td>
					</tr>
					<tr>
						<th>핸 드 폰</th>
						<td>010-4912-6545</td>
					</tr>
					<tr>
						<th>이 메 일</th>
						<td>jeongs9203@naver.com</td>
					</tr>
					<tr>
						<th>블 로 그</th>
						<td>blog.naver.com</td>
					</tr>
					<tr>
						<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
						<td>부산광역시 부산진구 신천대로 7</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td class = "info">자격정보</td>
					</tr>
				</table>
				<table  class = "oh">
					<tr>
						<th>2021.07</th>
						<td>ATC캐드마스터 1급</td>
					</tr>
					<tr>
						<th>2021.08</th>
						<td>CAD실무능력평가 2급</td>
					</tr>
						<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			<div class ="ou">
				<table>
					<tr>
						<td class = "info">학력사항</td>
					</tr>
				</table>
				<table class = "oh">
					<tr>
						<th>2022.02</th>
						<td>동의대학교 졸업</td>
					</tr>
					<tr>
						<th>2015.01</th>
						<td>거제옥포고등학교 졸업</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td class = "info">경력사항</td>
					</tr>
				</table>
				<table  class = "oh">
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>