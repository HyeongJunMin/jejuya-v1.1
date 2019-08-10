package com.schedule.service.impl;

import java.util.List;

import com.schedule.dao.ScheduleDao;
import com.schedule.dao.impl.ScheduleDaoImpl;
import com.schedule.service.ScheduleService;
import com.sights.dto.SightsDto;

import common.util.pageDto;

public class ScheduleServiceImpl implements ScheduleService {

	ScheduleDao dao=ScheduleDaoImpl.getInstance();
	
	private static ScheduleService single=null;
	
	private ScheduleServiceImpl() {}
	
	public static ScheduleService getInstance() {
		if(single==null) {
			single=new ScheduleServiceImpl();
		}
		return single;
	 }
	public List<SightsDto> getSightslist(int num){
		return dao.getSightslist(num);
	}
	public List<SightsDto> getPajingtowrismlist( int num , int startnum,int lastnum){
		return dao.getPajingtowrismlist(num, startnum, lastnum);
	  }
	public pageDto page(int total, int pg) {
		return dao.page(total, pg);
	  }
	public int pagenum(int total) {
		return dao.pagenum(total);
	}
	public  List<SightsDto> getLangkingchart(String theme){
		return dao.getLangkingchart(theme);
	}
	}
