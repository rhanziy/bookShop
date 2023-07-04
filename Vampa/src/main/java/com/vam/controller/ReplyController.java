package com.vam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vam.model.Criteria;
import com.vam.model.ReplyDTO;
import com.vam.model.ReplyPageDTO;
import com.vam.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyDTO dto) {
		
		replyService.enrollReply(dto);
	}


	
	/* 댓글 체크 */
	/* memberId, bookId 파라미터 */
	/* 존재 : 1 / 존재x : 0 */
	@PostMapping("/check")
	public String replyCheckPOST(ReplyDTO dto) {
		return replyService.checkReply(dto);
	}
	
	@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ReplyPageDTO replyListPOST(Criteria cri) {
		return replyService.replyList(cri);
	}
	
	
	@PostMapping("/update")
	public void replyModifyPOST(ReplyDTO dto) {
		replyService.updateReply(dto);
	}
	
	@PostMapping("/delete")
	public void replyDeletePOST(ReplyDTO dto) {
		replyService.deleteReply(dto);
	}
	
	
}
