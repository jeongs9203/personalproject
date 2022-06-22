<%@page import="board.NewsDAO"%>
<%@page import="board.NewsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

NewsBean newsBean = new NewsBean();
newsBean.setName(name);
newsBean.setPass(pass);
newsBean.setSubject(subject);
newsBean.setContent(content);

NewsDAO newsDAO = new NewsDAO();
int insertCount = newsDAO.insertNews(newsBean);

if(insertCount > 0) {
	response.sendRedirect("news.jsp");	
} else {
%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
<%
}
%>
