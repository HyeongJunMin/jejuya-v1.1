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
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String filename = "";
	if(request.getContentLength() > 10 * 1024 * 1024){
		out.println("<script>alert('업로드 용량 총 10MB를 초과하였습니다.');</script>");
		return;
	}
	
	out.println("real path :  " + request.getSession().getServletContext().getRealPath("/"));
	
%>

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
	sSkinURI: '/jejuya/resources/texteditor/SmartEditor2Skin.html', 
	fCreator: 'createSEditor2' 
}); 

$("#btnSave").click(function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); 
	$("#frm").submit();
});

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}

//textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = "<img src='<%=request.getContextPath()%>/<%=path %>/'>";
    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
}

</script>

</body>
</html>