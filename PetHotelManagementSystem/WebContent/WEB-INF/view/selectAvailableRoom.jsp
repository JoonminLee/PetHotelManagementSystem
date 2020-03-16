<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 메인페이지에서 체크인 체크아웃 값을 불러와 세션에 저장.  -->
<% 
request.setCharacterEncoding("utf-8");

String reCheckIn = request.getParameter("reCheckIn");
String reCheckOut = request.getParameter("reCheckOut");

session.setAttribute("reCheckIn", reCheckIn);
session.setAttribute("reCheckOut", reCheckOut);

%>
<style>
p {	margin: 20px 0px;}
</style>
<title>selectAllAvailable</title>
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

<!-- Jquery/CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/main/mainPage">petHotel</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/main/mainPage" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="/room/selectAvailableRoom" class="nav-link">Rooms</a></li>
	          <li class="nav-item"><a href="/main/servicePage" class="nav-link">Service</a></li>
	          <li class="nav-item"><a href="/my/myPage" class="nav-link">My page</a></li>
	          <li class="nav-item active"><a href="/main/contactPage" class="nav-link">고객센터</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav> 	
    <!-- END nav -->

    <div id="headerBg" class="hero-wrap" style="background-image: url(/css/rooms,contact/images/bg1.jpg);">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Rooms</h1>
            </div>
          </div>
        </div>
      </div>
     </div>
     
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#bothOk" onclick="$.changeBg('bg1')">Together</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#personOnly"  onclick="$.changeBg('bg2')">WithoutPet</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#petOnly"  onclick="$.changeBg('bg3')">PetOnly</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="bothOk">
					<div class="row">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether01" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether01">아담</a></h3>
		    						<p><span class="price mr-2">$120.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether01" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-2.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">넉넉</a></h3>
		    						<p><span class="price mr-2">$20.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-3.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">푸짐</a></h3>
		    						<p><span class="price mr-2">$150.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 5 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 2</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    		</div>
						<p>
							<c:forEach var="i" items="${listBothOkRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
					<div class="tab-pane fade" id="personOnly">
							<div class="row">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-4.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">싱글</a></h3>
		    						<p><span class="price mr-2">$120.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-5.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">더블</a></h3>
		    						<p><span class="price mr-2">$20.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-6.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">디럭스</a></h3>
		    						<p><span class="price mr-2">$150.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 5 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 2</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    		</div>
						<p>
							<c:forEach var="i" items="${listPersonOnlyRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
					<div class="tab-pane fade" id="petOnly">
						<div class="row">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">소형</a></h3>
		    						<p><span class="price mr-2">$120.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-2.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">중형</a></h3>
		    						<p><span class="price mr-2">$20.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 3 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 1</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room-3.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single.html">대형</a></h3>
		    						<p><span class="price mr-2">$150.00</span> <span class="per">per night</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> 5 Persons</li>
		    							<li><span>Size:</span> 45 m2</li>
		    							<li><span>View:</span> Sea View</li>
		    							<li><span>Bed:</span> 2</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="room-single.html" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    		</div>
						<p>
							<c:forEach var="i" items="${listPetOnlyRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
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
<script type="text/javascript">
$(function(){
	var i;
	$.changeBg = function(i){
		$("#headerBg").fadeOut(function(){
			switch (i) {
			case 'bg1':
				$("#headerBg").css({"background-image":"url('/css/rooms,contact/images/bg1.jpg')"}).fadeIn();
				break;
			case 'bg2':
				$("#headerBg").css({"background-image":"url('/css/rooms,contact/images/bg2.jfif')"}).fadeIn();
				break;
			case 'bg3':
				$("#headerBg").css({"background-image":"url('/css/rooms,contact/images/bg3.jpg')"}).fadeIn();
				break;
			default:
				break;
			}
		});
	};
});
</script>
</html>