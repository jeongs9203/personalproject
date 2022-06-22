<%@page import="board.NewsBean"%>
<%@page import="board.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = "";

if(session.getAttribute("sId") != null) {
	id = (String)session.getAttribute("sId");
}

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");

NewsDAO newsDAO = new NewsDAO();
newsDAO.updateReadCount(num);

NewsBean newsBean = newsDAO.selectNews(num);


%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_content.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />
	
		<div id="sub_img_center"></div>
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">Notice</a></li>
				<li><a href="news.jsp">Public News</a></li>
				<li><a href="driver_download.jsp">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>

		<article>
			<h1>Notice Content</h1>
			<table id="notice">
				<tr>
					<td>글번호</td>
					<td><%=newsBean.getNum() %></td>
					<td>글쓴이</td>
					<td><%=newsBean.getName() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=newsBean.getDate() %></td>
					<td>조회수</td>
					<td><%=newsBean.getReadcount() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=newsBean.getSubject() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><%=newsBean.getContent() %></td>
				</tr>
			</table>

			<div id="table_search">
				<input type="button" value="글수정" class="btn" <%if(id.equals("admin")) { %> onclick="location.href = 'news_update.jsp?num=<%=newsBean.getNum() %>&page=<%=pageNum%>'"<%} else { %> onclick=" alert('글수정 권한 없음!')" <%} %>> 
				<input type="button" value="글삭제" class="btn" <%if(id.equals("admin")) { %> onclick="location.href = 'news_delete.jsp?num=<%=newsBean.getNum() %>&page=<%=pageNum%>'"<%} else { %> onclick=" alert('글삭제 권한 없음!')" <%} %>> 
				<input type="button" value="글목록" class="btn" onclick="location.href = 'news.jsp?page=<%=pageNum%>'">
			</div>

			<div class="clear"></div>
		</article>

		<div class="clear"></div>
		<jsp:include page="../inc/bottom.jsp" />
	</div>
</body>
</html>


