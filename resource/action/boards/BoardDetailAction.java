package action.boards;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.BoardDAO;
import mybatis.dao.tblCommentDAO;
import mybatis.dto.BoardDTO;
import mybatis.dto.tblCommentDTO;

public class BoardDetailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다.
		String b_num = request.getParameter("b_num");
		
		//비즈니스 로직
		BoardDAO dao = new BoardDAO();
		dao.boardCount(b_num);					//조회수가 먼저 증가해야 글 조회 화면에서 증가된 조회수가 보임
		BoardDTO dto = dao.boardDetail(b_num);	//글 내용 검색
		request.setAttribute("dto", dto);
		
		int c_num = Integer.parseInt(request.getParameter("b_num"));
		tblCommentDAO dao2 = new tblCommentDAO();
		List<tblCommentDTO> list = dao2.commentSearchAll(c_num);
		request.setAttribute("list", list);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("views/boards/boardDetail.jsp");
		forward.setRedirect(false);
		return forward;
		}
		return null;
	}
	
}