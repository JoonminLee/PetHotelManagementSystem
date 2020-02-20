<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Pet정보입력 -->
	<form action="/size/insertSize" method="post">
		<fieldset>
			<legend>Size</legend>
			<input type="text" name="sSize" placeholder="방크기"> 
			<input type="number" name="sRPrice" placeholder="평일요금"> 
			<input type="number" name="sWPrice" placeholder="주말요금"> 
			<input type="submit" value="추가">
		</fieldset>
	</form>
</body>
</html>