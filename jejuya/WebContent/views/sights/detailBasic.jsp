<%@page import="com.sights.dto.SightsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SightsDto dto = (SightsDto)request.getAttribute("dto");
String homepage = dto.getHomepage();
System.out.println("homepage=" + homepage);

//이미지파일 경로설정
String serverPath = request.getContextPath();
System.out.println(serverPath);

//이미지 주소로 받을때랑 서버에서 받을때 두가지
String filename = (dto.getFilename().trim().substring(0,3).equals("http")
						?dto.getFilename():serverPath);

//리뷰평점평균
int count = (int) request.getAttribute("count");
System.out.println(count);
%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- global conf include -->
<jsp:include page="/views/templates/staticresources.jsp"></jsp:include>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 만든 CSS 파일 -->
<link rel="stylesheet" href="/jejuya/resources/css/sights/sightsdetail.css"/>

<style type="text/css">
table.tb1{
	width: 800px;
	border-collapse: collapse;
}
.td1{
	padding: 10px;	
}
.tr1{
	border-bottom: 1px solid #e5e5e5;
	border-top: 1px solid #e5e5e5;
}

</style>


</head>
<body>
<!-- GNB include -->
<jsp:include page="/views/templates/header.jsp"></jsp:include>

<div align="center">
	<img class="mainImg" src="<%=filename %>\upload\<%=dto.getFilename() %>" style="width: 100%">
	
	<div class="containerD">	
		<ul class="tabsD">			    
		    <li id="basic" class="menu current">기본정보</li>
		    <li id="content" class="menu">상세정보</li>
		    <li id="reviewlist" class="menu">리뷰 및 평가등록</li>
		    <li id="findroad" class="menu">길찾기</li>		
	  	</ul> 	
	  	
	  	<div class="content">
			<table id="basicTb" class="tb1">
				<tr class="tr1">
					<td class="td1">관광지명</td>
					<td><%=dto.getTitle() %></td> 
				</tr>
				<tr class="tr1">
					<td class="td1">평점</td>
					<td><%=count %></td>
				</tr>	
				<tr class="tr1">
					<td class="td1">주소</td>
				    <td><%=dto.getAddress() %></td>
				</tr>
				<tr class="tr1">
					<td class="td1">연락처</td>
					<td><%=dto.getPhone() %></td>
				</tr>
				<% if(homepage != null){
					%>
					<tr class="tr1">
						<td class="td1">홈페이지</td>
						<td><a href="http://<%=homepage %>" target="_blank"><%=homepage %></a></td>
					</tr>										
					<%
					}
					%>																
			</table>
			<br>
			<div id="map" style="width: 500px; height: 400px"></div>
			
			<div id="coordX"></div>
			<div id="coordY"></div>	
			
			<button type="button" id="findroad">길찾기</button>
					  	
	  	</div>	  	 	
	</div>	
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76a79f0ac1e4d339eaf1a7c26d8e87c2&libraries=services"></script>
<script>
$(function () {
	
	// 메뉴 page넘기기
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


//평점 숫자 별모양으로 바꾸기
$(function () {
	if("<%=count%>" == 5){
		$("#basicTb tr:eq(1) td:eq(1)").html("<font style='color:gold'>★★★★★</font>");
	}
	else if("<%=count%>" == 4){
		$("#basicTb tr:eq(1) td:eq(1)").html("<font style='color:gold'>★★★★</font>");
	}
	else if("<%=count%>" == 3){
		$("#basicTb tr:eq(1) td:eq(1)").html("<font style='color:gold'>★★★</font>");
	}
	else if("<%=count%>" == 2){
		$("#basicTb tr:eq(1) td:eq(1)").html("<font style='color:gold'>★★</font>");
	}
	else if("<%=count%>" == 1){
		$("#basicTb tr:eq(1) td:eq(1)").html("<font style='color:gold'>★</font>");
	}

});

//지도 불러오기
//var coordXY   = document.getElementById("coordXY");
var x,y       = "";

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=dto.getAddress()%>', function(result, status) {

//정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {

var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
y = result[0].x;
	 	x = result[0].y;

// 결과값으로 받은 위치를 마커로 표시합니다
var marker = new kakao.maps.Marker({
    map: map,
    position: coords
});

// 인포윈도우로 장소에 대한 설명을 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=dto.getTitle()%></div>'
});
infowindow.open(map, marker);

// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setCenter(coords);

$("#findroad").click(function() {
			alert(x + " , " + y);
			alert('<%=dto.getTitle()%>');
			
			window.open('https://map.kakao.com/link/to/' + '<%=dto.getTitle()%>' + ',' + x + ',' + y, '_blank');
		});
        
coordX.innerHTML = x;
coordY.innerHTML = y;
} 
});

</script>


<!-- include footer -->
<jsp:include page="/views/templates/footer.jsp"></jsp:include>


</body>
</html>











