<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

BoardBean boardBean = new BoardBean();
boardBean.setName(name);
boardBean.setPass(pass);
boardBean.setSubject(subject);
boardBean.setContent(content);

BoardDAO boardDAO = new BoardDAO();
int insertCount = boardDAO.insertBoard(boardBean);

if(insertCount > 0) {
	response.sendRedirect("notice.jsp");	
} else {
%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
<%
}
%>
