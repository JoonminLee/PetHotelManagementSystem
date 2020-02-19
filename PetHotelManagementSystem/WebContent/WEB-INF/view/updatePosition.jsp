<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateDepartment</title>
</head>
<body>
	<form action="/posi/updatePosition" method="post">
		<input type="text" name="poNum" value="${position.poNum }">
		<input type="text" name="poName" value="${position.poName }">
		<input type="submit" value="수정">
	</form>
</body>
</html>
