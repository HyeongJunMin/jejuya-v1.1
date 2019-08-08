<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>regi</title>
<!-- Bootstrap, jQuery CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"></link>
<link href="../../resources/css/member/regi.css" rel="stylesheet"></link>
<script type="text/javascript" src="../../resources/js/member/regi.js"></script>
</head>
<body>

<h1>회원등록</h1>
<p>환영합니다 VISIT JEJU</p>

<div class="center">

<form action="/jejuya/member" method="POST">
<input type="hidden" name="command" value="doregi">
<table border="1">
<tr>
<td>아이디</td>
<td><input type="text" name="id" size="20" id="inputIdInSignup"></td>
</tr>

<tr>
<td>패스워드</td>
<td><input type="password" name="pwd" size="20" id="inputPw1InSignup"></td>
</tr>

<tr>
<td>패스워드2</td>
<td><input type="password" name="pwd2" size="20" id="inputPw2InSignup"></td>
</tr>

<tr>
<td>이름</td>
<td><input type="text" name="name" size="20" id="inputName"></td>
</tr>

<tr>
<td>이메일</td>
<td><input type="text" name="email" size="20" id="inputEmailInSignup"></td>
</tr>


<tr>
<td>생일</td>
<td><input type="text" name="birth" size="20"></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="회원가입" id="btnSignupInSignupModal">
</td>
</tr>

</table>
</form>

<p id="signupWarn"></p>
<p id="chkAllOk"></p>
</div>

</body>
</html>