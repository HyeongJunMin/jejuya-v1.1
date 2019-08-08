<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String loginIdentifierInHeader = "로그인";
	if( request.getParameter("") != null){
		
	}
%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/jejuya/main">JEJUYA</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">관광지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#projects">음식점</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#signup">숙박</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#signup">나의여행</a>
          </li>
          <li class="nav-item">
          	<!-- 디폴트 값 : 로그인, 세션에 로그인한 아이디 정보가 있으면 로그아웃 -->
          	<a class="nav-link js-scroll-trigger" href="/jejuya/member"><%=loginIdentifierInHeader %></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>




</html>