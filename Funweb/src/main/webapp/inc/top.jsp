<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String id = (String)session.getAttribute("sId");
%>    
<header>
  <!-- login join -->
  
  <div id="login">
  	<%if(id == null) { %>
 		<a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a>
 	<%} else { %>
 		<a href="../member/memberInfo.jsp"><%=id %>님</a> | <a href="../member/logout.jsp">로그아웃</a>
 		<%if(id.equals("admin")) { %>
 			| <a href="../admin/admin.jsp">관리자페이지</a>
 		<%} else if(id != null) {%>
 		 	| <a href="../company/shopping_get.jsp">장바구니 </a>
 		<%} %>
 	<%} %>
 
 <!-- -------------------------------------------------------------------------------------------------------- -->
 
<%--  	<c:choose> --%>
<%--  		<c:when test="${empty sessionScope.sId }"> --%>
<!--  			<a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>\	 -->
<%--  		</c:when> --%>
<%--  		<c:otherwise> --%>
<%--  			<a href="#">${sessionScope.sId }님</a> | <a href="../member/logout.jsp">logout</a> --%>
<%--  		</c:otherwise> --%>
<%--  	</c:choose> --%>

  </div>
  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><a href="../main/main.jsp"><img src="../images/main_logo.png" width="100%"></a></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
  	<ul>
  		<li><a href="../main/main.jsp">HOME</a></li>
  		<li><a href="../company/welcome.jsp">COMPANY</a></li>
  		<li><a href="../company/shop.jsp">SOLUTIONS</a></li>
  		<li>
  			<a href="../center/notice.jsp">
  				CUSTOMER CENTER
  			</a>
  		</li>
  		<li><a href="../map/mapForm.jsp">CONTACT US</a></li>
  	</ul>
  </nav>
</header>