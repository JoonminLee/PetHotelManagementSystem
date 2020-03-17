<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my Pet</title>
</head>
<body>
<form action="/my/insertMyPet" method="post">
	<div>
		<input type="text" name="pName"><br>
		<input type="text" name="pType"><br>	
		<input type="submit" value="반려동물 등록">
	</div>
</form>
</body>
</html>