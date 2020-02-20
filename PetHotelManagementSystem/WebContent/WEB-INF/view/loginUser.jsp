<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginUser</title>
</head>
<body>
	<form action="/user/loginUser" method="post">
		<input type="text" name="uId" placeholder="아이디">
		<input type="password" name="uPwd" placeholder="비밀번호">
		<input type="submit" value="로그인">
	</form>
</body>
</html>