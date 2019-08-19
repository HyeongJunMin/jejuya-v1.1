<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String contextPath = request.getContextPath();	

	//isSearchedResult attr이 존재하면 회원관리 버튼을 선택하고 회원관리 검색결과를 보여주고 req에서 attr 제거
	boolean isSearchedResult = false;
	if (request.getAttribute("isSearchedResult") != null) {
		isSearchedResult = true;
		request.removeAttribute("isSearchedResult");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/jejuya/resources/css/admin/admin.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/jejuya/resources/js/admin/admin.js"></script>
<style type="text/css">
iframe{
	border: 0px;
	margin-top: 40px;
	margin-left: 70px;
	align-content: center;
}

ul.tab-link{
	font-size: 15px;
	
}


</style>
<title>admin.jsp</title>
</head>
<body>


	<div class="page_body">
		<div class="sidebar">
			<div class="manager_profile">
				<div class="manager_profile_view">
					<img alt="" src="/jejuya/resources/image/admin/people.png">
				</div>
				<div class="info_wrapper">
					<p class="manager_name">
						<b>관리자</b>
					</p>
					<br>
					<br>
				</div>
			</div>


			<div class="sidemenu">
			<div>
				<ul class="side_menu">
					<li class="side_menu_main_bbs"><b>게시판 관리</b></li>
				</ul>
					<ul class="side_menu_sub_tabs_bbs">
						<li class="tab-link" data-tab="tab-3">게시글 작성</li>
<!-- 						<li class="tab-link" data-tab="tab-4">게시글 수정 및 삭제</li> -->
					</ul>
			</div>
				<ul class="side_menu">
					<li><br></li>
					<li class="side_menu_main_user"><b>회원 관리</b></li>
				</ul>
					<ul class="side_menu_sub_tabs_user">
						<li class="tab-link" data-tab="tab-2">회원 정보 확인</li>
					</ul>
					
				<!-- 공지 관련 내용 -->
				<div>
					<ul class="side_menu">
						<li class="side_menu_main_notice">공지 관리</li>
					</ul>
					<ul class="side_menu_sub_tabs_notice">
						<li class="tab-link" data-tab="tab-5">공지 목록</li>
					</ul>
				</div>
			</div> 
			

			
			
		</div>

		<div class="page_content_wrapper">
			<div class="main_logo">
					<a href="javascript:location.reload();" class="admin_main_logo">Administrator</a>
			</div>

			<div class="mainmenu">
				<!-- 상단 메뉴 -->
				<input type="hidden" value="<%=isSearchedResult%>" id="_isSearchedResult">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">게시판 관리</li> 			<!-- current : 현재 선택된ㄴ 탭 -->
					<li class="tab-link" data-tab="tab-2">회원 관리</li>
					<!-- 공지 관련 내용 -->
					<li class="tab-link" data-tab="tab-5">공지 관리</li>
				</ul>
				<div class="mainmenuBbs">
					<div id="tab-1" class="tab-content current">
						<iframe src="/jejuya/adminControl?command=bbslist" width="1000" height="800"></iframe>
						
					</div>
					<div id="tab-2" class="tab-content">
						<iframe src="/jejuya/adminControl?command=userlist" width="1000" height="800"></iframe>
					</div>
					<div id="tab-3" class="tab-content">
<!-- 						<iframe src="http://zum.com/#!/home"></iframe> -->
						<iframe src="./views/admin/addSightsAdmin.jsp" width="1000" height="1500"></iframe>						
					</div>
					<div id="tab-4" class="tab-content">
<!-- 						<iframe src="/project/adminControl?command=userlist" width="1000" height="800"></iframe> -->
					</div>
					<!-- 공지 관련 내용 -->
					<div id="tab-5" class="tab-content">
 						<iframe src="<%=contextPath %>/notice?command=showlistAdmin" width="1000" height="800"></iframe>
					</div>
			</div>
		</div>

	</div>
</div>
	<script type="text/javascript">
		$(function() {
			
				
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});


			$('ul.side_menu_sub_tabs_bbs li').click(function() {
				var tab_id = $(this).attr('data-tab');
	
				$('ul.side_menu_sub_tabs_bbs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

			$('ul.side_menu_sub_tabs_user li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.side_menu_sub_tabs_user li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
			

			var i = 0;

			$('.side_menu_sub_tabs_bbs').hide();
			$('.side_menu_sub_tabs_user').hide();
			/* 공지 관련 내용 */
			$('.side_menu_sub_tabs_notice').hide();

			$(".side_menu_main_bbs").click(function() { // 게시판 관리

				if (i == 0) {
					$('.side_menu_sub_tabs_bbs').show();
					i = 1;
				} else {
					$('.side_menu_sub_tabs_bbs').hide();
					i = 0;
				}
			});

			$(".side_menu_main_user").click(function() { // 회원 관리

				if (i == 0) {
					$('.side_menu_sub_tabs_user').show();
					i = 1;
				} else {
					$('.side_menu_sub_tabs_user').hide();
					i = 0;
				}
			});
			
			/* 공지 관련 내용 */
			$(".side_menu_main_notice").click(function() { // 공지 관리

				if (i == 0) {
					$('.side_menu_sub_tabs_notice').show();
					i = 1;
				} else {
					$('.side_menu_sub_tabs_notice').hide();
					i = 0;
				}
			});

		});
	</script>
</body>
</html>

