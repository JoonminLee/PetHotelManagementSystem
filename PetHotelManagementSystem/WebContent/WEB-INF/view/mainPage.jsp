<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- OAuth2.0 -->
<script type="text/javascript"	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- CSS -->
<link rel="stylesheet" href="/css/main/assets/css/main.css" />
<link rel="stylesheet" href="/css/main/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main/assets/css/bootstrap-datepicker.css">

<!-- Theme Style -->
<link rel="stylesheet" href="/css/main/assets/css/style.css">

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>mainPage</title>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="bg"></div>
		<div id="overlay"></div>
		<div id="main">
			<!-- header -->
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
						%><li><a href="/sess/sessionLogout" onclick="kakaoOut()">로그아웃</a></li>
						<%
							break;
								case "google":
						%><li><a href="/sess/sessionLogout" onclick="googleOut()">로그아웃</a></li>
						<%
							break;
								case "naver":
						%><li><a href="/sess/sessionLogout">로그아웃</a></li>
						<%
							break;
								case "phms":
						%><li><a href="/sess/sessionLogout">로그아웃</a></li>

						<%
							break;
								}//switch end
							} else {
						%><li><a href="/user/loginUser">로그인</a></li>
						<%
							}//if end
						%>
						<li><a href="/user/insertUser">회원가입</a></li>
						<li><a href="/main/servicePage">서비스소개</a></li>
						<li><a href="/room/selectAvailableRoom">예약</a>
							<ul>
								<li><a href="#">확인</a></li>
								<li><a href="#">취소</a></li>
							</ul></li>
						<li><a href="#two">고객센터</a></li>
					</ul>
				</nav>
			</header>
			<!-- section -->
			<section id="section">
				<h1>Pet. Hotel.</h1>
				<nav>
					<!-- END section -->
					<div class="container">
						<div class="block-32" data-aos="fade-up" data-aos-offset="-200">
							<form action="/room/selectAvailableRoom" method="post">
								<div class="row">
									<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
										<label for="checkin_date" class="font-weight-bold-text-black">Check In</label>
										<div class="field-icon-wrap">
											<div class="icon">
												<span class="icon-calendar"></span>
											</div>
											<input id="reCheckInDate" type="date" name="reCheckIn" class="form-control">
										</div>
									</div>
									<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
										<label for="checkout_date" class="font-weight-bold-text-black">Check Out</label>
										<div class="field-icon-wrap">
											<div class="icon">
												<span class="icon-calendar"></span>
											</div>
											<input id="reCheckOutDate" type="date" name="reCheckOut" class="form-control">
										</div>
									</div>
									<div class="col-md-6 mb-3 mb-md-0 col-lg-3">
										<div class="row">
											<div class="col-md-6 mb-3 mb-md-0">
												<label for="adults" class="font-weight-bold-text-black">인원수</label>
												<div class="field-icon-wrap">
													<div class="icon">
														<span class="ion-ios-arrow-down"></span>
													</div>
													<select type="number" name="numOfPeople" id="adults" class="form-control">
														<option value="0">0</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3+">3+</option>
													</select>
												</div>
											</div>
											<div class="col-md-6 mb-3 mb-md-0">
												<label for="children" class="font-weight-bold-text-black">동물수</label>
												<div class="field-icon-wrap">
													<div class="icon">
														<span class="ion-ios-arrow-down"></span>
													</div>
													<select type="number" name="numOfPets" id="children" class="form-control">
														<option value="0">0</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3+">3+</option>
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6 col-lg-3 align-self-end">
										<input type="submit" class="btn btn-primary btn-block text-white" value="Check Availability">
									</div>
								</div>
							</form>
						</div>
					</div>
				</nav>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<span class="copyright">&copy; pet HOTEL 02) 000-0000: <a
					href="http://html5up.net">문의</a>.
				</span>
			</footer>
		</div>
	</div>

</body>

<!-- JS, Bootstrap, 라이브러리 -->
<script src="/css/main/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/css/main/js/owl.carousel.min.js"></script>
<script src="/css/main/js/jquery.stellar.min.js"></script>
<script src="/css/main/js/aos.js"></script>
<script src="/css/main/js/bootstrap-datepicker.js"></script>
<!-- <script src="/css/main/js/main.js"></script> -->
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
	
	
	// 페이지가 로드된 후에 문서안에 있는 바디태그 안에 is-preload이런 이름의  클래스를 지운다.
	window.onload = function() {
		document.body.classList.remove('is-preload');
	}
	
	
	//카카오 로그아웃
	function kakaoOut() {
		Kakao.init('f93055f9d183a780c81d29d70f577730');
		Kakao.Auth.logout();
	}

	//구글 init
	function init() {
		gapi.load('auth2', function() {
				gapi.auth2.init({
				client_id : "676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com"
				});
		});
	}
	
	//구글 로그아웃
	function googleOut() {
		init();
		var gauth = gapi.auth2.getAuthInstance();
		console.log(gauth);
		gauth.signOut();
		gauth.disconnect();
		console.log(gauth);
	}
	
</script>
</html>