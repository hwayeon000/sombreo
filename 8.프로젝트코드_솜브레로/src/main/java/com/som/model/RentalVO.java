package com.som.model;

import java.sql.Timestamp;

public class RentalVO {

	private int rental_seq;
	private int order_seq;
	private int product_seq;
	private int rental_quantity;
	private int rental_period;
	private int rental_payment;
	private String rental_address;
	private String rental_user;
	private String rental_phone;
	private Timestamp rental_return;
	private Timestamp rental_date;
	
	private int user_seq;
	
	public RentalVO() {
		super();
	}
	public RentalVO(int rental_seq, int order_seq, int product_seq, int rental_quantity,
			int rental_period, int rental_payment, String rental_address, String rental_user,
			String rental_phone, Timestamp rental_return, Timestamp rental_date) {
		super();
		this.rental_seq = rental_seq;
		this.order_seq = order_seq;
		this.product_seq = product_seq;
		this.rental_quantity = rental_quantity;
		this.rental_period = rental_period;
		this.rental_payment = rental_payment;
		this.rental_address = rental_address;
		this.rental_user = rental_user;
		this.rental_phone = rental_phone;
		this.rental_return = rental_return;
		this.rental_date = rental_date;
	}
	
	
	public RentalVO(int product_seq, int rental_quantity, int rental_period, int rental_payment, String rental_address,
			String rental_user, String rental_phone, int user_seq) {
		super();
		this.product_seq = product_seq;
		this.rental_quantity = rental_quantity;
		this.rental_period = rental_period;
		this.rental_payment = rental_payment;
		this.rental_address = rental_address;
		this.rental_user = rental_user;
		this.rental_phone = rental_phone;
		this.user_seq = user_seq;
	}
	public int getRental_seq() {
		return rental_seq;
	}
	public int getOrder_seq() {
		return order_seq;
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
	public int getRental_payment() {
		return rental_payment;
	}
	public String getRental_address() {
		return rental_address;
	}
	public String getRental_user() {
		return rental_user;
	}
	public String getRental_phone() {
		return rental_phone;
	}
	public Timestamp getRental_return() {
		return rental_return;
	}
	public Timestamp getRental_date() {
		return rental_date;
	}
	public int getUser_seq() {
		return user_seq;
	}
	
}
