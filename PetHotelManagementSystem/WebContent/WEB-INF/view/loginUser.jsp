<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 -->
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta name="google-signin-client_id"
	content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>loginUser</title>
</head>
<body>

	<form action="/user/loginUser" method="post">
		<input type="text" name="uId" placeholder="아이디"> <input
			type="password" name="uPwd" placeholder="비밀번호"> <input
			type="submit" value="로그인">
	</form>

	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>

	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<!-- <a href="#" onclick="signOut();">Sign out</a> -->

</body>

<script type='text/javascript'>
	//카카오 로그인
	Kakao.init('f93055f9d183a780c81d29d70f577730');
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					console.log(res.toString)
					var kakaoProfile = "?vId=" + res.id + "&vName="
							+ res.properties.nickname + "&vEmail="
							+ res.kakao_account.email;
					location.href = "/visitor/insertVisitor" + kakaoProfile;
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

	//구글 로그인
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		var googleProfile = "?vId=" + profile.getId() + "&vName="
				+ profile.getName() + "&vEmail=" + profile.getEmail();
		location.href = "/visitor/insertVisitor" + googleProfile;
	}

	//구글 로그아웃
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut();
	}
</script>
</html>