<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 

<!-- CSS -->
<link rel="stylesheet" href="/css/admin_css/admin.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">

<html>
<head>
<meta charset="UTF-8">
<title>adminPage.jsp</title>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="view/admin/userAdminPage.js"></script>
<script type="text/javascript" src="view/admin/petAdminPage.js"></script>
<script type="text/javascript" src="view/admin/positionAdminPage.js"></script>
<script type="text/javascript" src="view/admin/departmentAdminPage.js"></script>
<script type="text/javascript" src="view/admin/reservationAdminPage.js"></script>
<script type="text/javascript" src="view/admin/roomAdminPage.js"></script>
<script type="text/javascript" src="view/admin/sizeAdminPage.js"></script>
<script type="text/javascript" src="view/admin/employeeAdminPage.js"></script>
<script type="text/javascript" src="view/admin/visitorAdminPage.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="wrapper">
	<!-- navbar -->
		<nav class="navbar navbar-dark bg-dark"><span>Admin</span></nav>
		
		<!-- 관리자box -->
		<div id="admin">
			<div id="infor">
				<img src="/images/admin.png"><br>
				<br>
				<div id="">이름</div>
				<div id="">부서</div>
				<div id="">Associate</div>			
			</div>
		</div>
		
		<div class="adminTabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item">
			    <a class="nav-link" id="user" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">User</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="pet" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="false">Pet</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="vistior" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Vistior</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="reservation" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Reservation</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="employee" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Employee</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="department" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Department</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="position" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Position</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="room" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Room</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="size" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">Size</a>
			  </li>
			</ul>
		</div>
		<br>
	
		<div id ="adminInsert"></div>
			
		<div id="adminList"></div>
	</div>

</body>

<script type="text/javascript">
	
	function insertRemove(){
		
		$('#userInsert').remove();
		$('#petInsert').remove();
		$('#positionInsert').remove();
		$('#departmentInsert').remove();
		$('#reservationInsert').remove();
		$('#roomInsert').remove();
		$('#sizeInsert').remove();
		$('#employeeInsert').remove();
		$('#visitorInsert').remove();
		
	}
</script>
</html>