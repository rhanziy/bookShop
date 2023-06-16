package com.vam.mapper;

import com.vam.model.MemberVO;

public interface MemberMapper {
  void memberJoin(MemberVO paramMemberVO);
  
  int idCheck(String paramString);
  
  MemberVO memberLogin(MemberVO paramMemberVO);
}
