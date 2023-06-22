package com.vam.mapper;

import java.util.List;

import com.vam.model.CartDTO;

public interface CartMapper {
	
	public int addCart(CartDTO cart) throws Exception;
	
	public int deleteCart(int cartId);
	
	public int modifyCount(CartDTO cart);
	
	public List<CartDTO> getCart(String memberId);
	
	public CartDTO checkCart(CartDTO cart);
	
	
	/* 주문 장바구니 제거 */
	public int deleteOrderCart(CartDTO cart);
}
