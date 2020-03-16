<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- JqueryCDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>adminProfilePhoto</title>
</head>
<body>
	<div>
		<input type="file" name="filezData" multiple>
	</div>
	<button id="fileUploadBtn">사진수정</button>
</body>
<script type="text/javascript">
$(function(){	

	$("#fileUploadBtn").on("click", function() {
	
		var files = $("input[name='filezData']")[0].files;
		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
			formData.append("filezData", files[i]);
		}
		$.ajax({
			url : "/adminProfilePhoto",
			processData : false,
			contentType : false,
			data : formData,
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("업로드 성공");
				opener.window.location="/adminHome";
				close();
			}
		});
	});
});
</script>
</html>