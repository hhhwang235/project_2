<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>������</title>
    
    <link rel="stylesheet" href="../../css/header.css">
    
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
                location.href="../MainForm.jsp";
            }else if(val == "0"){
                location.href="../member/view/ModifyFrom.jsp";
            }else if(val == "1"){
                location.href="../member/view/DeleteForm.jsp";
            }
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }
    </script>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
</head>
<body>
 <script type="text/javascript" src="../../js/go.js"></script>
<div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
        <input type="button" value="| �ڷΰ��� |" onclick="history.go(-1)" class = "header">
        <input type="button" value="| �Խ��� |" onclick="go_board()"class = "header"/>
     	<input type="button" value="| ���θ� |" onclick="go_market()"class = "header"/>
      	<input type="button" value="| ������ |" onclick="go_inf()" class = "header"/>
     	<input type="button" value="| ����� |" onclick="go_grade()"class = "header"/>
     	<input type="button" value="| �ֹ����� |" onclick="go_orders()"class = "header"/>
     
      
    <%
        String id = session.getAttribute("sessionID").toString();
        
  	//MemberDAO ���� ����� ���� ��������
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberOne(id);
    %>
 
        <br>
        <h2 align = center>�� ����</h2>
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
            		<input type="button" value="ȸ������ ����" onclick="changeForm(0)" style="width: 150; height:40px;">
        			<input type="button" value="ȸ��Ż��" onclick="changeForm(1)" style="width: 150; height:40px;">
            	</td>
            </tr>
        </table>
        
        <br>
</body>
</html>