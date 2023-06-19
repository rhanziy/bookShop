package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.CartMapper;
import com.vam.model.CartDTO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int addCart(CartDTO cart) {

		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		try {
			return cartMapper.addCart(cart);
		} catch(Exception e) {
			return 0;
		}
		
	}
	
	@Override
	public CartDTO checkCart(CartDTO cart) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int deleteCart(int cartId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<CartDTO> getCart(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int modifyCount(CartDTO cart) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
