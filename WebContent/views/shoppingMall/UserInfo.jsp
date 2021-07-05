<%@page import="mybatis.dao.LatitudeLongitudeDAO"%>
<%@page import="mybatis.dto.LatitudeLongitudeDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>내정보</title>
    
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
        님 로그인되었습니다.
        <input type="button" value="로그아웃" onclick="logoutPro()" />
        </div>
        <input type="button" value="돌아가기" onclick="changeForm(-1)">
    <%
        String id = session.getAttribute("sessionID").toString();
    	String a = request.getParameter("id");
        
  	//MemberDAO 에서 사용자 정보 가져오기
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberOne(a);
    %>
 
        <br>
        <h2 align = center>판매자 정보</h2>
        <br>
        <hr>
        <br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table border = "0" align = "center">
        <tr>
                    <%out.println("<th>" + "<img src = '../../memberupload/" + dto.getmImage() +"' width='300' height='300' />" + "</th>");%>      
         
       
        <td>
        <table border = "0" align = "center" style="width: 300; height:300;">
            <tr>
                <td id="title">아이디</td>
                <td><%=dto.getUserId() %></td>
            </tr>
                                        
            <tr>
                <td id="title">이름</td>
                <td><%=dto.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=dto.getGender() %></td>
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
                    <%=dto.getEmail1() %>@
                    <%=dto.getEmail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=dto.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
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
					<input type="submit" value="찾아오는길" style="width: 150; height:40px;">
					<% 
				}%>
            		
            	</td>
            </tr>
       	 </table>
        <br>
     </form>
</body>
</html>