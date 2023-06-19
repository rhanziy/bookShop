package com.vam.service;

import java.util.List;

import com.vam.model.CartDTO;

public interface CartService {
	
	public int addCart(CartDTO cart);
	
	public int deleteCart(int cartId);
	
	public int modifyCount(CartDTO cart);
	
	public List<CartDTO> getCart(String memberId);
	
	public CartDTO checkCart(CartDTO cart);
	
}
