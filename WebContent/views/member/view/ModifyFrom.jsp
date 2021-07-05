<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <%
    	request.setCharacterEncoding("euc-kr");
        String id = session.getAttribute("sessionID").toString();
    
    	//MemberDAO ���� ����� ���� ��������
    	
    	MemberDAO dao = new MemberDAO();
    	MemberDTO dto = dao.memberOne(id);
    %>
 
    <title>ȸ������ ����ȭ��</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
    <style type="text/css">
        #title{
           width:30%;  
			text-align:center;  	
        }
        td{
		font-weight:bold;
		padding:1px;
	}
        .box1{
  	text-align:right;
	}
    </style>
    <script type="text/javascript">
        function init(){
            
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select ���̵� �����´�.
            for (i = 0, j = selectMail.length; i < j; i++)  // select �ϴ� option ����ŭ �ݺ��� ������.
            {
                if (selectMail.options[i].value == val)  // �ԷµȰ��� option�� value�� ������ ��
                {
                    selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
                    break;
                }
            }
        }
        
        // ��й�ȣ �Է¿��� üũ
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
        }
        function logoutPro(){
            location.href="../../member/pro/LogOutPro.jsp";
        }	
    	function go_main(){
    		location.href="../../MainForm.jsp"
        }
    </script>
    
</head>
<body onload="init()">
 <div class="box1">
       <font color="red"><%=session.getAttribute("sessionID") %></font>
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
        <br>
        <h2 align = center>������ ����</h2>
        <br>
        <hr>
        
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ��� -->
        <form method="post" action="../pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            
            <br><br>    
            <table border = "0" align = "center">
 				<tr>
                    <%out.println("<th>" + "<img src = '../../../memberupload/" + dto.getmImage() +"' width='600' height='600' />" + "</th>");%>    
                    <td>
                    	<table border = "0" align = "center" style="width: 600; height:600;">
                    		<tr>
                    <td id="title">���̵�</td>
                    <td ><%=dto.getUserId() %></td>
                </tr>
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50" style="width: 370; height:30px;">
                    </td>
                </tr>
 				
                <tr>
                    <td id="title">�̸�</td>
                    <td><%=dto.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td><%=dto.getGender()%></td>
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
                        <input type="text" name="mail1" maxlength="50" 
                            value="<%=dto.getEmail1() %>" style="width: 170; height:30px;">
                        @
                        <select name="mail2" id="mail2" style="width: 170; height:30px;">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" value="<%=dto.getPhone() %>" style="width: 370; height:30px;"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value="<%=dto.getAddress() %>" style="width: 370; height:30px;"/>
                    </td>
                </tr>
                    	</table>
                    </td>
                </tr>        
 				
                      
                <tr>
                    
                    <td colspan = "2" align = "left" style="width: 600;">
                    	<textarea rows="1" cols="170" name="memo" required="required"><%=dto.getmMemo() %></textarea>
                    </td>
                </tr>
                <tr>
            	<td colspan = "2">
            	<div>
            		<div align = "left">
            		<font color="red">�̸���, �޴���ȭ, �ּ� �����: &nbsp;&nbsp;���� ��й�ȣ �Է�<br>
            	  ��й�ȣ �����: &nbsp;&nbsp;���� ������ ��й�ȣ �Է�</font>
            			</div>
            				<div align = "right">
            					<input type="button" value="���" onclick="go_main()" style="width: 150; height:40px;">
            					<input type="submit" value="����" style="width: 150; height:40px;"/>  
            				</div>
            			</div>
            		</td>
           		 </tr>
            </table>
        </form>   
</body>
</html>