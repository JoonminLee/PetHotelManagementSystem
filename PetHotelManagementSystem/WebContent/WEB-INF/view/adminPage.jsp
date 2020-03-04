<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<style type="text/css">
table, tr, td {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}

td{
	padding : 5px;	
}

input{width: 100px; margin:5px;}

.visibility{
	visibility:hidden;
	width: 0px;
	}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>adminPage.jsp</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="view/admin/petAdminPage.js"></script>
<script type="text/javascript" src="view/admin/userAdminPage.js"></script>
<script type="text/javascript" src="view/admin/positionAdminPage.js"></script>
<script type="text/javascript" src="view/admin/departmentAdminPage.js"></script>
<script type="text/javascript" src="view/admin/reservationAdminPage.js"></script>
<script type="text/javascript" src="view/admin/roomAdminPage.js"></script>
<script type="text/javascript" src="view/admin/sizeAdminPage.js"></script>
<script type="text/javascript" src="view/admin/employeeAdminPage.js"></script>

</head>
<body>
	<h2>관리자페이지</h2>
	<hr>
	<div class="tab">
		<button class="tablinks" id="user">user</button>
		<button class="tablinks" id="pet">pet</button>
		<button class="tablinks" id="position">position</button>
		<button class="tablinks" id="department">department</button>
		<button class="tablinks" id="reservation">reservation</button>
		<button class="tablinks" id="room">room</button>
		<button class="tablinks" id="size">size</button>
		<button class="tablinks" id="employee">employee</button>
		<button class="tablinks" id="visitor">visitor</button>
	</div>
	
	<hr>
	<div id ="adminInsert"></div>
	
	<hr>
	<div id="adminList"></div>


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
	
	$(function() {
		
		//visitor
		$("#visitor").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/visitor/selectAllVisitor",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>vNum</td><td>vId</td><td>vEmail</td><td>vFrom</td><td>vRoom</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].vNum+'</td><td>'+ result[i].vId+'</td><td>'+ result[i].vEmail+'</td><td>'+ result[i].vFrom+'</td><td>'+ result[i].vRoom+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
	});
</script>
</html>