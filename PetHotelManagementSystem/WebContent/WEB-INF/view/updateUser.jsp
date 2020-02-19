<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateUser</title>
</head>
<body>
	<form action="/user/updateUser" method="post">
		<input type="text" name="uNum" value="${user.uNum }" readonly>
		<input type="text" name="uId" value="${user.uId }" readonly>
		<input type="password" name="uPwd">
		<input type="text" name="uName" value="${user.uName }" readonly>
		<input type="text" name="uGender" value="${user.uGender }" readonly>
		<input type="text" name="uPhone" value="${user.uPhone }" readonly>
		<input type="text" name="uEmail" value="${user.uEmail }" readonly>
		<input type="date" name="uBirthStr" value="${user.uBirth }">
		<input type="submit" value="수정">
	</form>
</body>
</html>