package com.vam.model;

import java.util.List;

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
	private int point;
	
	@Setter(AccessLevel.PROTECTED)
	private int totalPoint;
	
	@Setter(AccessLevel.PROTECTED)
	private int salePrice;
	
	@Setter(AccessLevel.PROTECTED)
	private int totalPrice;
	public void initSaleTotal() {
		this.salePrice = (int) (this.bookPrice * (1-this.bookDiscount));
		this.totalPrice = this.salePrice * this.bookCount;
		
		if(this.salePrice == this.bookPrice) {
			this.point = (int)(Math.floor(this.bookPrice * 0.05));
		} else {
			this.point = (int)(Math.floor(this.salePrice * 0.05));
		}
		
		this.totalPoint = this.point * this.bookCount;
	}
	
	private List<AttachImageVO> imageList;

}
