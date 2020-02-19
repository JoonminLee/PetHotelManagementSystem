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
	<c:forEach var="i" items="${listReserve }">
		${i.toString() } 
		<br>
		<a href="/reserve/updateReseve?reId=${i.reId }">수정</a>
		<a href="/reserve/deleteReserve?reId=${i.reId }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>