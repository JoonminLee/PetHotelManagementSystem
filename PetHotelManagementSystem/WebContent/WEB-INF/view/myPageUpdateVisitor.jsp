<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- StyleSheet -->
<link rel="stylesheet" href="/css/insert_css/menu/css/animate.css">
<link rel="stylesheet" href="/css/insert_css/menu/css/style.css">

<!-- Font Icon -->
<link rel="stylesheet"
	href="/css/insert_css/css/fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/css/insert_css/css/css/style.css">
<title>myPageUpdateVisitor</title>
</head>
<body>
	<header id="header">
		<!-- header -->
		<header id="header">
			<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
				id="ftco-navbar">
				<a href="/main/mainPage"><img src="/images/logo.png"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">Menu
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
							} //if end
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
							} //if end
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
							} //if end
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
		<div class="main">
			<section class="signup">
				<div class="container">
					<div class="signup-content">
						<form action="/my/myPageUpdate" method="POST"
							onsubmit="return check()" id="signup-form" class="signup-form">
							<span class="login100-form-title p-b-49 animated bounce">
								<h1>회원정보수정</h1>
							</span> <br> <br>
							<div class="form-row">
								<div class="form-group">
									<label for="id">id</label> 
									<input type="text" class="form-input" name="vId" value="${visitor.vId }" readonly>
								</div>
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										class="form-input" name="uPwd"
										title="비밀번호를 8자 이상 특수문자, 숫자를 포함해 주세요"
										pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
										placeholder="비밀번호를 다시 한번 입력해주세요" />
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="name">name</label> 
									<input type="text" class="form-input" name="vName" value="${visitor.vName }">
								</div>
								<div class="form-group">
									<label for="re_password"> Email</label> 
									<input type="text" class="form-input" name="vEmail" value="${visitor.vEmail }" readonly>
								</div>
							</div>
							<div class="form-group">
								<input type="submit" name="submit" id="join" class="form-submit" value="회원정보수정" />
							</div>
						</form>
					</div>
				</div>
			</section>


		</div>
<%--  	<form action="/my/myPageUpdate" method="post">
			<input type="text" name="vNum" value="${visitor.vNum }" readonly>
			<input type="text" name="vId" value="${visitor.vId }" readonly>
			<input type="text" name="vName" value="${visitor.vName }"> 
			<input type="text" name="vEmail" value="${visitor.vEmail }" readonly>
			<input type="hidden" name="uBirthStr" value="2020-01-01"> 
			<input type="submit" value="수정">
		</form>  --%>
		
</body>
</html>