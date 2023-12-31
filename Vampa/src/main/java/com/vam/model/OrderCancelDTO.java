package com.vam.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class OrderCancelDTO {
	
	private String memberId;
	
	private String orderId;
	
	private String keyword;
	
	private int amount;
	
	private int pageNum;
	
}
