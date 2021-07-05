package action.shoppingMall;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.ResultMap;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import mybatis.dao.BoardDAO;
import mybatis.dao.CartDAO;
import mybatis.dao.GoodsDAO;
import mybatis.dto.BoardDTO;
import mybatis.dto.CartDTO;
import mybatis.dto.GoodsDTO;
import mybatis.dto.testDTO;

public class CartViewAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("sessionID");
		if(a != null) {
		
			
			//비즈니스 로직 : DAO 연동(DB 접속, 쿼리 수행)
			CartDAO dao = new CartDAO();
			List<testDTO> list =  dao.cartSelect(a);
		request.setAttribute("cartList", list);
		
		//BoardListAction 작업을 마무리 했다 → 프레젠테이션 로직(페이지 전환) : ActionForward.java
		//① View Page(path) : board/boardList.jsp
		//② 페이지 전환 방식(isRedirect) : forward()
		ActionForward forward = new ActionForward();
		forward.setPath("views/shoppingMall/cartView.jsp");
		forward.setRedirect(false); // true : sendRedirect() / false : forward()
		return forward;
		}
		return null;
	}
}
