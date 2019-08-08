<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>

<jsp:include page="/views/templates/staticresources.jsp"></jsp:include>
</head>
<body>
<!-- Header -->
<jsp:include page="/views/templates/header.jsp"></jsp:include>
<br><br><br><br><br><br><br>


<div class="findMemberWrapper" align="center">
	<div class="findIdWrapper">
		<form action="" class="findIdForm" id="_findIdForm" method="post">
			<table>
				<tr>
					<td colspan="2"><h3>ID 찾기</h3></td>
				</tr>
				<tr>
					<td colspan="2">아이디찾기 방법 : email, 핸드폰번호 등</td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td>
						<input type="text" id="_findIdInputIdTxt" name="findIdInputIdTxt" placeholder="이름을 입력하세요.">
					</td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td>
						<input type="text" id="_findIdInputEmailTxt" name="findIdInputEmailTxt" placeholder="이메일을 입력하세요.">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="_findIdSubmitBtn" value="찾기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<br>
	<hr>
	<br>
	
	<div class="findPwWrapper">
		<form action="" class="findPwForm" id="_findPwForm" method="post">
			<table>
				<tr>
					<td colspan="2"><h3>PW 찾기</h3></td>
				</tr>
				<tr>
					<td colspan="2">PW찾기 방법 : email, 핸드폰번호 등</td>
				</tr>
				<tr>
					<td colspan="2">재설정만 가능하도록(암호화 알고리즘 때문)</td>
				</tr>
				<tr>
					<td>ID : </td>
					<td>
						<input type="text" id="_findPwInputIdTxt" name="findPwInputIdTxt" placeholder="이름을 입력하세요.">
					</td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td>
						<input type="text" id="_findPwInputEmailTxt" name="findPwInputEmailTxt" placeholder="이메일을 입력하세요.">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<!-- Footer -->
<br><br><br><br><br><br><br>
<jsp:include page="/views/templates/footer.jsp"></jsp:include>

</body>
</html>