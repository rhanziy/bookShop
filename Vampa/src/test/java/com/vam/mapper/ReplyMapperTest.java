package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.Criteria;
import com.vam.model.ReplyDTO;
import com.vam.model.ReplyPageDTO;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTest {

	
	@Autowired
	private ReplyMapper mapper;
	
	
//	@Test
//	public void replyEnrollTest() {
//		
//		String id = "admin";
//		int bookId = 95;
//		int rating = 3;
//		String content = "reply test";
//		
//		
//		ReplyDTO dto = new ReplyDTO();
//		dto.setBookId(bookId);
//		dto.setMemberId(id);
//		dto.setRating(rating);
//		dto.setContent(content);
//		
//		mapper.enrollReply(dto);
//	}
	
	
	@Test
	public void getReplyTest() {
		
		Criteria cri = new Criteria(1,10);
		
		cri.setBookId(336);
		
		List<ReplyDTO> lists = mapper.getReplyList(cri);
		
		for(ReplyDTO reply : lists) {
			System.out.println(reply);
		}
		
	}
}
