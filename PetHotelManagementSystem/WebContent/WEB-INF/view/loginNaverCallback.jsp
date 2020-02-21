<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginNaverCallback</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

</body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("SrZGS8gLnicnLMxetGvW",	"http://localhost:8080/visitor/loginNaverCallback");
//	console.log(naver_id_login.oauthParams.access_token);
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() {
		var naverProfile = 
				"?vId=" + naver_id_login.getProfileData('id')
				+ "&vName="	+ naver_id_login.getProfileData('name')
				+ "&vEmail=" + naver_id_login.getProfileData('email');
		location.href = "/visitor/insertVisitor" + naverProfile;
		}
</script>
</html>