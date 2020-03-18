<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<% 
String checkIn = (String)session.getAttribute("reCheckIn");
String checkOut = (String)session.getAttribute("reCheckOut");
String numberOfPerson = (String)session.getAttribute("numberOfPerson");
String numberOfPet = (String)session.getAttribute("numberOfPet");
%>

<!-- StyleSheet -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
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

<!-- JqueryCDN -->
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#numberOfPerson option[value='${numberOfPerson}'").attr("selected", true);
	$("#numberOfPet option[value='${numberOfPet}'").attr("selected", true);
});

function gogo(){
   if( '<%=session.getAttribute("id")%>' != 'null' && '<%=session.getAttribute("from")%>' != 'null'){
   }else{
      alert("로그인해주세요");
      location.href="/user/loginUser"
   }
}
</script>
<title>PHMS : 룸 상세정보</title>
</head>
<body onload="gogo()">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/main/mainPage">PETHOTEL</a>
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
       </div>
     </nav>
    <!-- END nav -->

    <div class="hero-wrap" style="background-image: url('/css/rooms,contact/images/roombg1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
             <div class="text">
               <h1 class="mb-4 bread">Room Detail</h1>
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
                   <h2 class="mb-4">${size.sSize }</h2>
				   <%
				   	int sNum =  (Integer) request.getAttribute("sizeNumber");
				   	if (sNum < 7) {
				   %>
					<div class="single-slider owl-carousel">
                      <div class="item">
                         <div class="room-img" style="background-image: url(/css/rooms,contact/images/room-${size.sNum }1.jpg);"></div>
                      </div>
                      <div class="item">
                         <div class="room-img" style="background-image: url(/css/rooms,contact/images/room-${size.sNum }2.jpg);"></div>
                      </div>
                      <div class="item">
                         <div class="room-img" style="background-image: url(/css/rooms,contact/images/room-${size.sNum }3.jpg);"></div>
                      </div>
                   </div>
                </div>
                <div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
                    <div class="d-md-flex mt-5 mb-5">
                        <ul class="list">
                           <li><span>Max : ${size.sMax }</span></li>
                           <li><span>Size : ${size.sSpace }</span></li>
                           <li><span>View : ${size.sView }</span></li>
                           <li><span>Bed : ${size.sBed }</span></li>
                           <li><span>Weekday Price : ${size.sRPrice } KRW</span></li>
                           <li><span>Weekend Price : ${size.sWPrice } KRW</span></li>                                                     
                        </ul>
                   <% 
                   }else{
                   %>
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
                            <li><span>Max : ${size.sMax }</span></li>
                            <li><span>Lounge : ${size.sLounge }</span></li>
                            <li><span>Limit : ${size.sLimit }</span></li>
                            <li><span>Care : ${size.sCare } KRW</span></li>
                            <li><span>Bath : ${size.sBath } KRW</span></li>
                            <li><span>Weekday Price : ${size.sRPrice } KRW</span></li>
                            <li><span>Weekend Price : ${size.sWPrice } KRW</span></li>
                         </ul>   
                   <%
                   }
                   %>
                     </div>
                     <p>침대 종류 퀸베드 1개 욕실 및 세면도구 거울 목욕 가운 타월 헤어드라이어 엔터테인먼트 객실 내
                        영화(VOD) 무료 Wi-Fi (모든 객실) 위성 방송/케이블 방송 전화기 객실 편의 용품/시설 난방 방음 슬리퍼
                        에어컨 식음료 시설/서비스 냉장고 무료 생수 무료 웰컴 드링크 무료 인스턴트 커피 무료 차 미니바 커피/티 메이커
                        객실 구조 및 가구 책상</p>
                  	</div>
               </div>
          </div>

          <!-- sidebar -->
            <div class="col-lg-3 sidebar">
               <div class="sidebar-wrap bg-light ftco-animate">
                  <h3 class="heading mb-4">Room Option Selection</h3>
                  <form action="/reserve/reservationResult" method="get">
                    <div class="fields">
                    <div class="form-group">
                      <input type="text" name="reCheckInStr" id="checkin_date" class="form-control checkin_date" value="<%= checkIn %>" required>
                    </div>
                    <div class="form-group">
                      <input type="text" name="reCheckOutStr" id="checkout_date" class="form-control checkout_date" value="<%= checkOut %>" required>
                    </div>
                    <div class="form-group">
                      <div class="select-wrap one-third">
                       <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                       <select id="RoomType" name="rSNum" class="form-control" required>
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
                       <select id="numberOfPerson" name="numberOfPerson" class="form-control" required>
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
                       <select id="numberOfPet" name="numberOfPet" class="form-control" required>
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
                      <input type="submit" value="Confirm / Pay" class="btn btn-primary py-3 px-5">
                    </div>
                  </div>
               </form>
               </div>
           </div>

        </div>
      </div>
    </section> <!-- .section -->

</body>
<script type="text/javascript">
$(function(){
   $("#RoomType option[value='${size.sNum}'").attr("selected", true);
   
     var disabledDays = new Array();
     var reSNum=$("#RoomType option:selected").val();
     
     $.ajax({
        url :"roomTogether",
        data : {"reSNum" : reSNum},
        dataType : "json",
        type : "post",
        
        success :function(result){
           for(var i=0; i<result.length; i++){
              disabledDays[i] = result[i];
           }
           console.log("disabledDays:::",disabledDays);
           
         //특정일 선택 막기
         function disableAllTheseDays(date){
            var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
            
            if(m+1<10){
               m = "0"+(m+1);
               if(d<10){
                  d ="0"+d;
               }
            }else if(d<10){
               d = "0"+d;
            }
         
            for(var i = 0; i<disabledDays.length; i++){
               
               if($.inArray(y + '-' +m + '-' + d,disabledDays) != -1){
               
                  return false;
               }
            }
            return true;
         }
         
         $('#checkin_date').datepicker({
             format: "yyyy-mm-dd",
             language: "kr",
             autoclose: true,
             todayHighlight: true,
             constrainInput: false,
             beforeShowDay : disableAllTheseDays
         })
         
         $('#checkout_date').datepicker({
             format: "yyyy-mm-dd",
             language: "kr",
             autoclose: true,
             todayHighlight: true,
             constrainInput: false,
             beforeShowDay : disableAllTheseDays
         })
        }
     });

});
</script>

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

<!-- logOut javascript -->
<script type="text/javascript" src="/js/logOut.js"></script>

<!-- OAuth2.0 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="676303489666-7vh4op3lmi7j8pb5h2om655eoohkh449.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</html>