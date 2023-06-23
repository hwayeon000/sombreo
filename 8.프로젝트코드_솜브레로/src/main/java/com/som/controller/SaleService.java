package com.som.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.som.command.Command;
import com.som.model.SaleDAO;
import com.som.model.SaleVO;
import com.som.model.UsersVO;

public class SaleService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("./file"); // 저장할 경로
		System.out.println("저장 위치: " + path);
		int maxSize = 10 * 1024 * 1024; // 10mb
		String encoding = "utf-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		try {
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			HttpSession session = request.getSession();
			
			// String user_seq = session.getUser_seq();
			// 로그인 구현되면 session으로 수정
			
			UsersVO login_vo = (UsersVO)session.getAttribute("login_vo");
			int user_seq = login_vo.getUser_seq();
			
			// int cate_seq = Integer.parseInt(multi.getParameter("cate_seq"));
			int cate_depth1 = Integer.parseInt(multi.getParameter("cate_depth1"));
			int cate_depth2 = Integer.parseInt(multi.getParameter("cate_depth2"));
			
			String sale_name = multi.getParameter("sale_name");
			int sale_price  = Integer.parseInt(multi.getParameter("sale_price"));
			String sale_content = multi.getParameter("sale_content");
			String sale_photo = multi.getFilesystemName("sale_photo");
			String sale_bank = multi.getParameter("sale_bank");
			String sale_acc_holder = multi.getParameter("sale_acc_holder");
			int sale_account = Integer.parseInt(multi.getParameter("sale_account"));
			String sale_check = multi.getParameter("sale_check");
			
			SaleVO vo = new SaleVO(user_seq, sale_photo, sale_name, sale_price, sale_content, sale_account, sale_bank, sale_acc_holder, sale_check, cate_depth1, cate_depth2);
			SaleDAO dao = new SaleDAO();
			
			int cnt = dao.insertSale(vo);
			
			if(cnt>0) {
				// insert 성공
				System.out.println("매매 희망 상품 insert 성공");
			}else {
				// insert 실패
				System.out.println("매매 희망 상품 insert 실패");
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "sale.jsp";

	}

}