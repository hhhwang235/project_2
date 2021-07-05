package action.boards;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import mybatis.dao.BoardDAO;
import mybatis.dto.BoardDTO;

public class BoardInsertAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다 : 매개 변수 정보를 가져온다 → DTO 묶어준다.
		
		request.setCharacterEncoding("utf-8");
		
		String saveFoleder = "boardupload";
//		String realFolder = request.getRealPath(saveFoleder);
		
		String realFolder = ""; //저장 경로
		realFolder = "C:\\Users\\myhoh\\eclipse-workspace\\Project2\\WebContent\\boardupload";
		
		int fileSize = 5 * 1024 * 1024; //5MB
		//fileSize = byte 단위로 들어간다
		MultipartRequest multi = null; //파일 업로드 처리
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //중복 파일 명 방지
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", policy);
		BoardDTO dto = new BoardDTO(); //BoardBean, BoardVo 라고도 부른다.
		dto.setB_writer(multi.getParameter("b_writer"));
		dto.setB_subject(multi.getParameter("b_subject"));
		dto.setB_content(multi.getParameter("b_content"));
		dto.setB_pwd(multi.getParameter("b_pwd"));
		dto.setB_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		//뭔지 모르니까 찍어본다 ▶ 파일 이름이 찍힘 (ex : apple1.png)
		//System.out.println(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		
		//입력하는 데이터의 개수가 DTO 생성자의 매개 변수보다 적을때,
		//데이터 입력 방법 ① : 기본 생성자 메서드 이용
		/*
		BoardDTO dto = new BoardDTO();
		dto.setB_writer(b_writer);
		//dto.setB_writer(request.getParameter("b_writer"));
		dto.setB_subject(b_subject);
		dto.setB_content(b_content);
		dto.setB_pwd(b_pwd);
		*/
	
		//비즈니스 로직 : DAO 연동(DB 접속, 쿼리 수행)
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//프레젠테이션 로직 : alert 창을 사용 ▶ PrintWriter를 이용한 script 코드로 구현
		response.setContentType("text/html; charset = utf-8"); //MIME 설정
		PrintWriter out =response.getWriter(); 
		if(succ > 0) {
			out.println("<script> alert('등록 완료되었습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		} else {
			out.println("<script> alert('등록 실패했습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		}
		return null; 	//위의 코드(script)에서 페이지 전환이 이루어지므로,
		}				//ActionForward가 필요하지 않는다 → null을 리턴한다.
		return null;
	}
}