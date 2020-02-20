<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/size/updateSize" method="post">
		<input type="number" name="sNum" value="${size.sNum }" readonly>
		<input type="text" name="sSize" value="${size.sSize }">
		<input type="number" name="sRPrice" value="${size.sRPrice }">
		<input type="number" name="sWPrice" value="${size.sWPrice }">
		<input type="submit" value="수정">
	</form>
</body>
</html>