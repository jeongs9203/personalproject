<%@page import="board.NewsBean"%>
<%@page import="board.NewsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

int pageNum = 1; // 1페이지를 기본페이지로 설정

if(request.getParameter("page") != null) { // 페이지가 null이 아닌경우
	pageNum = Integer.parseInt(request.getParameter("page")); // 전달된 페이지 값 pageNum에 넣어주기
}

int listLimit = 10;	// 한 페이지 당 목록의 개수
int pageLimit = 10;	// 한 페이지 당 페이지의 개수

NewsDAO newsDAO = new NewsDAO();
int listCount = newsDAO.selectListCount(); // 테이블에 저장된 목록 개수 조회

int maxPage = (int)Math.ceil((double)listCount / listLimit); 
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;

if(endPage > maxPage) {
	endPage = maxPage;
}

//BoardDAO 객체의 selectBoardList()메서드를 호출하여 게시물 목록 조회
ArrayList<NewsBean> NewsList = newsDAO.selectNewsList(pageNum, listLimit);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/news.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />

		<div id="sub_img_center"></div>
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">고객 게시판</a></li>
				<li><a href="news.jsp">공지사항</a></li>
				<li><a href="driver_download.jsp">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<article>
			<h1>공지사항</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<%
				for(NewsBean newsBean : NewsList) {
				%>
				
				<tr onclick="location.href = 'news_content.jsp?page=<%=pageNum %>&num=<%=newsBean.getNum() %>'">
					<td><%=newsBean.getNum() %></td>
					<td class="left"><%=newsBean.getSubject() %></td>
					<td><%=newsBean.getName() %></td>
					<td><%=newsBean.getDate() %></td>
					<td><%=newsBean.getReadcount() %></td>
				</tr>
				
				<%
				}
				%>
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href = 'news_write.jsp'">
			</div>
			<div id="table_search">
				<form action="news_search.jsp" method="post">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
			<div class="clear"></div>
			<div id="page_control">
				<%if(pageNum > 1) {%>	
					<a href="news.jsp?page=<%=pageNum - 1 %>">Prev</a>
				<%} else {%>	
					Prev&nbsp;
				
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++){%>
					<%if(pageNum == i) {%>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else {%>
						<a href="news.jsp?page=<%=i %>"><%=i %></a>
					<%}%>
				<%}%>
				
				<%if(pageNum < maxPage) {%>
					<a href="news.jsp?page=<%=pageNum + 1 %>">Next</a>
				<%} else {%>
					&nbsp;Next
				<%} %>
			</div>
		</article>

		<div class="clear"></div>
		<jsp:include page="../inc/bottom.jsp" />
	</div>
</body>
</html>

