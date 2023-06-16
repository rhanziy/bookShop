package com.vam.service;

import com.vam.model.MemberVO;

public interface MemberService {
  void memberJoin(MemberVO paramMemberVO) throws Exception;
  
  int idCheck(String paramString) throws Exception;
  
  MemberVO memberLogin(MemberVO paramMemberVO) throws Exception;
}
