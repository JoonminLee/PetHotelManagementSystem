<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 4</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
p {
	margin: 20px 0px;
}
</style>
<title>selectAllAvailable</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<p>사용가능한 방</p>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#bothOk">사람+반려동물</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#personOnly">사람만</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#petOnly">동물만</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="bothOk">
							사람과 반려동물이 사용할 수 있는 방 리스트
						<p>
							<c:forEach var="i" items="${listBothOkRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
					<div class="tab-pane fade" id="personOnly">
							사람만 사용할 수 있는 방 리스트
						<p>
							<c:forEach var="i" items="${listPersonOnlyRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
					<div class="tab-pane fade" id="petOnly">
							케이지 방 리스트
						<p>
							<c:forEach var="i" items="${listPetOnlyRoom }">
								${i.toString() }
								<br>
								<a href="/reserve/insertReserve?rNum=${i.rNum }">예약</a>
								<hr>
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</html>