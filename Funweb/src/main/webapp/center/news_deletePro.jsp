<%@page import="board.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");
String pass = request.getParameter("pass");

NewsDAO newsDAO = new NewsDAO();
int deleteCount = newsDAO.deleteNews(num, pass);

if(deleteCount > 0) {
	response.sendRedirect("news.jsp?page=" + pageNum);
} else {
%>
	<script>
		alert("글 삭제 실패!");
		history.back();
	</script>
<%	
}
%>
