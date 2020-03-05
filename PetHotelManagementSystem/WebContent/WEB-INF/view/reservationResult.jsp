<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
p {	margin: 20px 0px;}
</style>
<title>reservationResult</title>
<!-- StyleSheet -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="/css/roomList/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/roomList/css/animate.css">
<link rel="stylesheet" href="/css/roomList/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/roomList/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/roomList/css/magnific-popup.css">
<link rel="stylesheet" href="/css/roomList/css/aos.css">
<link rel="stylesheet" href="/css/roomList/css/ionicons.min.css">
<link rel="stylesheet" href="/css/roomList/css/flaticon.css">
<link rel="stylesheet" href="/css/roomList/css/icomoon.css">
<link rel="stylesheet" href="/css/roomList/css/style.css">
<link rel="stylesheet" href="/css/reserve/css/style.css">

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
	          <li class="nav-item active"><a href="rooms.html" class="nav-link">Rooms</a></li>
	          <li class="nav-item"><a href="restaurant.html" class="nav-link">Restaurant</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav> 
    <!-- END nav -->

    <div id="headerBg" class="hero-wrap" style="background-image: url(/css/reserveResult/images/dogbanner.jpg);">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Reservation</h1>
            </div>
          </div>
        </div>
      </div>
     </div>
	<div class="container-fluid">
	<div class="row ">
		<div class="col-md-4">
		</div>
		<div class="col-md-4 border border-primary">
			<div class="row">
				<div class="col-md-12">
					<h4 class="text-center">
						Reservation Cehck
					</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded" />
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">
								Check-In-Date
							</p>
							<p class="text-center">
								2020-03-05	
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">
								Check-Out-Date
							</p>
							<p class="text-center">
								2020-03-08	
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<p>
								Room Type
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p>
								Number Of Person
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p>
								Number Of Pet
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<p class="text-right">
								아담
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="text-right">
								2
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="text-right">
								1
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-2">
				</div>
				<div class="col-md-2">
				</div>
				<div class="col-md-2">
				</div>
				<div class="col-md-2">
					<p class="text-right">
						Total : 
					</p>
				</div>
				<div class="col-md-2">
					<p class="text-left">
						120,000원
					</p>
				</div>
			</div>
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<button type="button" class="btn btn-block btn-md btn-primary">
							결제
						</button>
					</div>
					<div class="col-md-4">
					</div>
				</div>
			</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
</body>

<!-- Javascript -->
<script src="/css/roomList/js/jquery.min.js"></script>
<script src="/css/roomList/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/css/roomList/js/popper.min.js"></script>
<script src="/css/roomList/js/bootstrap.min.js"></script>
<script src="/css/roomList/js/jquery.easing.1.3.js"></script>
<script src="/css/roomList/js/jquery.waypoints.min.js"></script>
<script src="/css/roomList/js/jquery.stellar.min.js"></script>
<script src="/css/roomList/js/owl.carousel.min.js"></script>
<script src="/css/roomList/js/jquery.magnific-popup.min.js"></script>
<script src="/css/roomList/js/aos.js"></script>
<script src="/css/roomList/js/jquery.animateNumber.min.js"></script>
<script src="/css/roomList/js/bootstrap-datepicker.js"></script>
<script src="/css/roomList/js/scrollax.min.js"></script>
<script src="/css/roomList/js/main.js"></script>
</html>