<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("page");
String pass = request.getParameter("pass");

BoardDAO boardDAO = new BoardDAO();
int deleteCount = boardDAO.deleteBoard(num, pass);

if(deleteCount > 0) {
	response.sendRedirect("notice.jsp?page=" + pageNum);
} else {
%>
	<script>
		alert("글 삭제 실패!");
		history.back();
	</script>
<%	
}
%>
