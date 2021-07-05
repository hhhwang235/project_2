package action.shoppingMall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.CartDAO;
import mybatis.dto.CartDTO;


public class CartProcessAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다.
		
		CartDTO dto = new CartDTO();
			dto.setcNum(Integer.parseInt(request.getParameter("b_num")));
			dto.setcMembers(a);
			long startTime = System.currentTimeMillis();
	   					Timestamp time = new Timestamp(startTime);
	   					
	   		dto.setcReg(time);
	   		dto.setAmount(Integer.parseInt(request.getParameter("amount")));
		//비즈니스 로직
		CartDAO dao = new CartDAO();
		int succ = dao.cartInsert(dto);
		response.setContentType("text/html; charset = utf-8"); //MIME 설정
		PrintWriter out =response.getWriter(); 
		if(succ > 0) {
			out.println("<script> alert('장바구니에 담았습니다.');");
			out.println("location.href = 'goodsList.do';</script>");
		}else {
			out.println("<script> alert('장바구니 담기 불가능한 상품 입니다.');");
			out.println("location.href = 'goodsList.do';</script>");
		}
		
		}
		return null;
	}
	
}