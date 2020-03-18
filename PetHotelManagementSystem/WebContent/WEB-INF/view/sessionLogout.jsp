<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>sessionLogout</title>
</head>
<script type="text/javascript">
	function gogo(){
		alert('<%=(String) session.getAttribute("id")%>'+"님 로그아웃 성공");

		var from = '<%=(String) session.getAttribute("from")%>';
		

		switch (from) {
		case "kakao":
			var result = confirm("자동로그인 방지를 위해 " + from + " 사이트에서 로그아웃 하시겠습니까? ('예' 클릭 시, 자동으로 로그아웃 됩니다)");
			if (result) {
				window.open("https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
			}
			break;

		case "google":
			var result = confirm("자동로그인 방지를 위해 " + from + " 사이트에서 로그아웃 하시겠습니까? ('예' 클릭 시, 자동으로 로그아웃 됩니다)");
			if (result) {
				window.open("https://www.google.com/accounts/Logout");
			}
			break;

		case "naver":
			var result = confirm("자동로그인 방지를 위해 " + from + " 사이트에서 로그아웃 하시겠습니까? ('예' 클릭 시, 자동으로 로그아웃 됩니다)");
			if (result) {
				window.open("https://nid.naver.com/nidlogin.logout");
			}
			break;
		}
		<%session.invalidate();%>
		location.href = "/main/mainPage";
	}
</script>
<body onload="gogo()">
</body>
</html>