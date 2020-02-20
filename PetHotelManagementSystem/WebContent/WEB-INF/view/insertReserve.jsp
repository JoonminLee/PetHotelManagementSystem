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
		<input type="number" name="reSNum" min=1 max=7 placeholder="방사이즈넘버">
		<input type="number" name="reRNum" placeholder="방번호">
		<input type="date" name="reCheckInStr" placeholder="체크인">
		<input type="date" name="reCheckOutStr" placeholder="체크아웃">
		<input type="submit" value="예약완료">
	</form>
</body>
</html>