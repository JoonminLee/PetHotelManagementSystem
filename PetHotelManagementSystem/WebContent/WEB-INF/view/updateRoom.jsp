<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/room/updateRoom" method="post">
		<input type="number" name="rNum" value="${room.rNum }" readonly>
		<input type="number" name="rSNum" value="${room.rSNum }">  
		<input type="text" name="rWPrice" value="${room.rWPrice }"> 
		<input type="text" name="rHPrice" value="${room.rHPrice }"> 
		<input type="number" name="rStatus" value="${room.rStatus }"> 
		<input type="submit" value="수정">
	</form>
</body>
</html>