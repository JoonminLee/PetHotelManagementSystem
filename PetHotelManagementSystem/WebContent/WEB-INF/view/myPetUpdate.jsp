<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPetUpdate</title>
	
<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#myPetUpdate").on("click", function() {
		var pNum = $("input[name='pNum']").val();
		var pName = $("input[name='pName']").val();
		var pType = $("input[name='pType']").val();
		var pUNum = $("input[name='pUNum']").val();
		var pVNum = $("input[name='pVNum']").val();
		var pPhoto = $("input[name='pPhoto']").val();
		$.ajax({
			url : "/my/myPetUpdate",
			data : {"pNum":pNum, "pName":pName, "pType":pType, "pUNum":pUNum, "pVNum":pVNum, "pPhoto":pPhoto },
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("수정 성공");
				opener.window.location="/my/myPage01";
				close();
			}
		});
	});
	$("#myPetDelete").on("click",function(){
		var pNum = $("input[name='pNum']").val();
		$.ajax({
			url : "/my/myPetDelete",
			data : {"pNum":pNum},
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("삭제 성공");
				opener.window.location="/my/myPage01";
				close();
			}
		});
	});
});
</script>
<body>
<form>
	<div>
		<input type="hidden" name="pNum" value="${pet.pNum }">
		펫 이름 : <input type="text" name="pName" value="${pet.pName }"><br>
		펫 종류 : <input type="text" name="pType" value="${pet.pType }"><br>
		<input type="hidden" name="pUNum" value="${pet.pUNum }">
		<input type="hidden" name="pVNum" value="${pet.pVNum }">
		<input type="hidden" name="pPhoto" value="${pet.pPhoto }">
		<input id="myPetUpdate" type="button" value="반려동물 정보 수정">
	</div>
</form>
<form>
	<input type="hidden" name="pNum" value="${pet.pNum }">
	<input id="myPetDelete" type="button" value="반려동물  정보 삭제">
</form>
</body>
</html>