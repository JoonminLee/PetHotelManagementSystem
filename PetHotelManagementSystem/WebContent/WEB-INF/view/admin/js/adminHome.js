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
			
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr class="bg_gray"><td>방번호</td><td>'+result[i].rNum+'</td><td>'+result[i+1].rNum+'</td><td>'+result[i+2].rNum+'</td><td>'+result[i+3].rNum+'</td><td>'+result[i+4].rNum+'</td><td>'+result[i+5].rNum+'</td><td>'+result[i+6].rNum+'</td><td>'+result[i+7].rNum+'</td><td>'+result[i+8].rNum+'</td></tr>';
				makeTable.innerHTML += '<tr class="status"><td>Status</td><td name="status">'+result[i].rStatus+'</td><td name="status">'+result[i+1].rStatus+'</td><td>'+result[i+2].rStatus+'</td><td>'+result[i+3].rStatus+'</td><td>'+result[i+4].rStatus+'</td><td>'+result[i+5].rStatus+'</td><td>'+result[i+6].rStatus+'</td><td>'+result[i+7].rStatus+'</td><td>'+result[i+8].rStatus+'</td></tr>';
				i +=8;	
			}
			
			$('#roomList').append(makeTable);
			}
		
		})
		
	});
	
		$.photoUpload = function() {
			window.open("/adminProfilePhoto","사진수정","scrollbars=no, width=600, height=400, menubar=false");
	}
});
