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
	List<PortInfoDTO> dto = dao.portInfoSelect();
	%>
	<body>
	<script type="text/javascript">
        function port1(){
            location.href="port1.jsp";
        }
        function port2(){
            location.href="port2.jsp";
        }
    </script>
	
	<h2 align = "center">배송사와 담당부서</h2>
	<b>
	<br>
	<hr>
	<br>
	<table width="100%" border="0" cellpadding = "10px">
	<tr style = "background-color:skyblue;">		
		<td>택배회사</td><td>회사주소</td><td>회사번호</td>
		<td>담당부서명</td><td>부서주소</td><td>부서번호</td>
	</tr>
		
			<% 
				for(int i = 0; i < dto.size(); i++){
				
			%>
				<tr>
					<td><%= dto.get(i).getpCompanyName() %></td>
					<td><%= dto.get(i).getpCompanyAddress() %></td>
					<td><%= dto.get(i).getpCompanyPhone() %></td>
					<td><%= dto.get(i).getPORTDEPARTName() %></td>
					<td><%= dto.get(i).getPORTDEPARTAddress() %></td>
					<td><%= dto.get(i).getPORTDEPARTPhone() %></td>
				</tr>
			
			<%
				}
			%>		

	</table>
	<br><br>
	<div align = "center">
		<input type="button" value="당일배송요금" onclick="port1()"
     style="width:200px; height:50px;"/>
     		<input type="button" value="기본배송요금" onclick="port2()"
     style="width:200px; height:50px;"/>
     	</div>
     	</b>
	</body>
	</html>