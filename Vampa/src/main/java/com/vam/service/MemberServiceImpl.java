package com.vam.service;

import com.vam.mapper.MemberMapper;
import com.vam.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
  @Autowired
  private MemberMapper membermapper;
  
  
  @Override
  public void memberJoin(MemberVO member) throws Exception {
    this.membermapper.memberJoin(member);
  }
  
  
  @Override
  public int idCheck(String memberId) throws Exception {
    return this.membermapper.idCheck(memberId);
  }
  
  
  @Override
  public MemberVO memberLogin(MemberVO member) throws Exception {
    return this.membermapper.memberLogin(member);
  }
  
   @Override
	public MemberVO getMemberInfo(String memberId) {
		return membermapper.getMemberInfo(memberId);
	}
}
