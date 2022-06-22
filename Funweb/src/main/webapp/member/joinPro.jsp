<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address1") + request.getParameter("address2");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

// 회원가입에 필요한 파라미터 데이터를 하나의 객체로 관리하기 위해 MemberBean 객체 활용

MemberBean member = new MemberBean();
member.setId(id);
member.setPass(pass);
member.setName(name);
member.setEmail(email);
member.setAddress(address);
member.setPhone(phone);
member.setMobile(mobile);

MemberDAO dao = new MemberDAO();
int insertCount = dao.insertMember(member); 

if(insertCount > 0) {
	response.sendRedirect("joinSucess.jsp");
} else {
%>
	<script>
		alert("회원 가입 실패!");
		history.back();
	</script>
<%	
}
	

%>    

