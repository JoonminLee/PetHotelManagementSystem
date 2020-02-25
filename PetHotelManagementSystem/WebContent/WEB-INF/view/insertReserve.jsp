<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String rNum = request.getParameter("rNum"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertReserve</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="/reserve/insertReserve" method="post">
		<input type="text" name="reId" placeholder="예약자">
		<input type="text" value="010" readonly> - <input type="text" name="uPhone1"> - <input type="text" name="uPhone2">
		<input type="number" name="reSNum" min=1 max=7 placeholder="방사이즈넘버">
		<input type="number" name="reRNum" placeholder="방번호" value="<%=rNum %>" readonly>
		<input id="reCheckInDate" type="date" name="reCheckInStr">
		<input id="reCheckOutDate" type="date" name="reCheckOutStr">
		<input type="submit" value="예약완료">
	</form>
</body>
<script type="text/javascript">
	$(function() {

		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();

		if (month < 10)	month = "0" + month;
		if (date < 10) date = "0" + date;

		$("#reCheckInDate").attr('min', year + "-" + month + "-" + date);
		$("#reCheckInDate").val(year + "-" + month + "-" + date);

		today.setDate(today.getDate() + 1);

		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		
		if (month < 10)	month = "0" + month;
		if (date < 10) date = "0" + date;

		$("#reCheckOutDate").attr('min', year + "-" + month + "-" + date);
	});
</script>
</html>