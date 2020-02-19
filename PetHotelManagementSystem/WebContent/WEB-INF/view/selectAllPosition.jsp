<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllPosition</title>
</head>
<body>
	<c:forEach var="i" items="${listPosition}">
		${i.toString()}
		<br>
		<a href="/posi/updatePosition?poName=${i.poName }">수정</a>
		<a href="/posi/deletePosition?poName=${i.poName }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>