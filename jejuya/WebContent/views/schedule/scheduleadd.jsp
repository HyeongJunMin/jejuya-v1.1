<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 작성</title>
<!-- 개발자 작성 리소스 -->
<link rel="stylesheet" href="/jejuya/resources/css/schedule/scheduleadd.css"></link>

<!-- jquery cdn -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jquery UI cdn -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<div class="mainWrapScheduleAdd" align="center">
	
		<!-- 여행일정 시작일, 종료일 등 선택하는 부분 -->
		<div class="setScheduleOption">
			<jsp:include page="/views/schedule/schetemplates/schAdd001setSche.jsp"></jsp:include>
		</div>
		
		<!-- 타임라인에 스케쥴을 추가하는 부분 -->
		<div class="scheAdder">
			<jsp:include page="/views/schedule/schetemplates/schAdd002scheAdd.jsp"></jsp:include>
		</div>
		
		<!-- 지도와 각 관음숙의 정보가 표시되는 부분 -->
		<div class="mapAboutEachSights">
			지도와 각 관음숙의 정보가 표시되는 부분
		</div>
		
		<!-- 유저가 선택한 타임라인을 보여주는 부분 -->
		<div class="addedScheTimeline">
			유저가 선택한 타임라인을 보여주는 부분
		</div>	
		
		<!-- 관음숙 랭킹을 보여주는 부분 -->
		<div class="sightsRankDiagram">
			관음숙 랭킹을 보여주는 부분
		</div>
		
	</div>

</body>
</html>