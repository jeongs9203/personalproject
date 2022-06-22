<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
MemberDAO memberDAO = new MemberDAO();
boolean isDuplicate = memberDAO.checkId(id);

response.sendRedirect("check_id.jsp?id=" + id + "&duplicate=" + isDuplicate);


// if(isDuplicate){
// 	out.println("아이디 중복");
// } else {
// 	out.println("아이디 사용 가능");
// }
%>