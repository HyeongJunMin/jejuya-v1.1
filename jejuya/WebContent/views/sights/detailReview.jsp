
<%@page import="com.sights.dto.Paging"%>
<%@page import="com.sights.dto.SightsDto"%>
<%@page import="com.sights.dto.SightReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<%
//로그인한 멤버만 리뷰 쓰게하기

// 리뷰평점변수
int score = 0;
// 날짜 시간 제외할 변수
String writeDay = null;

//리뷰 리스트
List<SightReviewDto> list = (List<SightReviewDto>)request.getAttribute("list");
System.out.println("list.size()=" +list.size());
//for(int i = 0 ; i < list.size(); i++){
//	System.out.println(list.get(i).toString());
//}

//title뽑을용
SightsDto dto = (SightsDto)request.getAttribute("dto");
String title = dto.getTitle();
System.out.println("detailReview.jsp title:" + title);

//리뷰 총 갯수
int count = (Integer)request.getAttribute("count");

// 정렬용
String sorting = (String)request.getAttribute("sorting");
System.out.println("detailReview.jsp sorting:" + sorting);

//페이징
Paging paging = (Paging)request.getAttribute("paging");
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

<style type="text/css">

/* 리뷰등록 */
table.tb1{
	width: 800px;
	border-collapse: collapse;
	border-top: 1px solid #ef6d00;
}
.td1{
	padding: 10px;	
}

.btnD{
	border-radius: 5px;
    border : 0;
    width: 146px;
    height: 35px;
    font-size: 14px;
    color: #fff;
    background: #ef6d00;	
}
.delBtn{
	border-radius: 5px;
    border : 0.5px solid #ef6d00;
    background-color: white;
    width: 50px;
    height: 20px;
    font-size: 14px;
    color: #ef6d00;
}

.fileTd{
	border: 1px solid #e5e5e5;
	width: 266px;
}
.modal{
	display: none;
	position: fixed;
	z-index: 1;		/* sit on top */
	left: 200px;
	top: 300px;
	width: 100%;
	height: 100%;
	overflow: auto;		
/* 	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);  */
}
.modal-content{
	background-color: #fff;
	padding: 30px;	
	border: 1px solid #ef6d00;
	width: 45%;  
}

