package com.vam.model;

public class MemberVO {
  private String memberId;
  
  private String memberPw;
  
  private String memberName;
  
  private String memberMail;
  
  private String memberAddr1;
  
  private String memberAddr2;
  
  private String memberAddr3;
  
  private int adminCk;
  
  private int regDate;
  
  private int money;
  
  private int point;
  
  public String getMemberId() {
    return this.memberId;
  }
  
  public String getMemberPw() {
    return this.memberPw;
  }
  
  public String getMemberName() {
    return this.memberName;
  }
  
  public String getMemberMail() {
    return this.memberMail;
  }
  
  public String getMemberAddr1() {
    return this.memberAddr1;
  }
  
  public String getMemberAddr2() {
    return this.memberAddr2;
  }
  
  public String getMemberAddr3() {
    return this.memberAddr3;
  }
  
  public int getAdminCk() {
    return this.adminCk;
  }
  
  public int getRegDate() {
    return this.regDate;
  }
  
  public int getMoney() {
    return this.money;
  }
  
  public int getPoint() {
    return this.point;
  }
  
  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }
  
  public void setMemberPw(String memberPw) {
    this.memberPw = memberPw;
  }
  
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  
  public void setMemberMail(String memberMail) {
    this.memberMail = memberMail;
  }
  
  public void setMemberAddr1(String memberAddr1) {
    this.memberAddr1 = memberAddr1;
  }
  
  public void setMemberAddr2(String memberAddr2) {
    this.memberAddr2 = memberAddr2;
  }
  
  public void setMemberAddr3(String memberAddr3) {
    this.memberAddr3 = memberAddr3;
  }
  
  public void setAdminCk(int adminCk) {
    this.adminCk = adminCk;
  }
  
  public void setRegDate(int regDate) {
    this.regDate = regDate;
  }
  
  public void setMoney(int money) {
    this.money = money;
  }
  
  public void setPoint(int point) {
    this.point = point;
  }
  
  public String toString() {
    return "MemberVO(memberId=" + getMemberId() + ", memberPw=" + getMemberPw() + ", memberName=" + getMemberName() + ", memberMail=" + getMemberMail() + ", memberAddr1=" + getMemberAddr1() + ", memberAddr2=" + getMemberAddr2() + ", memberAddr3=" + getMemberAddr3() + ", adminCk=" + getAdminCk() + ", regDate=" + getRegDate() + ", money=" + getMoney() + ", point=" + getPoint() + ")";
  }
}
