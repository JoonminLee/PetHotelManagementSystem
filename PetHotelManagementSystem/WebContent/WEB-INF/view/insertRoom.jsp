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
		<input type="number" name="rSize" min="1" max="7" placeholder="방사이즈">
		<input type="number" name="rStatus" min="0" max="1" placeholder="방상태">
		<input type="text" name="rWPrice" placeholder="평일요금">
		<input type="text" name="rHPrice" placeholder="주말요금">
		<input type="submit" value="방추가">
	</form>
</body>
</html>