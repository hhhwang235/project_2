package action.ProductRegistration;

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


public class AmountProcessAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
					
			//수량 채워 넣기
			int amount  = Integer.parseInt(request.getParameter("amount"));
		
			
			GoodsDTO gdto = new GoodsDTO();
			gdto.setgAmount(amount);
			gdto.setgNum(Integer.parseInt(request.getParameter("b_num")));
			
			
			GoodsDAO gdao = new GoodsDAO();
			int succ = gdao.goodsAmountUpdate(gdto);
			
			
			//프레젠테이션 로직 : alert 창을 사용 ▶ PrintWriter를 이용한 script 코드로 구현
			response.setContentType("text/html; charset = utf-8"); //MIME 설정
			PrintWriter out =response.getWriter(); 
			if(succ > 0) {
				out.println("<script> alert('수량이 변경 되었습니다.');");
				out.println("location.href = 'MyMarketList.do';</script>");
			} else {
				out.println("<script> alert('수량 변경에 실패하였습니다.');");
				out.println("location.href = 'myMarketModify.do';</script>");
			}
			return null; 	//위의 코드(script)에서 페이지 전환이 이루어지므로,
			}				//ActionForward가 필요하지 않는다 → null을 리턴한다.
			return null;
	}
	
}