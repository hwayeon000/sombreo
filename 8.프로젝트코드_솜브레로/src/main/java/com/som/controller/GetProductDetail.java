package com.som.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.som.command.Command;
import com.som.model.ProductDAO;
import com.som.model.ProductVO;

public class GetProductDetail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Get Product Deatil");
		
		// 상품 seq 받아와야함
		int product_seq = Integer.parseInt(request.getParameter("product_seq"));
		ProductVO list = new ProductDAO().getProductDetail(product_seq);
		System.out.println("상품 정보 가져오기 성공 : " + list.getProduct_price());
		
		return "product-detail.jsp";
	}
	
}
