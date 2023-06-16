package com.vam.mapper;

import com.vam.model.AttachImageVO;
import java.util.List;

public interface AttachMapper {
	
  List<AttachImageVO> getAttachList(int bookId);
  
}
