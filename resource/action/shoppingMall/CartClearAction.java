package action.shoppingMall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.CartDAO;


public class CartClearAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트 요청
		String b_num = request.getParameter("b_num");
		
		//비즈니스 로직
		CartDAO dao = new CartDAO();
		dao.cartClear(a);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		response.setContentType("text/html; charset = utf-8"); //MIME 설정
		PrintWriter out =response.getWriter(); 
		out.println("<script> alert('장바구니를 비웠습니다.');");
		forward.setPath("goodsList.do");
		forward.setRedirect(true);
		return forward;
		}
		return null;
	}
}