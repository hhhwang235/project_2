<%@page import="mybatis.dto.testDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.ibatis.mapping.ResultMap"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
List<testDTO> list = (List<testDTO>)request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart View</title>
<script type="text/javascript">
function fnPay(){
	alert("결제 API를 발급 받으시기 바랍니다.");
}

function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "CartClear.do";	
	}
}

function fnGo(){
	location.href = "goodsList.do";
}
</script>
</head>
<body>
<div align="center">
	<h3>장바구니 보기</h3>
	<b>
	<br>
	<hr>
	<br>
	<table border="0" style="width: 80%;">
		
		<%
		if(list.size() == 0) {
			out.println("<tr align='center'>");
				out.println("<td colspan= '8'>");
					out.println("장바구니에 담긴 상품이 없습니다.");
					out.println("<a href= 'goodsList.do'>쇼핑하기</a>");
				out.println("</td>");
			out.println("</tr>");
		} else {
			%>
			<tr>
			<th>번호</th>
			<th>상품 사진</th>
			<th>상품명</th>
			<th>판매자</th>
			<th>장바구니 담은 시간</th>
			<th>가격</th>
			<th>수량</th>
			<th>총 가격</th>
		</tr>
			<%
			int totalSum = 0, total = 0;
			DecimalFormat df = new DecimalFormat("￦#,##0");
			for(int i = 0; i < list.size(); i++) {
				testDTO dto = list.get(i);
				out.println("<tr align= 'center'>");
					out.println("<td>" + (i + 1) + "</td>");
					out.println("<td>" + "<img src = 'goodsupload/" + dto.getImage() + "' width='70' height='70' />" + "</td>");
					out.println("<td>" + dto.getName() + "</td>");
					out.println("<td>" + dto.getCommenter() + "</td>");
					out.println("<td>" + dto.getReg() + "</td>");
					out.println("<td>" + dto.getPrice() + "</td>");
					out.println("<td>" + dto.getAmount() + "</td>");
					total = dto.getPrice() * dto.getAmount();
					out.println("<td>" + df.format(total) + "</td>");
				out.println("</tr>");
				out.println("</tr>");
				out.println("<tr align='center' style = 'height:50px;'>");
				out.println("</tr>");
				totalSum += total;
			}
		out.println("<tr align = 'center'>");
			out.println("<td colspan= '7'>");
				//out.println("<input type='button' value='결제하기' onclick='fnPay()' style='width: 180px; height:30px;'' />");
				out.println("<input type='button' value='장바구니 비우기' onclick='fnClear()' onclick='fnPay()' style='width: 180px; height:30px;'' />");
				out.println("<input type='button' value='쇼핑 계속하기' onclick='fnGo()'onclick='fnPay()' style='width: 180px; height:30px;'' />");
			out.println("</td>");
			out.println("<td>");
			out.println(df.format(totalSum));
			out.println("</td>");
		out.println("</tr>");
		}//if else
		%>
	</table>
	</b>
</div>
</body>
</html>