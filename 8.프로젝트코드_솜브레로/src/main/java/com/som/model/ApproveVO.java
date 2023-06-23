package com.som.model;

public class ApproveVO {
	
	private int approve_seq;
	private int order_seq;
	private String approve_number;
	private String approve_card;
	private int approve_price;
	private String approve_transfer_user;
	private int approve_date;
	
	private int user_seq;
	
	public ApproveVO() {
		super();
	}
	public ApproveVO(int approve_seq, int order_seq, String approve_number, String approve_card, int approve_price,
			String approve_transfer_user, int approve_date) {
		super();
		this.approve_seq = approve_seq;
		this.order_seq = order_seq;
		this.approve_number = approve_number;
		this.approve_card = approve_card;
		this.approve_price = approve_price;
		this.approve_transfer_user = approve_transfer_user;
		this.approve_date = approve_date;
	}
	
	public ApproveVO(String approve_number, String approve_card, int approve_price, String approve_transfer_user, int user_seq) {
		super();
		this.approve_number = approve_number;
		this.approve_card = approve_card;
		this.approve_price = approve_price;
		this.approve_transfer_user = approve_transfer_user;
		this.user_seq = user_seq;
	}
	
}
