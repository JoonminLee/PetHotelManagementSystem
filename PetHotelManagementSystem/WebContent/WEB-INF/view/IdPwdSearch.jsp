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
  <link rel="stylesheet" type="text/css" href="/css/login_css/fonts/iconic/css/material-design-iconic-font.min.css">
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
						location.href="/idpwd/search";
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
     <div class="cont">
    <div class="form sign-in">
      <span class="login100-form-title p-b-49">
        아이디 찾기
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
          <input class="login100-form-btn" type="button" id="pwdSearch" value="임시 인증번호 전송">
        </div>
      </div>
    </div>
  </div>


  <!-- js -->
  <script src="/css/idpwdsearch/script.js"></script>   
</body>
</html>