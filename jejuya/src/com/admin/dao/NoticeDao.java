package com.admin.dao;

import java.util.List;

import com.admin.dto.NoticeDto;
import com.admin.dto.NoticePagingDto;

public interface NoticeDao {
		
	public boolean insertNewNotice(NoticeDto dto);
	
	public List<NoticeDto> getAllNoticeList(NoticePagingDto dto);
	
}
