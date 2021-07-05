<%@page import="java.util.List"%>
<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dao.VisitantDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<html>
<head>
    <title>HMALL</title>  
    <style>
		.nav{
			display:flex;
			}
		.nav2{
			text-align:center;
			font-size:40px;
		}
		.nav3{
			text-align:center;
			font-size:20px;
		}
		
}
    </style>
    <script type="text/javascript">
        function logoutPro(){
            location.href="views/member/pro/LogOutPro.jsp";
        }
        function go_board(){
            location.href="BoardMain.html";
        }
        function go_market(){
            location.href="GoodsMain.html";
        }
        function go_myMarket(){
            location.href="MyMarketMain.html";
        }
        function go_inf(){
            location.href="views/myInfo/UserInfoForm.jsp";
        }
        function go_orders(){
            location.href="views/myOrders/OrderDetail.jsp";
        }
        function go_grade(){
            location.href="views/myGrade/MyGrade.jsp";
        }
        function go_maps(){
            location.href="views/map/MyMarketLocate.jsp";
        }
        function go_mapsgo(){
            location.href="views/map/Locate.jsp";
        }
        function go_port(){
            location.href="views/port/portInfo.jsp";
        }
    </script>
</head>
<body>
<form action="views/map/Locate.jsp">
    <%
   
        if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
        { 
            // �α��� ȭ������ �̵�
            response.sendRedirect("member/view/LoginForm.jsp");
        }
        else // �α��� ���� ���
        {
        	
        	
        	//�湮 Ƚ�� ������Ű��  
        	VisitantDAO vdao = new VisitantDAO();
        	vdao.visitantUpdate(0);
    %>
    
    <span style="display: inline-block; width: 100%; text-align: right;">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </span>
    <br><br>
    <div class = 'nav'>
    <input type="button" value="�Խ���" onclick="go_board()"
    style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
    	font-size:20px; border:0 solid;"/>
     <input type="button" value="���θ�" onclick="go_market()"
     style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     	font-size:20px; border:0 solid;"/>
      <input type="button" value="������" onclick="go_inf()"
     style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     	font-size:20px; border:0 solid;"/>
     	<input type="button" value="�����" onclick="go_grade()"
     style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     	font-size:20px; border:0 solid;"/>
     	<input type="button" value="�ֹ�����" onclick="go_orders()"
     style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     	font-size:20px; border:0 solid;"/>
     	
     
     
      <%
      	//�±� üũ�Ͽ� ����ϱ� 
      	MemberDAO dao = new MemberDAO();
      	
      Boolean tagCheck = dao.tagCheck((String)session.getAttribute("sessionID"));
      	if(tagCheck == true){
     %>
     		<input type="button" value="��ǰ ���" onclick="location.href = 'MyMarketInsertForm.do'"
     		style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid;"/>
     		<input type="button" value="����ǰ" onclick="go_myMarket()"
     		style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid;"/>
     		<input type="button" value="�ù�����" onclick="go_port()"
     		style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid;"/>
     			
     			<%
     		String id = session.getAttribute("sessionID").toString();
			LatitudeLongitudeDAO ldao = new LatitudeLongitudeDAO();
			String dto = ldao.LatitudeLongitudeSelectTest(id);
			if(dto == null){
				%>
				<input type="button" value="������ġ����" onclick="go_maps()"
			     		style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
			     		font-size:20px; border:0 solid;"/>	
			
		<%
			}
     	%>
     	
     	<%
			if(dto != null){
				LatitudeLongitudeDTO ldto = ldao.LatitudeLongitudeSelect(id);
				String a = ldto.getLatitude();
				String b = ldto.getLongitude();
				%>
				<input type= "hidden" name = "Latitude" value = <%=a %>>
				<input type= "hidden" name = "Longitude" value = <%=b %>>
			<input type="submit" value="��������ġ"
     		style="width:200; height:100; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     		font-size:20px; border:0 solid;"/>	
		<%
			}
     	%>
     		 
     <%	
     //border-radius: 12px;
     	}
     %>
    
    <br><br>
    </div>
    <div class = 'nav2'>
    	<br><br>�츮���� ���θ�!<br>
    	</div>
    <div class = 'nav3'>
     	������ ��� ������!
    </div>
   
   <%
   		} 
   %>  
   
   <%@include file="footer.jsp"%>
		</form>   
	</body>
</html>