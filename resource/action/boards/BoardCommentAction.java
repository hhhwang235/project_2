package action.boards;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.tblCommentDAO;
import mybatis.dto.tblCommentDTO;

public class BoardCommentAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다.
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		tblCommentDAO dao2 = new tblCommentDAO();
		List<tblCommentDTO> list = dao2.commentSearchAll(b_num);
		request.setAttribute("list", list);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardComment.jsp?b_num=" + b_num);
		forward.setRedirect(false);
		return forward;
		}
		return null;
	}
	
}