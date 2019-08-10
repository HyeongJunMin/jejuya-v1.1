package com.schedule.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.schedule.dao.ScheduleDao;
import com.sights.dto.SightsDto;

import common.db.DBClose;
import common.db.DBConnection;
import common.util.pageDto;

public class ScheduleDaoImpl implements ScheduleDao {

	private static ScheduleDaoImpl Scheduledao = new ScheduleDaoImpl();

	private ScheduleDaoImpl() {

	}

	public static ScheduleDaoImpl getInstance() {

		return Scheduledao;
	}

	/**
	 * 사이트 즉 관광지,숙소, 호텔 의 리스트를 파라메터로 카테고리 넘버로 입력받아 리스트를 보여지게 함 0관광지 1음식점 2호텔
	 *
	 */
	@Override
	public List<SightsDto> getSightslist(int num) {
		String sql = " SELECT SEQ, TITLE, CATEGORY, THEME, ADDRESS, HOMEPAGE " + " FROM SIGHTS WHERE CATEGORY = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<SightsDto> list = new ArrayList<SightsDto>();

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int i = 1;

				int seq = rs.getInt(i++);
				String title = rs.getString(i++);
				String category = rs.getString(i++);
				String theme = rs.getString(i++);
				String address = rs.getString(i++);
				String homepage = rs.getString(i++);

				SightsDto dto = new SightsDto(seq, title, category, theme, address, homepage);

				// System.out.println("getSightslist"+dto.toString());

				list.add(dto);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return list;
	}

	/**
	 * 페이징을 하기 위하여 카테고리 번호(관광지,음식점,호텔 구분 하기 위하여)를 입력받고 첫 번호와 끝 번호를 입력받아 페이징 해줌
	 *
	 */
	public List<SightsDto> getPajingtowrismlist(int num, int startnum, int lastnum) {
		String sql = " SELECT SEQ, TITLE, CATEGORY , THEME, ADDRESS, HOMEPAGE FROM "
				+ " (SELECT ROW_NUMBER()OVER(ORDER BY SEQ ASC) AS RNUM , "
				+ " SEQ, TITLE, CATEGORY, THEME, ADDRESS ,HOMEPAGE FROM SIGHTS WHERE CATEGORY= ? ) "
				+ "  WHERE RNUM >= ?  AND RNUM <= ? ";

//		
		System.out.println("4/3");

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<SightsDto> list = new ArrayList<SightsDto>();

		try {
			conn = DBConnection.getConnection();
			// System.out.println("4/4");
			psmt = conn.prepareStatement(sql);
//			System.out.println("4/oo4");

			psmt.setInt(1, num);
			psmt.setInt(2, startnum);
			psmt.setInt(3, lastnum);

			rs = psmt.executeQuery();

			// System.out.println("5/4");

			while (rs.next()) {
				// System.out.println("rs ok");
				int i = 1;

				int seq = rs.getInt(i++);
				// System.out.println("rs seq ok");

				String title = rs.getString(i++);
				// System.out.println("rs title ok");

				int category = rs.getInt(i++);
				// System.out.println("rs cat ok");

				String theme = rs.getString(i++);
				// System.out.println("rs theme ok");

				String address = rs.getString(i++);
				String homepage = rs.getString(i++);
				// System.out.println("rs get cols ok");

				SightsDto dto = new SightsDto(seq, title, category + "", theme, address, homepage);

				// System.out.println("getPajingtowrismlist"+dto.toString());
				list.add(dto);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return list;
	}

	/**
	 * 페이징을 하기 위한 함수 리스트의 전체 사이즈와 현재 페이지를 파라메터로 입력받으면 시작번호와 끝번호를 계산해서 return 해줌
	 *
	 */
	public pageDto page(int total, int pg) {
		int list = 10; // 전체페이지에 10개를 출력
		int startnum = 1;
		int lastnum = 1;
		int pagingnum = 0; // 페이징 갯수

		if (total % list != 0) {
			pagingnum = total / list + 1;
		} else {
			pagingnum = total / list;

		}
		lastnum = pg * list;
		startnum = lastnum - (list - 1);

		pageDto dto = new pageDto(startnum, lastnum, pagingnum);

		System.out.println("daopage" + dto.toString());
		return dto;

	}

	public int pagenum(int total) {

		int count = 0; // 페이지 갯수
		int list = 10; // 한페이지에 나올 갯수
		if (total % list != 0) {
			count = total / list + 1;
		} else {
			count = total / list;
		}

		return count;
	}
	
	
	
	/**일정을 짤 때 구분 별 랭킹 차트를 보여주기 위한 함수
	 * 
	 */
	public  List<SightsDto> getLangkingchart(String theme){
		
		String sql="SELECT TITLE,SEQ,ADDSCHEDULE ,TEME FROM SIGHTS  "
				+ "WHERE ADDSCHEDULE IS NOT NULL AND TEME=? ORDER BY ADDSCHEDULE DESC ";
		
		

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<SightsDto> list = new ArrayList<SightsDto>();
		SightsDto dto=null;
		try {
			conn=DBConnection.getConnection();
			System.out.println("1/6 getLangkingchart");
			
			psmt=conn.prepareStatement(sql);
			
			System.out.println("2/6 getLangkingchart");
			
			psmt.setString(1, theme);
			rs=psmt.executeQuery();
			
			System.out.println("3/6 getLangkingchart");
			
			while (rs.next()) {
				String title=rs.getString(1);
				int seq=rs.getInt(2);
				int addschedule=rs.getInt(3);
				
				dto=new SightsDto(seq, title, null, theme, null, null);				
				
				list.add(dto);
				System.out.println("4/6 getLangkingchart");
				System.out.println(dto.toString());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {		
			DBClose.close(conn, psmt, null);			
		}	
		return list;
	}

}
