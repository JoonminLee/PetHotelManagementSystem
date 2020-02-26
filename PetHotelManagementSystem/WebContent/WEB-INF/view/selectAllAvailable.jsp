<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllAvailable</title>
</head>
<body>
	<c:forEach var="i" items="${listAvailableRoom }">
		${i.toString() } 
		<br>
		<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
		<hr>
	</c:forEach>
</body>
</html>