<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/pet/insertPet" method="post">
		<input type="text" name="pName" placeholder="펫이름">
		<input type="text" name="pType" placeholder="펫종류">
		<input type="number" name="pUNum" placeholder="펫주인번호">
		<input type="number" name="pVNum" placeholder="방문자번호">
		<input type="submit" value="추가">
	</form>
</body>
</html>