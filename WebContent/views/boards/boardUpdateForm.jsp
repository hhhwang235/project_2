<%@page import="mybatis.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 수정 하시겠습니까?")) {
		return true;
	}
	return false;
}

function fnReset() {
	if(confirm("정말 초기화 하시겠습니까?")) {
		return true;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
	<h3>게시판 글 수정하기</h3>
	<br>
	<hr>
	<br>
	<b>
	<form action="boardUpdate.do" method="post" onsubmit="return fnSubmit()" onreset="return fnReset()" enctype="multipart/form-data">
	<input type="hidden" name="b_num" value="${dto.b_num }"/>
		<table border="0" style="width: 80%; padding: 10px; margin:10px;">
			<tr>
				<th>작성자</th>
				<td style="padding: 10px;"><%=session.getAttribute("sessionID") %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td style="padding: 10px;"><input type="text" name="b_subject" value="${dto.b_subject }" style='width: 350px; height:30px;' /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="padding: 10px;">
					<textarea rows="10" cols="48" name="b_content">${dto.b_content }</textarea>
				</td>
			</tr>
			
			<tr>
				<th>파일 첨부</th>
				<td style="padding: 10px;"><input type="file" name="b_file" value="<%=dto.getB_file() %>" /></td>
			</tr>
			
			<tr>
				<th>수정할 비밀번호</th>
				<td align="left" style="padding: 10px;">
					<input type="password" name="b_pwd" value="${dto.b_pwd }" style='width: 150px; height:30px;' />
					<input type="submit" value="수정 완료" style='width: 70px; height:35px;' />
					<input type="reset" value="초기화" style='width: 70px; height:35px;' />
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" style='width: 70px; height:35px;' />
				</td>
			</tr>
		</table>
	</form>
	</b>
</div>
</body>
</html>