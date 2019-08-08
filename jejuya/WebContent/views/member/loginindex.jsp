<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="/jejuya/resources/css/member/login.css" rel="stylesheet"></link>
<jsp:include page="/views/templates/staticresources.jsp"></jsp:include>
</head>
<body>

<jsp:include page="/views/templates/header.jsp"></jsp:include>

<br><br><br><br><br><br><br>

<div align="center" class="wrapInLoginPage">
<h1>로그인</h1>
<form action="/jejuya/member" method="post">
<input type="hidden" name="command" value="dologin">
<table border="1" class="tblInLoginPage">

<tr>
<td>아이디</td>
<td><input type="text" name="id" size="20"></td>
</tr>

<tr>
<td>패스워드</td>
<td><input type="password" name="pwd" size="20"></td>
</tr>
<tr>
	<td colspan="2">ID 저장</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="      로그인        ">
<br>
<!-- 회원가입 페이지로 이동 -->
<button type="button" onclick="location.href='/jejuya/member?command=goregi'"> 회원가입 </button>
<!-- ID/PW 찾기 페이지로 이동 -->
<button type="button" onclick="location.href='/jejuya/member?command=gofind'">ID/PW찾기</button>
</td>
</tr>
</table>
</form>
</div>

<br><br><br><br><br><br><br>


<jsp:include page="/views/templates/footer.jsp"></jsp:include>


</body>
</html>