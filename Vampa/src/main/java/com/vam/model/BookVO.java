package com.vam.model;

import java.util.Date;
import java.util.List;

public class BookVO {
  private int bookId;
  
  private String bookName;
  
  private int authorId;
  
  private String authorName;
  
  private String publeYear;
  
  private String publisher;
  
  private String cateCode;
  
  private String cateName;
  
  private int bookPrice;
  
  private int bookStock;
  
  private double bookDiscount;
  
  private String bookIntro;
  
  private String bookContents;
  
  private Date regDate;
  
  private Date updateDate;
  
  private List<AttachImageVO> imageList;
  
  public String toString() {
    return "BookVO(bookId=" + getBookId() + ", bookName=" + getBookName() + ", authorId=" + getAuthorId() + ", authorName=" + getAuthorName() + ", publeYear=" + getPubleYear() + ", publisher=" + getPublisher() + ", cateCode=" + getCateCode() + ", cateName=" + getCateName() + ", bookPrice=" + getBookPrice() + ", bookStock=" + getBookStock() + ", bookDiscount=" + getBookDiscount() + ", bookIntro=" + getBookIntro() + ", bookContents=" + getBookContents() + ", regDate=" + getRegDate() + ", updateDate=" + getUpdateDate() + ", imageList=" + getImageList() + ")";
  }
  
  public void setBookId(int bookId) {
    this.bookId = bookId;
  }
  
  public void setBookName(String bookName) {
    this.bookName = bookName;
  }
  
  public void setAuthorId(int authorId) {
    this.authorId = authorId;
  }
  
  public void setAuthorName(String authorName) {
    this.authorName = authorName;
  }
  
  public void setPubleYear(String publeYear) {
    this.publeYear = publeYear;
  }
  
  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }
  
  public void setCateCode(String cateCode) {
    this.cateCode = cateCode;
  }
  
  public void setCateName(String cateName) {
    this.cateName = cateName;
  }
  
  public void setBookPrice(int bookPrice) {
    this.bookPrice = bookPrice;
  }
  
  public void setBookStock(int bookStock) {
    this.bookStock = bookStock;
  }
  
  public void setBookDiscount(double bookDiscount) {
    this.bookDiscount = bookDiscount;
  }
  
  public void setBookIntro(String bookIntro) {
    this.bookIntro = bookIntro;
  }
  
  public void setBookContents(String bookContents) {
    this.bookContents = bookContents;
  }
  
  public void setRegDate(Date regDate) {
    this.regDate = regDate;
  }
  
  public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
  }
  
  public void setImageList(List<AttachImageVO> imageList) {
    this.imageList = imageList;
  }
  
  public int getBookId() {
    return this.bookId;
  }
  
  public String getBookName() {
    return this.bookName;
  }
  
  public int getAuthorId() {
    return this.authorId;
  }
  
  public String getAuthorName() {
    return this.authorName;
  }
  
  public String getPubleYear() {
    return this.publeYear;
  }
  
  public String getPublisher() {
    return this.publisher;
  }
  
  public String getCateCode() {
    return this.cateCode;
  }
  
  public String getCateName() {
    return this.cateName;
  }
  
  public int getBookPrice() {
    return this.bookPrice;
  }
  
  public int getBookStock() {
    return this.bookStock;
  }
  
  public double getBookDiscount() {
    return this.bookDiscount;
  }
  
  public String getBookIntro() {
    return this.bookIntro;
  }
  
  public String getBookContents() {
    return this.bookContents;
  }
  
  public Date getRegDate() {
    return this.regDate;
  }
  
  public Date getUpdateDate() {
    return this.updateDate;
  }
  
  public List<AttachImageVO> getImageList() {
    return this.imageList;
  }
}
