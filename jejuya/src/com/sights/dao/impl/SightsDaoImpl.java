package com.sights.dao.impl;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sights.dao.SightsDao;
import com.sights.dto.SightsDto;

import common.db.DBClose;
import common.db.DBConnection;



public class SightsDaoImpl implements SightsDao, Serializable {
	private static SightsDaoImpl dao = null;
	
	private SightsDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SightsDaoImpl getInstance() {
		if(dao == null) {
			dao = new SightsDaoImpl();
		}
		return dao;
	}
	public SightsDto getSightslist(int seq) {
		String sql = " SELECT * "
				+ " FROM SHIGHTS "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		SightsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new SightsDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getString(6), 
									rs.getString(7), 
									rs.getString(8), 
									rs.getString(9), 
									rs.getInt(10), 
									rs.getInt(11), 
									rs.getInt(12));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return dto;
		
	}
	
	
}
