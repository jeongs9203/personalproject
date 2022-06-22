<%@page import="food.FoodBean"%>
<%@page import="food.FoodDAO"%>
<%@page import="board.NewsBean"%>
<%@page import="board.NewsDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<!-- inc/top.jsp 페이지가 포함될 위치 -->
		<%-- jsp:include 액션태그의 page 속성으로 포함할 페이지 지정 --%>
		<jsp:include page="../inc/top.jsp" />
		<%-- include 디렉티브의 file 속성으로 포함할 페이지 지정 --%>
<%-- 		<%@ include file="../inc/top.jsp" %> --%>
		<!-- 헤더 들어가는곳 -->
		  
		<div class="clear"></div>   
		<!-- 본문들어가는 곳 -->
		<!-- 메인 이미지 -->
		<div id="main_img"><img src="../images/when-coffee.png" width="100%" height="100%"></div>
		<!-- 본문 내용 -->
		<article id="front">
		  	<div id="solution">
		  		<%
		  		FoodDAO foodDAO = new FoodDAO();
		  		%>
		  		<div id="hosting" onclick="location.href = '../company/foodDetail.jsp?name=애플%20망고%20스무디'">
		  			<h3>&nbsp;&nbsp;&nbsp;애플 망고 스무디</h3>
		  		</div>
		  		<div id="security" onclick="location.href = '../company/foodDetail.jsp?name=샤인머스캣%20코코%20스파클링'">
		  		  	<h3>샤인머스캣 코코 스파클링</h3>
		  		</div>
		  		<div id="payment" onclick="location.href = '../company/foodDetail.jsp?name=샤인머스캣%20봉봉%20스무디'">
		  			<h3>샤인머스캣 봉봉 스무디</h3>
		  		</div>
		  	</div>
		  	<div class="clear"></div>
			<div id="sec_news">
				<h3 class="orange">&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h3>
				<table>
					<%
					NewsDAO newsDAO = new NewsDAO();
					ArrayList<NewsBean> newsList = newsDAO.selectRecentNewsList();
					
					for(NewsBean newsBean: newsList) {
					%>
						<tr onclick="location.href='../center/news_content.jsp?num=<%=newsBean.getNum() %>&page=1'">
							<td width="320" class = "contxt"><%=newsBean.getSubject() %></td>
							<td width="80"><%=newsBean.getName() %></td>
							<td width="80"><%=newsBean.getDate() %></td>
						</tr>
					<%
					}
					%> 
				</table>
			</div>
			
			
			<div id="news_notice">
		  		<h3 class="brown">&nbsp;&nbsp;고객 게시판</h3>
				<table>
					<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardBean> boardList = boardDAO.selectRecentBoardList();
					
					// &page=<%=boardBean.pageNum
					for(BoardBean boardBean: boardList) {
					%>
							<!-- 게시물 행 클릭시 notice_content.jsp 페이지로 이동(해당 게시물 표시) -->
							<tr onclick="location.href='../center/notice_content.jsp?num=<%=boardBean.getNum() %>&page=1'">
<%-- 							<a href="../center/notice_content.jsp?num=<%=boardBean.getNum() %>&page=1"> --%>
								<td width="320" class = "contxt"><%=boardBean.getSubject() %></td>
								<td width="80"><%=boardBean.getName() %></td>
								<td width="80"><%=boardBean.getDate() %></td>
							</tr>
					<%
					}
					%>
				</table>
		  	</div>
	  	</article>
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<!-- inc/bottom.jsp 페이지가 포함될 위치 -->
		<%-- jsp:include 액션태그의 page 속성으로 포함할 페이지 지정 --%>
		<jsp:include page="../inc/bottom.jsp" />
		<%-- include 디렉티브의 file 속성으로 포함할 페이지 지정 --%>
<%-- 		<%@ include file="../inc/bottom.jsp" %> --%>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


