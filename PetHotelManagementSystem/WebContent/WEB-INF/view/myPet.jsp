<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my Pet</title>
</head>
<body>
<form action="/my/insertMyPet" method="post">
	<div>
		펫 이름 : <input type="text" name="pName" placeholder="백구, 인절미, 레오.."><br>
		펫 종류 : <input type="text" name="pType" placeholder="요크셔테리어, 불독, 말티즈, 골든리트리버.."><br>	
		<input type="submit" value="반려동물 등록">
	</div>
</form>
</body>
</html>