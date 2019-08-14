package com.admin.dao.impl;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.dao.AdminDao;
import com.member.dto.MemberDto;
import com.sights.dto.SightsDto;

import common.db.DBClose;
import common.db.DBConnection;

public class AdminDaoImpl implements AdminDao, Serializable {

	private static final long serialVersionUID = 1L;

	private static AdminDaoImpl dao = null;

	public static AdminDaoImpl getInstance() {
		if(dao == null) {
			dao = new AdminDaoImpl();
			DBConnection.initConnect();
		}
		return dao;
	
	}
	
	/* 회원 */
	
	/**
	 * 회원들의 리스트를 전부 가져오는 메소드
	 */
	@Override
	public List<MemberDto> getMemberList() {
		String sql = " SELECT ID, PW, NAME, EMAIL, BIRTH "
				+ " FROM MEMBER_JEJU "
				+ " WHERE ISADMIN=1"
				+ " ORDER BY SEQ DESC ";
		
//		System.out.println("getMemberList sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemberLsit suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemberLsit suc");
			
			rs = psmt.executeQuery();
			System.out.println(list.toString());
			System.out.println("3/6 getMemberLsit suc");
			
			while(rs.next()) {
				String id = rs.getString("ID");
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				String birth = rs.getString("BIRTH");
				
				MemberDto dto = new MemberDto(id, pw, name, email, birth);
				list.add(dto);
				System.out.println("4/6 getMemberLsit suc");
			}
			
			
		} catch (Exception e) {
			System.out.println("getMemberList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return list;
	}


	
	/**
	 * 회원 리스트에서 체크박스를 이용해 멀티 삭제하는 메소드
	 */
	@Override
	public boolean MemberMultiDelete(String[] ids) {
	
		String sql = " DELETE FROM MEMBER_JEJU "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
	
		int count[] = new int[ids.length];
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);	// 자동 commit 실행XX
			
			psmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < ids.length; i++) {
				psmt.setString(1, ids[i]);
				psmt.addBatch();	// 돌리면 새로운 값을 집어넣으면서 계속 동작하라
			}
			count = psmt.executeBatch();	// 모든 동작을 한꺼번에 처리한다
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBClose.close(conn, psmt, null);
		}
		
		boolean isS = true;
		
		for(int i = 0; i < count.length; i++) {
			if(count[i] != -2) {		// -2 == 정상종료
				isS = false;
				break;		
			}
		}
		return isS;
	}


	/**
	 * 선택 항목으로 회원을 검색하는 메소드
	 */
	@Override
	public List<MemberDto> getSearchMember(String sel, String searchW) {
		String sql = " SELECT ID, SEQ, PW, NAME, EMAIL, BIRTH, DEL, ISADMIN "
				+ " FROM MEMBER_JEJU "
				+ " WHERE ISADMIN=1 ";
		
		String sqlword = "";
		
		if(sel.equals("ID")) {
			sqlword = " AND ID LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("NAME")) {
			sqlword = " AND NAME LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("EMAIL")) {
			sqlword = " AND EMAIL LIKE '%" + searchW.trim() + "%' ";
		}
		sql += sqlword;
		sql += " ORDER BY SEQ ASC ";
		
//		System.out.println("search sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 SearchMember suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 SearchMember suc");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(	rs.getString(1), 
												rs.getInt(2), 
												rs.getString(3),
												rs.getString(4), 
												rs.getString(5), 
												rs.getString(6), 
												rs.getInt(7), 
												rs.getInt(8));
				list.add(dto);
			}
			System.out.println("3/6 SearchMember suc");
		} catch (Exception e) {
			System.out.println("SearchMember fail");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}


	/**
	 * 전체 멤버의 수를 카운트하는 메소드
	 */
	public int getAllMember(String sel, String searchW) {
		String sql = " SELECT COUNT(*) FROM MEMBER_JEJU WHERE ISADMIN=1 ";

		
		String sqlword = "";
		if(sel == null) {
			sql += "";
		}else if(sel.equals("ID")) {
			sqlword = " AND ID LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("NAME")) {
			sqlword = " AND NAME LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("EMAIL")) {
			sqlword = " AND EMAIL LIKE '%" + searchW.trim() + "%' ";
		}
		sql += sqlword;
		
//		System.out.println("getAllMember sql : " + sql);
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int BbsLen = 0;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllMember suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllMember suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllMember suc");
			
			if(rs.next()) {
				BbsLen = rs.getInt(1);
				}
			
		} catch (Exception e) {
			System.out.println("getAllMember fail");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return BbsLen;
	}
	
	
	/**
	 * 멤버리스트를 페이징 해주는 메소드
	 */
	public List<MemberDto> getMemberListPaging(int page, String sel, String searchW){
		String sql = " SELECT ID, SEQ, PW, NAME, EMAIL, "
				+ " BIRTH, DEL, ISADMIN " 
				+ " FROM ";
		
			sql += " (SELECT ROW_NUMBER()OVER (ORDER BY SEQ DESC)AS RNUM, "
				+ " ID, SEQ, PW, NAME, EMAIL, BIRTH, DEL, ISADMIN "
				+ " FROM MEMBER_JEJU ";
			
		
		String sqlword = "";
		if(sel == null) {
			sql += "";
		}else if(sel.equals("ID")) {
			sqlword = " WHERE ID LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("NAME")) {
			sqlword = " WHERE NAME LIKE '%" + searchW.trim() + "%' ";
		}else if(sel.equals("EMAIL")) {
			sqlword = " WHERE EMAIL LIKE '%" + searchW.trim() + "%' ";
		}
		sql += sqlword;
		sql += " ORDER BY SEQ DESC) ";
		sql += " WHERE RNUM >= ? AND RNUM <=? AND ISADMIN=1";
		
//		System.out.println("getMemberListPaging sql :" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		int startP, endP;
		startP = 1 + 5 *(page - 1);
		endP = page * 5;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMemberListPaging suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startP);
			psmt.setInt(2, endP);
			System.out.println("2/6 getMemberListPaging suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getMemberListPaging suc");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(	rs.getString(1), 
												rs.getInt(2), 
												rs.getString(3),
												rs.getString(4),
												rs.getString(5),
												rs.getString(6),
												rs.getInt(7),
												rs.getInt(8));
				
				list.add(dto);
				
			}
			System.out.println("4/6 getMemberListPaging suc");
			
		} catch (Exception e) {
			System.out.println("getMemberListPaging fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
		
	}

	
	
	/* 게시판 */
	

	
	/**
	 * 사이트의 게시글을 리스트로 가져오는 메소드
	 */
	@Override
	public List<SightsDto> getBbsList() {
		String sql = " SELECT TITLE, CATEGORY, THEME, ADDSCHEDULE, READCOUNT "
					+ " FROM SIGHTS "
					+ " ORDER BY SEQ DESC ";
		
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<SightsDto> list = new ArrayList<SightsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList suc");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList suc");
			
			rs = psmt.executeQuery();
			System.out.println(list.toString());
			System.out.println("3/6 getBbsList suc");
			
			while(rs.next()) {
				String title = rs.getString("TITLE");
				int category = rs.getInt("CATEGORY");
				String theme = rs.getString("THEME");
				int addSchedule = rs.getInt("ADDSCHEDULE");
				int readcount = rs.getInt("READCOUNT");
				
				SightsDto dto = new SightsDto(title, category, theme, addSchedule, readcount);

				
				list.add(dto);
				System.out.println("4/6 getBbsLsit suc");
			}
			
			
			
		} catch (Exception e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}


	
	/**
	 * 전체 게시글 카운트
	 */
	@Override
	public int getAllBbs(String category, String sel, String searchW) {
		String sql = " SELECT COUNT(*) FROM SIGHTS WHERE DEL=0 ";
		
		String sqlword = "";

		if(category != null) {
			if(category.equals("관광지")) {
			sqlword = " AND CATEGORY = 0 ";
			} else if(category.equals("음식점")) {
				sqlword = " AND CATEGORY = 1 ";
			} else if(category.equals("숙소")) {
				sqlword = " AND CATEGORY = 2 ";
			}
		}
		
		if(category == null && sel != null) {
			sqlword = " AND TITLE LIKE '%" + searchW.trim() + "%' ";
		}
		
		sql += sqlword;
		
		System.out.println("getAllBbs sql : " + sql);
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int BbsLen = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllBbs suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllBbs suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllBbs suc");
			
			if(rs.next()) {
				BbsLen = rs.getInt(1);
				}
			
		} catch (Exception e) {
			System.out.println("getAllBbs fail");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return BbsLen;
	}



	/**
	 * 사이트 게시글 리스트를  검색 및 페이징 해주는 메소드 
	 */
	@Override
	public List<SightsDto> getBbsListPaging(String category, int page, String sel, String searchW) {
		String sql = " SELECT TITLE, SEQ, CATEGORY, THEME, FILENAME,"
				+ " ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT, LIKECOUNT "
				+ " FROM ";
				
		sql += " (SELECT ROW_NUMBER() OVER (ORDER BY SEQ DESC) AS RNUM,"
				+ " TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS,"
				+ " PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT, LIKECOUNT "
				+ " FROM SIGHTS WHERE 1=1 ";
		
		String sqlword = "";
		
//		System.out.println(sql);

//		if(category == null && sel == null) {
//			sql += "";
//		}else if(category.equals("관광지")) {
//			sqlword += " AND CATEGORY = 0 ";
//		}else if(category.equals("음식점")) {
//			sqlword += " AND CATEGORY = 1 ";
//		}else if(category.equals("숙소")){
//			sqlword += " AND CATEGORY = 2 ";
//		}
		
		if(category != null) {
			if(category.equals("관광지")) {
			sqlword = " AND CATEGORY = 0 ";
			} else if(category.equals("음식점")) {
				sqlword = " AND CATEGORY = 1 ";
			} else if(category.equals("숙소")) {
				sqlword = " AND CATEGORY = 2 ";
			}
		}
		
		if(category == null && sel != null) {
			sqlword = " AND TITLE LIKE '%" + searchW.trim() + "%' ";
		}
		
		sql += sqlword;
		
		sql += " ORDER BY ADDSCHEDULE DESC )";
		sql += " WHERE RNUM >= ? AND RNUM <=? ";

		System.out.println("getBbsListPaging sql :" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<SightsDto> list = new ArrayList<SightsDto>();
		
		int startP, endP;
		startP = 1 + 10 *(page - 1);
		endP = page * 10;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsListPaging suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startP);
			psmt.setInt(2, endP);
			System.out.println("2/6 getBbsListPaging suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsListPaging suc");
			
			while(rs.next()) {
				SightsDto dto = new SightsDto(	rs.getString(1),
												rs.getInt(2), 
												rs.getInt(3),
												rs.getString(4),
												rs.getString(5), 
												rs.getString(6),
												rs.getString(7),
												rs.getString(8),
												rs.getString(9),
												rs.getInt(10),
												rs.getInt(11),
												rs.getInt(12));
				
				list.add(dto);
			}
			System.out.println("4/6 getBbsListPaging suc");
			
		} catch (Exception e) {
			System.out.println("getBbsListPaging fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
		
	} 
	
		/**
		 * 글 작성 후 등록하는 메소드
		 */
	@Override
	public boolean addSight(SightsDto dto) {
		String sql = " INSERT INTO SIGHTS(TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, "
				+ " PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT, LIKECOUNT) "
				+ " VALUES(?, SEQ_SIGHTS.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, 0, 0, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		System.out.println("addSight sql " + sql);
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addSight suc");
			
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTitle());
			psmt.setInt(2, dto.getCategory());
			psmt.setString(3, dto.getTheme());
			psmt.setString(4, dto.getFilename());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getHomepage());
			psmt.setString(8, dto.getContent());
			
			System.out.println("2/6 addSight suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addSight suc");
				
		} catch (Exception e) {
			System.out.println("addSight fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}



		/**
		 * 게시글 리스트 멀티 삭제 메소드
		 */
	@Override
	public boolean BbsMultiDelete(String[] titles) {
			
			String sql = " DELETE FROM SIGHTS "
					+ " WHERE TITLE=? ";
			
			System.out.println("bbsMulDel sql : " + sql);
			
			Connection conn = null;
			PreparedStatement psmt = null;
		
			int count[] = new int[titles.length];
			
			try {
				conn = DBConnection.getConnection();
				conn.setAutoCommit(false);	// 자동 commit 실행XX
				
				psmt = conn.prepareStatement(sql);
				
				for(int i = 0; i < titles.length; i++) {
					psmt.setString(1, titles[i]);
					psmt.addBatch();	// 돌리면 새로운 값을 집어넣으면서 계속 동작하라
				}
				count = psmt.executeBatch();	// 모든 동작을 한꺼번에 처리한다
				conn.commit();
				
			} catch (Exception e) {
				e.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				DBClose.close(conn, psmt, null);
			}
			
			boolean isS = true;
			
			for(int i = 0; i < count.length; i++) {
				if(count[i] != -2) {		// -2 == 정상종료
					isS = false;
					break;		
				}
			}
			return isS;
		}
	
}	
