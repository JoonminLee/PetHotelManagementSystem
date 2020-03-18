<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f93055f9d183a780c81d29d70f577730&libraries=services,clusterer,drawing"></script>

<!-- CSS -->
<link rel="stylesheet" href="/css/rooms,contact/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/animate.css">
<link rel="stylesheet" href="/css/rooms,contact/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/magnific-popup.css">
<link rel="stylesheet" href="/css/rooms,contact/css/aos.css">
<link rel="stylesheet" href="/css/rooms,contact/css/ionicons.min.css">
<link rel="stylesheet" href="/css/rooms,contact/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/rooms,contact/css/jquery.timepicker.css">
<link rel="stylesheet" href="/css/rooms,contact/css/flaticon.css">
<link rel="stylesheet" href="/css/rooms,contact/css/icomoon.css">
<link rel="stylesheet" href="/css/rooms,contact/css/style.css">

<title>PHMS : 따뜻함과 정성으로 보답하겠습니다</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/main/mainPage">PET.HOTEL.</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	      	
	        <ul class="navbar-nav ml-auto">
	        	<%
					String vFrom = "";
					if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
						vFrom = (String) session.getAttribute("from");
				%><li class="nav-item" ><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
				<%
					switch (vFrom) {
						case "kakao":
				%>
				<li class="nav-item" id="set_7_text"><a class="nav-link" href="/sess/sessionLogout" onclick="kakaoOut()">LogOut</a></li>
				<%
					break;
						case "google":
				%>
				<li class="nav-item" ><a class="nav-link" href="/sess/sessionLogout" onclick="googleOut()">LogOut</a></li>
				<%
					break;
						case "naver":
				%>
				<li class="nav-item" ><a class="nav-link" href="/sess/sessionLogout">LogOut</a></li>
				<%
					break;
						case "phms":
				%>
				<li class="nav-item" ><a class="nav-link" href="/sess/sessionLogout">LogOut</a></li>
				<%
					break;
						case "emp":
				%>
				<li class="nav-item" ><a class="nav-link" href="/sess/sessionLogout">LogOut</a></li>
				<%
					break;
								}//switch end
							} else {
				%>
				<li class="nav-item" id="set_7_text"><a class="nav-link" href="/user/loginUser">LogIn</a></li>
				<%
					}//if end
				%>
				
				<%
				if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
				%>
		        <li class="nav-item" id="set_7_text"><a class="nav-link" href="/user/insertUser">Register</a></li>
		      	<%
		      		}//if end
		      	%>
		      	
		      	<li class="nav-item"><a href="/room/selectAvailableRoom" class="nav-link">Rooms</a></li>
		      	
		        <li class="nav-item" id="set_7_text"><a class="nav-link" href="/main/servicePage">Service</a></li>
		      	
		      	<% 
		      	
		      	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		      	%>
		        <li class="nav-item" id="set_7_text"><a class="nav-link" href="/my/myPage01">MyPage</a></li>
		    	<%
		    		}//if end
		    	%>
		    	
		       <li class="nav-item active" id="set_7_text"><a class="nav-link"  href="/main/contactPage">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap" style="background-image: url('/css/rooms,contact/images/contact.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Contact Us</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section contact-section bg-light">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h3">Contact Information</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Address:</span> 105, Supyo-ro, Jongno-gu, Seoul, Republic of Korea</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Phone:</span> <a href="tel:010-7635-3210">+ 82) 010-7635-3210</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Email:</span> <a href="mailto:com2181@gmail.com">com2181@gmail.com</a></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Website</span> <a href="https://www.instagram.com/Pet.Hotel.">instagram.com/Pet.H</a></p>
	          </div>
          </div>
        </div>
        <div class="row block-9">
				<div class="col-md-6 order-md-last d-flex">
					<form action="https://formspree.io/mleljyvk" class="bg-white p-5 contact-form"
						enctype="multipart/form-data" method="post">
						<div class="form-group">
							<input type="text" name="name" class="form-control" placeholder="Your Name" required>
						</div>
						
						<div class="form-group">
							<input type="email" name="_replyto" class="form-control" placeholder="Your Email" required>
						</div>
						
						<div class="form-group">
							<input type="text" name="_subject" class="form-control" placeholder="Subject" required>
						</div>
						
						<div class="form-group">
							<input type="file" name="attachment" class="form-control" accept="image/png, image/jpeg">
						</div>
						
						<div class="form-group">
							<textarea name="message" cols="30" rows="7" class="form-control" placeholder="Message" required></textarea>
						</div>
						
						<div class="form-group">
							<input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
						</div>
					</form>
				</div>
				<div class="col-md-6 d-flex">
          	<div id="map" class="bg-white"></div>
          </div>
        </div>
      </div>
     </section>

	<!-- Footer -->
	<footer id="footer">
		<span class="copyright">&copy; 2020 PHMS. All Rights Reserved.
		</span>
	</footer>

</body>
<!-- JS, Bootstrap, 라이브러리 -->
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
<script>
	var mapContainer = document.getElementById('map'),
	mapOption = { 
	    center: new kakao.maps.LatLng(37.570518, 126.989102),
	    level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var markerPosition  = new kakao.maps.LatLng(37.570518, 126.989102); 
	var marker = new kakao.maps.Marker({
		map : map,
		position: markerPosition
	});
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>

<!-- logOut javascript -->
<script type="text/javascript" src="/js/logOut.js"></script>

<!-- OAuth2.0 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</html>
