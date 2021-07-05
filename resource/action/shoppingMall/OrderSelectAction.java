package action.shoppingMall;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.GoodsDAO;
import mybatis.dao.PortDAO;
import mybatis.dto.GoodsDTO;
import mybatis.dto.PortDTO;


public class OrderSelectAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다.
			String b = request.getParameter("b_num");
			String c = request.getParameter("amount");
			request.setAttribute("b", b);
			request.setAttribute("a", a);
			request.setAttribute("c", c);
	   		
			//클라이언트의 요청을 받는다.
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			
			//비즈니스 로직
			GoodsDAO dao = new GoodsDAO();
			GoodsDTO dto = dao.goodsDetail(b_num);
			request.setAttribute("myMarketDto", dto);
			
			
			PortDAO pdao = new PortDAO();
			List<PortDTO> pdto = pdao.portAll();
			request.setAttribute("plist", pdto);
			
			response.setContentType("text/html; charset = utf-8"); //MIME 설정
			PrintWriter out =response.getWriter(); 
			out.println("<script> alert('구매 페이지로 이동 합니다.');");
			out.println("</script>");
			//프레젠테이션 로직
			ActionForward forward = new ActionForward();
			forward.setPath("views/shoppingMall/orderSelect.jsp");
			forward.setRedirect(false);
			return forward;
			
			
			}
			return null;
	}
	
}