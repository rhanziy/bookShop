package com.vam.service;

import com.vam.mapper.AttachMapper;
import com.vam.model.AttachImageVO;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachServiceImpl implements AttachService {
  private static final Logger log = Logger.getLogger(AttachServiceImpl.class);
  
  @Autowired
  private AttachMapper attachMapper;
  
  public List<AttachImageVO> getAttachList(int bookId) {
    log.info("getAttachList................");
    return this.attachMapper.getAttachList(bookId);
  }
}
