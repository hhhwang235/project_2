<%@page import="mybatis.dto.PortSelectDTO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dto.PortInfoDTO"%>
<%@page import="mybatis.dao.PortInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head><title>택배</title></head>
	<%
	PortInfoDAO dao = new PortInfoDAO();
	List<PortSelectDTO> dto = dao.portInfoSelectCase("택배");
	%>
	<body>

	<h2 align = "center">기본배송요금</h2>
	<b>
	<br>
	<hr>
	<br>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">		
		<td>택배회사</td><td>기본배송비</td><td>도서산간비용</td>
	</tr>
		
			<% 
				for(int i = 0; i < dto.size(); i=i+2){
				
			%>
				<tr>
					<td><%= dto.get(i).getpCompanyName() %></td>
					<td><%= dto.get(i).getPortPrice() %></td>
					<td><%= dto.get(i).getExcludedAreaPrice() %></td>
				</tr>
			
			<%
				}
			%>		

	</table>
		
	</body>
	</html>