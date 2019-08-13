package com.sights.service.impl;

import java.util.List;

import com.sights.dao.SightsDao;
import com.sights.dao.impl.SightsDaoImpl;
import com.sights.dto.SightPagingDto;
import com.sights.dto.SightSortCondition;
import com.sights.dto.SightsDto;
import com.sights.service.SightsService;

public class SightsServiceImpl implements SightsService{
	
	SightsDao dao = SightsDaoImpl.getInstance();
	
	private static SightsService single = null;
	
	private SightsServiceImpl() {}
	
	public static SightsService getInstance() {
		if(single == null) {
			single = new SightsServiceImpl();
		}
		return single;
	}		

	@Override
	public SightsDto getOneSightDetail(String title) {
		// TODO Auto-generated method stub
		return dao.getOneSightDetail(title);
	}
	
	@Override
	public List<SightsDto> getSightslist(int category) {
		// TODO Auto-generated method stub
		return dao.getSightslist(category);
	}
	
	@Override
	public SightsDto getOneCategoryDto(int category) {
		// TODO Auto-generated method stub
		return dao.getOneCategoryDto(category);
	}
	
	@Override
	public List<String> getThemelist(int category) {
		// TODO Auto-generated method stub
		return dao.getThemelist(category);
	}
	
	@Override
	public List<SightsDto> getSightThemelist(String theme) {
		// TODO Auto-generated method stub
		return dao.getSightThemelist(theme);
	}
	
	@Override
	public List<SightsDto> getReadSortSightlist(int category, String theme) {
		// TODO Auto-generated method stub
		return dao.getReadSortSightlist(category, theme);
	}
	
	@Override
	public List<SightsDto> getScheduleSortSightlist(int category, String theme) {
		// TODO Auto-generated method stub
		return dao.getScheduleSortSightlist(category, theme);
	}

	@Override
	public List<SightsDto> getScheduleSortSightlist(SightSortCondition cond) {
		// TODO Auto-generated method stub
		return dao.getScheduleSortSightlist(cond);
	}

	@Override
	public List<SightsDto> getScheduleSortSightlist(SightSortCondition cond, SightPagingDto pageDto) {
		// TODO Auto-generated method stub
		return dao.getScheduleSortSightlist(cond, pageDto);
	}
		
	@Override
	public int getPageNumCount(SightSortCondition cond) {
		// TODO Auto-generated method stub
		return dao.getPageNumCount(cond);
	}
}
