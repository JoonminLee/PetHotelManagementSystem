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
</style>

<html>
<head>
<meta charset="UTF-8">
<title>adminPage.jsp</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		
		//user
		$("#user").click(function() {
			
			//input창 추가.
			var makeInsert = document.createElement('form');
			$("p").remove();
			
			makeInsert.innerHTML = 
				'<p><input type="text" name="uId" placeholder="아이디 입력" required="required">'+
				'<input type="password" name="uPwd" placeholder="패스워드 입력">'+
				'<input type="text" name="uName" placeholder="이름 입력"><br>'+
				'<label><input type="radio" name="uGender" value="남">남</label>'+
				'<label><input type="radio" name="uGender" value="여">여</label><br>'+
				'<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="uPhone1"> - <input type="text" maxlength="4" name="uPhone2"><br>'+
				'<input type="text" name="uEmail" placeholder="이메일 입력">'+
				'<input type="date" name="uBirthStr"><br>'+
				'<input type="button" id="UserAddBtn"value="추가"><p>';
			
			console.log(makeInsert);
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#UserAddBtn").click(function(){
				
				var uId = $("input[name='uId']").val();
				var uPwd = $("input[name='uPwd']").val();
				var uName = $("input[name='uName']").val();
				var uGender = $("input[name='uGender']").val();
				var uPhone1 = $("input[name='uPhone1']").val();
				var uPhone2 = $("input[name='uPhone2']").val();
				var uEmail = $("input[name='uEmail']").val();
				var uBirthStr = $("input[name='uBirthStr']").val();
				
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/user/insertUser",
					data : {"uId" : uId, "uPwd" : uPwd, "uName" : uName, "uGender" :uGender, 
						"uPhone1" : uPhone1, "uPhone2" : uPhone2, "uEmail" : uEmail, "uBirthStr" :uBirthStr},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						//select
						$.ajax({
							url : "${pageContext.request.contextPath}/user/selectAllUser",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>uNum</td><td>uId</td><td>uPwd</td><td>uName</td><td>uGender</td><td>uPhone</td><td>uEmail</td><td>uBirth</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].uNum+'</td><td>'+ result[i].uId+'</td><td>'+ result[i].uPwd+'</td><td>'+ result[i].uName+'</td><td>'+ result[i].uGender+'</td><td>'+ result[i].uPhone+'</td><td>'+ result[i].uEmail+'</td><td>'+ 
								result[i].uBirth.year+'-'+result[i].uBirth.monthValue+'-'+result[i].uBirth.dayOfMonth+'</td><td>관리</td></tr>';
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
				url : "${pageContext.request.contextPath}/user/selectAllUser",
				dataType : "json",
				type : "post",
				success : function(result) {
				console.log(result[0]);
				
				$("table").remove();
				var makeTable = document.createElement('table');
				makeTable.innerHTML = '<tr><td>uNum</td><td>uId</td><td>uPwd</td><td>uName</td><td>uGender</td><td>uPhone</td><td>uEmail</td><td>uBirth</td><td>관리</td></tr>';
				
				console.log(result.length);
				for(var i=0; i<result.length; i++){
					makeTable.innerHTML += '<tr><td>'+ result[i].uNum+'</td><td>'+ result[i].uId+'</td><td>'+ result[i].uPwd+'</td><td>'+ result[i].uName+'</td><td>'+ result[i].uGender+'</td><td>'+ result[i].uPhone+'</td><td>'+ result[i].uEmail+'</td><td>'+ 
					result[i].uBirth.year+'-'+result[i].uBirth.monthValue+'-'+result[i].uBirth.dayOfMonth+'</td><td>관리</td></tr>';
				}
				
			 	console.log(makeTable);
				$('#adminList').append(makeTable);
				}
			});
		})
		
		
		//pet
		$("#pet").click(function() {
			
			//input창 추가.
			var makeInsert = document.createElement('form');
			$("input").remove();
			
			makeInsert.innerHTML = 
				'<input type="text" name="pName" placeholder="펫이름">'+
				'<input type="text" name="pType" placeholder="펫종류">'+
				'<input type="number" name="pUNum" placeholder="펫주인번호">'+
				'<input type="number" name="pVNum" placeholder="방문자번호">'+
				'<input type="button" id="PetAddBtn"value="추가">';
			
			console.log(makeInsert);
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#PetAddBtn").click(function(){
				var pName = $("input[name='pName']").val();
				var pType = $("input[name='pType']").val();
				var pUNum = $("input[name='pUNum']").val();
				var pVNum = $("input[name='pVNum']").val();
				
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"${pageContext.request.contextPath}/pet/insertPet",
					data : {"pName" : pName, "pType" : pType, "pUNum" : pUNum, "pVNum" :pVNum},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						/* select  */
						$.ajax({
							url : "${pageContext.request.contextPath}/pet/selectAllPet",
							dataType : "json",
							type : "post",
							success : function(result) {
							console.log(result[0]);
							
							$("table").remove();
							var makeTable = document.createElement('table');
							makeTable.innerHTML = '<tr><td>pNum</td><td>pName</td><td>pType</td><td>pUNum</td><td>pVNum</td><td>관리</td></tr>';
							
							console.log(result.length);
							for(var i=0; i<result.length; i++){
								makeTable.innerHTML += '<tr><td>'+ result[i].pNum+'</td><td>'+ result[i].pName+'</td><td>'+ result[i].pType+'</td><td>'+ result[i].pUNum+'</td><td>'+ result[i].pVNum+'</td><td>관리</td></tr>';
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
			
			
		/* select  */
		$.ajax({
			url : "${pageContext.request.contextPath}/pet/selectAllPet",
			dataType : "json",
			type : "post",
			success : function(result) {
			console.log(result[0]);
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>pNum</td><td>pName</td><td>pType</td><td>pUNum</td><td>pVNum</td><td>관리</td></tr>';
			
			console.log(result.length);
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].pNum+'</td><td>'+ result[i].pName+'</td><td>'+ result[i].pType+'</td><td>'+ result[i].pUNum+'</td><td>'+ result[i].pVNum+'</td><td>관리</td></tr>';
			}
			
		 	console.log(makeTable);
			$('#adminList').append(makeTable);
			}
		});
	})
		
		
		//position
		$("#position").click(function() {
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
		
	})
</script>
</html>