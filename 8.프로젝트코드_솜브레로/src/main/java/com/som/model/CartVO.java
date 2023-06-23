package com.som.model;

import java.sql.Timestamp;

public class CartVO {

	private int cart_seq;
	private int user_seq;
	private int product_seq;
	private int cart_quantity;
	private int cart_period;
	private Timestamp cart_date;
	
	private String product_name;
	private String photo_path;
	private int product_price;
	
	public CartVO() {
	}
	public CartVO(int cart_seq, int user_seq, int product_seq, int cart_quantity, int cart_period,
			Timestamp cart_date) {
		super();
		this.cart_seq = cart_seq;
		this.user_seq = user_seq;
		this.product_seq = product_seq;
		this.cart_quantity = cart_quantity;
		this.cart_period = cart_period;
		this.cart_date = cart_date;
	}
	public CartVO(int user_seq, int product_seq, int cart_quantity, int cart_period) {
		super();
		this.user_seq = user_seq;
		this.product_seq = product_seq;
		this.cart_quantity = cart_quantity;
		this.cart_period = cart_period;
	}
	
	public CartVO(int user_seq, int product_seq, int cart_quantity, int cart_period, int product_price) {
		super();
		this.user_seq = user_seq;
		this.product_seq = product_seq;
		this.cart_quantity = cart_quantity;
		this.cart_period = cart_period;
		this.product_price = product_price;
	}

	public CartVO(int cart_seq, int cart_quantity, int cart_period, String product_name, String photo_path, int product_price) {
		super();
		this.cart_seq = cart_seq;
		this.cart_quantity = cart_quantity;
		this.cart_period = cart_period;
		this.product_name = product_name;
		this.photo_path = photo_path;
		this.product_price = product_price;
	}
	public CartVO(int cart_seq, int cart_quantity, int cart_period, int product_seq, String product_name, int product_price, String photo_path) {
		super();
		this.cart_seq = cart_seq;
		this.cart_quantity = cart_quantity;
		this.cart_period = cart_period;
		this.product_seq = product_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.photo_path = photo_path;
	}
	
	public int getCart_seq() {
		return cart_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public int getCart_period() {
		return cart_period;
	}
	public Timestamp getCart_date() {
		return cart_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public int getProduct_price() {
		return product_price;
	}
	
	
}
