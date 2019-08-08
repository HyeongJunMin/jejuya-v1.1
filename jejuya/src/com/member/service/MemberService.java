package com.member.service;

import com.member.dto.MemberDto;

public interface MemberService {

	public boolean addMember(MemberDto dto);
	
	public MemberDto getOneMember(String id);
	
	public boolean isExistingId(String id);
}