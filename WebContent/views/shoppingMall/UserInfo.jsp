<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>������</title>
    
    <style type="text/css">
    
	td{
		font-weight:bold;
		padding:5px;
	}
    	#title{
			width:30%;  
			text-align:center;  	
    	}
        .box1{
  	text-align:right;
	}
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="../../MainForm.jsp";
            }else if(val == "0"){
                location.href="ModifyFrom.jsp";
            }else if(val == "1"){
                location.href="DeleteForm.jsp";
            }
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }
    </script>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
</head>
<body>
<form action="locationSelect.jsp">
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
        <input type="button" value="���ư���" onclick="changeForm(-1)">
    <%
        String id = session.getAttribute("sessionID").toString();
    	String a = request.getParameter("id");
        
  	//MemberDAO ���� ����� ���� ��������
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberOne(a);
    %>
 
        <br>
        <h2 align = center>�Ǹ��� ����</h2>
        <br>
        <hr>
        <br>
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        <table border = "0" align = "center">
        <tr>
                    <%out.println("<th>" + "<img src = '../../memberupload/" + dto.getmImage() +"' width='300' height='300' />" + "</th>");%>      
         
       
        <td>
        <table border = "0" align = "center" style="width: 300; height:300;">
            <tr>
                <td id="title">���̵�</td>
                <td><%=dto.getUserId() %></td>
            </tr>
                                        
            <tr>
                <td id="title">�̸�</td>
                <td><%=dto.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td><%=dto.getGender() %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td>
                    <%=dto.getBirthyy() %>�� 
                    <%=dto.getBirthmm() %>�� 
                    <%=dto.getBirthdd() %>��
                </td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td>
                    <%=dto.getEmail1() %>@
                    <%=dto.getEmail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=dto.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
                    <%=dto.getAddress() %>
                </td>
            </tr>
            
            		</table>
            	</td>
            </tr>
            <tr>
            	<td colspan = "2" align = "left" style="width: 600;">
            		<%=dto.getmMemo() %>
            	</td>
            </tr>
            <tr>
            	<td colspan = "2" align = "right">
            	<% 
            	LatitudeLongitudeDAO ldao = new LatitudeLongitudeDAO();
				
            	String Qdto = ldao.LatitudeLongitudeSelectTest(dto.getUserId());
				if(Qdto != null){	
					LatitudeLongitudeDTO ldto = ldao.LatitudeLongitudeSelect(dto.getUserId());
					String c = ldto.getLatitude();
					String d = ldto.getLongitude();
					%>
					<input type= "hidden" name = "id" value = <%=dto.getUserId() %>>
					<input type= "hidden" name = "Latitude" value = <%=c %>>
					<input type= "hidden" name = "Longitude" value = <%=d %>>
					<input type="submit" value="ã�ƿ��±�" style="width: 150; height:40px;">
					<% 
				}%>
            		
            	</td>
            </tr>
       	 </table>
        <br>
     </form>
</body>
</html>