<%@page import="mybatis.dao.OrderDetailDAO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dto.OrderDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	OrderDetailDAO dao = new OrderDetailDAO();
	List<OrderDetailDTO> list = dao.orderDetail((String)session.getAttribute("sessionID"));
%>
<style>
<style>
  table {
    width: 100%;
    border: 0px solid #444444;
    border-collapse: collapse;
  }
  th{
    border: 0px solid #444444;
    padding: 5px;
  }
  .test{
  	border: 0px solid #444444;
    padding: 5px;
  }

</style>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
	<div align="center">
	<h2>주문 완료</h2>
	<br>
	<hr>
	<br>
	<table border = "0" style="width: 100%;">
		<tr align = center>	
			<td><b>이미지</b></td>
			<td><b>상품명</b></td>
			<td><b>판매가</b></td>
			<td><b>판매자</b></td>
			<td><b>수령인</b></td>
			<td><b>배송주소</b></td>
			<td><b>연락처</b></td>
			<td><b>배송방법</b></td>
			<td><b>배송요청사항</b></td>
			<td><b>구매수량</b></td>
			<td><b>결제금액</b></td>
			<td><b>결제일자</b></td>	
		</tr>	
		<%	
			int score = 0;
			for(int i =0; i < 1; i++){
				score = score + Integer.parseInt(list.get(i).getoSumPrice());
		%>
		<tr>
		<% 
	out.println("<th>" + "<img src = 'goodsupload/" + list.get(0).getgImage() + "' width='70' height='70' />" + "</th>");
		%>
			<th><%= list.get(0).getgName() %></th>
			<th><%= list.get(0).getgPrice() %></th>
			<th><%= list.get(0).getgCommenter() %></th>
			<th><%= list.get(0).getoName() %></th>
			<th><%= list.get(0).getoAddress() %></th>
			<th><%= list.get(0).getoPhone() %></th>
			<th><%= list.get(0).getoPort() %></th>
			<th><%= list.get(0).getoPortMessage() %></th>
			<th><%= list.get(0).getoAmount() %></th>
			<th><%= list.get(0).getoSumPrice() %></th>
			<th><%= list.get(0).getoReg() %></th>
			
			<%
				OrderDetailDTO dto = new OrderDetailDTO();
				dto.setgImage(list.get(0).getgImage());
				dto.setgName(list.get(0).getgName());
				dto.setgCommenter(list.get(0).getgCommenter());
				dto.setoMembers(list.get(0).getoMembers());
				dto.setoName(list.get(0).getoAddress());
				dto.setoAddress(list.get(0).getoAddress());
				dto.setoPhone(list.get(0).getoPhone());
				dto.setoPort(list.get(0).getoPort());
				dto.setoPortMessage(list.get(0).getoPortMessage());
				dto.setgPrice(list.get(0).getgPrice());
				dto.setoAmount(list.get(0).getoAmount());
				dto.setoSumPrice(list.get(0).getoSumPrice());
				dto.setoReg(list.get(0).getoReg());
				
				dao.orderDetailInsert(dto);
			%>
		</tr>
		
	<%
		}
	%>
		<tr>
			<td colspan = "12" align = "center" class = "test">
			<input type = "button" value = "메인으로" onClick = "location.href='MainForm.jsp'">
			</td>
		</tr>
	</table>
</div>		
</body>
</html>