<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllVisitor</title>
</head>
<body>
<c:forEach var="i" items="${listVisitor }">
		${i.toString() } 
		<br>
		<a href="/visitor/updateVisitor?vId=${i.vId }">수정</a>
		<a href="/visitor/deleteVisitor?vId=${i.vId }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>