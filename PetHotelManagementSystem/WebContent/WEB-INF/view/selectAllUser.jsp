<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllUser</title>
</head>
<body>
	<c:forEach var="i" items="${listUser}">
		${i.toString()}
	</c:forEach>
</body>
</html>