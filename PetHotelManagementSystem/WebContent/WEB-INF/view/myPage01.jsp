<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- CSS -->
<link rel="stylesheet" href="/css/my/assets/css/main.css" />
<noscript><link rel="stylesheet" href="/css/my/assets/css/noscript.css" /></noscript>
<!-- StyleSheet -->
<link rel="stylesheet" href="/css/my/menu/css/style.css">
<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<script type="text/javascript">
function gogo(){
	if( '<%=session.getAttribute("id")%>' != 'null' && '<%=session.getAttribute("from")%>' != 'null'){

	}else{
		alert("로그인해주세요");
		location.href="/user/loginUser"
	}
	$(function(){
		$("#confirm").click(function(){
			var result = confirm("정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요");
			
			if(result){				
				location.href="/main/contactPage";
			}else{
				
			}
		})
		$("#confirm1").click(function(){
			var result = confirm("정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요");
			
			if(result){				
				location.href="/main/contactPage";
			}else{
				
			}
		})
	})
}

$(function(){
	$.photoUpload = function(pNum) {
		window.open("/pet/petPhoto?pNum=" + pNum,"사진수정","scrollbars=no, width=600, height=400, menubar=false");
	}
	
	$.petInsert= function() {
		window.open("/my/myPet", "펫 추가","scrollbars=no, width=600, height=400, menubar=false");
	}
	
	$.petUpdate= function(pNum) {
		window.open("/my/myPetUpdate?pNum=" + pNum, "펫 수정","scrollbars=no, width=600, height=400, menubar=false");
	}
});
</script>
<title>PHMS : <%=session.getAttribute("id") %></title>
</head>
<body class="is-preload" onload="gogo()">
	<!-- header -->
	<header id="header">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<a href="/main/mainPage"><img
				src="/css/main/assets/css/images/logo.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<%
							String vFrom = "";
							if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
								vFrom = (String) session.getAttribute("from");
						%><li class="user_name"><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
					<%
							switch (vFrom) {
								case "kakao":
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a
							href="/sess/sessionLogout" onclick="kakaoOut()">LogOut</a></li>
					</div>
					<%
							break;
								case "google":
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a
							href="/sess/sessionLogout" onclick="googleOut()">LogOut</a></li>
					</div>
					<%
							break;
								case "naver":
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a
							href="/sess/sessionLogout">LogOut</a></li>
					</div>
					<%
							break;
								case "phms":
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a
							href="/sess/sessionLogout">LogOut</a></li>
					</div>
					<%
							break;
								}//switch end
							} else {
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a
							href="/user/loginUser">LogIn</a></li>
					</div>
					<%
							}//if end
						%>

					<%
						if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
						%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
						<li class="nav-item" id="set_7_text"><a
							href="/user/insertUser">Register</a></li>
					</div>
					<%
		              		}//if end
		              	%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
						<li class="nav-item" id="set_7_text"><a
							href="/room/selectAvailableRoom">Rooms</a></li>
					</div>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
						<li class="nav-item" id="set_7_text"><a
							href="/main/servicePage">Service</a></li>
					</div>

					<% 
		              	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		              	%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
						<li class="nav-item" id="set_7_text"><a href="/my/myPage01">MyPage</a>
					</div>
					<%
		            		}//if end
		            	%>
					<div class="set_7_btn-wrapper">
						<svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
						<li class="nav-item" id="set_7_text"><a
							href="/main/contactPage">Contact</a></li>
					</div>

				</ul>
			</div>

		</nav>
	</header>

