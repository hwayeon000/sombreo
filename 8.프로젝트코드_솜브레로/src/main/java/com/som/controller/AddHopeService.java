package com.som.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.som.command.Command;
import com.som.model.HopeDAO;
import com.som.model.HopeVO;



public class AddHopeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// post 방식 인코딩
		//request.setCharacterEncoding("utf-8");
		
		// 파일 업로드 -> MultipartRequest -> cos.jar
		// 1. 모든 요청 데이터가 들어있는 request 객체
		// 2. 업로드된 파일(이미지)를 저장할 경로(파일을 DB에 저장하지 않고 file에 따로 관리)
		// new MultipartRequest(request, getServletName(), 0, getServletInfo(), null)
		String path = request.getServletContext().getRealPath("./file");
		System.out.println("저장위치 : "+path);
		
		// 3. 파일의 max size 
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		// 4. 인코딩 방식
		String encoding = "UTF-8";
		
		// 5. 중복제거 - >파일명 뒤에 숫자로 식별할 수 있게 해주는 객체
		//			: DefaultFileRenamePolicy 객체
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		// 파일 업로드 -> MultipartRequest
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// DB에 저장하기 위해 게시글 정보 가져오기
			String hope_name = multi.getParameter("hope_name");
			int hope_price = Integer.parseInt(multi.getParameter("hope_price"));
			String hope_content = multi.getParameter("hope_content");
			String hope_photo = multi.getFilesystemName("hope_photo"); 
			// getParameter도 가능하지만 
			//MultipartRequest 객체 안에 getFilesystemName 메서드로도 가능
			
			System.out.println("hope_name : "+ hope_name);
			System.out.println("hope_price : "+ hope_price);
			System.out.println("hope_content : "+ hope_content);
			System.out.println("hope_photo : "+ hope_photo);
			
			// vo로 담기
			HopeVO vo = new HopeVO(hope_name, hope_price, hope_content, hope_photo);
			HopeDAO dao = new HopeDAO();
			int cnt = dao.uploadHope(vo);
			
			if(cnt>0) {
				System.out.println("업로드 성공!");
			}else {System.out.println("업로드 실패ㅠㅠ");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ㄴㄴㄴㄴㄴㄴ");
		}
		
		String moveURL = "Hope.jsp";
		return moveURL;
	}



}
