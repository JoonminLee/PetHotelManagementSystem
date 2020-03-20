<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdPwdSearch</title>
<!-- CSS -->
  <link rel='stylesheet' href='/css/idpwdsearch/photo.jpg'>
  <link rel="stylesheet" href="/css/idpwdsearch/style.css">
<!--====css===========================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/login_css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/login/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/css/login_css/login/css/util.css">
<!-- <link rel="stylesheet" type="text/css" href="/css/login_css/login/css/main.css"> -->
<!-- nav StyleSheet -->
<link rel="stylesheet" href="/css/login_css/menu/css/style.css">
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){   
   $("#idSearch").click(function(){
      var name = $("#name").val();
      var eMail = $("#eMail").val();   
      var pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      console.log(eMail);
      console.log(pattern);
      console.log((pattern.test(eMail)));
      if(name == null){
         alert("이름을 입력해주세요");
      }else if(name.length < 2){
         alert("이름을 확인해주세요");
      }else if(eMail == null){
         alert("이메일을 입력해주세요");
      }else if((!pattern.test(eMail))){
         alert("이메일 형식이 맞지 않습니다");
      }else{
         console.log("성공");
	      $.ajax({
				url : "/idpwd/idSearch",
				data : {"name" : name, "eMail" : eMail},
				dataType : "text",
				type : "post",
				beforeSend : function(a){
					alert("잠시만 기다려주세요");
				},
				success : function(result){
					alert(result);
					if(result == "아이디 전송완료"){
						location.href="/idpwd/search";
					}
				},
				error : function(e){
					alert(e);
				}
			})
      }
   })
   $("#pwdSearch").click(function(){
	   var id = $("#id").val();
	   var eMail = $("#eMail2").val();   
       var pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
       console.log(id);
       console.log(eMail);
       console.log(pattern);
       console.log((pattern.test(eMail)));
       if(id == null){
    	   alert("아이디를 입력해주세요");      
       }else if(id.length < 6){	   
    	   alert("아이디를 확인해주세요");	 
       }else if(eMail == null){	
    	   alert("이메일을 입력해주세요");	
       }else if((!pattern.test(eMail))){	
    	   alert("이메일 형식이 맞지 않습니다");	
       }else{
    	   console.log("성공");
    	   $.ajax({
				url : "/idpwd/pwdSearch",
				data : {"id" : id, "eMail" : eMail},
				dataType : "text",
				type : "post",
				beforeSend : function(a){
					alert("잠시만 기다려주세요");
				},
				success : function(result){
					alert(result);
					if(result == "임시비밀번호 전송완료"){
						location.href="/user/insertUser";
					}
				},
				error : function(e){
					alert(e);
				}
			})
	   }
   })
})
</script>
</head>
<body>

	<!-- header -->
	<header id="header">
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<a href="/main/mainPage"><img src="/images/logo.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				 Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<%
							String vFrom = "";
							if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
								vFrom = (String) session.getAttribute("from");
						%><li><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
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
     <div class="cont">
    <div class="form sign-in">
      <span class="login100-form-title p-b-49 animated bounce">
       ID찾기
      </span>
      <div class="wrap-input100 validate-input m-b-23" data-validate="이름이 필요합니다">
        <label>
          <span class="label-input100">name</span>
          <input class="input100" type="text" id="name" placeholder="이름을 입력하세요" />
          <span class="focus-input100" data-symbol="&#xf206;"></span>
        </label>
      </div>
      <div class="wrap-input100 validate-input" data-validate="email이 필요합니다">
        <label>
          <span class="label-input100">email</span>
          <input class="input100" type="email" id="eMail" placeholder="email을 입력하세요">
          <span class="focus-input100" data-symbol="&#xf190;"></span>
        </label>
      </div>

      <div class="wrap-login100-form-btn">
        <div class="login100-form-bgbtn"></div>
        <input class="login100-form-btn" type="button" id="idSearch" value="이메일 전송">
      </div>
    </div>

    <div class="sub-cont">
      <div class="img">
        <div class="img__text m--up">
          <h2>password?</h2>
          <p>비밀번호를 잊어버리셨으면 여기!</p>
        </div>
        <div class="img__text m--in">
          <h2>ID?</h2>
          <p>아이디를 잊어버리셨으면 여기!</p>
        </div>
        <div class="img__btn">
          <span class="m--up">비밀번호찾기</span>
          <span class="m--in">아이디찾기</span>
        </div>
      </div>

      <div class="form sign-up">
        <span class="login100-form-title p-b-49">
          비밀번호 찾기
        </span>
        <div class="wrap-input100 validate-input m-b-23" data-validate="아이디가 필요합니다">
          <label>
            <span class="label-input100">id</span>
            <input class="input100" type="text" id="id" placeholder="아이디를 입력하세요" />
            <span class="focus-input100" data-symbol="&#xf206;"></span>
          </label>
        </div>
        <div class="wrap-input100 validate-input" data-validate="email이 필요합니다">
          <label>
            <span class="label-input100">email</span>
            <input class="input100" type="email" id="eMail2" placeholder="email을 입력하세요">
            <span class="focus-input100" data-symbol="&#xf190;"></span>
          </label>
        </div>
        <div class="wrap-login100-form-btn">
          <div class="login100-form-bgbtn"></div>
          <input class="login100-form-btn" type="button" id="pwdSearch" value="임시 비밀번호 전송">
        </div>
      </div>
    </div>
  </div>


  <!-- js -->
  <script src="/css/idpwdsearch/script.js"></script>   
</body>
</html>