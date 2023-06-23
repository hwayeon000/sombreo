package com.som.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class MessageVO {
	private BigDecimal num;
	private String sender;
	private String recipient;
	private String message;
	private Timestamp m_date;
	
	public MessageVO() {
		super();
	}
	
	public MessageVO(String sender, String recipient, String message) {
		super();
		this.sender = sender;
		this.recipient = recipient;
		this.message = message;
	}

	public MessageVO(BigDecimal num, String sender, String recipient, String message, Timestamp m_date) {
		super();
		this.num = num;
		this.sender = sender;
		this.recipient = recipient;
		this.message = message;
		this.m_date = m_date;
	}
	public BigDecimal getNum() {
		return num;
	}
	public String getSender() {
		return sender;
	}
	public String getRecipient() {
		return recipient;
	}
	public String getMessage() {
		return message;
	}
	public Timestamp getM_date() {
		return m_date;
	}
	
}
