<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>가게 위치 설정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form action="LocatePro.jsp">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=6wo4jutisc"></script>

<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<h2 align = "center">가게위치지정 버튼을 누르시면 확정 됩니다.</h2>
	<b>
	<br>
	<hr>
	<br>
<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:650px;"></div>
<div style="text-align:center; margin-top:10px;"></div>

<!-- 파라미터로 넘겨줄값 구하기 -->
<%
	String Latitude = request.getParameter("namp_lat");
	String Longitude = request.getParameter("namp_lng");
%>
	
	<input type= "hidden" name = "Latitude" value = <%=Latitude %>>
	<input type= "hidden" name = "Longitude" value = <%=Longitude %>>
	
<script type="text/javascript">

function Request(){
	 var requestParam ="";
	 
	 //getParameter 펑션
	  this.getParameter = function(param){
	  //현재 주소를 decoding
	  var url = unescape(location.href);
	  //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
	   var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
	 
	   for(var i = 0 ; i < paramArr.length ; i++){
	     var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	 
	     if(temp[0].toUpperCase() == param.toUpperCase()){
	       // 변수명과 일치할 경우 데이터 삽입
	       requestParam = paramArr[i].split("=")[1];
	       break;
	     }
	   }
	   return requestParam;
	 }
	}


var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(35.1799817, 128.1076213),
    zoom: 15
});
var request = new Request();
var a = request.getParameter("namp_lat");
var b = request.getParameter("namp_lng");
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(a, b),
    map: map
});

			</script>
		<div align = "center">
		<input type= "submit" value = "가게위치지정" style="width:200px; height:50px;"> 
		</div>
	</form>
</body>
</html>