package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;
import com.som.model.SaleDAO;
import com.som.model.SaleVO;

public class SaleStatusService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = "";

		String sale_return = request.getParameter("sale_return");
		int sale_seq = Integer.parseInt(request.getParameter("sale_seq"));

		System.out.println(sale_return + sale_seq);

		SaleVO vo = new SaleVO(sale_return,sale_seq);
		SaleDAO dao = new SaleDAO();
		int cnt = dao.updateReturn(vo);

		if (cnt > 0) {
			System.out.println("제발돼라");
			request.setAttribute("sale_return", vo);
			moveURL = "admin.jsp";
		} else {
			System.out.println("안됐으니까 옥상 ㄱㄱ");
			moveURL = "admin.jsp";
		}

		return moveURL;

	}
}


