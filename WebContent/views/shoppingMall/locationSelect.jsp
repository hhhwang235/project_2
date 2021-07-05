<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>내 상점 위치</title>

<script src="http://code.jquery.com/jquery-latest.min.js">
function go_editLocate(){
    location.href="../MyMarketLocate.jsp";
	}
</script>
</head>
<body>
<h2 align = "center"><%=request.getParameter("id") %>님의 가게위치</h2>
<br>
<b>
<hr>
<br>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mn7cwsrvym"></script>

<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<div id="map" style="margin:0 auto; width:1800px; max-width:100%; height:650px;"></div>
<div style="text-align:center; margin-top:10px;"></div>


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
var a = request.getParameter("Latitude");
var b = request.getParameter("Longitude");
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(a, b),
    map: map
});

</script>

</body>
</html>