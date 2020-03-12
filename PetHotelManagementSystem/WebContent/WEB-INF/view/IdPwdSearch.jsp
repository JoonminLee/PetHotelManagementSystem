<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdPwdSearch</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var id = $("#id").val();
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
			alert("dd");
		}else{
			alert("성공");
		}
		$.ajax({
			url : "/idpwd/idSearch",
			data : {"name" : name, "eMail" : eMail},
			dataType : "text",
			type : "post",
			success : function(result){
				alert(result);
			},
			error : function(e){
				alert(e);
			}
		})
	})	
})
</script>
</head>
<body>
	<div>
	<h2>아이디 찾기</h2>
		<input type="text" id="name" placeholder="이름을 입력해주세요"><br>
		<input type="text" id="eMail" placeholder="이메일을 입력해주세요"><br><br>
		<input type="button" id="idSearch" value="이메일 전송">
	</div>
	<br>
	<hr>
	<div>
	<h2>비밀번호 찾기</h2>
		<input type="text" id="id" placeholder="아이디를 입력해주세요"><br>
		<input type="text" id="eMail" placeholder="이메일을 입력해주세요"><br><br>
		<input type="button" id="pwdSearch" value="임시 인증번호 전송">
	</div>
</body>
</html>