<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%

	//여기는 컨트롤러
	String htmlCode = "";

	htmlCode += "<table>";
	//내용을 넣었음
	htmlCode += "</table>";
	
	PrintWriter pw = response.getWriter();
	pw.print(htmlCode);

	//선언부
	List<String> lst = new ArrayList<>();

	for(int i = 1 ; i < 50 ; i++){
		lst.add(i+"");
	}
%>
<div id="div_uls">
<%

	int paging = 1;
	out.println("<ul id='ul_1'>");
	for(int i = 1 ; i < lst.size() +1 ; i++){
		
		%>
			<li><%=i %>&nbsp; ㅎㅎ</li>			
		<%		
		if( (i%9) == 0 && i > 1 ){
			out.println("</ul><ul id='ul_" + ((i/9)+1) + "'>");
		}
	}
	out.println("</ul>");
%>
</div>

<script type="text/javascript">
$(function(){
	alert($("#div_uls").children().eq(0));
	$("#div_uls").children(":eq(0)");

});

</script>

</body>
</html>