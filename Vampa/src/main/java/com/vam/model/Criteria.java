package com.vam.model;

import java.util.Arrays;

public class Criteria {
  private int pageNum;
  
  private int amount;
  
  private int skip;
  
  private String type;
  
  private String keyword;
  
  private String[] authorArr;
  
  private String cateCode;
  
  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
    this.skip = (pageNum - 1) * amount;
  }
  
  public Criteria() {
    this(1, 10);
  }
  
  public String[] getTypeArr() {
    return (this.type == null) ? new String[0] : this.type.split("");
  }
  
  public int getPageNum() {
    return this.pageNum;
  }
  
  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
    this.skip = (pageNum - 1) * this.amount;
  }
  
  public int getAmount() {
    return this.amount;
  }
  
  public void setAmount(int amount) {
    this.amount = amount;
    this.skip = (this.pageNum - 1) * amount;
  }
  
  public int getSkip() {
    return this.skip;
  }
  
  public void setSkip(int skip) {
    this.skip = skip;
  }
  
  public String getType() {
    return this.type;
  }
  
  public void setType(String type) {
    this.type = type;
  }
  
  public String getKeyword() {
    return this.keyword;
  }
  
  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
  
  public String[] getAuthorArr() {
    return this.authorArr;
  }
  
  public void setAuthorArr(String[] authorArr) {
    this.authorArr = authorArr;
  }
  
  public String getCateCode() {
    return this.cateCode;
  }
  
  public void setCateCode(String cateCode) {
    this.cateCode = cateCode;
  }
  
  public String toString() {
    return "Criteria [pageNum=" + this.pageNum + ", amount=" + this.amount + ", type=" + this.type + ", keyword=" + this.keyword + 
      ", authorArr=" + Arrays.toString((Object[])this.authorArr) + ", cateCode=" + this.cateCode + "]";
  }
}
