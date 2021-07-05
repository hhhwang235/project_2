<%@page import="mybatis.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
String a = (String)session.getAttribute("sessionID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board reply JSP</title>
</head>
<body>
<div align="center">
	<h3>답글 쓰기</h3>
	<b>
	<br>
	<hr>
	<br>
	<form action="boardReplyAction.do" method="post">
	<input type="hidden" name="b_num" value="<%=dto.getB_num() %>" />
		<table border="0">
			<tr>
				
				<td align = "center" colspan = "2" style = "padding : 20px;"><%=a %></td>
			</tr>
			<tr>
				<th>Comment</th>
				<td>
					<textarea rows="15" cols="50" name="board_content" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답글등록" style="width: 90px; height:35px;" />
					<input type="button" value="취소하기" onclick="history.go(-1)" style="width: 90px; height:35px;"/>
					<input type="button" value="목록보기" onclick="location.href='boardList.do'" style="width: 90px; height:35px;"/>
				</td>
			</tr>
		</table>
	</form>
	</b>
</div>
</body>
</html>