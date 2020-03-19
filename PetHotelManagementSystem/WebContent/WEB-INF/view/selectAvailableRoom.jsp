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

String reCheckIn = request.getParameter("checkin_date");
String reCheckOut = request.getParameter("checkout_date");

session.setAttribute("reCheckIn", reCheckIn);
session.setAttribute("reCheckOut", reCheckOut);
session.setAttribute("numberOfPerson", request.getParameter("numOfPeople"));
session.setAttribute("numberOfPet", request.getParameter("numOfPets"));


%>
<title>PHMS : 룸 리스트</title>
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
<header id="header">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	   
	      <a class="navbar-brand" href="/main/mainPage"><img src="/images/logo.png"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	         Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
				<%
					String vFrom = "";
					if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
						vFrom = (String) session.getAttribute("from");
				%><li class="user_name" ><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
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
		      	
		      	<li class="nav-item active"><a href="/room/selectAvailableRoom" class="nav-link">Rooms</a></li>
		      	
		        <li class="nav-item" id="set_7_text"><a class="nav-link" href="/main/servicePage">Service</a></li>
		      	
		      	<% 
		      	
		      	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		      	%>
		        <li class="nav-item" id="set_7_text"><a class="nav-link" href="/my/myPage01">MyPage</a>
		    	<%
		    		}//if end
		    	%>
		    	
		       <li class="nav-item" id="set_7_text"><a class="nav-link"  href="/main/contactPage">Contact</a></li>
	        </ul>
	      </div>
	  </nav> 	
	  </header>
    <!-- END nav -->

    <div id="headerBg" class="hero-wrap" style="background-image: url(/css/rooms,contact/images/bg1.jpg);">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text animated bounce">
	            <h1 class="mb-4 bread">Rooms.</h1>
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
		    					<a href="/room/roomTogether?reSNum=1" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room11.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=1">${listSize[0].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[0].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[0].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[0].sMax }</li>
		    							<li><span>Size:</span> ${listSize[0].sSpace }</li>
		    							<li><span>View:</span> ${listSize[0].sView }</li>
		    							<li><span>Bed:</span> ${listSize[0].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=1" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=2" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room21.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=2">${listSize[1].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[1].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[1].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[1].sMax }</li>
		    							<li><span>Size:</span> ${listSize[1].sSpace }</li>
		    							<li><span>View:</span> ${listSize[1].sView }</li>
		    							<li><span>Bed:</span> ${listSize[1].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=2" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=3" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room31.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=3">${listSize[2].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[2].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[2].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[2].sMax }</li>
		    							<li><span>Size:</span> ${listSize[2].sSpace }</li>
		    							<li><span>View:</span> ${listSize[2].sView }</li>
		    							<li><span>Bed:</span> ${listSize[2].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=3" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    		</div>
					</div>
					<div class="tab-pane fade" id="personOnly">
							<div class="row">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=4" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room41.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=4">${listSize[3].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[3].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[3].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[3].sMax }</li>
		    							<li><span>Size:</span> ${listSize[3].sSpace }</li>
		    							<li><span>View:</span> ${listSize[3].sView }</li>
		    							<li><span>Bed:</span> ${listSize[3].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=4" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=5" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room51.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=5">${listSize[4].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[4].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[4].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[4].sMax }</li>
		    							<li><span>Size:</span> ${listSize[4].sSpace }</li>
		    							<li><span>View:</span> ${listSize[4].sView }</li>
		    							<li><span>Bed:</span> ${listSize[4].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=5" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=6" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room61.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=6">${listSize[5].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[5].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[5].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[5].sMax }</li>
		    							<li><span>Size:</span> ${listSize[5].sSpace }</li>
		    							<li><span>View:</span> ${listSize[5].sView }</li>
		    							<li><span>Bed:</span> ${listSize[5].sBed }</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=6" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    		</div>
					</div>
					<div class="tab-pane fade" id="petOnly">
						<div class="row">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=7" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room71.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=7">${listSize[6].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[6].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[6].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[6].sMax }</li>
		    							<li><span>Lounge:</span> ${listSize[6].sLounge }</li>
		    							<li><span>Room Limit:</span> ${listSize[6].sLimit }</li>
		    							<li><span>Care:</span> ${listSize[6].sCare } KRW</li>
		    							<li><span>Bath:</span> ${listSize[6].sBath } KRW</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=7" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=8" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room81.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=8">${listSize[7].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[7].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[7].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[7].sMax }</li>
		    							<li><span>Lounge:</span> ${listSize[7].sLounge }</li>
		    							<li><span>Room Limit:</span> ${listSize[7].sLimit }</li>
		    							<li><span>Care:</span> ${listSize[7].sCare } KRW</li>
		    							<li><span>Bath:</span> ${listSize[7].sBath } KRW</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=8" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="/room/roomTogether?reSNum=9" class="img d-flex justify-content-center align-items-center" style="background-image: url(/css/rooms,contact/images/room91.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="/room/roomTogether?reSNum=9">${listSize[8].sSize }</a></h3>
		    						<p><span class="price mr-2">${listSize[8].sRPrice } KRW</span> <span class="per">Weekday</span><br>
		    						<span class="price mr-2">${listSize[8].sWPrice } KRW</span> <span class="per">Weekend</span></p>
		    						<ul class="list">
		    							<li><span>Max:</span> ${listSize[8].sMax }</li>
		    							<li><span>Lounge:</span> ${listSize[8].sLounge }</li>
		    							<li><span>Room Limit:</span> ${listSize[8].sLimit }</li>
		    							<li><span>Care:</span> ${listSize[8].sCare } KRW</li>
		    							<li><span>Bath:</span> ${listSize[8].sBath } KRW</li>
		    						</ul>
		    						<hr>
		    						<p class="pt-1"><a href="/room/roomTogether?reSNum=9" class="btn-custom">Book Now <span class="icon-long-arrow-right"></span></a></p>
		    					</div>
		    				</div>
		    			</div>		
		    			</div>
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

<!-- logOut javascript -->
<script type="text/javascript" src="/js/logOut.js"></script>

<!-- OAuth2.0 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</html>