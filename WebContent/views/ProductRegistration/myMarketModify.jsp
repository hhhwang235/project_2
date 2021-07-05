<%@page import="mybatis.dto.GoodsDTO"%>
<%@page import="mybatis.dto.tblCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//BoardDetailAction에서 보낸 dto를 받는다.
request.setCharacterEncoding("utf-8");
GoodsDTO dto = (GoodsDTO) request.getAttribute("myMarketDto");


pageContext.setAttribute("enter", "\r\n");	//JSTL 줄바꿈 처리를 위해 현재 페이지에서 사용할 객체 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<script type="text/javascript">
	function btn_click(str){
		if(str == 'amount'){
			frm1.action = "AmountProcess.do";
		}else if(str == 'delete'){
					frm1.action = "DeleteSelect.do";
				}
			}
	
</script>
<style>
	body{
		font-weight:bold;
	}
	td{
		padding:5px;
	}
</style>
</head>
<body>
<form name = "frm1" method = "get" onsubmit="return checkValue()">
<div align="center">
	<h2>상품 상세정보</h2>
	<br>
	<hr>
	<table border="1">
		<tr>
			
			<td>
				<%if(dto.getgImage() == null) { %>
					첨부된 파일이 없습니다.
				<%} else { %>
					<img src="goodsupload/<%=dto.getgImage()%>" width='300' height='300'>
				<%} %>
			</td>
		<td>
			<table border="0" style="width: 80%; height:100px;">
		<tr align = "center">
			<td width= "200">판매자</td>
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
			<td>상품수량</td>
			<td>
			<%
					if(dto.getgAmount() < 1){
						out.print("<b>품절</b>");
					}else{
			%>
				<%=dto.getgAmount() %>개
			<% 
				}
				%>
			</td>			
		</tr>
		<tr align = "center">
			<td>변경 수량</td>
			<td>
				<%			
					out.println("<input type='text' name = 'amount' placeholder='변경하실 수량을 입력하세요' style='width: 500px; height:30px;' />");
				%>
			</td>			
		</tr>
		<tr align = "center">
			<td>상품설명</td>
			<td>
				<%=dto.getgMemo() %>
			</td>
		</tr>	
		
				<input type = "hidden" name = "b_num" value = <%=dto.getgNum() %>>
				
		<tr align = "center">
			<td colspan = "2" >
				<!-- script에서 user_pwd에 접근하기 위한 폼, 폼에서 Enter키 입력으로 인한 화면 전환 방지 -->
					
					<input type="reset" value="돌아가기" onClick="history.back()" style="width: 120px; height:40px;">	 
					<input type='submit' value='수량변경' onClick='btn_click("amount");' style="width: 120px; height:40px;" />
					<input type='submit' value='상품삭제' onClick='btn_click("delete");' style="width: 120px; height:40px;"/>
					
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>