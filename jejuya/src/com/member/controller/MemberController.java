package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dto.MemberDto;
import com.member.service.MemberService;
import com.member.service.impl.MemberServiceImpl;

@WebServlet("/member")
public class MemberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("[MemberController] do get");
		
		if( req.getParameter("command") == null ) {
			//if command is null, go to login index page
			resp.sendRedirect("/jejuya/views/member/loginindex.jsp");
			return;
		}else {
			
			MemberService memberService = MemberServiceImpl.getInstance();
			
			String command = req.getParameter("command");
			
			if( command.equals("goregi") ) {
				//command가 goregi인 경우 회원가입 페이지로 이동
				resp.sendRedirect("/jejuya/views/member/regi.jsp");
				return;
			}else if( command.equals("gofind") == true ) {
				System.out.println("[MemberController] do find");
				//ID/PW 찾기 페이지로 이동
				resp.sendRedirect("/jejuya/views/member/findMember.jsp");
				return;
			}else if( command.equals("getOneId") == true ) {
				//Ajax통신으로 ID중복여부 검사를 위한 메소드, Ajax에 해당 ID가 DB에 있는지 여부 리턴
				System.out.println( "Ajax con : " + req.getParameter("inputId") );
				
				String inputId = req.getParameter("inputId");
				boolean isNotDupId = memberService.isExistingId(inputId);
				System.out.println( "Ajax ID사용가능? : " + isNotDupId );
				
				//Ajax에 중복 여부 리턴
				PrintWriter pw = resp.getWriter();
				pw.print(isNotDupId);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[MemberController] do post");
		
		if( req.getParameter("command") == null ) {
			//command커맨드가 널인 경우 로그인인덱스 페이지로 이동	
			resp.sendRedirect("/jejuya/views/member/loginindex.jsp");
			return;
		}else {			
			
			String command = req.getParameter("command");
			
			MemberService service = MemberServiceImpl.getInstance();			
			
			if( command.equals("dologin") ) {
				//command가 dologin인 경우 계정검사 수행
				String id = req.getParameter("id");
				String pw = "";
				
				MemberDto dto = service.getOneMember(id);
				
				if( dto == null ) {
					//id를 DB에서 찾지 못한 경우 로그인인덱스로 돌아감.
					//req.getRequestDispatcher("/views/member/loginindex.jsp").forward(req, resp);
					System.out.println("wrong id");					
					
					resp.sendRedirect("/jejuya/views/member/loginindex.jsp");
					return;
				}else {					
					//view에서 입력받은 pwd값 저장
					pw = req.getParameter("pwd");
					
					//입력받은 pwd값을 hashing algorithm을 통해 변조
					MessageDigest md;
					try {
						md = MessageDigest.getInstance("SHA-256");
						md.update(pw.getBytes());
						pw = byteToHexString(md.digest());
						System.out.println("input PW : " + pw);
					} catch (NoSuchAlgorithmException e) {
						e.printStackTrace();
					}				   
					
					//변조한 입력값과 DB에 저장된 해시문자열을 비교
					if( pw.equals(dto.getPw()) ) {						
						//일치하는 경우 로그인 성공
						req.getSession().setAttribute("user", dto);
						resp.sendRedirect("/jejuya/views/index.jsp");
						return;
					}else {
						//일치하지 않으면 실패
						System.out.println("wrong pw");
						resp.sendRedirect("/jejuya/views/member/loginindex.jsp");
						return;
					}
				}
			}else if( command.equals("doregi") ) {
				//command가 doregi인 경우 회원가입 수행
				String id = req.getParameter("id");
			    String pw = req.getParameter("pwd");
			    String name = req.getParameter("name");
			    String email = req.getParameter("email");
			    String birth = req.getParameter("birth");
			    
			    MemberDto dto = new MemberDto(id, pw, name, email, birth);
			    
			    boolean isDone = service.addMember(dto);
			    if( isDone == true ) {
			    	//addMember 메소드를 통해 회원가입을 성공한 경우 세션에 계정정보를 저장하고 메인페이지로 이동
			    	req.getSession().setAttribute("user", dto);
			    	System.out.println("[MemberController] do regi : " + dto.toString());
					resp.sendRedirect("/jejuya/views/index.jsp");
					return;
			    }else {
			    	//addMember 메소드를 통해 회원가입을 실패한 경우 회원가입 창으로 이동
			    	resp.sendRedirect("/jejuya/views/member/regi.jsp");
					return;
			    }
			}
		}
	}
	
	/**
	 * 바이트 배열을 HEX 문자열로 변환한다.
	 * @param data
	 * @return
	 */
	public static String byteToHexString(byte[] data) {
		StringBuilder sb = new StringBuilder();
		for(byte b : data) {
			sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
}
