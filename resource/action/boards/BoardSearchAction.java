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
import mybatis.dto.BoardDTO;
import mybatis.dto.SearchDTO;


public class BoardSearchAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트 요청
		request.setCharacterEncoding("utf-8");
		String part = request.getParameter("part");
		String searchData = request.getParameter("searchData");
		SearchDTO dto = new SearchDTO();
		dto.setPart(part);
		dto.setSearchData("%" + searchData + "%");
		
		//비즈니스 로직
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearch(dto);
		request.setAttribute("list", list);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("views/boards/boardSearchList.jsp");
		forward.setRedirect(false);
		return forward;
		}
		return null;
	}
}