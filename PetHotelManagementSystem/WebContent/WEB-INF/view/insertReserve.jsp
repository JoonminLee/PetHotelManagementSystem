<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/reserve/insertReserve" method="post">
		<input type="text" name="reId" placeholder="예약자">
		<input type="text" value="010" readonly> - <input type="text" name="uPhone1"> - <input type="text" name="uPhone2">
		<input type="text" name="reRoom" placeholder="방이름">
		<input type="date" name="reDateStr" placeholder="예약일">
		<input type="submit" value="예약완료">
	</form>
</body>
</html>