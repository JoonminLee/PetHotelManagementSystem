<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>mainPage</title>
<<<<<<< HEAD
=======
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta name="google-signin-client_id"
	content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/api.js" async defer></script>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
>>>>>>> branch 'master' of https://github.com/JoonminLee/PetHotelManagementSystem.git
</head>
<body>
	<%
		String vFrom = "";
		if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
			vFrom = (String) session.getAttribute("from");
	%><%=(String) session.getAttribute("id")%>님 안녕하세요
	<%
		switch (vFrom) {
			case "kakao":
	%><a href="/sess/sessionLogout" onclick="kakaoOut()">로그아웃</a>
	<%
		break;
			case "google":
<<<<<<< HEAD
	%>
	<a href="/sess/sessionLogout" onclick="googleOut()">로그아웃</a>
	<a href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/sess/sessionLogout">로그아웃</a>
	<%
		break;
			case "naver":
	%><a href="/sess/sessionLogout">로그아웃</a>
=======
	%><a href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/sess/sessionLogout">로그아웃</a>
>>>>>>> branch 'master' of https://github.com/JoonminLee/PetHotelManagementSystem.git
	<%
		break;
			case "phms":
	%><a href="/sess/sessionLogout">로그아웃</a>
	<%
		break;
			}
		} else {
	%><a href="/user/loginUser">로그인</a>
	<%
		}
	%>

	<form action="/room/selectAllAvailable" method="post">
		<input id="reCheckInDate" type="date" name="reCheckIn"> 
		<input id="reCheckOutDate" type="date" name="reCheckOut"> 
		<input type="number" min="0" max="9" name="numOfPeople"> 
		<input type="number" min="0" max="9" name="numOfPets">
		<input type="submit" value="Check Availability">
	</form>
</body>
<script type="text/javascript">
	$(function() {

		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();

		if (month < 10)
			month = "0" + month;
		if (date < 10)
			date = "0" + date;

		$("#reCheckInDate").attr('min', year + "-" + month + "-" + date);
		$("#reCheckInDate").val(year + "-" + month + "-" + date);

		today.setDate(today.getDate() + 1);

		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();

		if (month < 10)
			month = "0" + month;
		if (date < 10)
			date = "0" + date;

		$("#reCheckOutDate").attr('min', year + "-" + month + "-" + date);
	});

	//카카오 로그아웃
	function kakaoOut() {
		Kakao.init('f93055f9d183a780c81d29d70f577730');
		Kakao.Auth.logout();
	}

<<<<<<< HEAD
	//구글 init
	function init() {
		var gauth;
		gapi.load('auth2', function() {
				gauth = gapi.auth2.init({
				client_id : "676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com"
				});
		});
		return gauth;
	}
	
	//구글 로그아웃
	function googleOut() {
		var gauth = gapi.auth2.getAuthInstance();
		gauth.signOut();
		gauth.disconnect();
=======
	//구글 로그아웃
	function signOut() {
>>>>>>> branch 'master' of https://github.com/JoonminLee/PetHotelManagementSystem.git
	}
</script>
</html>