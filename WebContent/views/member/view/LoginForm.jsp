<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>로그인 화면</title>
    <style>
    	.test{
    	text-align:center;
    	}
    </style>
    <!-- css 파일 분리 -->
    <link href='../../css/join_style.css' rel='stylesheet' type='text/css'/>
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
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
            <input type="submit" value="로그인"
            style="width:100; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid; border-radius: 12px;"/>
            <input type="button" value="회원가입" onclick="goJoinForm()"
            style="width:100; height:50; font-family: 'Nanum Gothic'; background-color:#a0a0a0;
     			font-size:20px; border:0 solid; border-radius: 12px;"/>
        </form>
        
        <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>    
    </div> 
</body>
</html>









