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
		alert("<%=(String) session.getAttribute("id")%>님 로그아웃 성공");
	}
	
	function toMain(){
		var url = document.getElementById("goLogOut").getAttribute("href");
		window.open(url);
		location.href = "/main/mainPage";
	}
</script>
<body onload="gogo()">
	<%
		String vFrom = "";
			if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		vFrom = (String) session.getAttribute("from");
			switch (vFrom) {
			case "kakao":
	%>
		<p>자동로그인 방지를 위해 <%=vFrom %>사이트에서 한번 더 로그아웃해주세요.</p>
		<a id="goLogOut" href="https://accounts.kakao.com/" target="_blank" onclick="toMain()">카카오 계정 로그아웃</a>
	<%
		break;
			case "google":
	%>	
		<p>자동로그인 방지를 위해 <%=vFrom %>사이트에서 한번 더 로그아웃해주세요.</p>	
		<a id="goLogOut" href="https://www.google.com/accounts/Logout" target="_blank" onclick="toMain()">구글 계정 로그아웃</a>
	<%
		break;
			case "naver":
	%>	
		<p>자동로그인 방지를 위해 <%=vFrom %>사이트에서 한번 더 로그아웃해주세요.</p>	
		<a id="goLogOut" href="https://nid.naver.com/" target="_blank" onclick="toMain()">네이버 계정 로그아웃</a>
	<%
		break;
			}// switch end
		}//if end
		session.invalidate();
	%>
	<a href="/main/mainPage">메인</a>
</body>
</html>