.closeModal:hover,
.closeModal:focus{
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>
<body>
<!-- GNB include -->
<jsp:include page="/views/templates/header.jsp"></jsp:include>

<div align="center">
	<img src="<%=request.getContextPath()%>\upload\<%=dto.getFilename() %>" style="width: 100%">
	
	<div class="containerD">	
		<ul class="tabsD">			    
		    <li id="basic" class="menu">기본정보</li>
		    <li id="content" class="menu">상세정보</li>
		    <li id="reviewlist" class="menu current">리뷰 및 평가등록</li>
		    <li id="findroad" class="menu">길찾기</li>		 
	  	</ul> 	
	  		  	
			<font style="font-size: 20px">여행가의 리뷰<font style="color: #ef6d00">(<%=count %>)</font></font><br>
			<font>
				<a href="/jejuya/SightsController?command=reviewList&title=<%=dto.getTitle()%>">최신순</a> | 
			    <a href="/jejuya/SightsController?command=reviewList&title=<%=dto.getTitle()%>&sorting=score">평가순</a>
			</font>
			
			<div class="content">
			<%
			if(list.size() == 0){
				%>
				작성된 글이 없습니다	
				<%
			}else{
				for(int i = 0; i < list.size(); i ++){
					SightReviewDto review = list.get(i);
					score = review.getScore();
					writeDay = review.getWdate();
//					System.out.println("writeDay=" + writeDay);
					String wday = writeDay.substring(0, 10);
//					System.out.println("wday=" + wday);
				%>
			<table class="tb1">
			<col width="150"><col width="370"><col width="20">
				<tr>
					<td class="td1" align="center">
					<%=review.getId() %><br>
					<%=wday %><br>
					<% if(score == 5){
							%><font style='color:gold'>★★★★★</font><% 
						}
						else if(score == 4){
							%><font style='color:gold'>★★★★</font><%
						}
						else if(score == 3){
							%><font style='color:gold'>★★★</font><%
						}
						else if(score == 2){
							%><font style='color:gold'>★★</font><%
						}
						else if(score == 1){
							%><font style='color:gold'>★</font><%
						}%>		
					</td>
					<td class="td1" colspan="3">
						<%=review.getContent() %><br>												
					</td>													
					<td class="td1">	
						<input type="button" id="delBtn<%=i %>" class="delBtn" value="삭제" seq=<%=review.getSeq() %> style="visibility: visible">
					</td>				
				</tr>
				<tr>
					<td colspan="3" align="center" class="td1">
						<%	
						if(review.getFilename() != null){
							String str = review.getFilename();
				
							String[] filename = str.split("/");
				//			for(String file : filename){
				//				System.out.println(file);
				//			} 
				
							for(String file : filename){
								%>							
								<img class="reviewImg" src="<%=request.getContextPath()%>\review\<%=file %>" style="width: 130px; height: 80px">
														
								<div id="myModal" class="modal">									
									<div class="modal-content">
									<!-- 	<button type="button" class="closeModal" data-dismiss="modal">&times;</button><br> -->
										<img class="modalImg" src="" style="width: 500px; height: 300px">				
									</div>	
								</div>							
								<%
							}						
						}
						%>
					</td>
				</tr>								
			</table>
				<%	
				}
			}
			%> 
			<hr style="border: 0.5px solid #ef6d00">
			
			<c:url var="action" value="/SightsController?command=reviewList"/>
			<c:if test="${paging.prev}">
			 <a href="${action}&page=${paging.beginPage-1}&title=<%=title%>&sorting=<%=sorting%>">prev</a>
			</c:if>
			<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" step="1" var="index">
				<c:choose>
					<c:when test="${paging.nowpage==index}">
						[${index}]
					</c:when>
					<c:otherwise>
						<a href="${action}&page=${index}&title=<%=title%>&sorting=<%=sorting%>">[${index}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.next}">
				<a href="${action}&page=${paging.endPage+1}&title=<%=title%>&sorting=<%=sorting%>">next</a>
			</c:if>
			<br><br>	
								
			<form action="/jejuya/SightsController?command=addReview" method="post" enctype="multipart/form-data">
					 <input type="hidden" name="id" value="id">
					 <input type="hidden" name="title" value=<%=title %>>
				<!-- <input type="hidden" name="command" value="addReview"> -->
				
				<table class="tb2">
					<tr>
						<td colspan="3">
							<input type="radio" id="score" name="score" value="5" checked="checked">매우 좋아요
							<input type="radio" id="score" name="score" value="4">좋아요
							<input type="radio" id="score" name="score" value="3">보통
							<input type="radio" id="score" name="score" value="2">싫어요
							<input type="radio" id="score" name="score" value="1">매우 싫어요
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<textarea style="width: 800px" rows="5" name="content" placeholder="리뷰를 입력해주세요"></textarea>
						</td>			
					</tr>
					<tr>
						<td><input type="file" class="fileTd" id="fileload" name="fileload1"></td>
						<td><input type="file" class="fileTd" id="fileload" name="fileload2"></td>
						<td><input type="file" class="fileTd" id="fileload" name="fileload3"></td>
					</tr>	
					<tr>
						<td colspan="3" align="center" style="padding: 10px">
							<input type="submit" value="등록" class="btnD">
						</td>
					</tr>
				</table>
			</form>		
										  	
	  	</div>	  	 	
	</div>	
</div>

<script type="text/javascript">
var modal = document.getElementById("myModal");

//리뷰 사진 누르면 모달open
$(function () {		
	$(".reviewImg").click(function () {	
		var src = $(this).attr("src");
//		alert(src);
		
		$(".modalImg").attr("src", src);				
		$(".modal").css("display","block");											
	});
	
/* 	$(".closeModal").click(function () {
		$(".modal").css("display", "none");
	}); */
	
	$(".modalImg").click(function () {
		$(".modal").css("display", "none");
	});
	
	// 리뷰테이블 회색으로 변하기
 	$(".tb1").mouseover(function () {
		$(this).css("background", "#e5e5e5");
	}); 
	$(".tb1").mouseout(function () {
		$(this).css("background", "");
	});  
	
});

window.onclick = function (event) {
	if(event.target == modal){
		modal.style.dispaly = "none";
	}  
}


// 삭제버튼
$(function () {
	<%-- 	
	if(<%=mem.getId().equals(dto.getId())%>){
		$("#delBtn").css("visibility", "visible");  
	}
	 --%>
  	$(".delBtn").click(function () {
		var id = $(this).attr("id");
		alert(id);		
		var seq = $("#" + id).attr("seq");
		alert(seq);	
		
		location.href="/jejuya/SightsController?command=delReview&seq="+seq+"&title=<%=title%>";  	
	});
	   	
});

// 메인메뉴
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
	});  */
	
});







</script>


<!-- include footer -->
<jsp:include page="/views/templates/footer.jsp"></jsp:include>

</body>
</html>











