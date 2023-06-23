package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;
import com.som.model.CartDAO;

public class DeleteCart implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		int cart_seq = Integer.parseInt(request.getParameter("cart_seq"));
		System.out.println("delete service check:" + cart_seq);
		CartDAO dao = new CartDAO();
		int res = dao.deleteCart(cart_seq);
		
		if (res>0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		return "shopping-cart.jsp";
	}

}
