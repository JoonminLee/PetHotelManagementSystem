<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAllUser</title>
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
			System.out.println("세션없음");
	%><a href="/user/loginUser">로그인</a><hr>
	<%
		} else {
	%>
	<%=session.getAttribute("id")%>님 안녕하세요
	<a href="/sess/sessionLogout">로그아웃</a><hr>
	<hr>
	<%
		}
	%>

	<c:forEach var="i" items="${listUser }">
		${i.toString() } 
		<br>
		<a href="/user/updateUser?uId=${i.uId }">수정</a>
		<a href="/user/deleteUser?uId=${i.uId }">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>