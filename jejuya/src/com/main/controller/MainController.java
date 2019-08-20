package com.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.dto.NoticeDto;
import com.admin.dto.NoticePagingDto;
import com.admin.service.NoticeService;
import com.admin.service.impl.NoticeServiceImpl;
import com.sights.dto.SightPagingDto;
import com.sights.dto.SightSortCondition;
import com.sights.dto.SightsDto;
import com.sights.service.SightsListService;
import com.sights.service.impl.SightsListServiceImpl;


@SuppressWarnings("serial")
@WebServlet("/main")
public class MainController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[MainController] do get");
		
		//0, "all", "addschedule"
		SightsListService sightsService = SightsListServiceImpl.getInstance();
		NoticeService noticeService = NoticeServiceImpl.getInstance();
		
		//일정등록 많은 순으로 카테고리 별 (관음숙) 아이템 8개 받아오도록 조건 설정
		SightSortCondition cond = new SightSortCondition(0, "all", "addschedule");
		SightPagingDto pagingDto = new SightPagingDto(1);
		pagingDto.setEndRnum(8);
		List<SightsDto> mainListAllCate = sightsService.getScheduleSortSightlist(cond, pagingDto );
		
		List<SightsDto> mainSiteMapList = sightsService.getPopularSightlist(cond, pagingDto );
				
		req.setAttribute("mainListAllCate", mainListAllCate);
		req.setAttribute("mainSiteMapList", mainSiteMapList);
				
		//공지사항 attr 추가
		int totalNoticeSize = noticeService.getNoticeDBSize();
		NoticePagingDto noticePagingDto = new NoticePagingDto(1, totalNoticeSize);
		List<NoticeDto> mainNoticeList = noticeService.getAllNoticeList(noticePagingDto);
		
		req.setAttribute("mainNoticeList", mainNoticeList);
		req.setAttribute("noticePagingDto", noticePagingDto);
		//System.out.println("공지사항 추가 했습니다!");
				
		//메인뷰로 이동
		req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[MainController] do post");
	}
}
