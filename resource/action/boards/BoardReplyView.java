package action.boards;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import mybatis.dao.BoardDAO;
import mybatis.dto.BoardDTO;

public class BoardReplyView implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardDetail(b_num);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("views/boards/board_reply.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
