<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="views/map/Locate.jsp">
 	<% 
     	String id = session.getAttribute("sessionID").toString();
		LatitudeLongitudeDAO ldao = new LatitudeLongitudeDAO();
		String dto = ldao.LatitudeLongitudeSelectTest(id);
		if(dto == null){
			out.print("지도정보가 없습니다.");
			%>
			<input type = "submit" value = "넘어가기">
		<% 	
			}
		%>
</form>
</body>
</html>