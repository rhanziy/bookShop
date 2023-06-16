package com.vam.service;

import com.vam.model.AttachImageVO;
import java.util.List;

public interface AttachService {
	public List<AttachImageVO> getAttachList(int bookId);	
}
