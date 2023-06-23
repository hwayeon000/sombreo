package com.som.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.som.command.Command;
import com.som.model.UsersDAO;
import com.som.model.UsersVO;

public class UserStatusService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String moveURL = "";

		String user_status = request.getParameter("status");
		int user_seq = Integer.parseInt(request.getParameter("seq"));

		System.out.println(user_status + user_seq);

		UsersVO vo = new UsersVO(user_seq, user_status);
		System.out.println(vo.toString());
		UsersDAO dao = new UsersDAO();
		int cnt = dao.updateStatus(vo);

		if (cnt > 0) {
			request.setAttribute("user_status", vo);
			moveURL = "admin.jsp";
		} else {
			moveURL = "admin.jsp";
		}

		return moveURL;

	}

}
