package com.som.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.som.command.Command;
import com.som.model.ReviewDAO;
import com.som.model.ReviewVO;

public class ReviewService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Review Service");
		String path = request.getServletContext().getRealPath("./file");
		System.out.println("저장위치 : " + path);
		int maxSize = 10 * 1024 * 1024; // 10MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi;
		int product_seq = 0;
		int user_seq = 0;
		String review_content = "";
		int review_check = 0;
		String review_photo = "";
		
		/*
		 * product_Seq = Integer.parseInt(request.getParameter("product_seq")); user_Seq
		 * = Integer.parseInt(request.getParameter("user_seq")); review_content =
		 * request.getParameter("review"); review_check =
		 * Integer.parseInt(request.getParameter("rating")); review_photo =
		 * request.getParameter("filename");
		 */
		
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// DB에 저장하기 위헤 게시글 정보 가져오기
			product_seq = Integer.parseInt(multi.getParameter("product_seq"));
			user_seq = Integer.parseInt(multi.getParameter("user_seq"));
			review_content = multi.getParameter("review");
			review_check = Integer.parseInt(multi.getParameter("rating"));
			review_photo = multi.getFilesystemName("filename");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ReviewVO r_vo = new ReviewVO(user_seq, product_seq, review_content, review_photo, review_check);
		int res = new ReviewDAO().updateReview(r_vo);
		
		if (res > 0) {
			// 업로드 성공
			System.out.println("업로드 성공");
		} else {
			// 업로드 실패
			System.out.println("업로드 실패");
		}
		
		return "product-detail.jsp?product_seq="+product_seq;
	}

}
