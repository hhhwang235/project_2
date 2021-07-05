package action.shoppingMall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import mybatis.dao.GoodsDAO;
import mybatis.dao.OrdersDAO;
import mybatis.dao.PortDAO;
import mybatis.dto.GoodsDTO;
import mybatis.dto.OrdersDTO;
import mybatis.dto.PortDTO;


public class OrderSuccessAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
			
			//주문 항목 업로드
			OrdersDTO dto = new OrdersDTO();
			
			dto.setoMembers(a);
			dto.setoName(request.getParameter("name"));	
			dto.setoAddress(request.getParameter("address"));
			dto.setoPhone(request.getParameter("phone"));
			dto.setoPort(request.getParameter("portCheck"));
			dto.setoProtMessage(request.getParameter("portMessage"));
			dto.setoNum(Integer.parseInt(request.getParameter("num")));
			dto.setoAmount(Integer.parseInt(request.getParameter("amount2")));
			dto.setoSumPrice(Integer.parseInt(request.getParameter("sumPrice")));
			long startTime = System.currentTimeMillis();
				Timestamp time = new Timestamp(startTime);
			dto.setoReg(time);
			
			//남은 수량 계산하기
			int amount1  = Integer.parseInt(request.getParameter("amount1"));
			int amount2  = Integer.parseInt(request.getParameter("amount2"));
			int amountResult = amount1 - amount2;
			
			GoodsDTO gdto = new GoodsDTO();
			gdto.setgAmount(amountResult);
			gdto.setgNum(Integer.parseInt(request.getParameter("num")));
			
			
			GoodsDAO gdao = new GoodsDAO();
			gdao.goodsAmountUpdate(gdto);
			
			
			
			OrdersDAO dao = new OrdersDAO();
			dao.ordersInsert(dto);
			
			//프레젠테이션 로직
			ActionForward forward = new ActionForward();
			forward.setPath("views/shoppingMall/orderComplete.jsp");
			forward.setRedirect(false);
			return forward;
			
			
			}
			return null;
	}
	
}