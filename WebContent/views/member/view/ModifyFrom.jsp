<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
    <%
    	request.setCharacterEncoding("euc-kr");
        String id = session.getAttribute("sessionID").toString();
    
    	//MemberDAO 에서 사용자 정보 가져오기
    	
    	MemberDAO dao = new MemberDAO();
    	MemberDTO dto = dao.memberOne(id);
    %>
 
    <title>회원정보 수정화면</title>
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
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
        <br>
        <h2 align = center>내정보 수정</h2>
        <br>
        <hr>
        
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="../pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            
            <br><br>    
            <table border = "0" align = "center">
 				<tr>
                    <%out.println("<th>" + "<img src = '../../../memberupload/" + dto.getmImage() +"' width='600' height='600' />" + "</th>");%>    
                    <td>
                    	<table border = "0" align = "center" style="width: 600; height:600;">
                    		<tr>
                    <td id="title">아이디</td>
                    <td ><%=dto.getUserId() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" style="width: 370; height:30px;">
                    </td>
                </tr>
 				
                <tr>
                    <td id="title">이름</td>
                    <td><%=dto.getName() %></td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td><%=dto.getGender()%></td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <%=dto.getBirthyy() %>년 
                        <%=dto.getBirthmm() %>월 
                        <%=dto.getBirthdd() %>일
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
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
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="<%=dto.getPhone() %>" style="width: 370; height:30px;"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
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
            		<font color="red">이메일, 휴대전화, 주소 변경시: &nbsp;&nbsp;현재 비밀번호 입력<br>
            	  비밀번호 변경시: &nbsp;&nbsp;새로 설정할 비밀번호 입력</font>
            			</div>
            				<div align = "right">
            					<input type="button" value="취소" onclick="go_main()" style="width: 150; height:40px;">
            					<input type="submit" value="수정" style="width: 150; height:40px;"/>  
            				</div>
            			</div>
            		</td>
           		 </tr>
            </table>
        </form>   
</body>
</html>