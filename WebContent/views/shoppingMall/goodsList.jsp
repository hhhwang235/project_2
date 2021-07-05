<%@page import="mybatis.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("list2");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopMallMain JSP</title>
<script type="text/javascript">

function fnView() {
	if(confirm("장바구니를 보시겠습니까?")){
		location.href = "CartView.do";
	}
}
</script>
</head>
<body>

<div align="center">
	<h2>상품목록</h2>
	<br>
	<table border="0">
		<tr align="right">
			<td colspan="3">
				<input type="button" value="장바구니 보기" onclick="fnView()" style="width: 150px; height:30px;" />
			</td>
		</tr>
		<%
		for(int i = 0; i < list.size(); i++) {
			if(i % 3 == 0) { 
				out.println("<tr align='center'>");
			}
			out.println("<td>");
				out.println("<table>");
				
				out.println("<tr align='center'>");
				out.println("<td>");
					out.println("<b>등록인 : " + list.get(i).getgCommenter() + "</b>");
				out.println("</td>");
			out.println("</tr>");
				
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<a href = 'myMarketDetail.do?g_num=" + list.get(i).getgNum() +
									"'>" + "<img src = 'goodsupload/" + list.get(i).getgImage() + "' width='150' height='150' />");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>상품명 : " + list.get(i).getgName() + "</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>가격 : " + list.get(i).getgPrice() + "￦</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
					out.println("<td>");
					//남은 수량 여부에 따른 값 변환 
						if(list.get(i).getgAmount() < 1){
							out.print("<b>남은 수량이 없습니다.</b>");
						}else{
						out.print("<b>남은 수량 : " + list.get(i).getgAmount() + "개</b>");
						}
					out.println("</td>");
				out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							
						out.println("</td>");
					out.println("</tr>");
				out.println("</table>");
			out.println("</td>");
			if(i % 3 == 2) {
				out.println("</tr>");
			}
		}
		out.println("<hr>");
		%>	
	</table>
</div>
</body>
</html>