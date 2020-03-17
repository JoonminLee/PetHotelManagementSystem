<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- OAuth2.0 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!--====css===========================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/css/util.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/css/main.css">

<!--====폰트===========================================================================================-->
<!-- <link rel="stylesheet"	href="fonts/material-icon/css/material-design-iconic-font.min.css"> -->

<!--===js============================================================================================-->
<script src="/css/login_css/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/css/login_css/vendor/animsition/js/animsition.min.js"></script>
<script src="/css/login_css/vendor/bootstrap/js/popper.js"></script>
<script src="/css/login_css/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/css/login_css/vendor/select2/select2.min.js"></script>
<script src="/css/login_css/vendor/daterangepicker/moment.min.js"></script>
<script src="/css/login_css/vendor/daterangepicker/daterangepicker.js"></script>
<script src="/css/login_css/vendor/countdowntime/countdowntime.js"></script>
<script src="/css/login_css/js/main.js"></script>

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>loginUser</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form action="/user/loginUser" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-49"> Login </span>

					<div class="wrap-input100 validate-input m-b-23" data-validate="ID가 필요합니다">
						<span class="label-input100">ID</span> 
						<input class="input100" type="text" name="uId" placeholder="ID를 입력하세요"> 
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="비밀번호가 필요합니다">
						<span class="label-input100">Password</span> 
						<input class="input100" type="password" name="uPwd" placeholder="비밀번호를 입력하세요"> 
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="text-right p-t-8 p-b-31">
						<a href="/idpwd/search">ID 또는 비밀번호를 잊으셨나요? </a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">Login</button>
						</div>
					<div class="txt1 text-center p-t-54 p-b-20" style="display:inline-block;">
						<span> <a href="/user/insertUser"> 회원가입 </a></span><br>
					</div>
					</div>
					<div class="flex-c-m">	
							<a href="#" id="kakao-login-btn" onclick="kakaoLogin()"><img src="/images/kakao_login_btn_medium.png"></a>
							<div class="g-signin2" style="width:110px;" data-height="40"data-onsuccess="onSignIn"></div>
							<div id="naver_id_login"></div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script type='text/javascript'>

		Kakao.init('f93055f9d183a780c81d29d70f577730');
		
		//카카오 로그인
	function kakaoLogin() {

		Kakao.Auth.loginForm({
			success : function(authObj) {
				Kakao.API.request({
							url : '/v2/user/me',
							success : function(res) {
								var kakaoProfile = "?vId=" + res.id + "&vName="
										+ res.properties.nickname + "&vEmail="
										+ res.kakao_account.email
										+ "&vFrom=kakao";
								location.href = "/visitor/insertVisitor"
										+ kakaoProfile;
							},
							fail : function(error) {
								console.log(JSON.stringify(error));
							}
						});
			},
			fail : function(err) {
				console.log(JSON.stringify(err));
			}
		});
	}

	//구글 로그인
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		var googleProfile = "?vId=" + profile.getId() + "&vName="
				+ profile.getName() + "&vEmail=" + profile.getEmail()
				+ "&vFrom=google";
		location.href = "/visitor/insertVisitor" + googleProfile;
	}

	//네이버 로그인
	var naver_id_login = new naver_id_login("SrZGS8gLnicnLMxetGvW",
			"http://localhost:8080/visitor/loginNaverCallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 2, 40);
	naver_id_login.setDomain("http://localhost:8080/user/loginUser");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
</script>
</html>