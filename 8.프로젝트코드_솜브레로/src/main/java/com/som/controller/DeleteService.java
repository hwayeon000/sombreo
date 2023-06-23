package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.som.command.Command;
import com.som.model.UsersDAO;
import com.som.model.UsersVO;

public class DeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = "";
		
		String user_id = request.getParameter("user_id");
		
		UsersVO vo = new UsersVO(user_id);
		UsersDAO dao = new UsersDAO();
		int cnt = dao.delete(vo);
		
		if(cnt > 0) {
			System.out.println("삭제성공");
			moveURL = "admin.jsp";
		}else {
			System.out.println("삭제실패");
			moveURL = "admin.jsp";
		}
		return moveURL;
	}
}
