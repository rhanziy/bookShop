package com.vam.service;

import com.vam.model.ReplyDTO;

public interface ReplyService {
	
	public int enrollReply(ReplyDTO dto);
	
	/* 댓글 존재 체크 */
	public String checkReply(ReplyDTO dto);

}
