package action.boards;

import java.io.IOException;

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

public class BoardUpdateAction implements Action {
@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	HttpSession session = request.getSession();
	String a = (String)session.getAttribute("sessionID");
	if(a != null) {
		
		String saveFoleder = "boardupload";
//		String realFolder = request.getRealPath(saveFoleder);
		
		String realFolder = ""; //저장 경로
		realFolder = "C:\\Users\\myhoh\\eclipse-workspace\\Project2\\WebContent\\boardupload";
		
		int fileSize = 5 * 1024 * 1024; //5MB
		//fileSize = byte 단위로 들어간다
		MultipartRequest multi = null; //파일 업로드 처리
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy(); //중복 파일 명 방지
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", policy);
		
	//클라이언트 요청
	BoardDTO dto = new BoardDTO();
	dto.setB_num(Integer.parseInt(multi.getParameter("b_num")));
	dto.setB_subject(multi.getParameter("b_subject"));
	dto.setB_content(multi.getParameter("b_content"));
	dto.setB_pwd(multi.getParameter("b_pwd"));
	dto.setB_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
	
	//비즈니스 로직
	BoardDAO dao = new BoardDAO();
	dao.boardUpdate(dto);
	
	//프레젠테이션 로직
	ActionForward forward = new ActionForward();
	forward.setPath("boardList.do");
	forward.setRedirect(true);
	return forward;
		}
	return null;
	}
}