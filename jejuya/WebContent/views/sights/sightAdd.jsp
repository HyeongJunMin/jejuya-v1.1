<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
table{
	font-size: 13px;
	font-family: "NanumSquare", "Nanum Gothic", "나눔고딕", "맑은 고딕";
	border-collapse: collapse;
	border: 1px solid #ef6d00;
}

.btn {
    border-radius: 5px;
    border : 0;
    width: 100px;
    height: 35px;
    font-size: 14px;
    color: #fff;
    background: #ef6d00;
}

</style>

</head>
<body>

<div align="center">

<form action="/jejuya/SightsController?command=addsights" method="post" enctype="multipart/form-data">
	<!-- <input type="hidden" name="command" value="addsights"> -->
	
<h3>여행지 등록</h3>

<table border="1">
<tr>	
	<td>여행지선택</td>
	<td>
		<select id="category" name="category" onchange="categorySel()">
			<option value="0">관광지</option>
			<option value="1">음식점</option>
			<option value="2">숙소</option>
		</select>		
	</td>	
</tr>	
<tr>
	<td>여행지명</td>
	<td>
		<input type="text" id="title" name="title" onblur="titlecheck()">
		<br>
		<span id="titlecheck" class="msg"></span>	
	</td>
</tr>
<tr>	
	<td>테마선택</td>
	<td id="_theme0">	
		<select name="theme">
			<option value="nature">자연</option>
			<option value="tour">문화관광</option>
			<option value="leisure">레저/체험</option>
			<option value="walk">걷기</option>
			<option value="photo">포토스팟</option>
		</select>
	</td>
	
	<td id="_theme1">	
		<select name="theme">
			<option value="traditional">전통음식</option>
			<option value="korean">한식</option>
			<option value="western">양식</option>
			<option value="chinese">중식</option>
			<option value="cafe">카페</option>
		</select>
	</td>
	
	<td id="_theme2">	
		<select name="theme">
			<option value="hotel">호텔</option>
			<option value="resort">리조트</option>
			<option value="pension">펜션</option>
			<option value="inns">민박</option>
			<option value="guest">게스트하우스</option>
		</select>
	</td>
	
</tr>	
<tr>	
	<td>주소</td>
	<td>
		<jsp:include page="postNum.jsp" ></jsp:include>
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<input type="text" name="phone">	
	</td>	
</tr>
<tr>
	<td>홈페이지</td>
	<td>
		<input type="text" name="homepage">	
	</td>	
</tr>
<tr>
	<td>상세정보</td>
	<td>
		<textarea rows="25" cols="55" name="content"></textarea>
	</td>	
</tr>
<tr>
	<td>대표사진</td>
	<td>
		<input type="file" id="fileload" name="fileload" style="width: 400px">
        <div id="holder"><span></span></div>
	</td>	
</tr>
</table>

<input type="submit" class="btn" value="등록">
<input type="button" id="btnUpdate" class="btn" value="수정">
<input type="button" id="btnDel" class="btn" value="삭제">

</form>
</div>


<!-- 업로드한 이미지 출력 -->
<%-- <img src="<%=request.getContextPath()%>\upload\udo.jpg"> --%>

<script type="text/javascript">
$(function () {
	$("#_theme0").show(); $("#_theme1").hide(); $("#_theme2").hide();
})

function categorySel() {
	// 카테고리 선택이 바뀌면 그 값을 가져온다
	var num = document.getElementById("category");
	var valNum = num.options[num.selectedIndex].value;
//	alert(valNum);

	switch(valNum){
	case '0': $("#_theme0").show(); $("#_theme1").hide(); $("#_theme2").hide(); break;
	case '1': $("#_theme0").hide(); $("#_theme1").show(); $("#_theme2").hide(); break;
	case '2': $("#_theme0").hide(); $("#_theme1").hide(); $("#_theme2").show(); break;
	default : break;
	}
	
}

// 업로드 이미지 미리보기
var upload = document.getElementById("fileload"),
    holder = document.getElementById("holder")
    
upload.onchange = function (e) {
e.preventDefault();

var file = upload.files[0],
    reader = new FileReader();
    
reader.onload = function (event) {
  var img = new Image();
  img.src = event.target.result;
  // note: no onload required since we've got the dataurl...I think! :)
  if (img.width > 250) { // holder width
    img.width = 250;
  }
  holder.innerHTML = '';
  holder.appendChild(img);
};
reader.readAsDataURL(file);

return false;
};



</script>



</body>
</html>









