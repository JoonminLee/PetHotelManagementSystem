<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Material Admin by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    
    <!-- Bootstrap CSS-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="/css/admin_css/admin.css" />
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
            <div class="avatar"><a href="#" onclick="$.photoUpload()"><img id="profilePicture" src="${emp.ePhoto }" alt="..." class="img-fluid rounded-circle"></a></div>
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
              <h2 class="no-margin-bottom">수정 / 삭제</h2>
            </div>
          </header>
          <!-- Breadcrumb-->
          <div class ="tabList">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item">
                <p class="nav-link" id="user" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">User</p>
              </li>
              <li class="nav-item">
                <p class="nav-link" id="pet" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="false">Pet</p>
              </li>
              <li class="nav-item">
			    <p class="nav-link" id="visitor" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Visitor</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="reservation" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Reservation</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="employee" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Employee</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="department" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Department</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="position" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Position</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="room" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Room</p>
			  </li>
			  <li class="nav-item">
			    <p class="nav-link" id="size" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Size</p>
			  </li>
            </ul>
          </div>

          <section class="tables">
            <div class="container-fluid">
              <div class="row">
                <div class="col-lg-12">
                  <div class="card">
                  
                    <div class="card-header d-flex align-items-center" id="tableName"></div>
                    
                    <div class="card-body">
                      <div class="table-responsive" id="adminList"></div>
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
            </div>
          </footer>
        </div>
      </div>
    </div>


    <script type="text/javascript">
    	function insertRemove(){
    		$('#petInsert').remove();
      		$('#userInsert').remove();
    		$('#positionInsert').remove();
    		$('#departmentInsert').remove();
    		$('#reservationInsert').remove();
    		$('#roomInsert').remove();
    		$('#sizeInsert').remove();
    		$('#employeeInsert').remove();
    		$('#visitorInsert').remove();
    	}
    </script>
    <!-- JavaScript files-->
    <script src="view/admin/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="view/admin/vendor/chart.js/Chart.min.js"></script>
    <script src="view/admin/vendor/jquery/jquery.min.js"></script>
    <script src="view/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="view/admin/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="view/admin/js/front.js"></script>
	
	<!-- 관리자 js files -->
	<script type="text/javascript" src="view/admin/js/userAdminPage.js"></script>
    <script type="text/javascript" src="view/admin/js/petAdminPage.js"></script>
    <script type="text/javascript" src="view/admin/js/positionAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/departmentAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/reservationAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/roomAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/sizeAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/employeeAdminPage.js"></script>
	<script type="text/javascript" src="view/admin/js/visitorAdminPage.js"></script>
  </body>
</html>
