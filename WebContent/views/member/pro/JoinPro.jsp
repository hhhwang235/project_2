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
    <title>ȸ������ ó�� JSP</title>
    
    <!-- css ���� �и� -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
    <script>
         function goLoginForm() {
            location.href="../view/LoginForm.jsp";
        }    
    </script>
</head>
<body>
  <%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
    <%
    	// �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
                request.setCharacterEncoding("euc-kr");
    %>
   			
   			<%
   			
   			String realFolder = ""; //���� ���
   			realFolder = "C:\\Users\\myhoh\\eclipse-workspace\\Project2\\WebContent\\memberupload";
   			
   			int fileSize = 5 * 1024 * 1024; //5MB
   			//fileSize = byte ������ ����
   			MultipartRequest multi = null; //���� ���ε� ó��
   			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //�ߺ� ���� �� ����
   			multi = new MultipartRequest(request, realFolder, fileSize, "euc-kr", policy);
   			
   			//��й�ȣ ��ȣȭ 
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
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					
   			   			   			   					//���� �ð� ���ϱ�
   			   			   			   					long startTime = System.currentTimeMillis();
   			   			   			   					Timestamp a = new Timestamp(startTime);
   			   			   			   					
   			   			   			   					dto.setReg(a);
   			   			   			   					
   			   			   			   					MemberDAO dao = new MemberDAO();
   			   			   			   				result = dao.insertMember(dto);
   			   			   			   				
   			   			   			   				if(result > 0){
   			   			%>
				
				<div id="wrap">
        <br><br>
        <b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="blue"><%=dto.getUserId() %></font>�� ������ ���ϵ帳�ϴ�.
        <br><br>
        
        <%-- �ڹٺ󿡼� �Էµ� ���� �����Ѵ�. --%>
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=dto.getUserId() %></td>
            </tr>
                        
            <tr>
                <td id="title">�̸�</td>
                <td><%=dto.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td><%=dto.getGender() %></td>
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
                    <%=dto.getEmail1() %>@<%=dto.getEmail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=dto.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
                    <%=dto.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="Ȯ��" onclick="goLoginForm()">
    </div>
			
		<%
			}	
		%>
		
		
</body>
</html>
