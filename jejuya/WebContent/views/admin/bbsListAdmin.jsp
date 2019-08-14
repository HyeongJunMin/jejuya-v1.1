<%@page import="com.sights.dto.SightsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<SightsDto> list = (List<SightsDto>) request.getAttribute("bbslist");

	int allBbspage = (Integer) request.getAttribute("allpage");
	System.out.println("allpage : " + allBbspage);

	int bbsPage = allBbspage / 10;
	if (allBbspage % 10 > 0) {
		bbsPage = bbsPage + 1;
	}
	
	String category = (String)request.getAttribute("categorySelectValue");
	System.out.println("bbslist category : " + category);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
select{
	width: 90px;
	padding: .4em .4em;
    border: 1px solid #999;
}
</style>
<link type="text/css" rel="stylesheet"
	href="/jejuya/resources/css/admin/listadmin.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<h2>게시글 List</h2>
<form action="/jejuya/adminControl?" id="category_select" >
	<input type="hidden" name="command" value="bbslist">
		<div align="right" style="width: 880px">
			<select name="category_select" class="category_sel" onchange="category_sel()">
				<option id="op1" value="All" selected="selected">All</option>
				<option id="op2" value="관광지">관광지</option>
				<option id="op3" value="음식점">음식점</option>
				<option id="op4" value="숙소">숙소</option>
			</select>
		</div>
</form>
	
	<div class="list_main">
		<form action="/jejuya/adminControl" method="get">
			<input type="hidden" name="command" value="bbs_muldel">
			<table class="bbs_list_table">
				<col width="70"><col width="200"><col width="150"><col width="150"><col width="150"><col width="150">	
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="6"></td>
				</tr>
				<tr class="th_class">
					<th><input type="checkbox" name="alldel"
						onclick="deletechecks(this.checked)"></th>
					<th>Title</th>
					<th>Category</th>
					<th>Theme</th>
					<th>Add Schedule</th>
					<th>Readcount</th>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="6"></td>
				</tr>
				<%
					if (list == null || list.size() == 0) { // 데이터가 없을 때
				%>
				<tr bgcolor="#f6f6f6">
					<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="6"></td>
				</tr>
				<%
					} else { // 데이터가 있을 때
						for (SightsDto bbs : list) {
				%>
				<tr class="listclick" id="list_click" bgcolor="f6f6f6">
					<td align="center"><input type="checkbox" name="bbs_delck"
						value="<%=bbs.getTitle()%>"></td>
					<td class="list"><%=bbs.getTitle()%></td>
					<%
						if (bbs.getCategory() == 0) {
					%>
					<td class="list">관광지</td>
					<%
						} else if (bbs.getCategory() == 1) {
					%>
					<td class="list">음식점</td>
					<%
						} else if (bbs.getCategory() == 2) {
					%>
					<td class="list">숙소</td>
					<%
						}
					%>

					<td class="list"><%=bbs.getTheme()%></td>
					<td class="list"><%=bbs.getAddSchedule()%></td>
					<td class="list"><%=bbs.getReadcount()%></td>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="6"></td>
				</tr>
				<%
					}
				}
				%>
				<tr align="center">
					<td colspan="6">
						<%
						String sel =(String)request.getAttribute("searchsel");
						String searchW =(String)request.getAttribute("searchword");
						
						System.out.println("list sel .JSP : " + sel);
						System.out.println("list searchW .JSP : " + searchW);
						
							for (int i = 1; i <= bbsPage; i++) {
								%> 
								 <a href="/jejuya/adminControl?command=bbslist&page=<%=i%>&bbs_choice=<%=sel%>&searchWord=<%=searchW%>&category_select=<%=category %>" style="font-size: 15pt; color: #5d5d5d; ">[<%=i%>]</a>
								  
								  <%
 						}
 							%>
					</td>
				</tr>
				<tr class="delete_bbs"  >
					<td colspan="6" class="tablesubmit">
					<input type="submit" value="게시글 삭제" style="width: 8em; height: 2.5em;">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<br>
	<br>
	<form action="/jejuya/adminControl" method="get">
		<input type="hidden" name="command" value="bbslist">
		<table>
			<tr>
				<td><select name="bbs_choice">
						<option value="TITLE" >TITLE</option>
				</select></td>
				<td><input type="text" id="search" name="searchWord" style="width: 10em; height: 2em;">
				</td>
				<td><input type="submit" value="search" style="width: 5em; height: 2.5em;"></td>
			</tr>
		</table>
	</form>
<script type="text/javascript">

function category_sel() {
	document.getElementById("category_select").submit();
}


$(function () {
	<%for(int i = 0; i <= 3; i++){
		%>
	var selCategoryValue = $(".category_sel").children().eq(<%=i %>).text();
// 		alert(selCategoryValue);
		
		if("<%=category%>" == selCategoryValue){
		$("#op<%=i + 1%>").attr("selected", "selcted");
		}
	<%
	}
	%>
	
});

function deletechecks(e) {
	var arr = document.getElementsByName("bbs_delck");
	alert(arr);

	for (i = 0; i < arr.length; i++) {
		arr[i].checked = e;
	}
}
</script>
</body>
</html>