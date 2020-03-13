<%@page import="phms.dto.ReservationDto"%>
<%@page import="javax.sound.sampled.ReverbType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
p {
	margin: 20px 0px;
}
input{
	border:none; 
}
</style>
<title>reservationResult</title>
<!-- StyleSheet -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"	rel="stylesheet">
<link rel="stylesheet" href="/css/reserveResult/css/animate.css">
<link rel="stylesheet" href="/css/rooms,contact/css/style.css">

<!-- Font-->
<link rel="stylesheet" type="text/css" href="/css/reserveResult/form/css/muli-font.css">

<!-- datepicker -->
<link rel="stylesheet" type="text/css" href="/css/reserveResult/form/css/jquery-ui.min.css">
	
<!-- Main Style Css -->
<link rel="stylesheet" href="/css/reserveResult/form/css/style.css" />

<!-- Jquery/CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#pay").click(function(){
		var uPhone1 = $("input[name='uPhone1']").val();
		var uPhone2 = $("input[name='uPhone2']").val();
		var rSNumStr = $("input[name='rSNumStr']").val();
		var price = parseInt($("input[name='totalPrice']").val());
		console.log(rSNumStr);
		console.log(price);
		if(uPhone1 == null || uPhone2 == null){
			alert("전화번호를 입력해주세요");
		}else{
			var IMP = window.IMP; // 생략가능
			IMP.init('imp16403775');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			*/
			pay_method: 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
			merchant_uid: 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			*/
			name: rSNumStr+"",
			//결제창에서 보여질 이름
			amount: 1000,
			//가격
			buyer_email: 'iamport@siot.do',
			buyer_name: '구매자이름',
			buyer_tel: '010-1234-5678',
			buyer_addr: '서울특별시 강남구 삼성동',
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});			
		}		
	})	
})

</script>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/main/mainPage">petHotel</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/main/mainPage" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="/room/selectAvailableRoom"
						class="nav-link">Rooms</a></li>
					<li class="nav-item"><a href="/main/servicePage"
						class="nav-link">Service</a></li>
					<li class="nav-item"><a href="/my/myPage01" class="nav-link">My
							page</a></li>
					<li class="nav-item active"><a href="/main/contactPage"
						class="nav-link">고객센터</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div id="headerBg" class="hero-wrap"
		style="background-image: url(/css/reserveResult/css/images/photo.jfif);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
				<div
					class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
					<div class="text">
						<h1 class="mb-4 bread">Reservation</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row ">
			<div class="col-md-4"></div>
			<div class="page-content">
				<div class="wizard-v2-content">
					<div class="wizard-image"></div>
					<div class="wizard-form">
						<div class="wizard-header">
							<h3>Reservation Check</h3>
							<p>예약정보를 확인하세요.</p>
						</div>
						<form class="form-register" action="/reserve/reservationResult"
							method="post">
							<div id="form-total">
								<section>
									<div class="inner">
										<div class="form-row table-responsive">
											<table class="table">
												<tbody>
													<tr class="space-row">
														<th>Check-In-Date :</th>
														<td><input type="date" name="reCheckInStr" value="${reCheckInStr }" readonly></td>
													</tr>
													<tr class="space-row">
														<th>Check-Out-Date :</th>
														<td><input type="date" name="reCheckOutStr" value="${reCheckOutStr }" readonly></td>
													</tr>
													<tr class="space-row">
														<th>Room Type:</th>
														<td>
														<input type="hidden" name="reSNum" value="${rSNum }"> 
														<input type="text" name="rSNumStr" value="${rSNumStr }" readonly>
														</td>
													</tr>
													<tr class="space-row">
														<th>Number Of Person :</th>
														<td><input type="text" name="numberOfPerson" value="${numberOfPerson }" readonly></td>
													</tr>
													<tr class="space-row">
														<th>Number Of Pet :</th>
														<td><input type="text" name="numberOfPet" value="${numberOfPet }" readonly></td>
													</tr>
													<tr class="space-row">
														<th>Phone Number :</th>
														<td>
															<%
																String vFrom = (String) session.getAttribute("from");
																if (vFrom == "phms") {
															%> 
															<input type="text" name="uPhone" value="${user.uPhone }" readonly />
															<input type="hidden" name="uPhone1"/>
															<input type="hidden" name="uPhone2"/>																														
															<%
															} else {
 															%>
 															<input style="border:1px solid #ccc; border-radius:4px; width:60px; text-align: center;" type="text" value="010">-
															<input style="border:1px solid #ccc; border-radius:4px; width:60px; text-align: center;" type="text" maxlength="4" name="uPhone1" required />-
															<input style="border:1px solid #ccc; border-radius:4px; width:60px; text-align: center;" type="text" maxlength="4" name="uPhone2" required />
 															<%
															}
															%>
														</td>
													</tr>
													<tr class="space-row">
														<th>Total :</th>
														<td><input type="text"  name="totalPrice" value="${totalPrice }" style= "text-align:right;" readonly> KRW</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</section>

								<div class="form-group">
									<input type="button" id="pay" value="결제" class="btn btn-primary py-3 px-5">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Javascript -->
<script src="/css/rooms,contact/js/jquery.min.js"></script>
<script src="/css/rooms,contact/js/jquery-migrate-3.0.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/css/rooms,contact/js/popper.min.js"></script>
<script src="/css/rooms,contact/js/bootstrap.min.js"></script>
<script src="/css/rooms,contact/js/jquery.waypoints.min.js"></script>
<script src="/css/rooms,contact/js/jquery.stellar.min.js"></script>
<script src="/css/rooms,contact/js/owl.carousel.min.js"></script>
<script src="/css/rooms,contact/js/aos.js"></script>
<script src="/css/rooms,contact/js/jquery.animateNumber.min.js"></script>
<script src="/css/rooms,contact/js/scrollax.min.js"></script>
<script src="/css/rooms,contact/js/main.js"></script>
</html>