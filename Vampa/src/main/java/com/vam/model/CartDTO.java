package com.vam.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartDTO {
	private int cartId;
	
	private String memberId;
	
	private int bookId;
	
	private int bookCount;
	
	private String bookName;
	
	private int bookPrice;
	
	private double bookDiscount;
	
	@Setter(AccessLevel.PROTECTED)
	private int salePrice;
	
	@Setter(AccessLevel.PROTECTED)
	private int totalPrice;
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1-this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
	}
}
