package com.admin.dto;

import common.util.PagingCommonVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticePagingDto extends PagingCommonVO {
	
	private int startnum;
	private int lastnum;
	private int pageNum;
	
	public NoticePagingDto(int startnum, int lastnum, int pageNum) {
		super();
		this.startnum = startnum;
		this.lastnum = lastnum;
		this.pageNum = pageNum;
		this.setRecordCountPerPage(10);
	}
}
