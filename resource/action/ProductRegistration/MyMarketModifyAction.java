package action.ProductRegistration;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.GoodsDAO;
import mybatis.dto.GoodsDTO;


public class MyMarketModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		//클라이언트의 요청을 받는다.
		int g_num = Integer.parseInt(request.getParameter("g_num"));
		
		//비즈니스 로직
		GoodsDAO dao = new GoodsDAO();
		GoodsDTO dto = dao.goodsDetail(g_num);
		request.setAttribute("myMarketDto", dto);
		
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("views/ProductRegistration/myMarketModify.jsp");
		forward.setRedirect(false);
		return forward;
		}
		return null;
	}
	
}