<%
		String vFrom1 = (String) session.getAttribute("from");
		if (vFrom1 == "phms") {
%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- menu -->
		<menu id="menu">
			<div class="logo">
				<span class="icon fa-gem"></span>
			</div>
			<div class="content">
				<div class="inner">
					<h1>MyPage</h1>
					<p>
						회원정보수정 and 반려동물정보 등록<br /> 예약정보확인 페이지
					</p>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#intro">회원정보</a></li>
					<li><a href="#work">Pet정보</a></li>
					<li><a href="#about">예약정보</a></li>
				</ul>
			</nav>
		</menu>


		<!-- Main -->
		<div id="main">

			<!-- Intro -->
			<article id="intro">
				<h2 class="major">회원정보</h2>
				<span class="image main"></span>
				<div>
					회원 아이디 : ${user.uId }<br>
				회원 이름 : ${user.uName }<br>
				회원 전화번호 : ${user.uPhone }<br>
				회원 이메일 : ${user.uEmail }<br>
				회원 생년월일 : ${user.uBirth }<br>
				<br>
				<a href="/my/myPageUpdate" class="btn btn-primary">회원정보 수정</a>
				</div>
			</article>

			<!-- Work -->
			<article id="work">
				<h2 class="major">Pet정보</h2>
				<div class="card-group justify-content-center">
				<c:forEach var="i" items="${pet}">
					<div class="card text-center col-3">
						<a href="#" onclick="$.photoUpload(${i.pNum})"><img class="card-img-top" height="100%" src="${i.pPhoto }" onerror="this.src='/image/petImageAvatar.jpg'"></a>
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							반려동물 이름 : ${i.pName }<br>
							반려동물 종류 : ${i.pType }<br>
							</p>
							<a href="#" onclick="$.petUpdate(${i.pNum})" class="btn btn-primary">펫 정보수정</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<br>
				<br>
				<a href="#" onclick="$.petInsert()" class="btn btn-primary">반려동물 추가</a>
			</article>

			<!-- About -->
			<article id="about">
				<h2 class="major">예약정보</h2>
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
						<a id="confirm" class="btn btn-primary">예약취소</a>
					</div>
				</div>
			</c:forEach>
			</article>

		</div>
			<!-- Footer -->
		<footer id="footer">
			<p>
				&copy; Untitled. All rights reserved. Design: <a
					href="http://templated.co">TEMPLATED</a>. Demo Images: <a
					href="http://unsplash.com">Unsplash</a>.
			</p>
		</footer>

	</div>

	<%
		} else {
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- menu -->
		<menu id="menu">
			<div class="logo">
				<span class="icon fa-gem"></span>
			</div>
			<div class="content">
				<div class="inner">
					<h1>MyPage</h1>
					<p>
						회원정보수정 and 반려동물정보 등록<br /> 예약정보확인 페이지
					</p>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#intro">회원정보</a></li>
					<li><a href="#work">Pet정보</a></li>
					<li><a href="#about">예약정보</a></li>
				</ul>
			</nav>
		</menu>
			<!-- Main -->
			<div id="main">

				<!-- Intro -->
				<article id="intro">
					<h2 class="major">회원정보</h2>
					<span class="image main"></span>
					<div>회원 아이디 : ${visitor.vId }<br>
				회원 이름 : ${visitor.vName }<br>
				회원 이메일 : ${visitor.vEmail }<br>
				회원 경로 : ${visitor.vFrom1 }<br>
				<br>
				<a href="/my/myPageUpdate" class="btn btn-primary">회원정보 수정</a></div>
				</article>

				<!-- Work -->
				<article id="work">
					<h2 class="major">Pet</h2>
						<div class="card-group justify-content-center">
				<c:forEach var="i" items="${pet}">
					<div class="card text-center col-3" >
						<a href="#" onclick="$.photoUpload(${i.pNum})"><img class="card-img-top" height="100%" src="${i.pPhoto }" onerror="this.src='/image/petImageAvatar.jpg'"></a>
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							반려동물 이름 : ${i.pName }<br>
							반려동물 종류 : ${i.pType }<br>
							</p>
							<a class="link l4" href="#" onclick="$.petUpdate(${i.pNum})" value="펫 정보수정" onclick="$.petInsert()"></a>
						</div><br>
					<br>
				<br>
					</div>
				</c:forEach>
				</div>
				<br>
				<br>
				<a class="link l4" href="#" value="반려동물 추가" onclick="$.petInsert()"></a>
				</article>

				<!-- About -->
				<article id="about">
					<h2 class="major">예약정보</h2>
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
					<a id="confirm" class="btn btn-primary">예약취소</a>
				</div>
			</div>
	</c:forEach>
				</article>

			</div>
			<!-- Footer -->
		<footer id="footer">
			<p>
				&copy; Untitled. All rights reserved. Design: <a
					href="http://templated.co">TEMPLATED</a>. Demo Images: <a
					href="http://unsplash.com">Unsplash</a>.
			</p>
		</footer>

	</div>
	<%
		}
	%>
	
	
	
	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="/css/my/assets/js/jquery.min.js"></script>
	<script src="/css/my/assets/js/browser.min.js"></script>
	<script src="/css/my/assets/js/breakpoints.min.js"></script>
	<script src="/css/my/assets/js/util.js"></script>
	<script src="/css/my/assets/js/main.js"></script>
</body>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>