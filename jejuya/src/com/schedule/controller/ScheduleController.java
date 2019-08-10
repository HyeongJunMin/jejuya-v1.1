package com.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.schedule.service.ScheduleService;
import com.schedule.service.impl.ScheduleServiceImpl;
import com.sights.dto.SightsDto;

import common.util.pageDto;

@WebServlet("/ScheduleController")
public class ScheduleController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		String command=req.getParameter("command");
	
	
		ScheduleService service=ScheduleServiceImpl.getInstance();
		
		if(command.equals("tourism")) {
	
			List<SightsDto> list0=service.getSightslist(0);//관광지
			List<SightsDto> list1=service.getSightslist(1);//음식점
			List<SightsDto> list2=service.getSightslist(2);//숙소
			
			
			
		   req.setAttribute("list0", list0);//관광지 리스트 보내기
		   req.setAttribute("list1", list1);//음식점 리스트 보내기
		   req.setAttribute("list2", list2);//숙소 리스트 보내기
		
		   int count=service.pagenum(list0.size());
		   req.setAttribute("count",count);
		   req.getRequestDispatcher("/view/schedule/scheduleadd.jsp").forward(req, resp);
			 		   
		}else if( command.equals("tourismAjaxTblTriblist") ) {
			resp.setContentType("text/html; charset=utf-8");
			String pg=req.getParameter("pg");
			int category=Integer.parseInt(req.getParameter("category"));
			
			System.out.println("pg:"+pg+"category"+category);
			
			List<SightsDto> list0=service.getSightslist(category);
		
		
			pageDto page=service.page(list0.size(), Integer.parseInt(pg));
			
			List<SightsDto> list00 = service.getPajingtowrismlist(category, page.getStartnum(), page.getLastnum());
			
			
			System.out.println(list00.get(0));
			PrintWriter pw = resp.getWriter();
			
			
			String htmlTags = "";

			for (int i = 0 ; i < list00.size(); i++) {
				SightsDto dto = list00.get(i);
				 System.out.println("tourismAjaxTblTriblist:"+dto.toString());
				htmlTags += "<table id='triplist' border='2' >";
				htmlTags += "<col width='50'><col width='250'>";
				htmlTags += "<tr><th><input type='checkbox' name='addck[]' value="+dto.getTitle()+"></th>";
				htmlTags += "<th ><font size='2'id='coment'>"+dto.getTitle()+"</font></th></tr>";
				
			
			}
			 htmlTags +="<tr><th colspan='2'>";
			for(int i=1;i<=page.getPagignum();i++) {
				 htmlTags+="<button type='button' onclick='pagingBtnClick("+i+")'>"+i+"</button>";
			}
			htmlTags  +="</tr></th>";
			
			htmlTags +="<tr><th colspan='2'>"
					+"<button type='button' onclick='add()' id= 'addbtn' >추가</button>"
					+ "</th></tr>";
			
			htmlTags  +="</table>";
			
			   
			System.out.println("htmlTags"+htmlTags);
			//System.out.println("페이지"+page.getPagignum());
			
			//System.out.println(htmlTags);
			pw.print(htmlTags);
			pw.flush();
			
		}
		
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ScheduleController] do post");
	}

	
	
}
