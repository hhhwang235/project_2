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
     		��ȣ��(��)Ȳȣ�� | ��ǥ�̻� : Ȳȣ�� | �������� å���� : Ȳȣ�� ����̻� | ȣ���� ������ : (��) Ȳȣ�� <br>
     		����� ��� ��ȣ : 000000000 | FAX : 000000 <br>
     		�ּ� : ��󳲵� ���ֽ� 000 <br>
     		�̿��� | �������� ó����ħ <br>
     		COPYRIGHT (C) 2012 00000 CORP. ALL RIGHT RESERVERD
     		</div>
     		
     		<div style="position: absolute; right: 30px; bottom: 7px;">
     		�� �湮Ƚ�� :  <%= dao.visitantAll() %>  
     		</div>
	</div>
</body>
</html>