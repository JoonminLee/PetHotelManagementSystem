<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/room/insertRoom" method="post">
		<input type="number" name="rSNum" min="1" max="7" placeholder="방사이즈">
		<input type="number" name="rStatus" min="0" max="2" placeholder="방상태">
		<input type="submit" value="방추가">
	</form>
</body>
</html>