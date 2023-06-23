package com.som.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;
import com.som.model.ApproveDAO;
import com.som.model.ApproveVO;
import com.som.model.CartDAO;
import com.som.model.CartVO;
import com.som.model.OrderDAO;
import com.som.model.OrderVO;
import com.som.model.RentalDAO;
import com.som.model.RentalVO;

public class OrderService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("order service");
		// user_seq 정보 받아오기
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		// 주문 금액
		int order_payment = Integer.parseInt(request.getParameter("order_payment"));
		System.out.println(order_payment);
		
		// 여러 과정을 처리 할 스텝과 결과값을 받아 올 변수 하나 선언
		boolean nextStep = false;
		int res = 0;
		
		// ================================= 주문번호 등록 =================================
		OrderVO vo = new OrderVO(user_seq, order_payment);
		OrderDAO dao = new OrderDAO();
		res = dao.insertOrder(vo);
		if (res>0) {
			System.out.println("주문번호 등록 완");
			nextStep = true;
			res = 0;
		} else {
			System.out.println("주문번호 등록 실패");
		}
		
		
		// ================================= 상품 별 상세 대여 정보 등록 =================================
		List<CartVO> list = null;
		list = new CartDAO().printCart(user_seq);
		
		int product_seq = 0;
		int rental_quantity = 0;
		int rental_period = 0;
		
		int product_price = 0;
		int rental_payment = 0;
		
		// 가져온 대여 수령인 및 결제자 정보
		// 주문자
		String approve_transfer_user = request.getParameter("approve_transfer_user");
		// 수취인
		String rental_user = request.getParameter("rental_user");
		// 연락처
		String rental_phone = request.getParameter("rental_phone");
		// 대여 배송지 (가져오기)
		String zipNo = request.getParameter("zipNo");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		// 대여 배송지
		String rental_address = zipNo+" "+addr1+" "+addr2+" "+addr3;
		
		// 결제정보
		// 카드 번호
		String approve_number = request.getParameter("approve_number");
		// 카드사 명
		String approve_card = request.getParameter("approve_card");
		// 결제된 가격
		int approve_price = Integer.parseInt(request.getParameter("approve_price"));
		
		
		System.out.println(rental_user);
		System.out.println(rental_phone);
		System.out.println("전체주소 : " + rental_address);
		System.out.println(approve_number + ", " + approve_card + ", " + approve_price);
		
		System.out.println(nextStep + ", "+ list.get(0).getProduct_name());
		if (nextStep && list!=null) {
			// 장바구니 상품 리스트를 반복문을 통해 rental 테이블에 정보 넣어주기
			for (int i = 0; i < list.size(); i++) { 
				product_seq = list.get(i).getProduct_seq();
				rental_quantity = list.get(i).getCart_quantity();
				rental_period = list.get(i).getCart_period();
				product_price = list.get(i).getProduct_price();
				rental_payment = product_price*(rental_period/7)*rental_quantity;
				
				RentalVO r_vo = new RentalVO(product_seq, rental_quantity, rental_period, rental_payment, rental_address, rental_user, rental_phone, user_seq);
				res = new RentalDAO().insertRental(r_vo);
				//int result = 4;
				if (res>0) {
					System.out.println(product_seq + "상품 대여 상세 등록 완");
					res = 0;
				} else {
					System.out.println(product_seq + "상품 대여 상세 등록 실패");
					nextStep = false;
				}
			}
		} else {
			System.out.println("주문 등록 실패 혹은 장바구니리스트 가져오기 실패");
			nextStep = false;
		}
		
		// ================================= 결제 정보 정보 등록 =================================
		if (nextStep) {
			ApproveVO a_vo = new ApproveVO(approve_number, approve_card, approve_price, approve_transfer_user, user_seq);
			res = new ApproveDAO().insertApprove(a_vo);
		}
		
		
		// ================================= 장바구니 비우기 =================================
		int resres = 0;
		if (res>0) {
			resres = new CartDAO().ClearCart(user_seq);
		} else {
			System.out.println("insertApprove 실패");
		}
		
		
		
		if(resres>0) {
			System.out.println("주문 최종 성공");
		}else {
			System.out.println("주문 실패");
		}
		
		
		return "completePayment.jsp";
	}

}
