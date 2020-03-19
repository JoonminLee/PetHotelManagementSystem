<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- CSS -->
<link rel="stylesheet" href="/css/main/assets/css/main.css" />
<noscript><link rel="stylesheet" href="/css/main/assets/css/noscript.css" /></noscript>

<!-- chackin css-->
<link rel="stylesheet" href="/css/main/chackin/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main/chackin/css/bootstrap-datepicker.css">

<!-- chackin Theme Style -->
<link rel="stylesheet" href="/css/main/chackin/css/style.css">

<!-- nav StyleSheet -->
<link rel="stylesheet" href="/css/main/menu/css/animate.css">
<link rel="stylesheet" href="/css/main/menu/css/style.css">
	
<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>PHMS : 반려동물과 함께하는 여행</title>
</head>
<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
				<!-- header -->
				<header id="header">
						<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
						<a class="navbar-brand" href="index.html">
								<a href="/main/mainPage"><img src="/css/main/assets/css/images/logo.png" ></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
								<span class="oi oi-menu"></span> Menu
							</button>
							<div class="collapse navbar-collapse" id="ftco-nav">
							<ul class="navbar-nav ml-auto">
						<%
							String vFrom = "";
							if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
								vFrom = (String) session.getAttribute("from");
						%><li class="user_name"><%=(String) session.getAttribute("id")%>님 안녕하세요</li>
						<%
							switch (vFrom) {
								case "kakao":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout" onclick="kakaoOut()">LogOut</a></li>
						</div>
						<%
							break;
								case "google":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout" onclick="googleOut()">LogOut</a></li>
						</div>
						<%
							break;
								case "naver":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout">LogOut</a></li>
						</div>
						<%
							break;
								case "phms":
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout">LogOut</a></li>
						</div>
						<%
							break;
								case "emp":
									%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
				        <rect id="set_7_button1" height="50" width="120"></rect>
				        </svg>
						<li class="nav-item" id="set_7_text"><a href="/sess/sessionLogout">LogOut</a></li>
						</div>
						<%
							break;
						}//switch end
						} else {
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
               			<rect id="set_7_button1" height="50" width="120"></rect>
                		</svg>
						<li class="nav-item" id="set_7_text"><a href="/user/loginUser">LogIn</a></li>
						</div>
						<%
							}//if end
						%>
						
						<%
						if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
						%>
						<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/user/insertUser">Register</a></li>
		              	</div>
		              	<%
		              		}//if end
		              	%>
		              	<%
						if (session.getAttribute("id") == null && session.getAttribute("from") == null) { 
						%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/room/selectAvailableRoom">Rooms</a></li>
		            	</div>
		            		<%
		              		}//if end
		              	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/main/servicePage">Service</a></li>
		              	</div>
		              	
		              	<% 
		              	if (session.getAttribute("id") != null && session.getAttribute("from") != null) {
		              	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/my/myPage01">MyPage</a>
		            	</div>
		            	<%
		            		}//if end
		            	%>
		              	<div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
		                <rect id="set_7_button1" height="50" width="120"></rect>
		                </svg>
		                <li class="nav-item" id="set_7_text"><a href="/main/contactPage">Contact</a></li>
		              	</div>
		              	
					</ul>
				</div>

			</nav>
			</header>
			<div id="main">
			<!-- section -->
			<section id="section">
				<h1>Pet. Hotel.</h1>
				<nav>
					<!-- END section -->
					<div class="container">
 						<div class="block-32" data-aos="fade-up" data-aos-offset="-200">

						            <form action="/room/selectAvailableRoom" method="post">
						              <div class="row">
						                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
						                  <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
						                  <div class="field-icon-wrap">
						                    <div class="icon"><span class="icon-calendar"></span></div>
						                    <input id="checkin_date" name="checkin_date" type="text" class="form-control" required>
						                    </div>
						                </div>
						                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
						                  <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
						                  <div class="field-icon-wrap">
						                    <div class="icon"><span class="icon-calendar"></span></div>
						                    <input id="checkout_date" name="checkout_date" type="text" class="form-control" required>
						                  </div>
						                </div>
						                <div class="col-md-6 mb-3 mb-md-0 col-lg-3"> 
						                  <div class="row">
						                    <div class="col-md-6 mb-3 mb-md-0">
						                      <label for="adults" class="font-weight-bold text-black">Visitors</label>
						                      <div class="field-icon-wrap">
						                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
						                        <select name="numOfPeople" id="adults" class="form-control" required>
						                         	<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3+">3+</option>
						                        </select>
						                      </div>
						                    </div>
						                    <div class="col-md-6 mb-3 mb-md-0">
						                      <label for="children" class="font-weight-bold text-black">Pets</label>
						                      <div class="field-icon-wrap">
						                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
						                        <select name="numOfPets" id="children" class="form-control" required>
						                        	<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3+">3+</option>
						                        </select>
						                      </div>
						                    </div>
						                  </div>
						                </div>
						                <div class="col-md-6 col-lg-3 align-self-end">
						                  <input type="submit" class="btn btn-primary btn-block text-white" value="Check Availability">
						                </div>
						              </div>
						            </form>


						        </div>
						      </div>

						</nav>
					</section>

			<!-- Footer -->
			<footer id="footer">
				<span class="copyright">&copy; 2020 PHMS. All Rights Reserved.
				</span>
			</footer>

			</div>
		</div>

</body>
<!-- JS, Bootstrap, 라이브러리 -->
<!-- chackin datepicker js -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

<!-- chackin js -->
<script src="/css/main/chackin/js/jquery-3.3.1.min.js"></script>
<script src="/css/main/chackin/js/aos.js"></script>
<script src="/css/main/chackin/js/bootstrap-datepicker.js"></script>
<script src="/css/main/chackin/js/main.js"></script>

<!--nav Javascript -->
<script src="/css/main/menu/js/jquery.min.js"></script>
<script src="/css/main/menu/js/bootstrap.min.js"></script>
<script src="/css/main/menu/js/jquery.waypoints.min.js"></script>
<script src="/css/main/menu/js/jquery.stellar.min.js"></script>
<script src="/css/main/menu/js/owl.carousel.min.js"></script>
<script src="/css/main/menu/js/jquery.animateNumber.min.js"></script>
<script src="/css/main/menu/js/scrollax.min.js"></script>
<script src="/css/main/menu/js/main.js"></script>

<script type="text/javascript">

	// 페이지가 로드된 후에 문서안에 있는 바디태그 안에 is-preload이런 이름의  클래스를 지운다.
	window.onload = function() {
		document.body.classList.remove('is-preload');
	}
	

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