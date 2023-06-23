package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.som.command.Command;
import com.som.model.UsersDAO;
import com.som.model.UsersVO;

public class JoinService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = "joinSuccess.jsp";
	
	    String user_id = request.getParameter("user_id");
	    System.out.println(user_id);
		String user_pw = request.getParameter("user_pw");
		System.out.println(user_pw);
		String user_name = request.getParameter("user_name");
		System.out.println(user_name);
		
		String zipNo = request.getParameter("zipNo");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		// 주소
		String user_address = zipNo+" "+addr1+" "+addr2+" "+addr3;
		
		System.out.println(user_address);
		String user_nick = request.getParameter("user_nick");
		System.out.println(user_nick);
		String user_phone = request.getParameter("user_phone");
		System.out.println(user_phone);
		
		UsersVO vo = new UsersVO(user_id,user_pw,user_name,user_nick,user_address,user_phone);
		UsersDAO dao = new UsersDAO();
		int cnt = dao.insertUser(vo);
		
		if(cnt>0) {
			
			System.out.println("회원가입 성공");
			moveURL = "joinSuccess.jsp";
			
		}else {
			System.out.println("회원가입 실패");
			moveURL = "joinPage.jsp";	
		}
	
		return moveURL;
	}

}
