package com.vam.model;

public class PageDTO {
  private int pageStart;
  
  private int pageEnd;
  
  private boolean next;
  
  private boolean prev;
  
  private int total;
  
  private Criteria cri;
  
  public String toString() {
    return "PageDTO(pageStart=" + getPageStart() + ", pageEnd=" + getPageEnd() + ", next=" + isNext() + ", prev=" + isPrev() + ", total=" + getTotal() + ", cri=" + getCri() + ")";
  }
  
  public void setPageStart(int pageStart) {
    this.pageStart = pageStart;
  }
  
  public void setPageEnd(int pageEnd) {
    this.pageEnd = pageEnd;
  }
  
  public void setNext(boolean next) {
    this.next = next;
  }
  
  public void setPrev(boolean prev) {
    this.prev = prev;
  }
  
  public void setTotal(int total) {
    this.total = total;
  }
  
  public void setCri(Criteria cri) {
    this.cri = cri;
  }
  
  public int getPageStart() {
    return this.pageStart;
  }
  
  public int getPageEnd() {
    return this.pageEnd;
  }
  
  public boolean isNext() {
    return this.next;
  }
  
  public boolean isPrev() {
    return this.prev;
  }
  
  public int getTotal() {
    return this.total;
  }
  
  public Criteria getCri() {
    return this.cri;
  }
  
  public PageDTO(Criteria cri, int total) {
    this.cri = cri;
    this.total = total;
    this.pageEnd = (int)Math.ceil(cri.getPageNum() / 10.0D) * 10;
    this.pageStart = this.pageEnd - 9;
    int realEnd = (int)Math.ceil(total * 1.0D / cri.getAmount());
    if (realEnd < this.pageEnd)
      this.pageEnd = realEnd; 
    this.prev = (this.pageStart > 1);
    this.next = (this.pageEnd < realEnd);
  }
}
