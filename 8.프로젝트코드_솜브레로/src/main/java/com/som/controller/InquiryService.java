package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.som.command.Command;
import com.som.model.InquiryVO;
import com.som.model.UsersVO;
import com.som.model.inquiryDAO;

public class InquiryService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UsersVO login_vo = (UsersVO)session.getAttribute("login_vo");
		int user_seq = login_vo.getUser_seq();
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		
		inquiryDAO dao = new inquiryDAO();
		InquiryVO vo = new InquiryVO(user_seq,inquiry_title,inquiry_content);
		
		int cnt = dao.uploadInquiry(vo);
		
		if(cnt>0) {
			System.out.println("질문 ㄱㄱ");
		}else {
			System.out.println("질문 ㄴㄴ");
		}
		
		return "contact.jsp";
	}


}
