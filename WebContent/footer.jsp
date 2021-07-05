<%@page import="mybatis.dao.VisitantDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.footer{ 
		position:fixed;
		bottom:0; 
		margin:1%;
		width:97%; 
		height:20%;
		}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		VisitantDAO dao = new VisitantDAO();		
	%>
	<div class = "footer" style="font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid; border-radius: 12px;">
     		<div style = "padding:10">
     		상호명(주)황호현 | 대표이사 : 황호현 | 개인정보 책임자 : 황호현 기술이사 | 호스팅 제공자 : (주) 황호현 <br>
     		사업자 등록 번호 : 000000000 | FAX : 000000 <br>
     		주소 : 경상남도 진주시 000 <br>
     		이용약관 | 개인정보 처리방침 <br>
     		COPYRIGHT (C) 2012 00000 CORP. ALL RIGHT RESERVERD
     		</div>
     		
     		<div style="position: absolute; right: 30px; bottom: 7px;">
     		총 방문횟수 :  <%= dao.visitantAll() %>  
     		</div>
	</div>
</body>
</html>