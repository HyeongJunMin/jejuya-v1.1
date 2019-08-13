<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<input type="text" value="1" id="inputNum1">
<input type="text" value="4" id="inputNum2">
<input type="button" id="inputBtn1" value="계산">

<div class="timeline">
	<table border="1" class="tblTimeline">
		<tr>
			<td colspan="2">
				<a><h3>TimeLine</h3></a>
				<input type="hidden" id="currDayInTimeline" value="1">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p>DAY <a id="dayInTimeline">1</a></p>
			</td>
		</tr>
		
	</table>
</div>

<input type="button" id="inputBtnDay1" value="<<">
<input type="button" id="inputBtnDay2" value=">>">

<script type="text/javascript">

var totalTripDate = 0;
$("#inputBtn1").click(function(){
	var inputNum1 = $("#inputNum1").val();
	var inputNum2 = $("#inputNum2").val();
	totalTripDate = inputNum2 - inputNum1 ;
	//alert(inputNum2 - inputNum1);
	$("#tripDate").val( inputNum2 - inputNum1 );
	
	for( i = 1 ; i <= totalTripDate + 1 ; i++){
		//var $trTrip = $("<tr colspan='2' class='dayInTimeline" + i + "'><td>Day" + i + "</td></tr>");
		//$(".tblTimeline").append($trTrip);
		for( j = 5 ; j < 24 ; j++ ){
			//여행일 변수 저장 날짜:시간:분 
			var dayVar = ( (i<10)?"0"+i:i ) ;
			var timeVar = ( (j<10)?'0'+j:j) ;
			//$trTrip.append("<tr class='tripSche" + dayVar + ":" + timeVar + ":00'><td>" + timeVar + ':00' + "</td><td>&nbsp;</td></tr>");			
			$(".tblTimeline").append("<tr class='tripSche" + dayVar + "'><td>" + timeVar + ':00' + "</td><td>"
				+ "<input type='text'/></td></tr>");
		}
		
		if( i > 1 ){
			$(".tripSche" + dayVar ).hide();	
		}		
	}
	
});

$("#inputBtnDay1").click(function(){
	var currDay = parseInt($("#dayInTimeline").html().trim());
	for(i = 1 ; i <= currDay ; i++){
		$(".tripSche0" + i).hide();
	}
	if(currDay > 1){
		currDay = parseInt(currDay) - 1;
		$("#currDayInTimeline").val( ( currDay ) );
	}
	$("#dayInTimeline").html(currDay);
	$(".tripSche0" + currDay).show();
});

$("#inputBtnDay2").click(function(){
	var currDay = parseInt($("#dayInTimeline").html().trim());
	for(i = 1 ; i <= currDay ; i++){
		$(".tripSche0" + i).hide();
	}
	if(currDay <= totalTripDate ){
		currDay = parseInt(currDay) + 1;
		$("#currDayInTimeline").val( ( currDay ) );		
	}
	$("#dayInTimeline").html(currDay);
	$(".tripSche0" + currDay).show();
});
</script>
</body>
</html>