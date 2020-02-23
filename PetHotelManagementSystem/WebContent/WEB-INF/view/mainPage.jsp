<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>mainPage</title>
</head>
<body>
	<form action="/room/selectAllRoom" method="post">
		<input id="reCheckInDate" type="date" name="reCheckIn">
		<input id="reCheckOutDate" type="date" name="reCheckOut">
		<input type="number" min="0" max="9" name="numOfPeople">
		<input type="number" min="0" max="9" name="numOfPets">
		<input type="submit" value="Check Availability">
	</form>
</body>
<script type="text/javascript">
	$(function(){
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		
		if(month < 10) month = "0" + month;
	    if(date < 10) date = "0" + date;
		
	$("#reCheckInDate").attr('min', year + "-" + month + "-" + date);
	$("#reCheckInDate").val(year + "-" + month + "-" + date);
	
	$("#reCheckOutDate").attr('min', $("#reCheckInDate").val());
	});
</script>
</html>