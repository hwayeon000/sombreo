package com.som.model;

public class HopeVO {

	private int		hope_seq;
	private String 	hope_name;
	private int		hope_price;
	private String	hope_content;
	private String	hope_photo;
	private String	hope_date;
	
	public HopeVO() {
		super();
	}
	




	public HopeVO(int hope_seq, String hope_name, int hope_price, String hope_content, String hope_photo) {
		super();
		this.hope_seq = hope_seq;
		this.hope_name = hope_name;
		this.hope_price = hope_price;
		this.hope_content = hope_content;
		this.hope_photo = hope_photo;
	}





	// 희망상품 정보를 가져오는 생성자
	public HopeVO(String hope_name, int hope_price, String hope_photo, String hope_content) {
		super();
		this.hope_name = hope_name;
		this.hope_price = hope_price;
		this.hope_content = hope_content;
		this.hope_photo = hope_photo;
	}




	public HopeVO(int hope_seq, String hope_name, int hope_price, String hope_content, String hope_photo,
			String hope_date) {
		super();
		this.hope_seq = hope_seq;
		this.hope_name = hope_name;
		this.hope_price = hope_price;
		this.hope_content = hope_content;
		this.hope_photo = hope_photo;
		this.hope_date = hope_date;
	}








	public int getHope_seq() {
		return hope_seq;
	}




	public String getHope_name() {
		return hope_name;
	}




	public int getHope_price() {
		return hope_price;
	}




	public String getHope_content() {
		return hope_content;
	}




	public String getHope_photo() {
		return hope_photo;
	}




	public String getHope_date() {
		return hope_date;
	}
}
