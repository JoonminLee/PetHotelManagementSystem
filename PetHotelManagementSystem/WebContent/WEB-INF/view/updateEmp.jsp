<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateEmp</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#eDNum option[value='${employee.eDNum}'").attr("selected", true);
    $("#ePoNum option[value='${employee.ePoNum}'").attr("selected", true);
});
</script>
<body>
	<form action="/emp/updateEmp" method="post">
		<input type="text" name="eNum" value="${employee.eNum }" readonly>
		<select id="eDNum" name="eDNum">
			<option value="1">사무관리부</option>
			<option value="2">객실관리부</option>
		</select>
		<select id="ePoNum" name="ePoNum">
			<option value="1">관리자</option>
			<option value="2">영업부</option>
			<option value="3">총무부</option>
			<option value="4">리셉션</option>
			<option value="5">미화부</option>
			<option value="6">마케팅부</option>
		</select>
		<input type="text" name="eName" value="${employee.eName }">
		<input type="text" name="ePhone" value="${employee.ePhone }">
		<input type="date" name="eHireDateStr" value="${employee.eHireDate }">
		<input type="text" name="eSalary" value="${employee.eSalary }">
		<input type="submit" value="사원수정">
	</form>
</body>
</html>