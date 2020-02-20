<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%session.setAttribute("id", request.getAttribute("uId"));%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogin</title>
</head>
<body>
	<%=(String) session.getAttribute("id")%>님 로그인 성공
	<a href="/user/selectAllUser">유저목록가기</a>
</body>
</html>