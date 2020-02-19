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
	<c:forEach var="i" items="${listRoom }">
		${i.toString() } 
		<br>
		<a href="/room/updateRoom?rNum=${i.rNum }">수정</a>
		<a href="/room/deleteRoom?rNum=${i.rNum }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>