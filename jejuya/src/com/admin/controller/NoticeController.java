package com.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.dto.NoticeDto;
import com.admin.service.NoticeService;
import com.admin.service.impl.NoticeServiceImpl;

@WebServlet("/notice")
public class NoticeController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[NoticeController] do get");
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		if( req.getParameter("command") == null ) {
			resp.getWriter().print("<script>history.back();</script>");
			resp.getWriter().flush();
		}else {
			String command = req.getParameter("command");
			
			if( command.equals("showList") ) {
				
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[NoticeController] do post");
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		if( req.getParameter("command") == null ) {
			resp.getWriter().print("<script>history.back();</script>");
			resp.getWriter().flush();
		}else {
			String command = req.getParameter("command");
			
			NoticeService noticeService = NoticeServiceImpl.getInstance();
			
			if( command.equals("insertNewNotice") ) {
				//noticeWriteAdmin.jsp에서 저장 버튼을 클릭했을 때
				
				String inputTitle = nvlParam(req, "inputTitle", null);
				String inputContent = nvlParam(req, "inputContent", null);
								
				if( inputTitle == null ) {
					resp.getWriter().print("<script>alert('제목이 없습니다.'); history.back();</script>");
				}else if( inputContent == null ) {
					resp.getWriter().print("<script>alert('내용이 없습니다.'); history.back();</script>");
				}else if( inputContent.length() > 6000 ){
					resp.getWriter().print("<script>alert('6000바이트까지만 입력 가능합니다.'); history.back();</script>");
				}else {
					//본문이 2000자, 4000자 이상이면 잘라서 DB에 저장
					String cont1 = null;
					String cont2 = null;
					String cont3 = null;
					String author = req.getParameter("author");
					
					cont1 = inputContent;
					if(inputContent.length() > 2000) {
						cont1 = inputContent.substring(0, 1999);
						cont2 = inputContent.substring(2000, 3999);
					}
					if( inputContent.length() > 4000 ) {
						cont3 = inputContent.substring(4000, 5999);
					}					
					
					NoticeDto dto = new NoticeDto(inputTitle, author, "", cont1, cont2, cont3);
					noticeService.insertNewNotice(dto);
					resp.getWriter().print("<script>alert('저장이 완료되었습니다. '); history.back();</script>");
				}
			}
		}
	}
	
	
	/**name파라미터가 있으면 해당 value를 리턴, 없으면 altText리턴
	 * @param req
	 * @param name
	 * @param altText
	 * @return
	 */
	public String nvlParam(HttpServletRequest req, String name, String altText) {
		String str = altText;
		
		if( req.getParameter(name) != null ) {
			str = req.getParameter(name);
		}		
		return str;
	}
}
