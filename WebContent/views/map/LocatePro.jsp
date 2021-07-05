<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="security.Sha256"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
    <title>위치정보 수정처리</title>
   
</head>
<%
    	request.setCharacterEncoding("utf-8");
        String id = session.getAttribute("sessionID").toString();
    
        
    	//LatitudeLongitudeDAO 에서 사용자 정보 가져오기
    	
    	LatitudeLongitudeDTO dto = new LatitudeLongitudeDTO();
 
    	dto.setlMembers(id);
    	dto.setLatitude(request.getParameter("Latitude"));
    	dto.setLongitude(request.getParameter("Longitude"));
    	
    	LatitudeLongitudeDAO dao = new LatitudeLongitudeDAO();
    	dao.LatitudeLongitudeInsert(dto);
%>

<body>
		
    <%
    	response.sendRedirect("../../MainForm.jsp");
    %>
	
</body>
</html>