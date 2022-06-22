<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>map/mapForm.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wdq1rymald"></script>
<style type="text/css">
#map {
	margin: 0px auto;
}

#maps{
 	width: 100%; 
}

h2 {
	font-size: 30px;
	font-weight: bold;
}

th {
	font-size: 16px;
}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../inc/top.jsp" />

		<div id="sub_img"></div>
		
		<!-- 본문 내용 -->
		<article class="get">
			<h2>본사</h2>
			<table id = "maps">
				<tr>
					<th>주소</th>
					<td>서울특별시 종로구 율곡로 88 삼환빌딩 8층 (운니동)</td>
				</tr>
				<tr>
					<th>오시는 길</th>
					<td>안국역 4번 출구 250m 직진</td>
				</tr>
			</table>
		</article>
				
			
		<div id="map" style="width:97%;height:340px;"></div>
		
		<script>
// 			var mapOptions = {
// 			mapTypeControl: true, 
//     		center: new naver.maps.LatLng(37.5767837, 126.9889126),
//     		zoom: 18
// 			};
			
			var map = new naver.maps.Map('map', {
			    center: new naver.maps.LatLng(37.5767837, 126.9889126),
			    zoom: 15  
			});
			
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(37.5767837, 126.9889126),
			    map: map
			});
			

			var map = new naver.maps.Map('map', mapOptions);
		</script>
		
		<jsp:include page="../inc/bottom.jsp" />
	</div>
</body>
</html>


    