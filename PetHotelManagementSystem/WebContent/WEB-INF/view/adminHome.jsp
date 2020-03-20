<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="view/admin/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="view/admin/vendor/font-awesome/css/font-awesome.min.css">
<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="view/admin/css/fontastic.css">
<!-- Google fonts - Poppins -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="view/admin/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="view/admin/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="view/admin/img/favicon.ico">
<link rel="stylesheet" href="/css/admin_css/admin.css" />

<% 
String emp = (String)session.getAttribute("emp");
%>    
<script type="text/javascript">
function gogo(){
	if( '<%=session.getAttribute("id")%>' != 'null'){

	}else{
		alert("로그인해주세요");
		location.href="/user/loginUser"
	}
}
</script>
    <title>PHMS : 관리자 페이지</title>
  </head>
  <body onload="gogo()">
    <div class="page">
      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="/adminHome" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span></span><strong>PetHotel Admin</strong></div>
                  </a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">

                <!-- Logout -->
                <!-- 메인페이지로 이동 -->
                <li class="nav-item"><a href="/sess/sessionLogout" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><a href="#" onclick="$.photoUpload()"><img id="profilePicture" src="${emp.ePhoto }" onerror="this.src='/image/emp/admin.png'" class="img-fluid rounded-circle"></a></div>
            <div class="title">
              <h1 class="h4">${emp.eName }</h1>
              <p>${department.dName }</p>
              <p>${position.poName }</p>
            </div>
          </div>
          <ul class="list-unstyled">
            <li class="active"><a href="/adminHome"> <i class="icon-home"></i>Home </a></li>
            <li><a href="/updateDeleteAdmin"> - 관리 </a></li>
            <li><a href="/insertAdmin"> - 추가 </a></li>
          </ul>
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">일간 차트</h2>
            </div>
          </header>
          <!-- Dashboard Counts Section-->
          <section class="dashboard-counts no-padding-bottom">
            <div class="container-fluid">
              <div class="row bg-white has-shadow">
                <!-- Item -->
                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-violet"><i class="icon-user"></i></div>

                    <!-- 오늘 예약 건 수 -->
                    <div class="title"><span>Today<br>Reserve</span>
                      <div class="progress">
                        <div role="progressbar" style="width: ${todayReserveCnt }%; height: 4px;" aria-valuenow="${todayReserveCnt }" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-violet"></div>
                      </div>
                    </div>
                    <div class="number"><strong>${todayReserveCnt }</strong></div>
                  </div>
                </div>
                <!-- Item -->
                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                    <div class="title"><span>Today<br>Visitor</span>
                      <div class="progress">
                        <div role="progressbar" style="width: ${todayGuestCnt }%; height: 4px;" aria-valuenow="${todayGuestCnt }" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-red"></div>
                      </div>
                    </div>
                    <div class="number"><strong>${todayGuestCnt }</strong></div>
                  </div>
                </div>
                <!-- Item -->
                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-green"><i class="fa fa-paper-plane-o"></i></div>
                    <div class="title"><span>This Month's<br>Reserve</span>
                      <div class="progress">
                        <div role="progressbar" style="width: ${thisMonthReserveCnt }%; height: 4px;" aria-valuenow="${thisMonthReserveCnt }" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-green"></div>
                      </div>
                    </div>
                    <div class="number"><strong>${thisMonthReserveCnt }</strong></div>
                  </div>
                </div>
                <!-- Item -->
                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-orange"><i class="fa fa-calendar-o"></i></div>
                    <div class="title"><span>This Month's <br>Visitor</span>
                      <div class="progress">
                        <div role="progressbar" style="width: ${thisMonthGuestCnt }%; height: 4px;" aria-valuenow="${thisMonthGuestCnt }" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-orange"></div>
                      </div>
                    </div>
                    <div class="number"><strong>${thisMonthGuestCnt }</strong></div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- Dashboard Header Section    -->
          <section class="dashboard-header">
            <div class="container-fluid">
              <div class="row" style="position:relative;">
              
                <div class="col-lg-4 width_500" style="position:absolute">
                  <div class="line-chart-example card no-margin-bottom">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Memo</h3>
                    </div>
                    <div class="card-body">
                    	<form class ="js-toDoForm">
      				  		<input type="text" placeholder="Write a to do" />
  						</form><br>
                    	<ul class="js-toDoList">
    					</ul>
                    	
                    </div>
                  </div>
                </div>
                
                <div class="col-lg-4 width_500" style="position:absolute; left:50%">
                  <div class="line-chart-example card no-margin-bottom">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Room Status</h3>
                    </div>
                    <div class="card-body">
                    	<div id="roomList"></div>
                    </div>
                  </div>
                </div>
                
                
              </div>
            </div>
          </section>

          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid col-sm-6">
              <p>Pet Hotel &copy; Admin</p>
            <!-- 사진 업로드 시험중 -->
            </div>
          </footer>
        </div>
      </div>
    </div>

    <!-- JavaScript files-->
    
    <script src="view/admin/vendor/jquery/jquery.min.js"></script>
    <script src="view/admin/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="view/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="view/admin/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="view/admin/vendor/chart.js/Chart.min.js"></script>
    <script src="view/admin/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="view/admin/js/charts-home.js"></script>
    <script src="view/admin/js/charts-custom.js"></script>
    <!-- Main File-->
    <script src="view/admin/js/front.js"></script>
    <script type="text/javascript" src="view/admin/js/adminHome.js"></script>
    <script type="text/javascript" src="view/admin/js/todoList.js"></script>
  </body>
</html>
