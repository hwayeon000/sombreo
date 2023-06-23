package com.som.model;

import java.sql.Timestamp;

public class mypageVO {
	private Timestamp order_date;
	private int product_seq;
	private int rental_quantity;
	private int rental_period;
	private int rental_payment;
	
	private int user_seq;
	private String product_name;
	private Timestamp return_date;
	private String photo_path;
	
	// 1:1 문의
	private int inquiry_seq;
	private String inquiry_title;
	private String inquiry_content;
	private Timestamp inquiry_date;
	private int answer_seq;
	private String answer_title;
	private String answer_content;
	private Timestamp answer_date;
	
	
	public mypageVO() {
		super();
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public int getProduct_seq() {
		return product_seq;
	}

	public int getRental_quantity() {
		return rental_quantity;
	}

	public int getRental_period() {
		return rental_period;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public String getProduct_name() {
		return product_name;
	}

	public int getRental_payment() {
		return rental_payment;
	}

	public Timestamp getReturn_date() {
		return return_date;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public int getInquiry_seq() {
		return inquiry_seq;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public Timestamp getInquiry_date() {
		return inquiry_date;
	}

	public int getAnswer_seq() {
		return answer_seq;
	}

	public String getAnswer_title() {
		return answer_title;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public Timestamp getAnswer_date() {
		return answer_date;
	}

		
	
	
}
