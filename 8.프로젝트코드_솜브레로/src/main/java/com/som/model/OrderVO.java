package com.som.model;

import java.sql.Timestamp;

public class OrderVO {
	
	private int order_seq;
	private int user_seq;
	private int order_quantity;
	private int order_payment;
	private Timestamp order_date;
	
	public OrderVO() {
		super();
	}
	public OrderVO(int order_seq, int user_seq, int order_quantity, int order_payment,
			Timestamp order_date) {
		super();
		this.order_seq = order_seq;
		this.user_seq = user_seq;
		this.order_quantity = order_quantity;
		this.order_payment = order_payment;
		this.order_date = order_date;
	}
	
	public OrderVO(int user_seq, int order_payment) {
		super();
		this.user_seq = user_seq;
		this.order_payment = order_payment;
	}
	
	public int getOrder_seq() {
		return order_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public int getOrder_payment() {
		return order_payment;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	
	
}
