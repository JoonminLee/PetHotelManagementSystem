<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.setAttribute("id", request.getAttribute("id"));
	session.setAttribute("from", request.getAttribute("from"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function gogo(){
	alert("<%=(String) session.getAttribute("id")%>님 로그인 성공");
	location.href="/main/mainPage"
	}	
</script>
<title>sessionLogin</title>
</head>
<body onload="gogo()">
</body>
</html>