
<%@page import="com.sights.dto.SightsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SightsDto dto = (SightsDto)request.getAttribute("dto");
String filename = dto.getFilename();
String title = "/views/sights/content/" + dto.getTitle() + ".jsp";
System.out.println("title=" + title);
%>

      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- global conf include -->
<jsp:include page="/views/templates/staticresources.jsp"></jsp:include>

<!-- 만든 CSS 파일 -->
<link rel="stylesheet" href="/jejuya/resources/css/sights/sightsdetail.css"/>

</head>
<body>
<!-- GNB include -->
<jsp:include page="/views/templates/header.jsp"></jsp:include>

<div align="center">
	<img src="<%=request.getContextPath()%>\upload\<%=filename %>" style="width: 100%">
	
	<div class="containerD">	
		<ul class="tabsD">			    
		    <li id="basic" class="menu">기본정보</li>
		    <li id="content" class="menu current">상세정보</li>
		    <li id="reviewlist" class="menu">리뷰 및 평가등록</li>
		    <li id="findroad" class="menu">길찾기</li>		
	  	</ul> 	
	  	
	  	<div class="content" align="left">
			
			<%-- <%=dto.getContent() %> --%>
			<jsp:include page="<%=title %>" flush="false"/>
			  	
	  	</div>	  	 	
	</div>	
</div>

<script type="text/javascript">
$(function () {
	
	$("#basic").mousedown(function () {
		location.href="/jejuya/SightsController?command=detailBasic&title=<%=dto.getTitle()%>";		
	});
	$("#content").mousedown(function () {
		location.href="/jejuya/SightsController?command=conBasic&title=<%=dto.getTitle()%>";		
	});
	$("#reviewlist").mousedown(function () {
		location.href="/jejuya/SightsController?command=reviewList&title=<%=dto.getTitle()%>";		
	});
	/* $("#findroad").mousedown(function () {
		location.href="";		
	}); */
	
});

</script>

<!-- include footer -->
<jsp:include page="/views/templates/footer.jsp"></jsp:include>


</body>
</html>











