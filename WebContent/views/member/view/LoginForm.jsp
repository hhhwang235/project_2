<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <%
        // ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>�α��� ȭ��</title>
    <style>
    	.test{
    	text-align:center;
    	}
    </style>
    <!-- css ���� �и� -->
    <link href='../../css/join_style.css' rel='stylesheet' type='text/css'/>
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("���̵� �Է��ϼ���");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("��й�ȣ�� �Է��ϼ���");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
        function goJoinForm() {
            location.href="divideJoin.jsp";
        }    
    </script>
 
</head>
<body>
<br>
	<div class = "test"><h1 style = "font-size:65px;"> HMALL</h1></div>
    <div align = "center">
        <form name="loginInfo" method="post" action="../pro/LoginPro.jsp" 
                onsubmit="return checkValue()">
        
            <br><br>
            
            <table>
                <tr>
                    <td align = "center" style="width:70; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			 border:0 solid; border-radius: 12px;">ID</td>
                    <td><input type="text" name="id" maxlength="50" style="width:250; height:50;"></td>
                </tr>
                <tr>
                    <td align = "center" style="width:70; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			 border:0 solid; border-radius: 12px;">PASSWORD</td>
                    <td><input type="password" name="password" maxlength="50" style="width:250; height:50;"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="�α���"
            style="width:100; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid; border-radius: 12px;"/>
            <input type="button" value="ȸ������" onclick="goJoinForm()"
            style="width:100; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid; border-radius: 12px;"/>
        </form>
        
        <% 
            // ���̵�, ��й�ȣ�� Ʋ����� ȭ�鿡 �޽��� ǥ��
            // LoginPro.jsp���� �α��� ó�� ����� ���� �޽����� ������.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>��й�ȣ�� Ȯ���� �ּ���.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>���̵� Ȯ���� �ּ���.</font>");
            }
        %>    
    </div> 
</body>
</html>









