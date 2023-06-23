package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;
import com.som.model.CartDAO;
import com.som.model.CartVO;

public class InsertCart  implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("help!!!!!!!!!!!!!!!!!!!!");
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		System.out.println(user_seq);
		// 대여 기간
		int cart_period = Integer.parseInt(request.getParameter("rental_period"));
		// 대여 수량
		int cart_quantity = Integer.parseInt(request.getParameter("rental_quantity"));
		int price = Integer.parseInt(request.getParameter("product_price").replace("원", "").trim());
		int product_price = price*cart_quantity*(cart_period/7);
		System.out.println("가격 제발.."  + price+ "," + product_price);
		
		// 상품 순번
		int product_seq = Integer.parseInt(request.getParameter("product_seq"));
		CartVO cartVo = new CartVO(user_seq, product_seq, cart_quantity, cart_period, product_price);
		CartDAO dao = new CartDAO();
		int res = dao.insertCart(cartVo);
		if (res>0) {
			System.out.println("장바구니 업데이트 성공");
		} else {
			System.out.println("장바구니 업데이트 실패");
		}
		String url = "";
		boolean check = (Boolean.parseBoolean(request.getParameter("check")));
		if (check) {
			url = "product-detail.jsp?product_seq="+product_seq;
		}else {
			url = "shopping-cart.jsp";
		}
		return url;
	}
}
