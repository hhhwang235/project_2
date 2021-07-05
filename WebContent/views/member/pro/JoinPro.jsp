<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<%@page import="mybatis.dao.MemberDAO"%>
<%@page import="mybatis.dto.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="security.Sha256"%>
<html>

<head>
    <title>회원가입 처리 JSP</title>
    
    <!-- css 파일 분리 -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
    <script>
         function goLoginForm() {
            location.href="../view/LoginForm.jsp";
        }    
    </script>
</head>
<body>
  <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <%
    	// 한글 깨짐을 방지하기 위한 인코딩 처리
                request.setCharacterEncoding("euc-kr");
    %>
   			
   			<%
   			
   			String realFolder = ""; //저장 경로
   			realFolder = "C:\\Users\\myhoh\\eclipse-workspace\\Project2\\WebContent\\memberupload";
   			
   			int fileSize = 5 * 1024 * 1024; //5MB
   			//fileSize = byte 단위로 들어간다
   			MultipartRequest multi = null; //파일 업로드 처리
   			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //중복 파일 명 방지
   			multi = new MultipartRequest(request, realFolder, fileSize, "euc-kr", policy);
   			
   			//비밀번호 암호화 
   			String password = Sha256.encrypt(multi.getParameter("password"));
   			   				MemberDTO dto = new MemberDTO();
   			   			   			   					int result;
   			   			   			   				
   			   			   dto.setUserId(multi.getParameter("id"));
   			   			   dto.setPwd(password);   					
   			   			   dto.setName(multi.getParameter("name"));
   			   			   dto.setGender(multi.getParameter("gender"));
   			   			   dto.setBirthyy(multi.getParameter("birthyy"));
   			   			   dto.setBirthmm(multi.getParameter("birthmm"));
   			   		       dto.setBirthdd(multi.getParameter("birthdd"));
   			   			   dto.setEmail1(multi.getParameter("mail1"));
   			   		       dto.setEmail2(multi.getParameter("mail2"));
   			   			   dto.setPhone(multi.getParameter("phone"));
   			   			   dto.setAddress(multi.getParameter("address"));
   			   			   dto.setTag(multi.getParameter("tag"));
   			   		       dto.setmImage(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
   			   			   dto.setmMemo(multi.getParameter("m_memo"));
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					//현재 시간 구하기
   			   			   			   					long startTime = System.currentTimeMillis();
   			   			   			   					Timestamp a = new Timestamp(startTime);
   			   			   			   					
   			   			   			   					dto.setReg(a);
   			   			   			   					
   			   			   			   					MemberDAO dao = new MemberDAO();
   			   			   			   				result = dao.insertMember(dto);
   			   			   			   				
   			   			   			   				if(result > 0){
   			   			%>
				
				<div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=dto.getUserId() %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
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
                    <%=dto.getEmail1() %>@<%=dto.getEmail2() %>
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
        
        <br>
        <input type="button" value="확인" onclick="goLoginForm()">
    </div>
			
		<%
			}	
		%>
		
		
</body>
</html>
