<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>탈퇴 화면</title>
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
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
    <h3 align = "center">회원탈퇴</h3>
    <b>
    <br>
    <hr>
    <br>
    <b><p id="font">비밀 번호를 입력해 주세요.</p></b>
    
 
    <form name="deleteform" method="post" action="../pro/DeletePro.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td><h2>PassWord : </h2></td>
                <td><input type="password" name="password" maxlength="50" style='width: 400px; height:40px;'></td>
            </tr>
        </table>
        
        <br> 
        <input type="submit" value="탈퇴" style='width: 100px; height:40px;' /> 
    </form>
    </b>
</body>
</html>