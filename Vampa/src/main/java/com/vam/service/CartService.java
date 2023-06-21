package com.vam.service;

import java.util.List;

import com.vam.model.CartDTO;

public interface CartService {
	
	public int addCart(CartDTO cart);
	
	public List<CartDTO> getCartList(String memberId);
	
	public int modifyCount(CartDTO cart);
	
	public int deleteCart(int cartId);
	
	public CartDTO checkCart(CartDTO cart);
	
}
