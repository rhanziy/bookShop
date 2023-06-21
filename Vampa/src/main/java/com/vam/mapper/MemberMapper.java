package com.vam.mapper;

import com.vam.model.MemberVO;

public interface MemberMapper {
 
	public void memberJoin(MemberVO paramMemberVO);
  
	public int idCheck(String paramString);
  
	public MemberVO memberLogin(MemberVO paramMemberVO);
	
	public MemberVO getMemberInfo(String memberId);
}
