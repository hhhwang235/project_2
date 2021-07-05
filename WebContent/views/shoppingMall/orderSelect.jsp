<%@page import="mybatis.dto.PortDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mybatis.dto.GoodsDTO"%>
<%@page import="mybatis.dto.tblCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%

request.setCharacterEncoding("utf-8");
String a = (String)request.getAttribute("a");
String num = (String)request.getAttribute("b"); //주문수량
String amount = (String)request.getAttribute("c"); 
GoodsDTO dto = (GoodsDTO) request.getAttribute("myMarketDto");
List<PortDTO> list = (List<PortDTO>)request.getAttribute("plist");


pageContext.setAttribute("enter", "\r\n");	//JSTL 줄바꿈 처리를 위해 현재 페이지에서 사용할 객체 생성
%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		font-weight:bold;
	}
</style>
<meta charset="UTF-8">
<title>주문항목작성</title>
</head>
<body>
	<form action = "OrderSuccess.do" method = "post">
<div align="center">
	<h2>주문 항목 작성</h2>
	<br>
	<hr>
	<table border="0">
		<tr>
			
			<td>
				<%if(dto.getgImage() == null) { %>
					첨부된 파일이 없습니다.
				<%} else { %>
					<img src="goodsupload/<%=dto.getgImage()%>" width='300' height='300'>
				<%} %>
			</td>
		<td>
			<table border="1"style="width: 330px; height:400px;">
		<tr align = "center">
			<td width= "100">판매자</td>
			<td><%=dto.getgCommenter() %></td>
		</tr>
		<tr align = "center">
			<td>상품명</td>
			<td><%=dto.getgName() %></td>			
		</tr>
		<tr align = "center">
			<td>상품가격</td>
			<td><%=dto.getgPrice() %>원</td>		
		</tr>
		<tr align = "center">
			<td>선택수량</td>
			<td>
				<%=amount %>개
			</td>			
		</tr>
		<tr align = "center">
			<td>결제금액</td>
			<td>
			<%
				int total = 0;
				DecimalFormat df = new DecimalFormat("#,##0");
				total = dto.getgPrice() * Integer.parseInt(amount);
			%>
				<%=df.format(total)  %>￦
			</td>			
		</tr>
		</table>
		
		</td>
		<td>
		<table border="1" style="width: 450px; height:400px;">
		<tr align = "center">
			<td>수령인</td>
			<td><input type = "text" name = "name" placeholder="이름을 입력하세요." style="width: 300px; height:30px;"></td>		
		</tr>
		<tr align = "center">
			<td>배송주소</td>
			<td><input type = "text" name = "address" placeholder="배송주소를 입력하세요." style="width: 300px; height:30px;"></td>		
		</tr>
		<tr align = "center">
			<td>연락처</td>
			<td><input type = "text" name = "phone" placeholder="연락처를 입력하세요." style="width: 300px; height:30px;"></td>
			
			<%//파라미터 넘기기 용도 %>
			<input type = "hidden" name = "sumPrice" value = <%=total %>>
			<input type = "hidden" name = "amount1" value = <%=dto.getgAmount() %>>
			<input type = "hidden" name = "amount1" value = <%=dto.getgAmount() %>>
			<input type = "hidden" name = "amount2" value = <%=amount %>>
			<input type = "hidden" name = "num" value = <%=dto.getgNum() %>>		
		</tr>
		<tr align = "center">
			<td>택배선택</td>
			<td>
				
				<%
					for(int i = 0; i < list.size(); i ++){
				%>
					<input type = "checkBox" name = "portCheck" value = <%=list.get(i).getpName() %>><b><%=list.get(i).getpName() %></b>
				<%		
					}
				%>
   				
   			</td>		
		</tr>
		<tr align = "center">
			<td>배송메세지</td>
			<td>	
				<select name="portMessage" style="width: 300px; height:30px;">
					<option value="요청사항 없음.">요청사항 없음.</option>
    				<option value="부재시, 경비실에 맡겨주세요." >부재시, 경비실에 맡겨주세요.</option>
   					<option value="부재시, 전화주시거나 또는 문자 남겨주세요.">부재시, 전화주시거나 또는 문자 남겨주세요.</option>
   					<option value="배송전, 연락바랍니다.">배송전, 연락바랍니다.</option>
   				</select>
			</td>		
		</tr>
						
		<tr align = "center">
			<td colspan = "2">
				<!-- script에서 user_pwd에 접근하기 위한 폼, 폼에서 Enter키 입력으로 인한 화면 전환 방지 -->
					
					<input type="reset" value="주문취소" onClick="history.back()" style="width: 150px; height:30px;">	 
					<input type='submit' value='주문하기' style="width: 150px; height:30px;"/>
					
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>