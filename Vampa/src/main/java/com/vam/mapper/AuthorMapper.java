package com.vam.mapper;

import com.vam.model.AuthorVO;
import com.vam.model.Criteria;
import java.util.List;

public interface AuthorMapper {
  void authorEnroll(AuthorVO paramAuthorVO);
  
  List<AuthorVO> authorGetList(Criteria paramCriteria);
  
  int authorGetTotal(Criteria paramCriteria);
  
  AuthorVO authorGetDetail(int paramInt);
  
  int authorModify(AuthorVO paramAuthorVO);
  
  int authorDelete(int paramInt);
}
