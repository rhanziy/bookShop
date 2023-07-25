package com.vam.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.BookVO;
import com.vam.model.CateFilterDTO;
import com.vam.model.Criteria;
import com.vam.service.BookService;



@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class BookServiceTests {

	@Autowired
	BookService service;
	
//	@Test
//	public void getGoodsInfoTest() {
//		
//		int bookId = 2;
//		
//		BookVO goodsInfo = service.getGoodsInfo(bookId);
//		
//		System.out.println("==결과==");
//		System.out.println("전체 : " + goodsInfo);
//		System.out.println("bookId : " + goodsInfo.getBookId());
//		System.out.println("imageInfo : " + goodsInfo.getImageList().isEmpty());
//		
//	}
//	
//	@Test
//	public void getCateInfoListTest1() {
//		Criteria cri = new Criteria();
//	
//		String type = "TC";
//		//String keyword = "테스트";
//		String keyword = "없음";	
//		String cateCode="103002";
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setCateCode(cateCode);
//		
//		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
//		
//	}
	
	@Test
	public void getCateInfoListTest3() {
		Criteria cri = new Criteria();
	
		String type = "T";
		String keyword = "테스트";
		//String keyword = "없음";	
		

		cri.setType(type);
		cri.setKeyword(keyword);
		
		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
		
	}
	
}
