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
	
	
	
	
	$("#send").click(function(){
		var uEmail = $("input[name='uEmail']").val();
		console.log(uEmail);
		$.ajax({
			url : "${pageContext.request.contextPath}/mail/sendMail",
			data: {"uEmail":uEmail},
			dataType : "json",
			type : "post",
			success : function(result) {
				alert("인증코드를 전송했습니다.");
			},			
			error : function(e) {
				alert("이메일을 확인해주세요.");		
			}
			});		
	});
	 $("#sendCheck").click(function(){
		 var uEmail2 = $("input[name='uEmail2']").val();
		console.log(uEmail2);
		$.ajax({
			url : "${pageContext.request.contextPath}/mail/sendCheck",
			data : {"uEmail2" : uEmail2},
			dataType : "text",
			type : "post",
			success : function(result){
				alert("인증되었습니다!");
			},
			error : function(e){
				alert("인증코드를 다시 확인해주세요.");
			}
		});
	});
}) 
</script>
</head>
<body>
	<!-- User정보입력 -->
	<fieldset>
		<legend>회원가입</legend>
		<form action="${pageContext.request.contextPath}/user/insertUser" method="post">
			<input type="text" name="uId" placeholder="아이디 입력" required="required"> <br>
			<input type="password" name="uPwd" placeholder="패스워드 입력"> <br>
			<input type="text" name="uName" placeholder="이름 입력"> <br>
			<label><input type="radio" name="uGender" value="남">남</label>
			<label><input type="radio" name="uGender" value="여">여</label> <br>
			<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="uPhone1"> - <input type="text" maxlength="4" name="uPhone2"><br> 
			<input type="text" name="uEmail" placeholder="이메일 입력"> 
			<input type="text" name="uEmail2" placeholder="인증번호 확인"> 
			<input type="date" name="uBirthStr"> <br>
			<input type="submit" value="회원가입">
			</form>
			 <button id="send">이메일 발송</button><br>
			 <button id="sendCheck">인증번호 확인</button>
	</fieldset>
</body>
</html>