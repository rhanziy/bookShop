package com.vam.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Setter
@Getter
public class AttachImageVO {

	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int bookId;

	
	
}