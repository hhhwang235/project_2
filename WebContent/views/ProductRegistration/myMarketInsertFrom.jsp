<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert Form</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("작성하신 글을 등록하시겠습니까?")) {
		return true;
	}
	return false;
}

function fnReset() {
	if(confirm("입력하신 내용을 삭제하시겠습니까?")) {
		fnLoad();
		return true;
	}
	return false;
}

function fnLoad() {
	//폼에 name 속성을 줘서 폼 - 텍스트창으로 접근한다
	document.regForm.b_writer.focus();
}
</script>
</head>
<body onload="fnLoad()"><!-- 입력칸에 자동으로 포커스가 오게끔 설정 -->

<div align="center">
	<h3>[상품 등록하기]</h3>
	<b>
	<br>
	<hr>
	<br>
	<form action="MyMarketInsert.do" method="post" name="regForm" onsubmit="return fnSubmit()" onreset="return fnReset()" enctype="multipart/form-data">
<!-- enctype : 파일 첨부할때 필요한 속성 -->
	
		<table border="0">
			<tr>
				<th>작성자</th>
				<td><%=session.getAttribute("sessionID") %></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="g_subject" maxlength="50" required="required" style="width: 344px; height:40px;" /></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td>
					<textarea rows="10" cols="47" name="g_memo" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td>
					<input type="text" name="g_price" maxlength="50" required="required" style="width: 344px; height:40px;" />원
				</td>
			</tr>
			<tr>
				<th>상품수량</th>
				<td>
					<input type="text" name="g_amount" maxlength="50" required="required" style="width: 343px; height:40px;" />개
				</td>
			</tr>
			<tr>
				<th>상품 사진</th>
				<td><input type="file" name="g_image" />
			</tr></td>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록" style="width: 100px; height:40px;" />
					<input type="reset" value="내용 삭제" style="width: 100px; height:40px;"/>
					
				</td>
			</tr>
		</table>
	</form>
	</b>
</div>
</body>
</html>