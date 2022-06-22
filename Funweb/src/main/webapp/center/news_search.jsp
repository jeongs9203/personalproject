<%@page import="board.NewsBean"%>
<%@page import="board.NewsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//  --------------------- 페이징 처리 ---------------------------------
request.setCharacterEncoding("UTF-8");
String search = request.getParameter("search");
String searchType = request.getParameter("searchType");
int pageNum = 1;

if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page"));
}

int listLimit = 10;	// 한 페이지 당 표시할 목록 갯수
int pageLimit = 10;	// 한 페이지 당 표시할 페이지 갯수

NewsDAO newsDAO = new NewsDAO();
int listCount = newsDAO.searchListCount(search, searchType);


int maxPage = (int)Math.ceil((double)listCount / listLimit);
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;

if(endPage > maxPage) {
	endPage = maxPage;
}

ArrayList<NewsBean> searchList = newsDAO.selectSearchList(search, pageNum, listLimit, searchType);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
<!-- 		헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
<!-- 		헤더 들어가는곳 -->

<!-- 		본문들어가는 곳 -->
<!-- 		본문 메인 이미지 -->
		<div id="sub_img_center"></div>
<!-- 		왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">Notice</a></li>
				<li><a href="news.jsp">Public News</a></li>
				<li><a href="driver_download.jsp">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
<!-- 		본문 내용 -->
		<article>
			<h1>Search</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<%
				for(NewsBean newsBean : searchList) {
				%> 
				<tr onclick="location.href = 'news_content.jsp?num=<%=newsBean.getNum() %>&page=<%=pageNum %>'">
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
				<form action="news_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name" <%if(searchType.equals("name")){ %> selected="selected" <%} %>>작성자</option>
					</select>
					<input type="text" name="search" class="input_box"  value="<%=search%>" required="required">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
<!-- 			페이징 처리 -->
			<div class="clear"></div>
			<div id="page_control">
				<%if(pageNum > 1) { // 이전페이지가 존재할 경우 %>	
					<a href="news_search.jsp?page=<%=pageNum - 1 %>&search=<%=search%>&searchType=<%=searchType%>">Prev</a>
				<%} else { // 이전페이지가 존재하지 않을경우 %>	
					Prev&nbsp;
				
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++){%>
					<%if(pageNum == i) {%>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else {%>
						<a href="news_search.jsp?page=<%=i %>&search=<%=search%>&searchType=<%=searchType%>"><%=i %></a>
					<%}%>
				<%}%>
				
				<%if(pageNum < maxPage) {%>
					<a href="news_search.jsp?page=<%=pageNum + 1 %>&search=<%=search%>&searchType=<%=searchType%>">Next</a>
				<%} else {%>
					&nbsp;Next
				<%} %>
			</div>
		</article>

		<div class="clear"></div>
<!-- 		푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
<!-- 		푸터 들어가는곳 -->
	</div>
</body>
</html>


