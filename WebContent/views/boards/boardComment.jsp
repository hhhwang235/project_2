<%@page import="mybatis.dao.tblCommentDAO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dto.tblCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>[답글창]</h3>
<table border="0" cellpadding = "10px"style="width: 40%;">
		<tr>
			<th>작성자</th>
			<th>답글</th>
			<th>작성시간</th>
		</tr>
	<%
		List<tblCommentDTO> list = (List<tblCommentDTO>)request.getAttribute("list");
	
		 if(list.size() == 0) {
			 out.println("작성된 답글이 없습니다.");
		 } else {
			 for(int i = 0; i < list.size(); i++) {
				 out.println("<tr align='center'>");
					out.println("<td>" + list.get(i).getC_commenter() + "</td>");
					out.println("<td>" + list.get(i).getC_content() + "</td>");
					out.println("<td>" + list.get(i).getC_date() + "</td>");
					out.println("</tr>");
			 }
		 }	
	%>
	
	</table>

</body>
</html>