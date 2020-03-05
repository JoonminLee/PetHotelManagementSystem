<%@page import="org.springframework.ui.Model"%>
<%@page import="phms.dto.VisitorDto"%>
<%@page import="phms.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
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
	var makeTable = document.createElement('table');
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
					makeTable = document.createElement('table');
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
										$("#but2").attr('style','display: none');
										$("#but").removeAttr("style");
										location.href="/my/myPage";
										},
									error : function(e){
										console.log(e);
										}
									})
								})
							}	
						}
							else{
								if(a == 1){
									console.log("여기까지옴2?");
									makeTable.remove();
									makeTable = document.createElement('table');
									makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.vId+'</td></tr>';
									makeTable.innerHTML += '<tr><td>회원 닉네임</td><td><input type="text" name="vName"></td></tr>';
									makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.vEmail+'</td></tr>';
									makeTable.innerHTML += '<tr><td>회원 경로</td><td>'+result.vFrom+'</td></tr>';
									$("#show").append(makeTable);
									console.log(makeTable);
									a = 0;	
									$("#but").attr('style','display: none');
									$("#but2").removeAttr("style");
									$("#but2").click(function(){
										var vName = $("input[name='vName']").val();
										$.ajax({
											url : "${pageContext.request.contextPath}/my/changeVisitor",
											dataType : "json",
											type : "post",
											data : {"vId" : "<%=(String) session.getAttribute("id")%>", 
													"vName" : vName},
										success : function(result){
											if(a == 0){												
												makeTable.remove();
												makeTable = document.createElement('table');
												makeTable.innerHTML += '<tr><td>회원 아이디</td><td>'+result.vId+'</td></tr>';
												makeTable.innerHTML += '<tr><td>회원 닉네임</td><td>'+result.vName+'</td></tr>';
												makeTable.innerHTML += '<tr><td>회원 이메일</td><td>'+result.vEmail+'</td></tr>';
												makeTable.innerHTML += '<tr><td>회원 경로</td><td>'+result.vFrom+'</td></tr>';
												$("#show").append(makeTable);
												a == 1;
												}
											alert("수정완료");	
											$("#but2").attr('style','display: none');
											$("#but").removeAttr("style");
											location.href="/my/myPage";
											},
										error : function(e){
											console.log(e);
											}
										})
									})
								}
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
<%String a = (String)session.getAttribute("from");%>
	<%=(String) session.getAttribute("from")%>
	<button id="userUpdate">회원정보 수정</button>
	<button id="reserveCheck">예약 조회</button>
	<hr>
	<div id="show">
			<h2>회원 정보</h2>
		<%if(a.equals("phms")){
			%>
	<table>
		<tr><td>회원 아이디</td><td>${user.uId}</td></tr>
		<tr><td>회원 이름</td><td>${user.uName}</td></tr>
		<tr><td>회원 전화번호</td><td>${user.uPhone}</td></tr>
		<tr><td>회원 이메일</td><td>${user.uEmail}</td></tr>
		<tr><td>회원 생년월일</td><td>${user.uBirth.year}-${user.uBirth.monthValue }-${user.uBirth.dayOfMonth }</td></tr>				
	</table><br>
		<hr>			
			<%
		}else{
		%>
	<table>
		<tr><td>회원 아이디</td><td>${visitor.vId}</td></tr>
		<tr><td>회원 이름</td><td>${visitor.vName}</td></tr>
		<tr><td>회원 이메일</td><td>${visitor.vEmail}</td></tr>
		<tr><td>회원 경로</td><td>${visitor.vFrom}</td></tr>						
	</table><br>
		<hr>
		<%
		}%>
			<h2>예약 정보</h2>
		<%if(a.equals("phms")){
			%>
			<table>
				<tr><td>예약자</td><td>${userRoom.uName }</td></tr>
				<tr><td>예약자 전화번호</td><td>${userRoom.uPhone }</td></tr>
				<tr><td>예약자 방번호</td><td>${userRoom.uRNum }번방</td></tr>
				<tr><td>예약자 방이름</td><td>${userRoom.sSize }</td></tr>
				<tr><td>예약자 입실날짜</td><td>${userRoom.reCheckIn }</td></tr>
				<tr><td>예약자 퇴실날짜</td><td>${userRoom.reCheckOut }</td></tr>
			</table>
			<%
		}else{
		%>
			<table>
				<tr><td>예약자</td><td>${visitorRoom.vName }</td></tr>
				<tr><td>예약자 전화번호</td><td>${visitorRoom.rePhone }</td></tr>
				<tr><td>예약자 방번호</td><td>${visitorRoom.vRoom }번방</td></tr>
				<tr><td>예약자 방이름</td><td>${visitorRoom.sSize }</td></tr>
				<tr><td>예약자 입실날짜</td><td>${visitorRoom.reCheckIn }</td></tr>
				<tr><td>예약자 퇴실날짜</td><td>${visitorRoom.reCheckOut }</td></tr>
			</table>
		<%
		}%>
	</div>
	<div id="but" style="display: none;">
		<button id="updat">수정</button>
	</div>
	<div id="but2" style="display: none;">
		<button id="updatCheck">수정 완료</button>
	</div>
</body>
</html>