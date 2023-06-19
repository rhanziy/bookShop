package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.CartDTO;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CartMapperTest {

	@Autowired
	private CartMapper mapper;
	
//	@Test
//	public void addCart() {
//		
//		String memberId = "admin";
//		int bookId = 332;
//		int count = 2;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setBookId(bookId);
//		cart.setBookCount(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("결과 :" + result);
//		
//	}
//	
//	@Test
//	public void deleteCart(){
//		
//		int cartId = 1;
//		
//		mapper.deleteCart(cartId);
//	}
//	
//	@Test
//	public void getCart() {
//		String memberId = "admin";
//		
//		mapper.deleteCart(cartId);
//	}
	
	@Test
	public void modifyCart() {
		int cartId = 2;
		int count = 5;
		
		CartDTO cart = new CartDTO();
		cart.setCartId(cartId);
		cart.setBookCount(count);
		
		mapper.modifyCount(cart);
	}
	
	
}
