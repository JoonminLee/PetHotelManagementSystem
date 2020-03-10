<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage.jsp</title>
<style>
table, tr, td {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../view/mypage/myPage.js"></script>
<body>
	<input type="button" id="userUpdate" value="회원정보 수정">
	<input type="button" id="reserveDelete" value="예약조회">
	<hr>
	<!-- 회원 정보 -->
	<h1>회원 정보</h1>
	<div id ="userInfo"></div>

	<hr>
	<!-- 예약 정보 -->
	<h1>예약정보</h1>			
	<div id="userReserve"></div>

</body>

</html>