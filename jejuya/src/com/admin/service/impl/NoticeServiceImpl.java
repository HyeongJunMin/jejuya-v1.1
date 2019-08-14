package com.admin.service.impl;

import com.admin.dao.NoticeDao;
import com.admin.dao.impl.NoticeDaoImpl;
import com.admin.dto.NoticeDto;
import com.admin.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {

	public static NoticeServiceImpl single = null;
	
	private NoticeDao dao = NoticeDaoImpl.getInstance();
		
	private NoticeServiceImpl() {}
	
	public static NoticeServiceImpl getInstance() {
		if( single == null ) {
			single = new NoticeServiceImpl();
		}
		return single;
	}

	@Override
	public boolean insertNewNotice(NoticeDto dto) {
		// TODO Auto-generated method stub
		return dao.insertNewNotice(dto);
	}

}
