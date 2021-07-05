<%@page import="mybatis.dto.OrderDetailDTO"%>
<%@page import="mybatis.dao.OrderDetailDAO"%>
<%@page import="mybatis.dto.GradeDTO"%>
<%@page import="mybatis.dao.GradeDAO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dto.OrdersDTO"%>
<%@page import="mybatis.dao.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
		
	//등급 가져오기
	GradeDAO gdao = new GradeDAO();
	List<GradeDTO> list = gdao.gradeDetail();
	
	OrderDetailDAO odao = new OrderDetailDAO();
	List<OrderDetailDTO> olist = odao.orderDetailAll((String)session.getAttribute("sessionID"));
%>

<meta charset="UTF-8">
<title>나의 등급</title>
</head>
<body>
	<%
	if(olist.isEmpty()){
%>
	<div align = "center" style = "padding:70px;">
		<h1><font color="red"><%= session.getAttribute("sessionID") %></font>고객님은 현재 등급이 없습니다.<br><br>
			물건을 구매하세요!
		</h1>
	</div>
<% 		
	}else{
		
		//회원의 총 구매 가격 가져오기
		int result = odao.orderPriceSum((String)session.getAttribute("sessionID"));
		
	
	for(int i = 0; i< list.size(); i++){
		if((list.get(i).getGradeMinScore() <= result && list.get(i).getGradeMaxScore() >= result)){
			//등업까지 남은 요금
			int quiz = (list.get(i).getGradeMaxScore() - result);
%>
		
			<table border = "0" align = "center" style = "padding:30px;">
				<tr>
					<td align=center style="width:300; height:200; font-family: 'Nanum Gothic';
    				font-size:20px; border:0 solid; ">
						<h1><%=list.get(i).getGradeName() %></h1>
					</td>
					<td align=center style="width:300; height:200; font-family: 'Nanum Gothic';
    				font-size:20px; border:0 solid; ">
						<b><%=list.get(i).getGradeMemo() %></b>
					</td>
				</tr>
				<tr>
						<% out.println("<td>" + "<img src = '../../img/" + list.get(i).getGradeImage() + "' width='300' height='300' />" + "</td>");%>
					<td align=center style="width:300; height:200; font-family: 'Nanum Gothic';
    				font-size:20px; border:0 solid; ">
						
						 <%if(list.get(i).getGradeName().equals("마스터")){ %>
						 	<b><font color="red"><%= session.getAttribute("sessionID") %></font>고객님은<br><br>
						  	이미 최고등급 회원입니다!</b>
						 <%
						 	}else{
						 %>
						  <b><font color="red"><%= session.getAttribute("sessionID") %></font>고객님의<br>
						  등급 업그레이드 까지 남은 요금은<br>
						  <font color="red"><%=quiz %> 원</font> 입니다! </b>
						  <%
						 	}
						  %>
					</td>
				</tr>
			</table>
		</div>
<% 
			}
		}
	}
%>
</body>
</html>