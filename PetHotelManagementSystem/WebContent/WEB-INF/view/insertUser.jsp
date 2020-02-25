<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  				alert(result);
  				 $("input[name='uId']").prop('readonly', true);
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
					return false;
				}else {
					alert("이메일 확인 완료");
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
	 			$.idCheck();
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
		
});  	

</script>
</head>
<body>
	<!-- User정보입력 -->
	<fieldset>
		<legend>회원가입</legend>
		<form action="${pageContext.request.contextPath}/user/insertUser"
			method="post" onsubmit="return check()">
			<input type="text" name="uId" placeholder="아이디 입력" required> <input id="uIdCheck" type="button" value="중복 확인"><br> 
			<input type="password" name="uPwd" placeholder="패스워드 입력" required><br>
			<input type="password" name="uPwd2" placeholder="패스워드 입력" required><br> 
			<input type="text" name="uName" placeholder="이름 입력" required> <br> 
			<label><input type="radio" name="uGender" value="남">남</label> 
			<label><input type="radio" name="uGender" value="여">여</label> <br> 
			<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="uPhone1" required> - <input type="text" maxlength="4" name="uPhone2" required><br> 
			<input type="text" name="uEmail" placeholder="이메일 입력" required> <input id="send" type="button" value="인증번호 발송"><br> 
			<input type="text" name="uEmail2" placeholder="인증번호 확인" required> <input id="sendCheck" type="button" value="인증번호 확인"><br> 
			<input type="date" name="uBirthStr"> <br> 
			<input type="submit" id="join" value="회원가입">
		</form>
	</fieldset>
</body>
</html>