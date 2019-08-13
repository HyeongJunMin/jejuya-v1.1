package com.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sights.dto.SightSortCondition;
import com.sights.dto.SightsDto;
import com.sights.service.SightsService;
import com.sights.service.impl.SightsServiceImpl;


@SuppressWarnings("serial")
@WebServlet("/main")
public class MainController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[MainController] do get");
		
		//0, "all", "addschedule"
		SightsService sightsService = SightsServiceImpl.getInstance();
		
		//일정등록 많은 순으로 카테고리0(관광지) 아이템 받아옴
		List<SightsDto> lst = sightsService.getScheduleSortSightlist( new SightSortCondition(0, "all", "addschedule") );
		
		req.setAttribute("mainListCate0", lst);
		System.out.println("리스트사이즈: " + lst.size());
		
		//메인뷰로 이동
		req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[MainController] do post");
	}
}
