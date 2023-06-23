package com.som.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.controller.AddHopeService;
import com.som.controller.AnswerService;
import com.som.controller.DeleteCart;
import com.som.controller.DeleteService;
import com.som.controller.GetProductDetail;
import com.som.controller.InquiryService;
import com.som.controller.InsertCart;
import com.som.controller.JoinService;
import com.som.controller.LoginService;
import com.som.controller.LogoutService;
import com.som.controller.MessageService;
import com.som.controller.OrderService;
import com.som.controller.ReviewService;
import com.som.controller.SaleService;
import com.som.controller.SaleStatusService;
import com.som.controller.UserStatusService;
import com.som.controller.returnService;
import com.som.command.Command;


@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[Frontcontroller]");
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String result = reqURI.substring(contextPath.length() + 1);
		System.out.println("최종 uri : " + result);
		Command service = null;
		
		if (result.equals("LoginService.do")) {
			// 로그인 기능
			service = new LoginService();
		} else if (result.equals("JoinService.do")) {
			// 회원가입
			service = new JoinService();
		} else if (result.equals("LogoutService.do")) {
			// 로그아웃
			service = new LogoutService();
		} else if (result.equals("GetProductDetail.do")) {
			// 상품 정보 가져오기
			service = new GetProductDetail();
		} else if (result.equals("InsertCart.do")) {
			// 장바구니 업뎃
			service = new InsertCart();
		} else if (result.equals("DeleteCart.do")) {
			// 장바구니 삭제
			service = new DeleteCart();
		} else if (result.equals("OrderService.do")) {
			// 주문 정보 처리 가져오기
			service = new OrderService();
		} else if (result.equals("SaleService.do")) {
			// 매매 희망 서비스
			service = new SaleService();
		} else if (result.equals("DeleteService.do")) {
			// 관리자 회원삭제 서비스
			service = new DeleteService();
		} else if (result.equals("ReviewService.do")) {
			// 리뷰 등록 서비스
			service = new ReviewService();
		} else if (result.equals("MessageService.do")) {
			// 메세지 저장 기능
			service = new MessageService();
		} else if (result.equals("UserStatusService.do")) {
			// 회원 구매진행상태 변경
			service = new UserStatusService();
		} else if (result.equals("InquiryService.do")) {
			// 문의 게시판
			service = new InquiryService();
		} else if (result.equals("SaleStatusService.do")) {
			// 상품 상태 변경
			service = new SaleStatusService();
		} else if (result.equals("AnswerService.do")) {
			// 문의 답변
			service = new AnswerService();
		}else if(result.equals("returnService.do")) {
			// 반납 게시판
			service = new returnService();
		}else if(result.equals("AddHopeService.do")) {
			// 희망상품 등록
			service = new AddHopeService();
		} 
		
		String moveURL = service.execute(request, response);
		response.sendRedirect(moveURL);
	}

}
