<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>Ż�� ȭ��</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            
        }
        
       
        
        
        .box1{
  	text-align:right;
	}
    </style>
    
    <script type="text/javascript">
        // ��й�ȣ ���Է½� ���â
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
                return false;
            }
        }
        function go_user() {
        	location.href="UserInfoForm.jsp";
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }	
    </script>
    
</head>
<body>

 <div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
    <h3 align = "center">ȸ��Ż��</h3>
    <b>
    <br>
    <hr>
    <br>
    <b><p id="font">��� ��ȣ�� �Է��� �ּ���.</p></b>
    
 
    <form name="deleteform" method="post" action="../pro/DeletePro.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td><h2>PassWord : </h2></td>
                <td><input type="password" name="password" maxlength="50" style='width: 400px; height:40px;'></td>
            </tr>
        </table>
        
        <br> 
        <input type="submit" value="Ż��" style='width: 100px; height:40px;' /> 
    </form>
    </b>
</body>
</html>