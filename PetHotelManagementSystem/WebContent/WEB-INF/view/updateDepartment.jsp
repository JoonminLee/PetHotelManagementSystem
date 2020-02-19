<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateDepartment</title>
</head>
<body>
	<form action="/dep/updateDepartment" method="post">
		<input type="text" name="dNum" value="${department.dNum }">
		<input type="text" name="dName" value="${department.dName }">
		<input type="submit" value="수정">
	</form>
</body>
</html>
