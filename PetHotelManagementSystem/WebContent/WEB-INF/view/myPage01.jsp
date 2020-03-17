<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="/css/mypage/assets/css/main.css" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript">
function gogo(){
	if( '<%=session.getAttribute("id")%>' != 'null' && '<%=session.getAttribute("from")%>' != 'null'){

	}else{
		alert("로그인해주세요");
		location.href="/user/loginUser"
	}
}
</script>
<title>PHMS : <%=session.getAttribute("id") %></title>
</head>
<body onload="gogo()">
	<div id="wrapper">

	<%
		String vFrom = (String) session.getAttribute("from");
		if (vFrom == "phms") {
	%>

		<header id="header">
			<span class="avatar"><img src="/css/mypage/images/노창옥.JPG"	alt="" /></span>
				<h1>회원 정보</h1><br>
				회원 아이디 : ${user.uId }<br>
				회원 이름 : ${user.uName }<br>
				회원 전화번호 : ${user.uPhone }<br>
				회원 이메일 : ${user.uEmail }<br>
				회원 생년월일 : ${user.uBirth }<br>
				<a href="/my/myPageUpdate">회원정보 수정</a><br><br>
				<h1>반려 동물 정보</h1>
				<a href="/my/myPet">반려동물 추가</a>
		</header>

	<hr>
	
	<h1>사용 대기중인 예약 정보</h1><br>
	<c:forEach var="i" items="${userReserve }">
			<div class="card bg-light mb-3" style="max-width: 18rem;">
				<div class="card-body">
					<h5 class="card-title text-primary">${i.sSize }방</h5>
					<p class="card-text">
					예약자 : ${i.reId }<br>
					예약자 전화번호 : ${i.rePhone }<br>
					예약 방번호 : ${i.reRNum }번방<br>
					체크인 : ${i.reCheckIn }<br>
					체크아웃 : ${i.reCheckOut }<br>
					</p>
					<a href="/my/myPageReserveCancle" class="btn btn-primary" onclick="return confirm('정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요');">예약취소</a>
				</div>
			</div>
		</c:forEach>

	<%
		} else {
	%>
	
		<header id="header">
			<span class="avatar"><img src="/css/mypage/images/노창옥.JPG"	alt="" /></span>
				<h1>회원 정보</h1><br>
				회원 아이디 : ${visitor.vId }<br>
				회원 이름 : ${visitor.vName }<br>
				회원 이메일 : ${visitor.vEmail }<br>
				회원 경로 : ${visitor.vFrom }<br>
				<a href="/my/myPageUpdate">회원정보 수정</a>
				<h1>반려 동물 정보</h1>
				<a href="/my/myPet">반려동물 추가</a>
		</header>
	<hr>
	
	<h1>예약 정보</h1><br>
	<c:forEach var="i" items="${visitorReserve }">
	<div class="card bg-light mb-3" style="max-width: 18rem;">
				<div class="card-body">
					<h5 class="card-title text-primary">${i.sSize }방</h5>
					<p class="card-text">
					예약자 : ${i.reId }<br>
					예약자 전화번호 : ${i.rePhone }<br>
					예약 방번호 : ${i.reRNum }번방<br>
					체크인 : ${i.reCheckIn }<br>
					체크아웃 : ${i.reCheckOut }<br>
					</p>
					<a href="/my/myPageReserveCancle" class="btn btn-primary" onclick="return confirm('정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요');">예약취소</a>
				</div>
			</div>
	</c:forEach>
	<%
		}
	%>
	
	</div>
		<!-- Footer -->
		<footer id="footer">
			<p>
				&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. 	Demo Images: <a	href="http://unsplash.com">Unsplash</a>.
			</p>
		</footer>

</body>

<!-- JS -->
<script src="/css/mypage/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>