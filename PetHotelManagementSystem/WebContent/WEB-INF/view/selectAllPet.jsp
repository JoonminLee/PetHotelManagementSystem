<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" items="${listPet }">
		${i.toString() } 
		<br>
		<a href="/pet/updatePet?pNum=${i.pNum }">수정</a>
		<a href="/pet/deletePet?pNum=${i.pNum }">삭제</a>
		<hr>
	</c:forEach>

</body>
</html>