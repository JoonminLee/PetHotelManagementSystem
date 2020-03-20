<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPet</title>
<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#insertMyPet").on("click",function(){
		var pName = $("input[name='pName']").val();
		var pType = $("input[name='pType']").val();
		$.ajax({
			url : "/my/insertMyPet",
			data : {"pName":pName, "pType":pType},
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("추가 성공");
				opener.window.location="/my/myPage01";
				close();
			}
		});
	});
});
</script>
<form action="/my/insertMyPet" method="post">
	<div>
		펫 이름 : <input type="text" name="pName" placeholder="백구, 인절미, 레오.."><br>
		펫 종류 : <input type="text" name="pType" placeholder="요크셔테리어, 불독, 말티즈, 골든리트리버.."><br>	
		<input id="insertMyPet" type="button" value="반려동물 등록">
	</div>
</form>
</body>
</html>