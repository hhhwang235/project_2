<%@page import="security.Sha256"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="mybatis.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
    <title>회원정보 수정처리</title>
   
</head>
<%
    	request.setCharacterEncoding("euc-kr");
        String id = session.getAttribute("sessionID").toString();
    
      	//비밀번호 암호화 
			String password = Sha256.encrypt(request.getParameter("password"));
        
    	//MemberDAO 에서 사용자 정보 가져오기
    	
    	MemberDTO dto = new MemberDTO();
    	
    	dto.setPwd(password);
    	dto.setEmail1(request.getParameter("mail1"));
    	dto.setEmail2(request.getParameter("mail2"));
    	dto.setPhone(request.getParameter("phone"));
    	dto.setAddress(request.getParameter("address"));
    	dto.setmMemo(request.getParameter("memo"));
    	dto.setUserId(id);
    	
    	MemberDAO dao = new MemberDAO();
    	dao.memberUpdate(dto);
%>

<body>
		
    <%
    	response.sendRedirect("../../../MainForm.jsp");
    %>
	
</body>
</html>