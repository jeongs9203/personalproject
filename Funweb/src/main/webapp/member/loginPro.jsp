<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberBean member = new MemberBean();
member.setId(id);
member.setPass(pass);

MemberDAO dao = new MemberDAO();
boolean isLoginSucess = dao.checkUser(member);   

if(isLoginSucess) {
	session.setAttribute("sId", id);
	response.sendRedirect("../main/main.jsp");
} 
%>
	<script>
		alert("아이디 또는 패스워드 틀림");
		history.back();
	</script>
<%
%>
