<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String isDuplicate = request.getParameter("duplicate");	
String id = request.getParameter("id");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	
	function useId(id) {
		// 자식창(나)에서 부모창(나를 연 창)을 제어하려면 window.opener.xxx 형태로 제어
		window.opener.document.fr.id.value = id;
		window.opener.checkIdResult = true;
		window.close();
	}
	
	function checkId(id) {
		var checkIdResult = document.getElementById("checkIdResult");
		var regex = /^[A-Za-z0-9]{4,16}$/;
		
		if(!regex.exec(id)) {
			checkIdResult.innerHTML = "4 ~ 16자리 영문자,숫자 조합!";
			checkIdResult.style.color = "RED";
			
		} else {
			checkIdResult.innerHTML = "";
		}
	}
	
	function checkId2() {
		var checkIdResult = document.getElementById("checkIdResult");
		var id = document.getElementById("id").value;
		var regex = /^[A-Za-z0-9]{4,16}$/;
		
		if(!regex.exec(id)) {
			checkIdResult.innerHTML = "4 ~ 16자리 영문자,숫자 조합!";
			checkIdResult.style.color = "RED";
			return false;
		} else {
			checkIdResult.innerHTML = "";
			return true;
		}
	}
</script>
</head>
<body>
	<h1>아이디 중복 체크</h1>
	<form action="check_id_pro.jsp" onsubmit="return checkId2()">
		<input type="text" name="id" id = "id" required="required" <%if(id != null) { %>value="<%=id %>"<%} %> placeholder="영문, 숫자 4 ~ 16글자" >
		<input type="submit" value="중복확인">
	</form>
	<div id = "checkIdResult">
	<!-- 중복체크 결과 표시 위치 -->
	<%if(isDuplicate != null && isDuplicate.equals("true")) {%>
		<br>이미 사용중인 아이디 입니다.
		
	<%} else if(isDuplicate != null && isDuplicate.equals("false")) {%>
		<br>사용 가능한 아이디 입니다.<br>
		<!-- 자바스크립트틑 Client-Side에서 실행 JSP는 Server-Side에서 실행되므로 JSP가 먼저 실행됨-->
		<input type="button" value="아이디 사용" onclick="useId('<%=id %>')">
	<%} %>
	
	</div>
</body>
</html>