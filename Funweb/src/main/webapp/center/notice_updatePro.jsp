<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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

BoardBean boardBean = new BoardBean();
boardBean.setNum(num);
boardBean.setName(name);
boardBean.setPass(pass);
boardBean.setSubject(subject);
boardBean.setContent(content);

BoardDAO boardDAO = new BoardDAO();
int updateCount = boardDAO.updateBoard(boardBean);

if(updateCount > 0) {
	response.sendRedirect("notice_content.jsp?page=" + pageNum + "&num=" + num);
} else {
%>
	<script>
		alert("글 수정 실패!");
		history.back();
	</script>
<%		
}

%>

