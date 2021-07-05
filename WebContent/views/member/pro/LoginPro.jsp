<%@page import="security.Sha256"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dto.MemberDTO"%>


<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
    <%
    	// 인코딩 처리
            request.setCharacterEncoding("euc-kr"); 
            
            // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
            String id= request.getParameter("id");
            String pw = Sha256.encrypt(request.getParameter("password"));
            
            // DB에서 아이디, 비밀번호 확인
            MemberDAO dao = new MemberDAO();
            
            boolean result1 = dao.loginCheck1(id);
            boolean result2 = dao.loginCheck2(id, pw);
   
    
         // URL 및 로그인관련 전달 메시지
            String msg = "";
           
            if(result1 == true && result2 == true){
            	session.setAttribute("sessionID", id);
            	msg = "../../../MainForm.jsp";
            }else    
              {
                msg = "../view/LoginForm.jsp";
            	}
           
            // sendRedirect(String URL) : 해당 URL로 이동
            // URL뒤에 get방식 처럼 데이터를 전달가능
            response.sendRedirect(msg);
    %>
</body>
</html>