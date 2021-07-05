<%@page import="java.util.List"%>
<%@page import="mybatis.dto.tblCommentDTO"%>
<%@page import="mybatis.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//BoardDetailAction에서 보낸 dto를 받는다.
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
List<tblCommentDTO> list = (List<tblCommentDTO>)request.getAttribute("list");


pageContext.setAttribute("enter", "\r\n");	//JSTL 줄바꿈 처리를 위해 현재 페이지에서 사용할 객체 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>
<script type="text/javascript">
//답글달기
function fnReply(num) {
	if(confirm("답글을 작성하시겠습니까?")) {
		location.href = "boardReplyView.do?b_num=" + num;
	}
}

//답글보기
function fnReply2(num) {
	 location.href="boardComment.do?b_num=" + num;
}

function fnDelete(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	//alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호가 미입력 시
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치 → confirm 창
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "boardDelete.do?b_num=" + ${dto.b_num 	};
		} else {
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		}
	}
}
function fnUpdate(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	//alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호가 미입력 시
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치 → 수정 화면(form)
		location.href = "boardUpdateForm.do?b_num=" + ${dto.b_num };
	}
}
</script>
</head>
<body>
<div align="center">
	<h3>글 내용 조회</h3>
	<b>
	<br>
	<hr>
	<br>
	
	<table border="1" style="width: 80%;">
		<tr>
			<th style = "padding : 10px;">작성자</th>
			<td>${dto.b_writer }</td>
			<th>조회수</th>
			<td align="center">${dto.b_readcount }</td>
		</tr>
		<tr>
			<th style = "padding : 10px;">제목</th>
			<td colspan="3">${dto.b_subject }</td>			
		</tr>
		<tr>
			<th style = "padding : 10px;">첨부 파일</th>
			<td colspan="3" >
				<%if(dto.getB_file() == null) { %>
					첨부된 파일이 없습니다.
				<%} else { %>
					<a href="boardupload/<%=dto.getB_file()%>"><%=dto.getB_file() %></a>
				<%} %>
			</td>
		</tr>
		<tr>
			<th style = "padding : 10px;">내용</th>
			<%-- <td colspan="3">${dto.b_content }</td> --%> <!-- 줄바꿈 처리를 못하는 문제 발생 -->
			<td colspan="3">
				<%--=dto.getB_content().replace("\r\n", "<br />") --%>	<!-- 자바 코드로 줄바꿈 처리 -->
				${fn : replace(dto.b_content, enter, "<br />") }
			</td>
		</tr>
		<tr>
			<th style = "padding : 10px;">비밀번호</th>
			<td colspan="3" style="width: 300px; height:30px;">
				<!-- script에서 user_pwd에 접근하기 위한 폼, 폼에서 Enter키 입력으로 인한 화면 전환 방지 -->
				<form name="detailForm" onsubmit="return false"  >
					<input type="password" name="user_pwd" style="width: 200px; height:20px;"/>
					<input type="button" value="삭제" onclick="fnDelete('${dto.b_pwd}')" style="width: 70px; height:35px;"/>
					<input type="button" value="수정" onclick="fnUpdate('${dto.b_pwd}')" style="width: 70px; height:35px;"/>
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" style="width: 70px; height:35px;"/>	
					<input type="button" value="답글 달기" onclick="fnReply('${dto.b_num 	}')" style="width: 70px; height:35px;"/>
					<% //<input type="button" value="답글 보기" onclick= "fnReply2('${dto.b_num 	}')"/>	%>			 
				</form>
			</td>
		</tr>
		
	</table>
		
	<br><br>
	<div align ="left" style="width: 80%;">
	
	<%
		
		 if(list.size() == 0) {
			 out.println("<h4><b>작성된 답글이 없습니다.</b></h4>");
		 } else {
			 %>
			<h3>답글</h3>
				<% 
			 for(int i = 0; i < list.size(); i++) {
				 %>
				 <table border="0" cellpadding = "5px"style="width: 30%;">
				 <% 
				 out.println("<tr align='center'>");
				 out.println("<th>" + "<img src = 'memberupload/Comment.jpg'  width='20' height='20' />" + "</th>");
					out.println("<td><b>" + list.get(i).getC_commenter() + "</b></td>");
					out.println("<td><b>" + list.get(i).getC_date() + "</b></td>");
					out.println("</tr>");
					out.println("<tr align='left'>");
					out.println("<td colspan = '3'>" + list.get(i).getC_content() + "</td>");
					out.println("</tr>");
	%>
	
			</table>
			<% 
			out.println("<hr>");
			 	}
			 }	
			%>
		</div>
		</b>
	</div>
	
</body>
</html>