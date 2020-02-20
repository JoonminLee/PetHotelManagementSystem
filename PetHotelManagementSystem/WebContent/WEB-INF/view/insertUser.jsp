<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser</title>
</head>
<body>
	<!-- User정보입력 -->
	<fieldset>
		<legend>회원가입</legend>
		<form action="/user/insertUser" method="post">
			<input type="text" name="uId" placeholder="아이디 입력"> <br>
			<input type="password" name="uPwd" placeholder="패스워드 입력"> <br>
			<input type="text" name="uName" placeholder="이름 입력"> <br>
			<label><input type="radio" name="uGender" value="남">남</label>
			<label><input type="radio" name="uGender" value="여">여</label> <br>
			<input type="text" value="010" readonly> - <input type="text" name="uPhone1"> - <input type="text" name="uPhone2"><br> 
			<input type="text" name="uEmail" placeholder="이메일 입력"> <br>
			<input type="date" name="uBirthStr"> <br>
			<input type="submit" value="회원가입">
		</form>
	</fieldset>
</body>
</html>