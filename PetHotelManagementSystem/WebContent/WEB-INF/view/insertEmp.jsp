<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertEmp</title>
</head>
<body>
	<form action="/emp/insertEmp" method="post">
		<input type="text" name="eNum" placeholder="사원번호 입력">
		<select name="eDNum">
			<option value="1">사무관리부</option>
			<option value="2">객실관리부</option>
		</select>
		<select name="ePoNum">
			<option value="1">관리자</option>
			<option value="2">영업부</option>
			<option value="3">총무부</option>
			<option value="4">리셉션</option>
			<option value="5">미화부</option> 
			<option value="6">마케팅부</option>	
		</select>
		<input type="text" name="eName" placeholder="사원이름 입력">
		<input type="text" value="010" readonly> - <input type="text" name="ePhone1"> - <input type="text" name="ePhone2">
		<input type="date" name="eHireDateStr">
		<input type="number" name="eSalary">
		<input type="submit" value="사원등록">
	</form>
</body>
</html>