<%@page import="board.NewsDAO"%>
<%@page import="board.NewsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

NewsBean newsBean = new NewsBean();
newsBean.setNum(num);
newsBean.setName(name);
newsBean.setPass(pass);
newsBean.setSubject(subject);
newsBean.setContent(content);

NewsDAO newsDAO = new NewsDAO();
int updateCount = newsDAO.updateNews(newsBean);

if(updateCount > 0) {
	response.sendRedirect("news_content.jsp?page=" + pageNum + "&num=" + num);
} else {
%>
	<script>
		alert("글 수정 실패!");
		history.back();
	</script>
<%		
}

%>

