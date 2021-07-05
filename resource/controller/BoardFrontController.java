package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.ProductRegistration.AmountProcessAction;
import action.ProductRegistration.DeleteSelectAction;
import action.ProductRegistration.MyMarketInsertAction;
import action.ProductRegistration.MyMarketListAction;
import action.ProductRegistration.MyMarketModifyAction;
import action.boards.BoardCommentAction;
import action.boards.BoardDeleteAction;
import action.boards.BoardDetailAction;
import action.boards.BoardInsertAction;
import action.boards.BoardListAction;
import action.boards.BoardReplyAction;
import action.boards.BoardReplyView;
import action.boards.BoardSearchAction;
import action.boards.BoardUpdateAction;
import action.boards.BoardUpdateFormAction;
import action.shoppingMall.CartClearAction;
import action.shoppingMall.CartProcessAction;
import action.shoppingMall.CartViewAction;
import action.shoppingMall.GoodsListAction;
import action.shoppingMall.MyMarketDetailAction;
import action.shoppingMall.OrderSelectAction;
import action.shoppingMall.OrderSuccessAction;

@WebServlet("/BoardFrontController.do")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 불필요한 코드를 지우고 서비스 메서드만 남겨둔다.
		//1. 클라이언트가 어떤 요청을 했는지를 파악한다.
		request.setCharacterEncoding("utf-8");
		//localhost:8080/mbb/boardList.do
		//mbb : context root
		//mbb/boardList.do : uri-pattern
		//uri-pattern에서 context root를 잘라내서 boardList.do만 남긴다.
		String uri = request.getRequestURI();		//uri-pattern 값	: /mbb/XXX.do
		String ctx = request.getContextPath();		//Context root 값	: /mbb
		String command = uri.substring(ctx.length());	//실제 요청한 페이지 : /XXX.do
		//System.out.println("uri : " + uri);
		//System.out.println("ctx : " + ctx);
		//System.out.println("command : " + command);
		
		
		//2. 클라이언트의 요청(*.do → command)과 실제 처리할 비즈니스 로직(Action Class) 연결
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/boardList.do")) {
			action = new BoardListAction();		//상위 객체(부모)쪽으로 업캐스팅 (다형성)
			forward = action.execute(request, response);
		} else if(command.equals("/boardInsertForm.do")) {	//글쓰기 폼으로 화면 전환만 필요 (Action 클래스 필요 X, 화면 전환은 ActionForward가 담당)
			forward = new ActionForward();
			forward.setPath("views/boards/boardInsertForm.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/boardInsert.do")) {
			action = new BoardInsertAction();
			forward = action.execute(request, response); //forward에 null값이 리턴된다.
		} else if(command.equals("/boardDetail.do")) {
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardDelete.do")) {
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardUpdateForm.do")) {
			action = new BoardUpdateFormAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardUpdate.do")) {
			action = new BoardUpdateAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardSearch.do")) {
			action = new BoardSearchAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardReplyView.do")) {
			action = new BoardReplyView();
			forward = action.execute(request, response);
		} else if(command.equals("/boardReplyAction.do")) {
			action = new BoardReplyAction();
			forward = action.execute(request, response);
		}else if(command.equals("/boardComment.do")) {
			action = new BoardCommentAction();
			forward = action.execute(request, response);
		}else if(command.equals("/goodsList.do")) {
			action = new GoodsListAction();
			forward = action.execute(request, response);
		}else if(command.equals("/MyMarketList.do")) {
			action = new MyMarketListAction(); 
			forward = action.execute(request, response);
		}else if(command.equals("/MyMarketInsertForm.do")) {	//글쓰기 폼으로 화면 전환만 필요 (Action 클래스 필요 X, 화면 전환은 ActionForward가 담당)
			forward = new ActionForward();
			forward.setPath("views/ProductRegistration/myMarketInsertFrom.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/MyMarketInsert.do")) {
			action = new MyMarketInsertAction();
			forward = action.execute(request, response); //forward에 null값이 리턴된다.
		} else if(command.equals("/myMarketDetail.do")) {
			action = new MyMarketDetailAction();
			forward = action.execute(request, response); //forward에 null값이 리턴된다.
		} else if(command.equals("/CartProcess.do")) {
			action = new CartProcessAction();
			forward = action.execute(request, response);
		} else if(command.equals("/CartView.do")) {
			action = new CartViewAction();
			forward = action.execute(request, response);
		}else if(command.equals("/CartClear.do")) {
			action = new CartClearAction();
			forward = action.execute(request, response);
		} else if(command.equals("/OrderSelect.do")) {
			action = new OrderSelectAction();
			forward = action.execute(request, response);
		} else if(command.equals("/OrderSuccess.do")) {
			action = new OrderSuccessAction();
			forward = action.execute(request, response);
		} else if(command.equals("/myMarketModify.do")) {
			action = new MyMarketModifyAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AmountProcess.do")) {
			action = new AmountProcessAction();
			forward = action.execute(request, response);
		} else if(command.equals("/DeleteSelect.do")) {
			action = new DeleteSelectAction();
			forward = action.execute(request, response);
		}
		
		//3. 페이지 전환(프레젠테이션 로직) : sendRedirect(), forward()
		if(forward != null) {	//forward가 null 아니면 작동
			if(forward.isRedirect()) {	//true : sendRedirect() 페이지 전환
				response.sendRedirect(forward.getPath());
			} else {					//false : forward() 페이지 전환
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}	
		}
	}
}