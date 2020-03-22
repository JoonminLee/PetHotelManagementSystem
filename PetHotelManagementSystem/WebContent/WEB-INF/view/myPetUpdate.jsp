<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPetUpdate</title>
	<!--====css===========================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/css/login_css/login/css/main.css">
<!-- nav StyleSheet -->
<link rel="stylesheet" href="/css/login_css/menu/css/style.css">
<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#myPetUpdate").on("click", function() {
		var pNum = $("input[name='pNum']").val();
		var pName = $("input[name='pName']").val();
		var pType = $("input[name='pType']").val();
		var pUNum = $("input[name='pUNum']").val();
		var pVNum = $("input[name='pVNum']").val();
		var pPhoto = $("input[name='pPhoto']").val();
		$.ajax({
			url : "/my/myPetUpdate",
			data : {"pNum":pNum, "pName":pName, "pType":pType, "pUNum":pUNum, "pVNum":pVNum, "pPhoto":pPhoto },
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("수정 성공");
				opener.window.location="/my/myPage01";
				close();
			}
		});
	});
	$("#myPetDelete").on("click",function(){
		var pNum = $("input[name='pNum']").val();
		$.ajax({
			url : "/my/myPetDelete",
			data : {"pNum":pNum},
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("삭제 성공");
				opener.window.location="/my/myPage01";
				close();
			}
		});
	});
});
</script>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49 animated bounce">
						My.Pet.
					</span>
					<div class="wrap-input100 validate-input m-b-23">
						<!-- <span class="label-input100">펫 이름 : </span> -->
						펫 이름 : <input class="input100" type="text" name="pName" value="${pet.pName }"> 
					</div>

					<div class="wrap-input100 validate-input" >
						<!-- <span class="label-input100">펫 종류 :</span> -->
						펫 종류 :<input class="input100" name="pType" value="${pet.pType }"> 
					</div>

					<div class="text-right p-t-8 p-b-31">

					</div>
	<br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="myPetUpdate" type="button" >반려동물 정보 수정</button>
							<!-- <input class="login100-form-btn" id="myPetUpdate" type="button" value="반려동물 정보 수정"> -->
						</div>
					</div>
				</form>
<form>
					<br>
					<br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="hidden" name="pNum" value="${pet.pNum }">
							<!-- <input class="login100-form-btn" id="myPetDelete" type="button" value="반려동물  정보 삭제"> -->
							<button class="login100-form-btn" id="myPetDelete" type="button">반려동물  정보 삭제</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>

<%--  <form>
	<div>
		<input type="hidden" name="pNum" value="${pet.pNum }">
		펫 이름 : <input type="text" name="pName" value="${pet.pName }"><br>
		펫 종류 : <input type="text" name="pType" value="${pet.pType }"><br>
		<input type="hidden" name="pUNum" value="${pet.pUNum }">
		<input type="hidden" name="pVNum" value="${pet.pVNum }">
		<input type="hidden" name="pPhoto" value="${pet.pPhoto }">
		<input id="myPetUpdate" type="button" value="반려동물 정보 수정">
	</div>
</form>
<form>
	<input type="hidden" name="pNum" value="${pet.pNum }">
	<input id="myPetDelete" type="button" value="반려동물  정보 삭제">
</form> --%> 


<!--===js============================================================================================-->
	<script src="/css/login_css/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/css/login_css/login/js/main.js"></script>
	<!--nav Javascript -->
	<script src="/css/login_css/menu/js/bootstrap.min.js"></script>
	<script src="/css/login_css/menu/js/main.js"></script>
</body>
</html>