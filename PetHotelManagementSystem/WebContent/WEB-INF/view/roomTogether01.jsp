<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- StyleSheet -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="/css/rooms,contact/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/animate.css">
<link rel="stylesheet" href="/css/rooms,contact/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/magnific-popup.css">
<link rel="stylesheet" href="/css/rooms,contact/css/aos.css">
<link rel="stylesheet" href="/css/rooms,contact/css/ionicons.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/flaticon.css">
<link rel="stylesheet" href="/css/rooms,contact/css/icomoon.css">
<link rel="stylesheet" href="/css/rooms,contact/css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/main/mainPage">PETHOTEL</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/main/mainPage" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="/room/selectAvailableRoom" class="nav-link">Rooms</a></li>
	          <li class="nav-item"><a href="/main/servicePage" class="nav-link">Service</a></li>
	          <li class="nav-item"><a href="/my/myPage01" class="nav-link">My page</a></li>
	          <li class="nav-item active"><a href="/main/contactPage" class="nav-link">고객센터</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap" style="background-image: url('/css/rooms,contact/images/roombg1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Room Single</h1>
            </div>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section">
      <div class="container-room">
        <div class="row">
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<h2 class="mb-4">아담</h2>
          			<div class="single-slider owl-carousel">
          				<div class="item">
          					<div class="room-img" style="background-image: url(/css/rooms,contact/images/room-1.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="room-img" style="background-image: url(/css/rooms,contact/images/room-2.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="room-img" style="background-image: url(/css/rooms,contact/images/room-3.jpg);"></div>
          				</div>
          			</div>
          		</div>
          		<div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
    						<div class="d-md-flex mt-5 mb-5">
    							<ul class="list">
	    							<li><span>Max:</span> 3 Persons</li>
	    							<li><span>Size:</span> 45 m2</li>
	    						</ul>
	    						<ul class="list ml-md-5">
	    							<li><span>View:</span> Sea View</li>
	    							<li><span>Bed:</span> 1</li>
	    						</ul>
                  <ul class="list ml-md-5">
                    <li><span>무료 Wi-Fi</span> 3 Persons</li>
                    <li><span>Size:</span> 45 m2</li>
                  </ul>
                  <ul class="list ml-md-5">
                    <li><span>View:</span> Sea View</li>
                    <li><span>Bed:</span> 1</li>
                  </ul>
    						</div>
    						<p>
침대 종류

퀸베드 1개
욕실 및 세면도구

거울
목욕 가운
타월
헤어드라이어
엔터테인먼트

객실 내 영화(VOD)
무료 Wi-Fi (모든 객실)
위성 방송/케이블 방송
전화기
객실 편의 용품/시설

난방
방음
슬리퍼
에어컨
식음료 시설/서비스

냉장고
무료 생수
무료 웰컴 드링크
무료 인스턴트 커피
무료 차
미니바
커피/티 메이커
객실 구조 및 가구

책상</p>
          		</div>

          	</div>
          </div> <!-- .col-md-10 -->

          <!-- sidebar -->
				<div class="col-lg-3 sidebar">
	      		<div class="sidebar-wrap bg-light ftco-animate">
	      			<h3 class="heading mb-4">Room selection</h3>
	      			<form action="/reserve/reservationResult" method="get">
	      			  <div class="fields">
		              <div class="form-group">
		                <input type="text" name="reCheckInStr" id="checkin_date" class="form-control checkin_date" placeholder="Check In Date">
		              </div>
		              <div class="form-group">
		                <input type="text" name="reCheckOutStr" id="checkin_date" class="form-control checkout_date" placeholder="Check Out Date">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="rSNum" id="" class="form-control">
	                      <option value="0">Room Type</option>
	                      <option value="1">아담</option>
	                      <option value="2">넉넉</option>
	                      <option value="3">푸짐</option>
	                      <option value="4">싱글</option>
	                      <option value="5">더블</option>
	                      <option value="6">디럭스</option>
                          <option value="7">소형</option>
	                      <option value="8">중형</option>
	                      <option value="9">대형</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="numberOfPerson" id="" class="form-control">
	                      <option value="0">0 명</option>
	                      <option value="1">1 명</option>
	                      <option value="2">2 명</option>
	                      <option value="3">3 명</option>
	                      <option value="4">4 명</option>
	                      <option value="5">5 명</option>
	                      <option value="6">6 명</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="numberOfPet" id="" class="form-control">
	                      <option value="0">0 마리</option>
	                      <option value="1">1 마리</option>
	                      <option value="2">2 마리</option>
	                      <option value="3">3 마리</option>
	                      <option value="4">4 마리</option>
	                      <option value="5">5 마리</option>
	                      <option value="6">6 마리</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="submit" value="예약확인 및 결제" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
	      		</div>
	        </div>

        </div>
      </div>
    </section> <!-- .section -->

</body>
<!-- Javascript -->
<script src="/css/rooms,contact/js/jquery.min.js"></script>
<script src="/css/rooms,contact/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/css/rooms,contact/js/popper.min.js"></script>
<script src="/css/rooms,contact/js/bootstrap.min.js"></script>
<script src="/css/rooms,contact/js/jquery.easing.1.3.js"></script>
<script src="/css/rooms,contact/js/jquery.waypoints.min.js"></script>
<script src="/css/rooms,contact/js/jquery.stellar.min.js"></script>
<script src="/css/rooms,contact/js/owl.carousel.min.js"></script>
<script src="/css/rooms,contact/js/jquery.magnific-popup.min.js"></script>
<script src="/css/rooms,contact/js/aos.js"></script>
<script src="/css/rooms,contact/js/jquery.animateNumber.min.js"></script>
<script src="/css/rooms,contact/js/bootstrap-datepicker.js"></script>
<script src="/css/rooms,contact/js/scrollax.min.js"></script>
<script src="/css/rooms,contact/js/main.js"></script>

</html>