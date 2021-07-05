<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="security.Sha256"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<style type="text/css">
.box1{
  	text-align:right;
	}
	</style>
    <title>회원 삭제 처리</title>
    <link href='../../css/font.css' rel='stylesheet' type='text/css'/>
     <script type="text/javascript">

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
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = Sha256.encrypt(request.getParameter("password"));
        
        // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
       	MemberDAO dao = new MemberDAO();
        if(dao.loginCheck2(id, pw)){
        	int succ = dao.memberDelete(id);
        	session.removeAttribute("sessionID");
        	if(succ > 0){
        		
        		response.sendRedirect("LogOutPro.jsp");
        	}else{
        		%>
        		<script>
                alert("회원탈퇴 실패 관리자에게 문의 하세요.");
                history.go(-1);
            </script>
        <% 
        	}
        %>
        	
        	<%	
        }else{
        %>	
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
       	<%
        }
        %>
    	
</body>
</html>