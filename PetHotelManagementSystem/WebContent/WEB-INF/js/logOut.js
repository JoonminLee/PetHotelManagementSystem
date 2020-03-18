//카카오 로그아웃
function kakaoOut() {
	Kakao.init('f93055f9d183a780c81d29d70f577730');
	Kakao.Auth.logout();
}

// 구글 로그아웃
function googleOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut();
}

function onLoad() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
	});
}