package action.boards;

import java.io.IOException;
import java.io.PrintWriter;
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

public class BoardReplyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
			
		request.setCharacterEncoding("utf-8");
		tblCommentDTO dto = new tblCommentDTO();
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		dto.setC_num(b_num);//부모 테이블
		dto.setC_commenter(a);//작성자 
		dto.setC_content(request.getParameter("board_content"));//내용
		
		
		tblCommentDAO dao = new tblCommentDAO();
		
		
		
		int succ = dao.tblCommentInsert(dto);
		
		tblCommentDAO dao2 = new tblCommentDAO();
		List<tblCommentDTO> list = dao2.commentSearchAll(b_num);
		request.setAttribute("list", list);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.println("<script>alert('답글 등록 성공');");
			out.println("location.href='boardDetail.do?b_num=" + b_num + "';</script>");
		} else {
			out.println("<script>alert('답글 등록 실패');");
			out.println("history.go(-1);</script>");
		}
		return null;
		}
		return null;
	}
}