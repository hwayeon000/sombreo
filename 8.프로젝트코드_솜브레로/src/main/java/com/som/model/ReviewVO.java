package com.som.model;

import java.sql.Timestamp;

public class ReviewVO {
	
	private int review_seq;
	private int user_seq;
	private int product_seq;
	private String review_photo;
	private String review_content;
	private Timestamp review_date;
	private int review_check;
	
	private String user_nick;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int review_seq, int user_seq, int product_seq, String review_photo, String review_content,
			Timestamp review_date, int review_check, String user_nick) {
		super();
		this.review_seq = review_seq;
		this.user_seq = user_seq;
		this.product_seq = product_seq;
		this.review_photo = review_photo;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_check = review_check;
		this.user_nick = user_nick;
	}
	
	public ReviewVO(int user_seq, int product_seq, String review_photo, String review_content, int review_check) {
		super();
		this.user_seq = user_seq;
		this.product_seq = product_seq;
		this.review_photo = review_photo;
		this.review_content = review_content;
		this.review_check = review_check;
	}

	public int getReview_seq() {
		return review_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public String getReview_photo() {
		return review_photo;
	}
	public String getReview_content() {
		return review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public int getReview_check() {
		return review_check;
	}
	public String getUser_nick() {
		return user_nick;
	}
	
	
	
	
	
}
