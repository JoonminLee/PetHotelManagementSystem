<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogout</title>
</head>
<body>
	<%=(String) session.getAttribute("id")%>님 로그아웃 성공
	<% session.invalidate();%>
	<a href="/user/selectAllUser">유저목록가기</a>
</body>
</html>