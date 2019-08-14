package com.admin.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.admin.service.AdminService;
import com.admin.service.impl.AdminServiceImpl;
import com.member.dto.MemberDto;
import com.sights.dto.SightsDto;

@WebServlet("/adminControl")
public class AdminController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public String processUploadFile(FileItem fileItem, String dir) throws IOException {

		String filename = fileItem.getName(); // 경로 + 파일명이 넘어옴
		long sizeInBytes = fileItem.getSize(); // 파일의 크기

		if (sizeInBytes > 0) { // 정상적인 파일 d:\\tmp\\abc.txt d:/tmp/abc.txt

			int idx = filename.lastIndexOf("\\"); // 뒤에서 \\의 위치를 얻어온다
			if (idx == -1) { // -1은 못찾았을때
				idx = filename.lastIndexOf("/");
			}

			filename = filename.substring(idx + 1); // abc.txt
			File uploadFile = new File(dir, filename); // 파일 새로 생성

			try {
				fileItem.write(uploadFile); // 실제 업로드 부분
			} catch (Exception e) {

			}
		}
		return filename; // 확인용
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("adminControl doget");
		String command = req.getParameter("command");
		AdminService service = AdminServiceImpl.getInstance();
		
		if(command.equals("main")) {
			req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
		}else if(command.equals("userlist")) {
			
			String sel = req.getParameter("choice");
			String searchW = req.getParameter("searchWord");
			
			int allMemberPage = service.getAllMember(sel, searchW);
			System.out.println("allMemberPage : " + allMemberPage);
			
			String Spage = req.getParameter("page");
			int page = 0;
			
			if(Spage == null) {
				page = 1; 
			}else {
				page = Integer.parseInt(Spage);
			}
			System.out.println("control page : "+ page);
			
			System.out.println("adminControl userlist");
//			List<MemberDto> userlist = service.getMemberList();
			List<MemberDto> userlist = service.getMemberListPaging(page, sel, searchW);
			
		
			req.setAttribute("allpage", allMemberPage);
			req.setAttribute("userlist", userlist);
			req.setAttribute("searchsel", sel);
			req.setAttribute("searchword", searchW);
			
			//jsp 뷰에 검색결과임을 알려주기 위해 attr 추가
			req.setAttribute("isSearchedResult", "isSearchedResult");
			req.getRequestDispatcher("/views/admin/userListAdmin.jsp").forward(req, resp);
			
					
		} else if(command.equals("bbslist")) {
			System.out.println("adminControl bbslist");
			
			String category = req.getParameter("category_select");
			String sel = req.getParameter("bbs_choice");
			String searchW = req.getParameter("searchWord");
			
			System.out.println("bbslist category CONT: " +  category);
			System.out.println("bbslist sel CONT: " +  sel);
			System.out.println("bbslist searchWord CONT: " +  searchW);

			
			int allBbsPage = service.getAllBbs(category, sel, searchW);
			System.out.println("getAllbbspage : " + allBbsPage);
			
			String Spage = req.getParameter("page");
			int page = 0;
			
			if(Spage == null) {
				page = 1; 
			}else {
				page = Integer.parseInt(Spage);
			}
			System.out.println("control page : "+ page);
			
			
			List<SightsDto> bbslist = service.getBbsListPaging(category, page, sel, searchW);
//			System.out.println(bbslist.toString());
			
			req.setAttribute("allpage", allBbsPage);
			req.setAttribute("bbslist", bbslist);
			req.setAttribute("searchsel", sel);
			req.setAttribute("searchword", searchW);
			req.setAttribute("categorySelectValue", category);
			
			req.getRequestDispatcher("/views/admin/bbsListAdmin.jsp").forward(req, resp);
			
		} else if(command.equals("bbs_muldel")) {
			System.out.println("adminControl bbsmultiDelete");
			String bbs_delArr[] = req.getParameterValues("bbs_delck");
			
			service.BbsMultiDelete(bbs_delArr);
			resp.sendRedirect("/project/adminControl?command=bbslist");
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("adminControl doPost");
		String command = req.getParameter("command");
		
		AdminService service = AdminServiceImpl.getInstance();
		
		if(command.equals("user_muldel")) {
			System.out.println("adminControl multiDelete");
			String delArr[] = req.getParameterValues("delck");
			
			service.MemberMultiDelete(delArr);
			resp.sendRedirect("/project/adminControl?command=userlist");
			
		}  else if(command.equals("addsights")) {

			String fupload = req.getServletContext().getRealPath("/upload");			
			String yourTempDir = fupload;

			int yourMaxRequestSize = 100 * 1024 * 1024; // 전송할때 사이즈 1MByte
			int yourMaxMemorySize = 100 * 1024; // 순간 메모리사용 사이즈 1KByte

			// form field의 데이터를 저장할 변수(multipart)
			String title = "";
			int category = 0;
			String theme = "";

			String roadAddress = "";
			String detailAddress = "";

			String phone = "";
			String homepage = "";
			String content = "";

			// file name
			String filename = ""; // DB에 넣어줄용

			boolean isMultipart = ServletFileUpload.isMultipartContent(req);

			if (isMultipart) {
				// FileItem을 생성
				DiskFileItemFactory factory = new DiskFileItemFactory();

				factory.setSizeThreshold(yourMaxMemorySize);
				factory.setRepository(new File(yourTempDir));

				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(yourMaxRequestSize);

				// list저장
				List<FileItem> items;
				try {
					items = upload.parseRequest(req);
					Iterator<FileItem> it = items.iterator();

					while (it.hasNext()) {
						FileItem item = it.next();

						if (item.isFormField()) {
							if (item.getFieldName().equals("title")) {
								title = item.getString("utf-8");
							} else if (item.getFieldName().equals("category")) {
								category = Integer.parseInt(item.getString("utf-8"));
							} else if (item.getFieldName().equals("theme")) {
								theme = item.getString("utf-8");
							} else if (item.getFieldName().equals("roadAddress")) {
								roadAddress = item.getString("utf-8");
							} else if (item.getFieldName().equals("detailAddress")) {
								detailAddress = item.getString("utf-8");
							} else if (item.getFieldName().equals("phone")) {
								phone = item.getString("utf-8");
							} else if (item.getFieldName().equals("homepage")) {
								homepage = item.getString("utf-8");
							} else if (item.getFieldName().equals("content")) {
								content = item.getString("utf-8");
							}

							/*
							 * System.out.println("title : " + title); System.out.println("theme : " +
							 * theme); System.out.println("roadAddress,  detailAddress : " + roadAddress +
							 * detailAddress); System.out.println("phone : " + phone);
							 * System.out.println("homepage : " + homepage); System.out.println("content : "
							 * + content);
							 */

						} else { // fileload
							if (item.getFieldName().equals("fileload")) {
								filename = processUploadFile(item, fupload/*파일 경로*/);
								System.out.println("fupload : " + fupload);
							} 
						}
					}

				} catch (FileUploadException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("multipart 아님");
			}

			// DB
			System.out.println(filename);
//			String address = roadAddress + detailAddress;

			boolean b = service.addSight(
					new SightsDto(title, 0, category, theme, filename, roadAddress, phone, homepage, content, 0, 0, 0));
//			req.setAttribute("b", b);
			
			// 관리자 페이지로 이동해야됨!!!!
//			req.getRequestDispatcher("/project/adminControl?command=main").forward(req, resp);
			
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=UTF-8");
			
			// doget으로 가야되는데  dopost로 가서 그냥 읽어서 보내줌
			PrintWriter pw = resp.getWriter();
			pw.print("<script type=\"text/javascript\">location.href='/project/adminControl?command=bbslist&&page=1';</script>");
		}	
		
	}
	
}
