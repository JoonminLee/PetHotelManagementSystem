$(function(){
	$("#roomList").ready(function() {
		
		// roomSelect메소드
		$.ajax({
			url : "room/selectAllRoom",
			dataType : "json",
			type : "post",
			success : function(result) {
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>방번호</td><td>상태</td></tr>';
			
			for(var i=0; i<result.length; i++){
				
				if(result[i].rStatus==0){
					makeTable.innerHTML += '<tr><td>'+ result[i].rNum+'</td><td style="background: #2ECC71; border-radius: 50%"></td></tr>';
				}else if(result[i].rStatus==1){
					makeTable.innerHTML += '<tr><td>'+ result[i].rNum+'</td><td style="border-radius:50%" class="icon bg-red"></td></tr>';
				}else{
					makeTable.innerHTML += '<tr><td>'+ result[i].rNum+'</td><td style="background: #F4D03F; border-radius: 50%"></td></tr>';
				}
			}

			$('#roomList').append(makeTable);
			}
		
		})
		
	});
	
		$("#fileUploadBtn").on("click", function() {
		var files = $("input[name='filezData']")[0].files;
		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
			formData.append("filezData", files[i]);
		}
		$.ajax({
			url : "/adminHome",
			processData : false,
			contentType : false,
			data : formData,
			type : "post",
			dataType : "text",
			success : function(result) {
				alert("업로드 성공");
				location.href="/adminHome";
			}
		});
	});
});
