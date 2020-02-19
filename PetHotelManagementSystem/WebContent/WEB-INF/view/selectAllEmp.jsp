<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllEmp</title>
</head>
<body>
	<c:forEach var="i" items="${listEmployee }">
		${i.toString() } 
		<br>
		<a href="/emp/updateEmp?eNum=${i.eNum }">수정</a>
		<a href="/emp/deleteEmp?eNum=${i.eNum }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>