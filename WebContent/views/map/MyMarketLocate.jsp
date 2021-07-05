<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>가게 위치잡기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form action="MyMarketMap.jsp">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mn7cwsrvym"></script>

<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<h2 align = "center">가게의 위치를 지정해 주세요</h2>
	<b>
	<br>
	<hr>
	<br>
<div id="naverMap" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
<div style="text-align:center; margin-top:10px;">
	<b>위도 :</b> <input type="text" name="namp_lat" style="width:200px; height:50px;" />
	<b>경도 :</b> <input type="text" name="namp_lng" style="width:200px; height:50px;" />
	<input type = "submit" value = "위치 확인하러 가기" style="width:200px; height:50px;">
</div>

<script>

var nmap = new naver.maps.Map('naverMap', { // naverMap 값은 div 의 id 값
	center : new naver.maps.LatLng(35.1799817, 128.1076213), // 지도 중앙 위치 : 위도, 경도 설정
	zoom : 14, // 줌 설정 : 1~14, 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
	zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
	zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
		position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정값
	},
	mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)
});


naver.maps.Event.addListener(nmap, 'click', function(e){
	// 제이쿼리 사용
	$('[name=namp_lat]').val( e.coord.lat() ); // 위도
	$('[name=namp_lng]').val( e.coord.lng() ); // 경도
});

		</script>
		</form>
	</body>
</html>