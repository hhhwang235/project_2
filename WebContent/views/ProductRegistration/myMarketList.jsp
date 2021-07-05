<%@page import="java.util.List"%>
<%@page import="mybatis.dto.GoodsDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("marketlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품 목록</title>
</head>
<body>
<div align="center">
	<h3>내가 올린 상품 목록</h3>
	<b>
	<br>
	<hr>
	<br>
	
		
		 <%
		 String a = "등록한 상품이 없습니다.";
		 if(list.size() == 0) {
			 out.println("<h3 style = 'font-size:20px;'>" + a + "</h3>");
		 } else {
			 %>
			 <table border="1" style="width: 80%;">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>등록인</th>
			<th>사진(세부 내용 보기)</th>
			<th>판매가격</th>
			<th>남은수량</th>
		</tr>
			 <% 
			 for(int i = 0; i < list.size(); i++) {
				 out.println("<tr align='center'>");
					out.println("<td>" + (list.size() - i) + "</td>");
					out.println("<td>" + list.get(i).getgName() + "</td>");
					out.println("<td>" + session.getAttribute("sessionID") + "</td>");
					out.println("<td> <a href = 'myMarketModify.do?g_num=" + list.get(i).getgNum() +
							"'>" + "<img src = 'goodsupload/" + list.get(i).getgImage() +
							"' width='150' height='150' />" + "</a></td>");
					out.println("<td>" + list.get(i).getgPrice() + "</td>");
					out.println("<td>" + list.get(i).getgAmount() + "<br>" + "</td>");
				out.println("</tr>");
			 }
		 }
		 %>	 	
	</table>
	</b>
</div>
</body>
</html>