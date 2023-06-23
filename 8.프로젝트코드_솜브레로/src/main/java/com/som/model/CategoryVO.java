package com.som.model;

import java.math.BigDecimal;

public class CategoryVO {
	private BigDecimal cate_seq;
	private BigDecimal cate_depth1;
	private BigDecimal cate_depth2;
	
	public CategoryVO(BigDecimal cate_seq, BigDecimal cate_depth1, BigDecimal cate_depth2) {
		super();
		this.cate_seq = cate_seq;
		this.cate_depth1 = cate_depth1;
		this.cate_depth2 = cate_depth2;
	}

	public BigDecimal getCate_seq() {
		return cate_seq;
	}

	public BigDecimal getCate_depth1() {
		return cate_depth1;
	}

	public BigDecimal getCate_depth2() {
		return cate_depth2;
	}
	
}
