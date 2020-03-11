<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- JqueryCDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>myPage01</title>
</head>
<body>
	<%
		String vFrom = (String) session.getAttribute("from");
		if (vFrom == "phms") {
	%>
	
	<h1>회원 정보</h1><br>
	회원 아이디 : ${user.uId }<br>
	회원 이름 : ${user.uName }<br>
	회원 전화번호 : ${user.uPhone }<br>
	회원 이메일 : ${user.uEmail }<br>
	회원 생년월일 : ${user.uBirth }<br>
	<a href="/my/myPageUpdate">회원정보 수정</a>
	
	<hr>
	
	<h1>예약 정보</h1><br>
	<c:forEach var="i" items="${userReserve }">
	예약자 : ${i.uName }<br>
	예약자 전화번호 : ${i.uPhone }<br> 
	예약 방번호 : ${i.uRNum }번방<br>
	예약 방종류 : ${i.sSize }<br>
	체크인 : ${i.reCheckIn }<br>
	체크아웃 : ${i.reCheckOut }<br>
	<a href="/my/myPageReserveCancle" onclick="return confirm('정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요');">예약취소</a>
	
	<hr>
	</c:forEach>

	<%
		} else {
	%>
	<h1>회원 정보</h1><br>
	회원 아이디 : ${visitor.vId }<br>
	회원 이름 : ${visitor.vName }<br>
	회원 이메일 : ${visitor.vEmail }<br>
	회원 경로 : ${visitor.vFrom }<br>
	<a href="/my/myPageUpdate">회원정보 수정</a>
	
	<hr>
	
	<h1>예약 정보</h1><br>
	<c:forEach var="i" items="${visitorReserve }">
	예약자 : ${i.vName }<br>
	예약자 전화번호 : ${i.rePhone }<br>
	예약자 방번호 : ${i.vRoom }<br>
	예약자 방종류 : ${i.sSize }<br>
	체크인 : ${i.reCheckIn }<br>
	체크아웃 : ${i.reCheckOut }<br>
	<a href="/my/myPageReserveCancle" onclick="return confirm('정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요');">예약취소</a>
	
	<hr>
	</c:forEach>
	<%
		}
	%>

</body>
</html>