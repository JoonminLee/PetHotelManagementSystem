<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser</title>
</head>
<body>
	<form action="/user/insertUser" method="post">
		<input type="text" name="uId" placeholder="아이디 입력">
		<input type="password" name="uPwd" placeholder="패스워드 입력">
		<input type="text" name="uName" placeholder="이름 입력">
		<label><input type="radio" name="uGender" value="남">남</label>
		<label><input type="radio" name="uGender" value="여">여</label>
		<input type="text" value="010" readonly> - <input type="text" name="uPhone1"> - <input type="text" name="uPhone2">
		<input type="text" name="uEmail" placeholder="이메일 입력">
		<input type="date" name="uBirthStr">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>