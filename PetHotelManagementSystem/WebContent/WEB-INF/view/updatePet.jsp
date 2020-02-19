<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/pet/updatePet" method="post">
		<input type="number" name="pNum" value="${pet.pNum }" readonly>
		<input type="text" name="pName" value="${pet.pName }">
		<input type="text" name="pType" value="${pet.pType }">
		<input type="number" name="pUNum" value="${pet.pUNum }">
		<input type="number" name="pVNum" value="${pet.pVNum }">
		<input type="submit" value="수정">
	</form>
</body>
</html>