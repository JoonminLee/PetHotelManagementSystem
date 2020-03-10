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

.visibility{
	visibility:hidden;
	width: 0px;
}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../view/mypage/myPage.js"></script>
<body>
	<input type="button" name="userUpdate" value="회원정보 수정">
	<input type="button" name="reserveUpdate" value="예약관리">
	<input type="button" name="updateOkBtn" value="수정완료" class="visibility">
	<input type="button" name="returnMypage" value="돌아가기" class="visibility">
	
	<hr>
	
	<div id ="userInfo">
		<h1>회원 정보</h1>
	</div>

	<hr>
				
	<div id="userReserve">
		<h1>예약정보</h1>
	</div>

</body>

</html>