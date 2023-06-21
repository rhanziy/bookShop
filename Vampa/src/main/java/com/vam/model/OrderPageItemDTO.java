package com.vam.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class OrderPageItemDTO {
	
	/*뷰로부터 전달 받을 값*/
	private int bookId;
	
	private int bookCount;
	
	/*DB에서 꺼내올 값*/
	private String bookName;
	
	private int bookPrice;
	
	private double bookDiscount;
	
	/*만들어 낼 값*/
	
	@Setter(AccessLevel.PROTECTED)
	private int salePrice;
	
	@Setter(AccessLevel.PROTECTED)
	private int totalPrice;
	
	@Setter(AccessLevel.PROTECTED)
	private int point;
	
	@Setter(AccessLevel.PROTECTED)
	private int totalPoint;
	public void initSaleTotal() {
		this.salePrice = (int)(this.bookPrice * (1-this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
		if(this.salePrice == this.bookPrice) {
			this.point = (int)(Math.floor(this.bookPrice * 0.05));
		} else {
			this.point = (int)(Math.floor(this.salePrice * 0.05));
		}
		this.totalPoint = this.point * this.bookCount;
	}
	
}
