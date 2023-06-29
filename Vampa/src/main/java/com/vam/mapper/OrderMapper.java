package com.vam.mapper;

import java.util.List;

import com.vam.model.BookVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderDTO;
import com.vam.model.OrderItemDTO;
import com.vam.model.OrderPageItemDTO;

public interface OrderMapper {
	
	/* 주문 상품 정보(주문 페이지) */	
	public OrderPageItemDTO getGoodsInfo(int bookId);
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int bookId);
	
	/* 주문 회원 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 주문 포인트 차감 */
	public int deductMoney(MemberVO member);
	
	/* 주문 책 재고 차감 */
	public int deductStock(BookVO book);
	
	/* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문 취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 취소된 주문정보 */
	public OrderDTO getOrder(String orderId);
}
