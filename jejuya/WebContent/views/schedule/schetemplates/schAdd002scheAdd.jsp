<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<br> <font size="2" id="coment">하단의 관광지 중 목록에 담고싶다면 클릭하세요</font>	<br>
<input type="hidden" id="hidden" value="0">
<button type="button" id="category" value="0" onclick="func(0);changehidden(0)">관광지</button>
<button type="button" id="category" value="1" onclick="func(1);changehidden(1)">음식점</button>
<button type="button" id="category" value="2" onclick="func(2);changehidden(2)">숙소   </button>

<br>

<!-- table태그는 위치를 잡기 위한 용도로 사용됨 -->
<table><col width="100"><col width="150"><tr><th colspan="2">
<select id="choicetime">
	<option value="0">시간 선택</option>
	<% for(int i = 5 ; i < 24 ; i++){
			out.println("<option value=\"");
			out.println( ( (i<10)? "0"+i : i ) + ":00\">" );
			out.println( ( (i<10)? "0"+i : i ) + ":00</option>");
		}%>
</select>
</th></tr></table>

<!-- 관광지 선택 테이블 시작 부분 -->
<table id="triplist">
	<col width="50">
	<col width="250">
	<%
		
	%>
	<tr>
		<th><input type="checkbox" name="addck[]" value='1'></th>
		<th><font size="2" id="coment">123</font></th>
	</tr>
	<%
		
	%>
	<!-- 	
</table>
<table id="paging"  >
	<col width="50">
	<col width="250"> -->
	<tr>
		<th colspan="2">
			
		</th>
	</tr>

	<tr>
		<th colspan="2"><button type="button" onclick="add()"
				id="addbtn">추가</button></th>
	</tr>

</table>

<script type="text/javascript">

//관광 음식 호텔 의 버튼을 눌렀을 때 해당 카테고리의 리스트를 가져오는 함수 입니다 
//e에 각 카테고리 숫자를 넣어 함수를 호출하여 ajax를 통하여 새로고침을 하지 않으면서
//컨트롤으로 접근하여 데이터를 가져오는 함수 입니다
function func(e) {
	//alert(e);
	$("#triplist").html(''); //기존 테이블에 있던 정보를 일단 초기화
	$.ajax({
		url:"/Projectjeju/ScheduleController?command=tourismAjaxTblTriblist",
	    type:"get",
	    data:{"pg":1, "category":e},
	    success:function(data,status,xhr){	    	
	    	
	    //	alert(data);	
	    	
	    	$("#triplist").html(data);
	    },
	    error:function(xhr,status,error){
	    	//alert("통신실패");
	    },
	    complete:function(xhr,status){
			//alert("통신 종료!");
	    }
	});
	
}

</script>

</html>