<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="/css/mypage/assets/css/main.css" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript">
function gogo(){
	if( '<%=session.getAttribute("id")%>' != 'null' && '<%=session.getAttribute("from")%>' != 'null'){

	}else{
		alert("로그인해주세요");
		location.href="/user/loginUser"
	}
	$(function(){
		$("#confirm").click(function(){
			var result = confirm("정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요");
			
			if(result){				
				location.href="/main/contactPage";
			}else{
				
			}
		})
		$("#confirm1").click(function(){
			var result = confirm("정말로 예약을 취소하시겠습니까? 환불관련은 고객센터로 문의해주세요");
			
			if(result){				
				location.href="/main/contactPage";
			}else{
				
			}
		})
	})
}

$(function(){
	$.photoUpload = function(pNum) {
		window.open("/pet/petPhoto?pNum=" + pNum,"사진수정","scrollbars=no, width=600, height=400, menubar=false");
	}
	
	$.petInsert= function() {
		window.open("/my/myPet", "펫 추가","scrollbars=no, width=600, height=400, menubar=false");
	}
	
	$.petUpdate= function(pNum) {
		window.open("/my/myPetUpdate?pNum=" + pNum, "펫 수정","scrollbars=no, width=600, height=400, menubar=false");
	}
});
</script>
<title>PHMS : <%=session.getAttribute("id") %></title>
</head>
<body onload="gogo()">
	<div id="wrapper">

	<%
		String vFrom = (String) session.getAttribute("from");
		if (vFrom == "phms") {
	%>

		<header id="header">
			<span class="avatar"><img src="/image/emp/admin.png" /></span>
				<h1>회원 정보</h1><br>
				회원 아이디 : ${user.uId }<br>
				회원 이름 : ${user.uName }<br>
				회원 전화번호 : ${user.uPhone }<br>
				회원 이메일 : ${user.uEmail }<br>
				회원 생년월일 : ${user.uBirth }<br>
				<br>
				<a href="/my/myPageUpdate" class="btn btn-primary">회원정보 수정</a>
				<hr>
				<h1>반려 동물 정보</h1>
				<br>
				<div class="card-group justify-content-center">
				<c:forEach var="i" items="${pet}">
					<div class="card text-center col-3">
						<a href="#" onclick="$.photoUpload(${i.pNum})"><img class="card-img-top" height="100%" src="${i.pPhoto }" onerror="this.src='/image/petImageAvatar.jpg'"></a>
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							반려동물 이름 : ${i.pName }<br>
							반려동물 종류 : ${i.pType }<br>
							</p>
							<a href="#" onclick="$.petUpdate(${i.pNum})" class="btn btn-primary">펫 정보수정</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<br>
				<br>
				<a href="#" onclick="$.petInsert()" class="btn btn-primary">반려동물 추가</a>
		</header>

	<hr>
	
	<h1>사용 대기중인 예약 정보</h1><br>
	<c:forEach var="i" items="${userReserve }">
			<div class="card bg-light mb-3" style="max-width: 18rem;">
				<div class="card-body">
					<h5 class="card-title text-primary">${i.sSize }방</h5>
					<p class="card-text">
					예약자 : ${i.reId }<br>
					예약자 전화번호 : ${i.rePhone }<br>
					예약 방번호 : ${i.reRNum }번방<br>
					체크인 : ${i.reCheckIn }<br>
					체크아웃 : ${i.reCheckOut }<br>
					</p>
					<a id="confirm" class="btn btn-primary" style="color: white">예약취소</a>
				</div>
			</div>
		</c:forEach>

	<%
		} else {
	%>
	
		<header id="header">
			<span class="avatar"><img src="/css/mypage/images/노창옥.JPG"	alt="" /></span>
				<h1>회원 정보</h1><br>
				회원 아이디 : ${visitor.vId }<br>
				회원 이름 : ${visitor.vName }<br>
				회원 이메일 : ${visitor.vEmail }<br>
				회원 경로 : ${visitor.vFrom }<br>
				<br>
				<a href="/my/myPageUpdate" class="btn btn-primary">회원정보 수정</a>
				<hr>
				<h1>반려 동물 정보</h1>
				<br>
				<div class="card-group justify-content-center">
				<c:forEach var="i" items="${pet}">
					<div class="card text-center col-3">
						<a href="#" onclick="$.photoUpload(${i.pNum})"><img class="card-img-top" height="100%" src="${i.pPhoto }" onerror="this.src='/image/petImageAvatar.jpg'"></a>
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							반려동물 이름 : ${i.pName }<br>
							반려동물 종류 : ${i.pType }<br>
							</p>
							<a href="#" onclick="$.petUpdate(${i.pNum})"class="btn btn-primary">펫 정보수정</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<br>
				<br>
				<a href="#" onclick="$.petInsert()" class="btn btn-primary">반려동물 추가</a>
		</header>
	<hr>
	
	<h1>예약 정보</h1><br>
	<c:forEach var="i" items="${visitorReserve }">
	<div class="card bg-light mb-3" style="max-width: 18rem;">
				<div class="card-body">
					<h5 class="card-title text-primary">${i.sSize }방</h5>
					<p class="card-text">
					예약자 : ${i.reId }<br>
					예약자 전화번호 : ${i.rePhone }<br>
					예약 방번호 : ${i.reRNum }번방<br>
					체크인 : ${i.reCheckIn }<br>
					체크아웃 : ${i.reCheckOut }<br>
					</p>
					<a id="confirm" class="btn btn-primary" style="color: white">예약취소</a>
				</div>
			</div>
	</c:forEach>
	<%
		}
	%>
	
	</div>
		<!-- Footer -->
		<footer id="footer">
			<p>
				&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. 	Demo Images: <a	href="http://unsplash.com">Unsplash</a>.
			</p>
		</footer>

</body>

<!-- JS -->
<script src="/css/mypage/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>