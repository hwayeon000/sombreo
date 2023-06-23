package com.som.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.som.command.Command;

public class ApproveService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Approve Service");
		
		
		
		
		
		return "approved.jsp";
	}

}
