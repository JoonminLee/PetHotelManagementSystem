<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/reserve/updateReserve" method="post"> 
		<input type="number" name="reNum" value="${reserve.reNum }" readonly>
		<input type="text" name="reId" value="${reserve.reId }">
		<input type="text" name="rePhone" value="${reserve.rePhone }">
		<input type="number" name="reSNum" value="${reserve.reSNum }">
		<input type="number" name="reRNum" value="${reserve.reRNum }">
		<input type="date" name="reCheckInStr" value="${reserve.reCheckIn }">
		<input type="date" name="reCheckOutStr" value="${reserve.reCheckOut }">
		<input type="submit" value="수정">
	</form>
</body>
</html>