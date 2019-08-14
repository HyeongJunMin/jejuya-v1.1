package com.admin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.admin.dao.NoticeDao;
import com.admin.dto.NoticeDto;
import com.admin.dto.NoticePagingDto;

import common.db.DBClose;
import common.db.DBConnection;

public class NoticeDaoImpl implements NoticeDao {

	public static NoticeDaoImpl single = null;	
	
	private NoticeDaoImpl() {}
	
	public static NoticeDaoImpl getInstance() {
		if( single == null ) {
			single = new NoticeDaoImpl();
		}
		return single;
	}
	
	/**	새로운 공지사항을 DB에 저장하는 메소드
	 *
	 */
	@Override
	public boolean insertNewNotice(NoticeDto dto) {
		boolean isDone = false;
		
		String sql = " INSERT INTO NOTICE_JEJU "
				+ " VALUES(SEQ_NOTICE_JEJU.NEXTVAL, SEQ_NOTICE_JEJU.CURRVAL , ?, ?, ?, ?, ?, ?, 0, 0, SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);

			int i = 1;			
			psmt.setString(i++, dto.getTitle() );
			psmt.setString(i++, dto.getContent1() );
			psmt.setString(i++, ( dto.getContent2() != null )? dto.getContent1() : " "  );
			psmt.setString(i++, ( dto.getContent3() != null )? dto.getContent1() : " "  );
			psmt.setString(i++, dto.getFilename() );
			psmt.setString(i++, dto.getAuthor() );
			
			psmt.executeUpdate();			
			
			isDone = true;

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);
		}
		
		return isDone;
	}

	/** paging규칙에 따라 모든 글을 DB에서 가져오는 메소드
	 *
	 */
	public List<NoticeDto> getAllNoticeList(NoticePagingDto dto){
		List<NoticeDto> lst = new ArrayList<NoticeDto>();
		
		
		
		return lst;
	}
}
