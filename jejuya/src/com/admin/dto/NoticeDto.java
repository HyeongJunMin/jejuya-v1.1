package com.admin.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	
	private int seq;
	private int origin_seq;
	private String title;
	private String content1;
	private String content2;
	private String content3;
	private String filename;
	private String author;
	private Date wdate;	
	
	//가변길이 매개변수 생성자
	public NoticeDto(String title, String author, String filename, String...content) {
		super();
		this.title = title;
		this.author = author;
		this.filename = filename;
		this.content1 = content[0];
		if( content[1] != null ) this.content2 = content[1];
		if( content[2] != null ) this.content3 = content[2];		
	}	
}
