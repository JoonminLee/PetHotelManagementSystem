<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllDepartment</title>
</head>
<body>
	<c:forEach var="i" items="${listDepartment}">
		${i.toString()}
		<br>
		<a href="/dep/updateDepartment?dName=${i.dName }">수정</a>
		<a href="/dep/deleteDepartment?dName=${i.dName }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>
