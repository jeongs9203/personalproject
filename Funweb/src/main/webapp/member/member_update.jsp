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
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

MemberBean member = new MemberBean();
member.setId(id);
member.setPass(pass);
member.setName(name);
member.setEmail(email);
member.setAddress(address);
member.setPhone(phone);
member.setMobile(mobile);

MemberDAO memberDAO = new MemberDAO();
int updateCount = memberDAO.updateMember(member);

if(updateCount > 0) {
%>
	<script>
		alert("정보 수정 성공!");
		location.href = "memberInfo.jsp";
	</script>	
<%	
} else {
%>
	<script>
		alert("정보 수정 실패!");
		history.back();
	</script>
<%	
}

%>

