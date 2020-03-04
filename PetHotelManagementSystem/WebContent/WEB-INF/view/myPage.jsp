<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.setAttribute("uId", request.getAttribute("uId"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
table, tr, td {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var a = 0;
	$("#userUpdate").click(function(){
		if(a == 0){
			$.ajax({			
				url : "${pageContext.request.contextPath}/my/selectOneVisitor",
				dataType : "json",
				type : "post",
				data : {"id" : "<%=(String) session.getAttribute("id")%>", 
					"from" : "<%=(String) session.getAttribute("from")%>"},
				success : function(result) {
					a = 1;
					var makeTable = document.createElement('table');
					if("<%=(String) session.getAttribute("from")%>" == ("phms")){
						
						makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.uId+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 비밀번호</td><td><button id="change">비밀번호 변경</button></td></tr>';
						makeTable.innerHTML += '<tr><td>회원 이름</td><td>'+result.uName+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 전화번호</td><td>'+result.uPhone+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.uEmail+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 생년월일</td><td>'+result.uBirth.year+'-'+result.uBirth.monthValue+'-'+result.uBirth.dayOfMonth+'</td></tr>';
					
												
					}else{
						
						makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.vId+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 닉네임</td><td>'+result.vName+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.vEmail+'</td></tr>';
						makeTable.innerHTML += '<tr><td>회원 경로</td><td>'+result.vFrom+'</td></tr>';
				
					}
								
					$("#show").append(makeTable);
					$("#but").removeAttr("style");
					$("#updat").click(function(){
						if("<%=(String) session.getAttribute("from")%>" == ("phms")){
							if(a == 1){
								makeTable.remove();
								makeTable = document.createElement('table');
								makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.uId+'</td></tr>';
								makeTable.innerHTML += '<tr><td>회원 비밀번호</td><td><button id="change">비밀번호 변경</button></td></tr>';
								makeTable.innerHTML += '<tr><td>회원 이름</td><td>'+result.uName+'</td></tr>';
								makeTable.innerHTML += '<tr><td>회원 전화번호</td><td><input type="text" name="uPhone" value="010" readonly> - <input type="text" maxlength="4" name="uPhone1"> - <input type="text" maxlength="4" name="uPhone2"></td></tr>';
								makeTable.innerHTML += '<tr><td>회원 이메일</td><td><input type="text" name="uEmail" placeholder="이메일 입력"></td></tr>';
								makeTable.innerHTML += '<tr><td>회원 생년월일</td><td>'+result.uBirth.year+'-'+result.uBirth.monthValue+'-'+result.uBirth.dayOfMonth+'</td></tr>';
								$("#show").append(makeTable);
								a = 0;	
								$("#but").attr('style','display: none');
								$("#but2").removeAttr("style");
								$("#but2").click(function(){
									var uPhone = $("input[name='uPhone']").val();
									var uPhone1 = $("input[name='uPhone1']").val();
									var uPhone2 = $("input[name='uPhone2']").val();
									var uEmail = $("input[name='uEmail']").val();
									$.ajax({
								
										url : "${pageContext.request.contextPath}/my/selectOneUser",
										dataType : "json",
										type : "post",
										data : {"uId" : "<%=(String) session.getAttribute("id")%>", 
												"uEmail" : uEmail,
												"uPhone" : uPhone,
												"uPhone1" : uPhone1,
												"uPhone2" : uPhone2
													},
									success : function(result) {
										alert("dd");
										if(a == 0){
											makeTable.remove();
											makeTable = document.createElement('table');
											makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.uId+'</td></tr>';
											makeTable.innerHTML += '<tr><td>회원 비밀번호</td><td><button id="change">비밀번호 변경</button></td></tr>';
											makeTable.innerHTML += '<tr><td>회원 이름</td><td>'+result.uName+'</td></tr>';
											makeTable.innerHTML += '<tr><td>회원 전화번호</td><td>'+result.uPhone+'</td></tr>';
											makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.uEmail+'</td></tr>';
											makeTable.innerHTML += '<tr><td>회원 생년월일</td><td>'+result.uBirth.year+'-'+result.uBirth.monthValue+'-'+result.uBirth.dayOfMonth+'</td></tr>';
											a == 1;
											$("#show").append(makeTable);
											console.log("여기까지옴?");
							
												}
										},
									error : function(e){
										console.log(e);
										}
									})
								})
							}	
						}
							else{
								
									console.log("여기까지옴?");
									makeTable.remove();
									makeTable = document.createElement('table');
									makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.vId+'</td></tr>';
									makeTable.innerHTML += '<tr><td>회원 닉네임</td><td><input type="text" name="vName"></td></tr>';
									makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.vEmail+'</td></tr>';
									makeTable.innerHTML += '<tr><td>회원 경로</td><td>'+result.vFrom+'</td></tr>';
									$("show").append(makeTable);
							
									var vName = $("input[name='vName']").val();
									$.ajax({
										url : "${pageContext.request.contextPath}/my/changeVisitor",
										dataType : "json",
										type : "post",
										data : {"vId" : "<%=(String) session.getAttribute("id")%>", 
												"vName" : vName},
									success : function(result){
										alert(result);	
										},
									error : function(e){
										console.log(e);
										}
									})
								
							}
						})						
				},
				error : function(e){
					console.log(e);
				}				
			})		
		}	
	})
})

</script>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	<button id="userUpdate">회원정보 수정</button>
	<button id="reserveCheck">예약 조회</button>
	<hr>
	<div id="show"></div>
	<div id="but" style="display: none;">
		<button id="updat">수정</button>
	</div>
	<div id="but2" style="display: none;">
		<button id="updatCheck">수정 완료</button>
	</div>
</body>
</html>