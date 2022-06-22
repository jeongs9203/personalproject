<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	var checkIdResult = false, isRetypePassCheck = false, checkPassResult = false;
	
	function openCheckIdwindow(){
		window.open("check_id.jsp", "", "width = 400, height = 250");
	}
	
	function checkPass(pass) {
		var spanElem = document.getElementById("checkPassResult");
		var lengthRegex = /^[A-Za-z0-9!@#$%^&]{8,16}$/;
		var engUpperRegex = /[A-Z]/;
		var engLowerRegex = /[a-z]/;
		var numRegex = /[0-9]/;
		var specRegex = /[!@#$%^&]/;
		
		var count = 0;
		
		if(lengthRegex.exec(pass)) {
// 			spanElem .innerHTML = "사용 가능한 패스워드";
// 			spanElem .style.color = "GREEN";
			
// 			checkPassResult = true;
			if(engUpperRegex.exec(pass)) count++;
			if(engLowerRegex.exec(pass)) count++;
			if(numRegex.exec(pass)) count++;
			if(specRegex.exec(pass)) count++;
			
			switch (count) {
			case 4:
				spanElem.innerHTML = "사용 가능한 패스워드(안전)";
				spanElem.style.color = "GREEN";
				checkPassResult = true;
				break;
			case 3:
				spanElem.innerHTML = "사용 가능한 패스워드(보통)";
				spanElem.style.color = "YELLOW";
				checkPassResult = true;
				break;
			case 2:
				spanElem.innerHTML = "사용 가능한 패스워드(위험)";
				spanElem.style.color = "ORANGE";
				checkPassResult = true;
				break;
			default:
				spanElem.innerHTML = "영문자,숫자,특수문자 중 2가지 이상 조합 필수!";
				spanElem.style.color = "RED";
				checkPassResult = false;
			}
		} else {
// 			spanElem.innerHTML = "사용 불가능한 패스워드";
			spanElem.innerHTML = "영문자,숫자,특수문자 조합 8 ~ 16자리 필수";
			spanElem.style.color = "RED";
			
			checkPassResult = false;
		}
	}

	function checkRetypePass(repass){
		var pass = document.fr.pass.value;
		var checkRetypePassResult = document.getElementById("checkRetypePassResult");
		
		if(pass == repass) {
			checkRetypePassResult.innerHTML = "비밀번호 일치";
			checkRetypePassResult.style.color = "green";
			
			isRetypePassCheck = true;
		} else {
			checkRetypePassResult.innerHTML = "비밀번호 불일치";
			checkRetypePassResult.style.color = "red";
			
			isRetypePassCheck = false;
		}
	}
	
	function checkSubmit() {
		if(checkIdResult  == false) {
			alert("아이디 중복확인 필수입니다!");
			document.fr.id.focus();
			return false;
		} else if(checkPassResult == false){
			alert("사용 불가능한 비밀번호 입니다!");
			document.fr.pass.focus();
			return false;
		} else if(isRetypePassCheck == false){
			alert("비밀번호가 불일치 합니다!");
			document.fr.pass2.focus();
			return false;
		} else {
			return true;
		}
	}
	
	 function Postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }

 
	
</script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->
		  
		<!-- 본문들어가는 곳 -->
		  <!-- 본문 메인 이미지 -->
		  <div id="sub_img_member"></div>
		  <!-- 왼쪽 메뉴 -->
		  <nav id="sub_menu">
		  	<ul>
		  		<li><a href="#">Join us</a></li>
		  		<li><a href="#">Privacy policy</a></li>
		  	</ul>
		  </nav>
		  <!-- 본문 내용 -->
		  <article>
		  	<h1>Join Us</h1>
		  	<form action="joinPro.jsp" method="post" id="join" name="fr" onsubmit="return checkSubmit()">
		  		<fieldset>
		  			<legend>Basic Info</legend>
		  			<label>User Id</label>
		  			<input type="text" name="id" class="id" id="id" required="required" readonly="readonly" placeholder="중복체크 버튼 클릭">
		  			<input type="button" value="dup. check" class="dup" id="btn" onclick="openCheckIdwindow()">
		  			<br>
		  			
		  			<label>Password</label>
		  			<input type="password" name="pass" id="pass" required="required"  placeholder="영문,숫자,특수문자 8~16글자" onkeyup="checkPass(this.value)">			
		  			<span id = "checkPassResult"></span>
		  			<br>
		  			
		  			<label>Retype Password</label>
		  			<input type="password" name="pass2" required="required" onkeyup="checkRetypePass(this.value)">
		  			<span id = "checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span>
		  			<br>
		  			
		  			<label>Name</label>
		  			<input type="text" name="name" id="name" required="required"><br>
		  			
		  			<label>E-Mail</label>
		  			<input type="email" name="email" id="email" required="required"><br>
		  			
		  		</fieldset>
		  		
		  		<fieldset>
		  			<legend>Optional</legend>
		  			<label>Post code</label>
		  			<input type="text" name="post_code" id="postcode" readonly="readonly"  placeholder="검색 버튼 클릭">
		  			<input type="button" value="search" onclick="Postcode()" class="dup"><br>
		  			<label>Address</label>
		  			<input type="text" name="address1" id="address" readonly="readonly">
		  			<input type="text" name="address2" id="extraAddress" placeholder="상세주소 입력"><br>
		  			<label>Phone Number</label>
		  			<input type="text" name="phone" ><br>
		  			<label>Mobile Phone Number</label>
		  			<input type="text" name="mobile" ><br>
		  		</fieldset>

		  		<div class="clear"></div>
		  		<div id="buttons">
		  			<input type="submit" value="Submit" class="submit">
		  			<input type="reset" value="Cancel" class="cancel">
		  		</div>
		  	</form>
		  </article>
		  
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


