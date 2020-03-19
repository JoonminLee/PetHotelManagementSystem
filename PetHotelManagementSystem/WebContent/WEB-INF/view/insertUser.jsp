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
<link rel="stylesheet" href="/css/insert_css/css/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/css/insert_css/css/vendor/jquery-ui/jquery-ui.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/css/insert_css/css/css/style.css">

<title>insertUser</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var idCheckNum = 0; 
		var emailSendNum = 0;
		var emailCheckNum = 0;
	$.idCheck = function(){
		var uId = $("input[name='uId']").val();
			console.log(uId);
    	  $.ajax({
  			url : "${pageContext.request.contextPath}/mail/idCheck",
  			data : {"uId" : uId},
  			dataType : "text",
  			type : "post",
  			success : function(result){
  				console.log(result);
  				if(result == "아이디를 사용할 수 있습니다."){
  					alert(result);
				 $("input[name='uId']").prop('readonly', true);
  				}else{
  					alert(result);
  				}
  				return false;
  			},
  			error : function(e){
  				console.log("아이디 중복 에러");
  			}
      });
	};
	$.emailSend = function(){
		var uEmail = $("input[name='uEmail']").val();
		$.ajax({
		url : "/mail/sendMail",
		data: {"uEmail":uEmail},
		dataType : "text",
		type : "post",
		success : function(result) {
			console.log(result);
			if(result == "실패"){
				alert("이메일을 확인해주세요!");	
				return false;
			}else {
				alert("인증코드 발송 완료");
				 $("input[name='uEmail']").prop('readonly', true);
				return false;
			}
		},			
		error : function(e) {					
			console.log("이메일 에러");
			}
		});
	}
	$.sendCheck = function(){
		var uEmail2 = $("input[name='uEmail2']").val();
		console.log(uEmail2);
		$.ajax({
			url : "/mail/sendCheck",
			data : {"uEmail2" : uEmail2},
			dataType : "text",
			type : "post",
			success : function(result){
				if(result == "실패"){
					alert("인증코드를 확인해주세요!");	
					$("input[name='uEmail']").prop('readonly', false);
					return false;
				}else {
					alert("이메일 확인 완료");
					$("input[name='uEmail2']").prop('readonly', false);
					return false;
				}
			},
			error : function(e){
				console.log("이메일 체크 에러");				
			}		
		});
	}
	
	$("form").submit(function(){
		//아이디
	     var uId = $("input[name='uId']").val();
	     if(uId.length < 6 || uId.length >= 15){
     	  	alert("아이디는 6글자 이상 15글자 미만으로 적어주세요");
	        $("input[name='uId']").focus();
	        return false;
	      }		    	 
		  //비밀번호
		    var pwd = $("input[name='uPwd']").val();
		    var pattern = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;;
		    if(pwd.length < 8 || (!pattern.test(pwd))){
		    	alert("비밀번호를 8자 이상 특수문자, 숫자를 포함해 주세요");
		      $("input[name='uPwd']").focus();
		      return false;
		    }else{
		    }
		  //비밀번호 확인
		    var pwd = $("input[name='uPwd']").val();
		    var uPwd2 = $("input[name='uPwd2']").val();
		    if(pwd == uPwd2){
		      $("#urpwdagain_error").html("비밀번호가 확인되었습니다").css("color","green");
		    }else{
		    	alert("비밀번호 확인을 다시 확인해 주세요");
		      $("input[name='uPwd2']").focus();
		      return false;
		    }
		  //유저이름
		    var name = $("input[name='uName']").val();
		    if(name == ""){
		      alert("이름을 다시 확인해 주세요");
		      $("input[name='uName']").focus();
		      return false;
		    }else{	     
		    }
		  //성별
		  	var gender = $("input[name='uGender']:checked").val();
		  	console.log(gender);
		    if(gender == null){
		    	alert("성별을 선택해주세요!");	 
		    	return false;		    	
		    }
		    if(idCheckNum == 0){
		    $.idCheck();
		    }
		    if(emailSendNum == 0){
		    $.emailSend();
		    }
		    if(emailCheckNum == 0){
		    $.sendCheck();
		    }
	});
		    //아이디 중복
	 		$("#uIdCheck").click(function(){
	 			var uId = $("input[name='uId']").val();
	 			if(uId.length < 6 || uId.length >= 15){
	 				alert("아이디는 6글자 이상 15글자 미만으로 적어주세요");
	 		        $("input[name='uId']").focus();
	 		        return false;
	 		    }else if(uId.length >= 6){
	 				$.idCheck();	 	     	  	
	 		    }		    	 
	 			idCheckNum = 1;
	 		});
		//이메일	
	 		$("#send").click(function(){
				$.emailSend();
				emailSendNum = 1;
	 		});
	 //이메일 체크
			$("#sendCheck").click(function(){
				$.sendCheck();
				emailCheckNum = 1;
			});		
	 })
 
