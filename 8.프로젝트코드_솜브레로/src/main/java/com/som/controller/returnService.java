package com.som.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;
import com.som.model.returnDAO;
import com.som.model.returnVO;

public class returnService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		int rental_seq = Integer.parseInt(request.getParameter("rental_seq"));
		int return_quantity = Integer.parseInt(request.getParameter("return_quantity"));
		String return_date = request.getParameter("return_date");
		String return_others = request.getParameter("return_others");
		
		returnVO vo = new returnVO(user_seq, rental_seq, return_quantity, return_date, return_others);
		returnDAO dao = new returnDAO();
		int cnt = dao.insertReturn(vo);
		
		if(cnt>0) {
			// 반납처리 완료
			System.out.println("반납처리 완료");
		}else {
			// 실패
			System.out.println("반납처리 실패");
		}
		
		
		return "returnPopup.jsp";
	}

}
