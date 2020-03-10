<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageUpdateVisitor</title>
</head>
<body>
	<form action="/my/myPageUpdate" method="post">
		<input type="text" name="vNum" value="${visitor.vNum }" readonly>
		<input type="text" name="vId" value="${visitor.vId }" readonly>
		<input type="text" name="vName" value="${visitor.vName }">
		<input type="text" name="vEmail" value="${visitor.vEmail }" readonly>
		<input type="date" name="uBirthStr" value="2020-01-01" readonly >
		<input type="submit" value="수정">
	</form></body>
</html>