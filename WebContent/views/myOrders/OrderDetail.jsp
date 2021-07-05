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
	List<OrderDetailDTO> list = dao.orderDetailAll((String)session.getAttribute("sessionID"));
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
	<h2>나의 주문 내역</h2>
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
			for(int i =0; i < list.size(); i++){
				score = score + Integer.parseInt(list.get(i).getoSumPrice());
		%>
		<tr>
		<% 
	out.println("<th>" + "<img src = '../../goodsupload/" + list.get(i).getgImage() + "' width='70' height='70' />" + "</th>");
		%>
			<th><%= list.get(i).getgName() %></th>
			<th><%= list.get(i).getgPrice() %></th>
			<th><%= list.get(i).getgCommenter() %></th>
			<th><%= list.get(i).getoName() %></th>
			<th><%= list.get(i).getoAddress() %></th>
			<th><%= list.get(i).getoPhone() %></th>
			<th><%= list.get(i).getoPort() %></th>
			<th><%= list.get(i).getoPortMessage() %></th>
			<th><%= list.get(i).getoAmount() %></th>
			<th><%= list.get(i).getoSumPrice() %></th>
			<th><%= list.get(i).getoReg() %></th>
		</tr>
		
	<%
		}
	%>
		<tr>
			<td colspan = "12" align = "center" class = "test">
			<h2>고객님의 현재까지 총 결제금액은 <%= score %> 원 입니다.</h2>
			</td>
		</tr>
	</table>
</div>		
</body>
</html>