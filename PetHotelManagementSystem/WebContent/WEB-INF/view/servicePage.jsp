<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">

<!-- Theme Style -->
<link rel="stylesheet" href="/css/service/assets/css/main.css">

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>PHMS : 기댈 수 있는 편안함</title>
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<h2><a href="/main/mainPage"><img src="/css/main/assets/css/images/main_images/logo.png" width="70" height="70"></a></h2>
		<nav>
			<ul>
				<%
					String vFrom = "";
					if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
						vFrom = (String) session.getAttribute("from");
				%><li><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
				<%
					switch (vFrom) {
						case "kakao":
				%>
				<li id="set_7_text"><a href="/sess/sessionLogout" onclick="kakaoOut()">LogOut</a></li>
				<%
					break;
						case "google":
				%>
				<li><a href="/sess/sessionLogout" onclick="googleOut()">LogOut</a></li>
				<%
					break;
						case "naver":
				%>
				<li><a href="/sess/sessionLogout">LogOut</a></li>
				<%
					break;
						case "phms":
				%>
				<li><a href="/sess/sessionLogout">LogOut</a></li>
				<%
					break;
								}//switch end
							} else {
				%>
				<li id="set_7_text"><a href="/user/loginUser">LogIn</a></li>
				<%
					}//if end
				%>
				
				<%
				if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
				%>
		        <li id="set_7_text"><a href="/user/insertUser">Register</a></li>
		      	<%
		      		}//if end
		      	%>
		        <li id="set_7_text"><a href="/main/servicePage">Service</a></li>
		      	<% 
		      	
		      	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		      	%>
		        <li id="set_7_text"><a href="/my/myPage01">MyPage</a>
		    	<%
		    		}//if end
		    	%>
		    	
		        <li id="set_7_text"><a href="/main/contactPage">Contact Us</a></li>
			</ul>
		</nav>
	</header>
	
	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen">
		<div class="content">
			<header>
				<h2>Pet. Hotel. Service.</h2>
			</header>
			<p>
				Welcome to <strong>PHMS</strong>
			</p>
			<footer>
				<a href="#one" class="button style2 down"></a>
			</footer>
		</div>
	</section>

	<!-- One -->
	<section id="one" class="main style2 right dark fullscreen">
		<div class="content box style2">
			<header>
				<h2>Love Pet, Travel Together</h2>
			</header>
			<p>저희는 반려동물을 사랑하는 마음으로, 보호자와 변려동물의 행복한 공존, 사람과 반려동물이 함께 어울리는 세상을
				만들기 위해 즐거운 일들을 합니다.<br>
				우리는 보호자를 대신하여 반려동물이 스트레스 받지 않고 힐링이 되는 서비스를 제공하고,
				보호자에게는 믿고 맡길 수 있는 안심 서비스를 제공해 최고의 펫호텔이 되고자 하는 목표를 가지고 나아가고 있습니다.</p>
		</div>
		<a href="#footer" class="button style2 down anchored"></a>
	</section>

	<!-- Two -->
	<section id="two" class="main style2 left dark fullscreen">
		<div class="content box style2">
			<header>
				<h2>Comfort Life Style Hotel</h2>
			</header>
			<p>실용성과 편안함은 저희 호텔이 추구하는 가치와 철학입니다. 필요한 것은 더 충실히 갖추고, 불필요한 것은 과감히
				배제하였습니다.<br>
				편리한 접근성과 집보다 안락한 객실로 고객에게 진정한 휴식을 제공하고, 지역의 특색을 포함하는 디자인과
				부대시설, 그리고 친근한 위트를 겸비한 서비스로 고객에게 즐거운 경험을 선사합니다.</p>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<span class="copyright">&copy; 2020 PHMS. All Rights Reserved.
		</span>
	</footer>

</body>

<!-- Scripts -->
<script src="/css/service/assets/js/jquery.min.js"></script>
<script src="/css/service/assets/js/jquery.poptrox.min.js"></script>
<script src="/css/service/assets/js/jquery.scrolly.min.js"></script>
<script src="/css/service/assets/js/jquery.scrollex.min.js"></script>
<script src="/css/service/assets/js/browser.min.js"></script>
<script src="/css/service/assets/js/breakpoints.min.js"></script>
<script src="/css/service/assets/js/util.js"></script>
<script src="/css/service/assets/js/main.js"></script>

</html>
