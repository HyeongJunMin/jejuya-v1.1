package com.admin.service;

import java.util.List;

import com.member.dto.MemberDto;
import com.sights.dto.SightsDto;

public interface AdminService {

	
	/* 회원 */
	
	public List<MemberDto> getMemberList();
	
	public boolean MemberMultiDelete(String ids[]);
	
	public List<MemberDto> getSerchMember(String sel, String searchW);
	
	public int getAllMember(String sel, String searchW);

	public List<MemberDto> getMemberListPaging(int page, String sel, String searchW);
	
	
	/* 게시판 */
	
	public List<SightsDto> getBbsList();
	
	public int getAllBbs(String category, String sel, String searchW);
	
	public List<SightsDto> getBbsListPaging(String category, int page, String sel, String searchW);
	
	public boolean addSight(SightsDto dto);
	
	public boolean BbsMultiDelete(String titles[]);
}