</script>
</head>
<body>
   				<!-- header -->
				<header id="header">
						<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
								<a href="/main/mainPage"><img src="/images/logo.png" ></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
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
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout" onclick="kakaoOut()">LogOut</a></li>
						</div>
						<%
							break;
								case "google":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout" onclick="googleOut()">LogOut</a></li>
						</div>
						<%
							break;
								case "naver":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout">LogOut</a></li>
						</div>
						<%
							break;
								case "phms":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout">LogOut</a></li>
						</div>
						<%
							break;
								}//switch end
							} else {
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/user/loginUser">LogIn</a></li>
						</div>
						<%
							}//if end
						%>
						
						<%
						if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/user/insertUser">Register</a></li>
		              	</div>
		              	<%
		              		}//if end
		              	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/room/selectAvailableRoom">Rooms</a></li>
		            	</div>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/main/servicePage">Service</a></li>
		              	</div>
		              	
		              	<% 
		              	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		              	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/my/myPage01">MyPage</a>
		            	</div>
		            	<%
		            		}//if end
		            	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/main/contactPage">Contact</a></li>
		              	</div>
					</ul>
				</div>

			</nav>
			</header>
  
   <div class="main">
    <section class="signup">
      <div class="container">
        <div class="signup-content">
          <form action="/user/insertUser" method="POST" onsubmit="return check()" id="signup-form" class="signup-form">
         	<span class="login100-form-title p-b-49 animated bounce">
				Sing.Up.
			</span>
			<br><br>
			<div class="form-row">
              <div class="form-group">
                <label for="id">id</label>
                <input type="text" class="form-input" name="uId" id="id" required/>
              </div>
              <div class="form-group">
                <input type="button" name="idsubmit" id="uIdCheck" class="overlap-submit" value="중복검사" />
              </div>
            </div>
			<div class="form-row">
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-input" name="uPwd" id="password" required/>
              </div>
              <div class="form-group">
                <label for="re_password">password</label>
                <input type="password" class="form-input" name="uPwd2" id="re_password" required/>
              </div>
            </div>
			<div class="form-group">
              <label for="first_name">name</label>
              <input type="text" class="form-input" name="uName" id="name" required/>
            </div>
			<div class="form-row">
              <div class="form-group">
                <label for="phone_number" class="phonenum">Phone number</label>
                <input type="text" class="form-phoneinput" value="010" readonly />
              </div>
              <div class="form-group">
                <br>
                <input type="text" class="form-phoneinput" maxlength="4" name="uPhone1" required />
              </div>
              <div class="form-group">
                <br>
                <input type="text" class="form-phoneinput" maxlength="4" name="uPhone2" required />
              </div>
            </div>
			<div class="form-row">
            <div class="form-group form-icon">
                <label for="uBirthStr">Birth date</label>
                <input type="text" class="form-input" data-date-format="mm-dd" name="uBirthStr" id="uBirthStr" placeholder="YYYY-MM-DD" />
            </div>
            <div class="form-radio">
                <label for="gender">Gender</label>
                <div class="form-flex">
                    <input type="radio" name="uGender" value="남" id="male" checked="checked" />
                    <label for="male">남</label>

                    <input type="radio" name="uGender" value="여" id="female" />
                    <label for="female">여</label>
                </div>
            </div>
            </div>
			<div class="form-row">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-input" name="uEmail" required/>
              </div>
              <div class="form-group">
                <input type="button" id="send" class="overlap-submit" value="인증번호발송" />
              </div>
            </div>
			<div class="form-row">
              <div class="form-group">
                <label for="email">Email인증번호입력</label>
                <input type="text" class="form-input" name="uEmail2" required/>
              </div>
              <div class="form-group">
                <input type="button" id="sendCheck" class="overlap-submit" value="인증번호확인" placeholder="인증번호를 입력하세요"/>
              </div>
            </div>
			<div class="form-group">
              <input type="submit" name="submit" id="join" class="form-submit" value="Submit"/>
            </div>
          </form>
        </div>
      </div>
    </section>


  </div> 
  	<!-- Javascript -->
<script src="/css/insert_css/menu/js/jquery.min.js"></script>
<script src="/css/insert_css/menu/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/css/insert_css/menu/js/bootstrap.min.js"></script>
<script src="/css/insert_css/menu/js/jquery.waypoints.min.js"></script>
<script src="/css/insert_css/menu/js/jquery.stellar.min.js"></script>
<script src="/css/insert_css/menu/js/owl.carousel.min.js"></script>
<script src="/css/insert_css/menu/js/scrollax.min.js"></script>
<script src="/css/insert_css/menu/js/main.js"></script>
  <!-- JS -->
<script src="/css/insert_css/css/vendor/jquery/jquery.min.js"></script>
<script src="/css/insert_css/css/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="/css/insert_css/css/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/css/insert_css/css/vendor/jquery-validation/dist/additional-methods.min.js"></script>
<script src="/css/insert_css/css/js/main.js"></script>  
</body>
</html>