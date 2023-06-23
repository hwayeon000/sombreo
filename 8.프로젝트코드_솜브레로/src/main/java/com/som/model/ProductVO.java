package com.som.model;

import java.sql.Timestamp;

public class ProductVO {
	private int product_seq;
	private int cate_seq;
	private int photo_seq;
	private String product_name;
	private int product_price;
	private String product_content;
	private Timestamp product_date;
	private int product_have;
	private int product_rent;
	private int product_rest;
	private int cate_depth1;
	private String photo_path;
	
	
	public ProductVO() {
		super();
	}
	
	public ProductVO(int product_seq, int cate_seq, int photo_seq, String product_name, int product_price,
			String product_content, Timestamp product_date, int product_have, int product_rent, int product_rest,
			int cate_depth1, String photo_path) {
		super();
		this.product_seq = product_seq;
		this.cate_seq = cate_seq;
		this.photo_seq = photo_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_date = product_date;
		this.product_have = product_have;
		this.product_rent = product_rent;
		this.product_rest = product_rest;
		this.cate_depth1 = cate_depth1;
		this.photo_path = photo_path;
	}

	public ProductVO(int product_seq, int cate_seq, int photo_seq, String product_name,
			int product_price, String product_content, Timestamp product_date, int product_have,
			int product_rent, int product_rest, int cate_depth1) {
		super();
		this.product_seq = product_seq;
		this.cate_seq = cate_seq;
		this.photo_seq = photo_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_date = product_date;
		this.product_have = product_have;
		this.product_rent = product_rent;
		this.product_rest = product_rest;
		this.cate_depth1 = cate_depth1;
	}

	public ProductVO(int product_seq, int cate_seq, int photo_seq, String product_name,
			int product_price, String product_content, Timestamp product_date, int product_have,
			int product_rent, int product_rest) {
		super();
		this.product_seq = product_seq;
		this.cate_seq = cate_seq;
		this.photo_seq = photo_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_date = product_date;
		this.product_have = product_have;
		this.product_rent = product_rent;
		this.product_rest = product_rest;
	}
	
	 // 상품 디테일 정보를 가져오기 위한 생성자
	   public ProductVO(int product_seq, String product_name, int product_price, String product_content, int product_have, String photo_path) {
	      super();
	      this.product_seq = product_seq;
	      this.product_name = product_name;
	      this.product_price = product_price;
	      this.product_content = product_content;
	      this.product_have = product_have;
	      this.photo_path = photo_path;
	   }

	public int getProduct_seq() {
		return product_seq;
	}


	public int getCate_seq() {
		return cate_seq;
	}


	public int getPhoto_seq() {
		return photo_seq;
	}


	public String getProduct_name() {
		return product_name;
	}


	public int getProduct_price() {
		return product_price;
	}


	public String getProduct_content() {
		return product_content;
	}


	public Timestamp getProduct_date() {
		return product_date;
	}


	public int getProduct_have() {
		return product_have;
	}


	public int getProduct_rent() {
		return product_rent;
	}


	public int getProduct_rest() {
		return product_rest;
	}


	public int getCate_depth1() {
		return cate_depth1;
	}
	
	public String getPhoto_path() {
		return photo_path;
	}
	

}
