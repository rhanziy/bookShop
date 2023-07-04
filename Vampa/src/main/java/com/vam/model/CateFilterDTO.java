package com.vam.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Setter
@Getter
public class CateFilterDTO {
	
	private String cateName;
	
	private int cateCount;
	
	private String cateCode;
	
	
	@Setter(AccessLevel.PROTECTED)
	private String cateGroup;
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
		this.cateGroup = cateCode.split("")[0];
		
	}
}
