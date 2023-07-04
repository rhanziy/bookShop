package com.vam.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Setter
@Getter
public class ReplyPageDTO {
	
	private List<ReplyDTO> list;
	
	private PageDTO pageInfo;

}
