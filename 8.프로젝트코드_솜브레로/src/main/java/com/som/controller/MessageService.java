package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.model.MessageDAO;
import com.som.model.MessageVO;
import com.som.command.Command;

public class MessageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String sender = request.getParameter("sender");
		String recipient = request.getParameter("recipient");
		String message = request.getParameter("message");
		
		System.out.println(sender + " / " + recipient + " / " + message);
		
		MessageVO vo = new MessageVO(sender, recipient, message);
		int res = new MessageDAO().messageUpdate(vo);

		if (res > 0) {
			// 메세지 업데이트 성공
			System.out.println("메세지 전송 성공");
		} else {
			// 메세지 업데이트 실패
			System.out.println("메세지 전송 실패");
		}
		return "main.jsp";
	}

}
