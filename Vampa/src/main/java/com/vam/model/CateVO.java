package com.vam.model;

public class CateVO {
  private int tier;
  
  private String cateName;
  
  private String cateCode;
  
  private String cateParent;
  
  public String toString() {
    return "CateVO(tier=" + getTier() + ", cateName=" + getCateName() + ", cateCode=" + getCateCode() + ", cateParent=" + getCateParent() + ")";
  }
  
  public void setTier(int tier) {
    this.tier = tier;
  }
  
  public void setCateName(String cateName) {
    this.cateName = cateName;
  }
  
  public void setCateCode(String cateCode) {
    this.cateCode = cateCode;
  }
  
  public void setCateParent(String cateParent) {
    this.cateParent = cateParent;
  }
  
  public int getTier() {
    return this.tier;
  }
  
  public String getCateName() {
    return this.cateName;
  }
  
  public String getCateCode() {
    return this.cateCode;
  }
  
  public String getCateParent() {
    return this.cateParent;
  }
}
