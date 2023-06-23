package com.som.model;

public class AnswerVO {
	private int answer_seq;
	private int inquiry_seq;
	private String answer_title;
	private String answer_content;
	private String answer_date;
	public AnswerVO(int answer_seq, int inquiry_seq, String answer_title, String answer_content, String answer_date) {
		super();
		this.answer_seq = answer_seq;
		this.inquiry_seq = inquiry_seq;
		this.answer_title = answer_title;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
	}
	public int getAnswer_seq() {
		return answer_seq;
	}
	public int getInquiry_seq() {
		return inquiry_seq;
	}
	public String getAnswer_title() {
		return answer_title;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public AnswerVO(int inquiry_seq, String answer_title, String answer_content) {
		super();
		this.inquiry_seq = inquiry_seq;
		this.answer_title = answer_title;
		this.answer_content = answer_content;
	}
	
	
	
	
	
	
	
}
