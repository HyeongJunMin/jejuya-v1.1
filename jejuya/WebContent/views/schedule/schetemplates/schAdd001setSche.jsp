<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<h3>나의 여행 일정</h3>
<font id="addtextname" size="2"> 작성자 정현아 </font>
<table id="addtable" >
	<col width="100">
	<col width="150">
	<tr>
		<th><font size="1" id="addtext1">새 여행 일정등록</font></th>
		<th><font size="1" id="addtext2">나의 여행 일정</font></th>
	</tr>
	<tr>
		<th><font size="1" id="titletable">제목</font></th>
		<td><input type="text" placeholder="예)우리들의 4박 5일 제주"></td>
	</tr>

	<tr>
		<th><font size="1" id="titletime">기간</font>	</th>
		<td><p id="tripdate"></p></td>
	</tr>

	<tr>
		<th colspan="2">
			<input type="text" id="firstday">
			<input type="text" id="lastday">
		</th>
	</tr>
	<tr>
		<th><font size="1" id="member">인원</font> 
			<select id="memberselec">
				<%for(int i = 1 ; i < 11 ; i++ ){
					out.println("<option value=\"" + i + "\">" + i + "명</option>");	
				}%>				
			</select>
		</th>
		<th><font size="1" id="with">일행</font> <select id="withselec">
				<option value="0">선택</option>	<option value="부모">부모</option>
				<option value="아이">아이</option>		<option value="친구">친구</option>
				<option value="커플">커플</option>		<option value="혼자">혼자</option>
		</select></th>
	</tr>

	<tr>
		<th><font size="1" id="section">구분</font></th>
		<th>
			<select id="sectionselec">
				<option value="0">여행 구분을 선택하세요</option>
				<option value="휴식">휴식과 치유여행</option>
				<option value="레저">레저와체험</option>
				<option value="트레킹">천천히 걷기</option>
				<option value="식도락">식도락 여행</option>
				<option value="문화체험">제주의 문화유산</option>
				<option value="전시">전시와 행사</option>
				<option value="쇼핑">쇼핑</option>
			</select>
		</th>
	</tr>
	<tr>
		<th colspan="2">
			<input type="radio" name="open" value="공개">	<font size="1" id="open">공개</font> 
			<input type="radio" name="open"	value="비공개"><font size="1" id="nonopen">비공개</font>
		</th>
	</tr>
	<tr>
		<th colspan="2">
			<div class="addschedule">
				<button type="button" class="maketrip" onclick="makeaddlist()">일정 만들기</button>
			</div>
		</th>
	</tr>
</table>

<script type="text/javascript">
//startday와 lastday 즉 여행기간을 알아내기 위하여 여행시작일과 여행마지막날을
//구하기 위해 calendar를 넣는 작업입니다
$(function () {
	var week=['일','월','화','수','목','금','토'];
	var arr1;
	var startday='';
	var lastday='';
	//여행시작일
	$("#firstday").datepicker({
		dataFormat:"yy/dd/mm",
		dataNamesMin:week,
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월",
			   "9월","10월","11월","12월"],
	    minDate:0,
	    onSelect:function(d){
	    	$("#lastday").datepicker("option","minDate",d);
	    }

	});
	
	//마지막날 달력
	$("#lastday").datepicker({
		dataFormat:"yy/dd/mm",
		dataNamesMin:week,
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월",
			   "9월","10월","11월","12월"],
		minDate:0,
	    onSelect:function(d){
	    	 $("#firstday").datepicker("option","maxDate",d);
	    },
	    onClose: function(){
	    	calBetweenTwoDays();
	    }
	});
});

//마지막 날짜를 입력하고 닫힐 때 발생하는 함수
//마지막날 달력 onClose이벤트리스너에 추가
function calBetweenTwoDays(){
	//alert($("#firstday").val());
	//alert($("#lastday").val());
	
	var start = $("#firstday").val();
	var end = $("#lastday").val();
	
	//startarr 변수 선언부 없음
	/* startarr = start.split('/'); */		
	var startarr = start.split('/');
	//alert("startarr[0]"+startarr[0]+"startarr[1]"+startarr[1]+"startarr[2])"+startarr[2]);
	
	//startarr 변수 선언부 없음
	var endarr=end.split('/');
	//alert("endarrarr[0]"+endarr[0]+"endarrarr[1]"+endarr[1]+"endarrarr[2])"+endarr[2]);
			
	var startday = new Date( startarr[2], startarr[0], startarr[1]);
	var endday = new Date( endarr[2], endarr[0], endarr[1]);
		
	//시작날과 끝날을 입력받아 두 날짜를 뺄셈하여 여행일정이 몇박며칠인지 알아내기 위해 뺄셈
	var betweenday = Math.ceil( endday.getTime() - startday.getTime() ) / ( 60*1000*60*24 );
	var betweendayy = betweenday+1;
		
	//여행 일수를 구해서 p 태그에 넣어줌
	document.getElementById("tripdate").innerHTML=betweenday+"박"+betweendayy+"일";
	
	
	//구해진 여행일수를 hidden타입으로 만들어놓은 곳에 값을 저장해줌
	//이미 $(function(){});이 선언되어있는 상황에서 또 jquery 시작함수를 중복해서 선언했음
	//$(document).ready(function(){
	
	//$("#triptime").val(betweendayy);
	//	alert($("#triptime").val());
	//});	
}
</script>

</html>