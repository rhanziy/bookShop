package com.vam.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class ReplyDTO {
	
	private int replyId;
	
	private int bookId;
	
	private String memberId;
	
	private Date regDate;
	
	private String content;
	
	private double rating;

}
