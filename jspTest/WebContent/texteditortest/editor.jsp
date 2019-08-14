<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/jspTest/resource/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
<h3>텍스트에디터</h3>
<!-- 표시할 textarea 영역 --> 
<form id="frm" action="./insert.jsp" method="post" >
	<textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%;">ㅁㄴㅇㄹ</textarea>
	
	<input type="button" value="저장" id="btnSave">
</form>

<!-- 페이지 로딩시 초기화 -->
<script> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({ 
	oAppRef: oEditors, 
	elPlaceHolder: 'txtContent', 
	sSkinURI: '/jspTest/resource/editor/SmartEditor2Skin.html', 
	fCreator: 'createSEditor2' 
}); 

$("#btnSave").click(function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); 
	$("#frm").submit();
});


</script>

</body>
</html>