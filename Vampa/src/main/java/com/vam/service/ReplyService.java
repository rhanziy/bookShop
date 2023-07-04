package com.vam.service;

import com.vam.model.Criteria;
import com.vam.model.ReplyDTO;
import com.vam.model.ReplyPageDTO;

public interface ReplyService {
	
	public int enrollReply(ReplyDTO dto);
	
	/* 댓글 존재 체크 */
	public String checkReply(ReplyDTO dto);

	/* 댓글페이징 */
	public ReplyPageDTO replyList(Criteria cri);
	
	/* 댓글 수정 */
	public int updateReply(ReplyDTO dto);
	
	/* 댓글 한개 정보 */
	public ReplyDTO getUpdateReply(int replyId);
	
	/* 댓글 삭제 */
	public int deleteReply(ReplyDTO dto);
}
