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
<script type="text/javascript" src="view/admin/petAdminPage.js?"></script>
<script type="text/javascript" src="view/admin/userAdminPage.js?"></script>
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
		$('#petInsert').remove	();
		$('#positionInsert').remove();
		$('#departmentInsert').remove();
		$('#reservationInsert').remove();
		$('#roomInsert').remove();
		$('#sizeInsert').remove();
		$('#employeeInsert').remove();
		$('#visitorInsert').remove();
		
	}
	
	$(function() {
		
		//position
		$("#position").click(function() {
			//input창 추가.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="positionInsert"><input type="text" name="poName" placeholder="poName">'+
				'<input type="button" id="PositionAddBtn"value="추가"></div>';
			
			console.log(makeInsert);
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#PositionAddBtn").click(function(){
				var poName = $("input[name='poName']").val();
				
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/posi/insertPosition",
					data : {"poName" : poName},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						/* select  */
						$.ajax({
							url : "${pageContext.request.contextPath}/posi/selectAllPosition",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>poNum</td><td>poName</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].poNum+'</td><td>'+ result[i].poName+'</td><td>관리</td></tr>';
							}
							
						 	console.log(makeTable);
							$('#adminList').append(makeTable);
							}
						});
						
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				})
				
			})
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/posi/selectAllPosition",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>poNum</td><td>poName</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].poNum+'</td><td>'+ result[i].poName+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		//department
		$("#department").click(function() {
			//input창 추가.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="departmentInsert"><input type="text" name="dName" placeholder="dName">'+
				'<input type="button" id="DepartmentAddBtn"value="추가"></div>';
			
			console.log(makeInsert);
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#DepartmentAddBtn").click(function(){
				var dName = $("input[name='dName']").val();
				
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/dep/insertDepartment",
					data : {"dName" : dName},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						/* select  */
						$.ajax({
							url : "${pageContext.request.contextPath}/dep/selectAllDepartment",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>dNum</td><td>dName</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].dNum+'</td><td>'+ result[i].dName+'</td><td>관리</td></tr>';
							}
							
						 	console.log(makeTable);
							$('#adminList').append(makeTable);
							}
						});
						
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				})
				
			})
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/dep/selectAllDepartment",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>dNum</td><td>dName</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].dNum+'</td><td>'+ result[i].dName+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		
		//reservation
		$("#reservation").click(function() {
			
			insertRemove();
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/reserve/selectAllReserve",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>reNum</td><td>reId</td><td>rePhone</td><td>reSNum</td><td>reRNum</td><td>reCheckIn</td><td>reCheckOut</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].reNum+'</td><td>'+ result[i].reId+'</td><td>'+ result[i].rePhone+'</td><td>'+ result[i].reSNum+'</td><td>'+ result[i].reRNum+
											'</td><td>'+ result[i].reCheckIn.year+'-'+result[i].reCheckIn.monthValue+'-'+result[i].reCheckIn.dayOfMonth+'</td><td>'+ 
											result[i].reCheckOut.year+'-'+result[i].reCheckOut.monthValue+'-'+result[i].reCheckOut.dayOfMonth+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		//room
		$("#room").click(function() {
			
			//input창 추가.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="roomInsert">'+
				'<input type="number" name="rSNum" min="1" max="7" placeholder="방사이즈">'+
				'<input type="number" name="rStatus" placeholder="0" readonly>'+
				'<input type="button" id="roomAddBtn"value="추가"></div>';
			
			console.log(makeInsert);	
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#roomAddBtn").click(function(){
				var rSNum = $("input[name='rSNum']").val();
				var rStatus = 0;
				
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/room/insertRoom",
					data : {"rSNum" : rSNum, "rStatus" : rStatus},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						//select
						$.ajax({
							url : "${pageContext.request.contextPath}/room/selectAllRoom",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>rNum</td><td>rSNum</td><td>rStatus</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].rNum+'</td><td>'+ result[i].rSNum+'</td><td>'+ result[i].rStatus+'</td><td>관리</td></tr>';
							}
							
						 	console.log(makeTable);
							$('#adminList').append(makeTable);
							}
						});
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				})
				
			})
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/room/selectAllRoom",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>rNum</td><td>rSNum</td><td>rStatus</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].rNum+'</td><td>'+ result[i].rSNum+'</td><td>'+ result[i].rStatus+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		//size
		$("#size").click(function() {
			
			//input창 추가.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="sizeInsert">'+
				'<input type="text" name="sSize" placeholder="방크기">'+
				'<input type="number" name="sRPrice" placeholder="평일요금">'+
				'<input type="number" name="sWPrice" placeholder="주말요금">'+
				'<input type="button" id="sizeAddBtn"value="추가"></div>'; 
			
			console.log(makeInsert);	
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#sizeAddBtn").click(function(){
				var sSize = $("input[name='sSize']").val();
				var sRPrice = $("input[name='sRPrice']").val();
				var sWPrice = $("input[name='sWPrice']").val();
				
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/size/insertSize",
					data : {"sSize" : sSize, "sRPrice" : sRPrice, "sWPrice" : sWPrice},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						//select
						$.ajax({
							url : "${pageContext.request.contextPath}/size/selectAllSize",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>sNum</td><td>sSize</td><td>sRPrice</td><td>sWPrice</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].sNum+'</td><td>'+ result[i].sSize+'</td><td>'+ result[i].sRPrice+'</td><td>'+ result[i].sWPrice+'</td><td>관리</td></tr>';
							}
							
						 	console.log(makeTable);
							$('#adminList').append(makeTable);
							}
						});
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				})
				
			})
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/size/selectAllSize",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>sNum</td><td>sSize</td><td>sRPrice</td><td>sWPrice</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].sNum+'</td><td>'+ result[i].sSize+'</td><td>'+ result[i].sRPrice+'</td><td>'+ result[i].sWPrice+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		//employee
		$("#employee").click(function() {
			
			//input창 추가.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="employeeInsert">'+
				'<input type="text" name="eNum" placeholder="사원번호 입력" readonly>'+
				'<input type="text" name="eName" placeholder="사원이름 입력">'+
				'<select name="eDNum">'+
					'<option value="1">사무관리부</option>'+
					'<option value="2">객실관리부</option>'+
				'</select>'+
				'<select name="ePoNum">'+
					'<option value="1">영업부</option>'+
					'<option value="2">총무부</option>'+
					'<option value="3">리셉션</option>'+
					'<option value="4">미화부</option>'+
					'<option value="5">마케팅부</option>'+	
					'<option value="6">관리자</option>'+
				'</select><br>'+
				'<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="ePhone1"> - <input type="text" maxlength="4" name="ePhone2">'+
				'<input type="date" name="eHireDateStr"><br>'+
				'<input type="number" name="eSalary" placeholder="월급">'+
				'<input type="button" id="EmployeeAddBtn"value="추가"></div>';
			
			console.log(makeInsert);	
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#EmployeeAddBtn").click(function(){
				//var eNum = $("input[name='eNum']").val(); 사원번호 AI
				var eNum = 0;
				var eName = $("input[name='eName']").val();
				var eDNum = $("select[name='eDNum']").val();	
				var ePoNum = $("select[name='ePoNum']").val();
				var ePhone1 = $("input[name='ePhone1']").val();
				var ePhone2 = $("input[name='ePhone2']").val();
				var eHireDateStr = $("input[name='eHireDateStr']").val();
				var eSalary = $("input[name='eSalary']").val();
				
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/emp/insertEmp",
					data : {"eNum" : eNum, "eName" : eName, "eDNum" : eDNum, "ePoNum" : ePoNum,
						"ePhone1" : ePhone1, "ePhone2" : ePhone2, "eHireDateStr" : eHireDateStr, "eSalary" : eSalary},
					dataType : "json", 
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						//select
						$.ajax({
							url : "${pageContext.request.contextPath}/emp/selectAllEmp",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>eNum</td><td>eName</td><td>eDNum</td><td>ePoNum</td><td>ePhone</td><td>eHireDate</td><td>eSalary</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].eNum+'</td><td>'+ result[i].eName+'</td><td>'+ result[i].eDNum+'</td><td>'+ result[i].ePoNum+'</td><td>'+ result[i].ePhone+
								'</td><td>'+ result[i].eHireDate.year+'-'+result[i].eHireDate.monthValue+'-'+result[i].eHireDate.dayOfMonth+'</td><td>'+ result[i].eSalary+'</td><td>관리</td></tr>';
							}
							
						 	console.log(makeTable);
							$('#adminList').append(makeTable);
							}
						});
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				})
				
			})
			
			//select
			$.ajax({
				url : "${pageContext.request.contextPath}/emp/selectAllEmp",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>eNum</td><td>eName</td><td>eDNum</td><td>ePoNum</td><td>ePhone</td><td>eHireDate</td><td>eSalary</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].eNum+'</td><td>'+ result[i].eName+'</td><td>'+ result[i].eDNum+'</td><td>'+ result[i].ePoNum+'</td><td>'+ result[i].ePhone+
					'</td><td>'+ result[i].eHireDate.year+'-'+result[i].eHireDate.monthValue+'-'+result[i].eHireDate.dayOfMonth+'</td><td>'+ result[i].eSalary+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
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