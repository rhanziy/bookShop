package com.vam.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Setter
@Getter
public class SelectDTO {
	
	private int bookId;
	
	private String bookName;
	
	private String cateName;
	
	private double ratingAvg;
	
	private List<AttachImageVO> imageList;

}
