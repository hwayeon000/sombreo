package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.som.command.Command;
import com.som.model.AnswerDAO;
import com.som.model.AnswerVO;
import com.som.model.InquiryVO;
import com.som.model.UsersVO;
import com.som.model.inquiryDAO;

public class AnswerService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int inquiry_seq = Integer.parseInt(request.getParameter("inquiry_seq"));
		String answer_title = request.getParameter("answer_title");
		String answer_content = request.getParameter("answer_content");
		
		AnswerDAO dao = new AnswerDAO();
		AnswerVO vo = new AnswerVO(inquiry_seq,answer_title,answer_content);
		
		int cnt = dao.uploadInquiry(vo);
		
		if(cnt>0) {
			System.out.println("답변 ㄱㄱ");
		}else {
			System.out.println("답변 ㄴㄴ");
		}
		
		return "admin.jsp";
	}

}
