package com.vam.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.BookVO;
import com.vam.service.BookService;



@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class BookServiceTests {

	@Autowired
	BookService service;
	
	@Test
	public void getGoodsInfoTest() {
		
		int bookId = 2;
		
		BookVO goodsInfo = service.getGoodsInfo(bookId);
		
		System.out.println("==결과==");
		System.out.println("전체 : " + goodsInfo);
		System.out.println("bookId : " + goodsInfo.getBookId());
		System.out.println("imageInfo : " + goodsInfo.getImageList().isEmpty());
		
	}
	
}
