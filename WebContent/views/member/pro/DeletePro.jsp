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
    <title>ȸ�� ���� ó��</title>
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
        �� �α��εǾ����ϴ�.
        <input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
        </div>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = Sha256.encrypt(request.getParameter("password"));
        
        // ���ǿ��� ���̵�, DeleteForm.jsp���� �Է¹��� ��й�ȣ�� �����´�.
        // ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
       	MemberDAO dao = new MemberDAO();
        if(dao.loginCheck2(id, pw)){
        	int succ = dao.memberDelete(id);
        	session.removeAttribute("sessionID");
        	if(succ > 0){
        		
        		response.sendRedirect("LogOutPro.jsp");
        	}else{
        		%>
        		<script>
                alert("ȸ��Ż�� ���� �����ڿ��� ���� �ϼ���.");
                history.go(-1);
            </script>
        <% 
        	}
        %>
        	
        	<%	
        }else{
        %>	
        <script>
            alert("��й�ȣ�� ���� �ʽ��ϴ�.");
            history.go(-1);
        </script>
       	<%
        }
        %>
    	
</body>
</html>