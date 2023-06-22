package com.vam.model;

import java.util.Date;
import java.util.List;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Setter
@Getter
public class OrderDTO {

	
	/* 주문 번호 */
	private String orderId;
	
	/* 배송 받는이 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String memberId;
	
	/* 우편번호 */
	private String memberAddr1;
	
	/* 회원 주소 */
	private String memberAddr2;
	
	/* 회원 상세주소 */
	private String memberAddr3;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;	
	
	/* 배송비 */
	 @Setter(AccessLevel.PROTECTED)
	private int deliveryCost;
	
	/* 사용 포인트 */
	private int usePoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	/* 판매가(모든 상품 비용) */
	 @Setter(AccessLevel.PROTECTED)
	private int orderSalePrice;
	
	/* 적립 포인트 */
	 @Setter(AccessLevel.PROTECTED)
	private int orderSavePoint;
	
	/* 최종 판매 비용 */
	 @Setter(AccessLevel.PROTECTED)
	private int orderFinalSalePrice;
	public void getOrderPriceInfo() {
		for(OrderItemDTO ordr : orders) {
			orderSalePrice += ordr.getTotalPrice();
			orderSavePoint += ordr.getTotalSavePoint();
		}
		
		if(orderSalePrice >= 30000) {
			this.deliveryCost = 0;
		} else {
			this.deliveryCost = 3000;
		}
		this.orderFinalSalePrice = this.orderSalePrice + this.deliveryCost - this.usePoint;
	}
	
}
