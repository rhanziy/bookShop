package com.vam.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AdminMapper;
import com.vam.mapper.AttachMapper;
import com.vam.mapper.BookMapper;
import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CateFilterDTO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;
import com.vam.model.SelectDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BookServiceImpl implements BookService{

	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	/*상품 이미지 정보 불러오기*/
	@Autowired
	private AdminMapper adminMapper;
	
	/* 상품 검색 */
	@Override
	public List<BookVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");
		
		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] authorArr = bookMapper.getAuthorIdList(cri.getKeyword());
		
		
		if(type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			if(authorArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String t : typeArr) {
			if(t.equals("A")) {
				cri.setAuthorArr(authorArr);
			}
		}		
		
		if(type.equals("M")) {
			String codeSub = cri.getCateCode().substring(0, 3);
			cri.setCateCode(codeSub);
		}
		
		List<BookVO> list = bookMapper.getGoodsList(cri);
		
	
		list.forEach(book -> {
			int bookId = book.getBookId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);
			
			book.setImageList(imageList);
		
		});

		
		return list;
	}

	/* 상품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {
		
		log.info("goodsGetTotal().......");
		
		String type = cri.getType();
		
		if(type == "C") {
			String codeSub = cri.getCateCode().substring(0, 3);
			cri.setCateCode(codeSub);
		}
		
		return bookMapper.goodsGetTotal(cri);
		
	}	
	
	/* 국내 카테고리 리스트 */
	@Override
	public List<CateVO> getCateCode1() {
		
		log.info("getCateCode1().........");
		
		return bookMapper.getCateCode1();
	}

	/* 외국 카테고리 리스트 */
	@Override
	public List<CateVO> getCateCode2() {
		
		log.info("getCateCode2().........");
		
		return bookMapper.getCateCode2();
	}

	
	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {
		
		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
		
		String[] typeArr = cri.getType().split("");
		String[] authorArr;
		String[] cateList = bookMapper.getCateList(cri);
		
		for(String type : typeArr) {
			if(type.equals("A")) {
				
				authorArr = bookMapper.getAuthorIdList(cri.getKeyword());
				
				if(authorArr.length == 0) {
					return filterInfoList;
				} 
				
				cri.setAuthorArr(authorArr);
			}
			
		}
		
		
		String tempCateCode = cri.getCateCode();
		
		for(String cateCode : cateList) {
			
			if(cri.getType() == "M") {
				cri.setCateCode(cateCode.substring(0, 3));
			}
			
			cri.setCateCode(cateCode);
			
			CateFilterDTO filterInfo = bookMapper.getCateInfo(cri);
			
			filterInfoList.add(filterInfo);
		}
		
		cri.setCateCode(tempCateCode);
		
		return filterInfoList;
	}
	
	
	
	@Override
	public BookVO getGoodsInfo(int bookId) {
		
		BookVO goodsInfo = bookMapper.getGoodsInfo(bookId);
		
		/*상품 이미지 정보*/
		goodsInfo.setImageList(adminMapper.getAttachInfo(bookId));
		
		return goodsInfo;
	}
	
	
	@Override
	public BookVO getBookIdName(int bookId) {
		return bookMapper.getBookIdName(bookId);
	}
	
	
	@Override
	public List<SelectDTO> likeSelect() {
		
		List<SelectDTO> list = bookMapper.likeSelect();
		
		list.forEach(dto -> {
			int bookId = dto.getBookId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);
			
			dto.setImageList(imageList);
		});
		
		return list;
	}
}