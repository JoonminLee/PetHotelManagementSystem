<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
table, tr, td {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}
</style>

<meta charset="UTF-8">
<title>selectAllReserve.jsp</title>
</head>
<body>
	<fieldset>
		<legend>예약리스트</legend>
		<table>
			<tr>
				<td>reNum</td><td>reId</td><td>rePhone</td><td>reSNum</td><td>reRNum</td><td>reCheckIn</td><td>reCheckOut</td><td>관리</td>
			</tr>
			<c:forEach var="i" items="${listReserve }">
				<tr>
					<td>${i.reNum }</td>
					<td>${i.reId }</td>
					<td>${i.rePhone }</td>
					<td>${i.reSNum }</td>
					<td>${i.reRNum }</td>
					<td>${i.reCheckIn }</td>
					<td>${i.reCheckOut }</td>
					<td><a href="/reserve/updateReserve?reId=${i.reId }">수정</a> <a
						href="/reserve/deleteReserve?reId=${i.reId }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</body>
</html>