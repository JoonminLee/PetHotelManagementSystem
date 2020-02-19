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
		<input type="text" name=rePhone value="${reserve.rePhone }">
		<input type="text" name="reRoom" value="${reserve.reRoom }">
		<input type="date" name="reDateStr" value="${reserve.reDate }">
		<input type="submit" value="수정">
	</form>
</body>
</html>