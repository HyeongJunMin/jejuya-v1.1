package com.schedule.service;

import java.util.List;

import com.sights.dto.SightsDto;

import common.util.pageDto;

public interface ScheduleService {

	public List<SightsDto> getSightslist(int num);
	public List<SightsDto> getPajingtowrismlist( int num , int startnum,int lastnum);
	public pageDto page(int total, int pg);
	public int pagenum(int total);
	public  List<SightsDto> getLangkingchart(String theme);
}
