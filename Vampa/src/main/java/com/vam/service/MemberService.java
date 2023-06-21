package com.vam.service;

import com.vam.model.MemberVO;

public interface MemberService {
  public void memberJoin(MemberVO paramMemberVO) throws Exception;

  public int idCheck(String paramString) throws Exception;
 
  public MemberVO memberLogin(MemberVO paramMemberVO) throws Exception;
  
  public MemberVO getMemberInfo(String memberId);
  
  
}
