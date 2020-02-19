<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertDepartment</title>
</head>
<body>
<div>
<h3>Department</h3>
	<form action="/dep/insertDepartment" method="post">
		<div>부서 : <input type="text" name="dName"><input type="submit" value="등록"></div>
	</form>
</div>
</body>
</html>