<%@page import="com.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	List<MemberDto> list = (List<MemberDto>) request.getAttribute("userlist");
// 	System.out.println("list 개수 : " + list.size());
	
	int allpage = (Integer)request.getAttribute("allpage");
// 	System.out.println("allpage : " + allpage);
	
	int memberPage = allpage / 5;
	if(allpage % 5 > 0){
		memberPage = memberPage + 1;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr.listclick:hover{
	border-collapse: collapse;
	background-color: #abd;
}
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

	<h2>회원 List</h2>


	<div class="list_main">
		<form action="/jejuya/adminControl" method="post">
			<input type="hidden" name="command" value="user_muldel">
			<table class="user_list_table">
				<col width="70">
				<col width="200">
				<col width="200">
				<col width="350">
				<col width="200">
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="5"></td>
				</tr>
				<tr class="th_class">
					<th><input type="checkbox" name="alldel"
						onclick="deletechecks(this.checked)"></th>
					<th>ID</th>
					<th>Name</th>
					<th>E-mail</th>
					<th>Birth</th>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="5"></td>
				</tr>
				<%
					if (list == null || list.size() == 0) { // 데이터가 없을 때
				%>
				<tr bgcolor="#f6f6f6">
					<td colspan="5" align="center">회원이 존재하지 않습니다</td>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="5"></td>
				</tr>
				<%
					} else { // 데이터가 있을 때
						for (MemberDto mem : list) {
// 							System.out.println("mem list: "  + mem.toString());
				%>
				<tr class="listclick" id="list_click" bgcolor="f6f6f6">
					<td align="center"><input type="checkbox" name="delck"
						value="<%=mem.getId()%>"></td>
					<td class="list"><%=mem.getId()%></td>
					<td class="list"><%=mem.getPw()%></td>
					<td class="list"><%=mem.getName()%></td>
					<td class="list"><%=mem.getEmail()%></td>
					<td class="list"><%=mem.getBirth()%></td>
				</tr>
				<tr>
					<td class="table_border" height="1" bgcolor="#000" colspan="5"></td>
				</tr>
				<%
					}
				}
				%>
				<tr align="center">
				<td colspan="5">
					<%
						String sel =(String)request.getAttribute("searchsel");
						String searchW =(String)request.getAttribute("searchword");
						
// 						System.out.println("list sel : " + sel);
// 						System.out.println("list searchW : " + searchW);
						for (int i = 1; i <= memberPage; i++) {
								%>
								 <a href="/jejuya/adminControl?command=userlist&page=<%=i%>&choice=<%=sel%>&searchWord=<%=searchW%>" style="font-size: 15pt; color: #5d5d5d; ">[<%=i%>]</a>
								<%	
// 							}else {

							}
					 %>
				</td>
				</tr>
				<tr class="delete_member">
					<td class="tablesubmit" colspan="5"><input type="submit" class="submit_del" name="submit_del" value="고객정보 삭제" style="width: 9em; height: 2.5em;"></td>
				</tr>
			</table>
		</form>
	</div>


	<br>
	<br>
	<form action="/jejuya/adminControl" method="get">
		<input type="hidden" name="command" value="userlist">
		<table>
			<tr>
				<td><select name="choice">
						<option value="ID" selected="selected">ID</option>
						<option value="NAME">NAME</option>
						<option value="EMAIL">EMAIL</option>
				</select></td>
				<td><input type="text" id="search" name="searchWord" style="width: 10em; height: 2em;">
				</td>
				<td><input type="submit" value="search" style="width: 5em; height: 2.5em;"></td>
			</tr>
		</table>
	</form>


	<!-- 상세 페이지 -->


	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h3 align="center">회원정보</h3>

			<div align="center">
				<form action="/jejuya/adminControl" method="post">
					<input type="hidden" name="command" value="update">
					<table style="width: 700">
						<col width="200">
						<col width="600">
						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
						</tr>
						<tr class="modal_detail" bgcolor="f6f6f6">
							<th class="modal_table_header">ID</th>
							<td id="id"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
						</tr>
						<tr class="modal_detail" bgcolor="f6f6f6">
							<th class="modal_table_header">PWD</th>
							<td id="pw"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
						</tr>
						<tr class="modal_detail" bgcolor="f6f6f6">
							<th class="modal_table_header">NAME</th>
							<td id="name"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
						</tr>
						<tr class="modal_detail" bgcolor="f6f6f6">
							<th class="modal_table_header">EMAIL</th>
							<td id="email"></td>
						</tr>
						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
						</tr>
						<tr class="modal_detail" bgcolor="f6f6f6">
							<th class="modal_table_header">BIRTH</th>
							<td id="birth"></td>
						</tr>

						<tr>
							<td height="1" bgcolor="#000" colspan="3"></td>
					</table>
				</form>
			</div>
		</div>
	</div>


<script type="text/javascript">
$(".list").click(function() {

	$(".modal").css("display", "block");
		$("#id").text($(".listclick").children().eq(1).text());
		$("#pw").text($(".listclick").children().eq(2).text());
		$("#name").text($(".listclick").children().eq(3).text());
		$("#email").text($(".listclick").children().eq(4).text());
		$("#birth").text($(".listclick").children().eq(5).text());

});
$(".close").on("click", function() {
	$(".modal").css("display", "none");
});

$('td.list:nth-child(3)').hide(); // td의 세번째 열 데이터를 숨김

function deletechecks(e) {
	var arr = document.getElementsByName("delck");

	for (i = 0; i < arr.length; i++) {
		arr[i].checked = e;
	}
}

</script>

</body>
</html>