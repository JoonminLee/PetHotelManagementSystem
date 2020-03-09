$(function(){
	$("#visitor").click(function() {
		
		//메소드 실행.
		visitorAdmin();
		
		//visitor select메소드
		function selectVisitor(result){
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>vNum</td><td>vId</td><td>vName</td><td>vEmail</td><td>vFrom</td><td>vRoom</td><td>관리</td></tr>';
			
			console.log(result.length);
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].vNum+'</td><td>'+ result[i].vId+'</td><td>'+ result[i].vName+'</td><td>'+ result[i].vEmail+'</td><td>'+ result[i].vFrom+'</td><td>'+ result[i].vRoom+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
		 	console.log(makeTable);
			$('#adminList').append(makeTable);
		
		}
		
		//visitor CRUD메소드
		function visitorAdmin(){
			
			insertRemove();
			
			//select
			$.ajax({
				url : "visitor/selectAllVisitor",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectVisitor(result);
					
					//버튼 정의.
					var updateBtn = $("input[name='updateBtn']");
					var deleteBtn = $("input[name='deleteBtn']");
					var updateOkBtn = $("input[name='updateOkBtn']");
					var cencleBtn = $("input[name='cencleBtn']");
					
					//수정버튼 클릭 시,
					$("input[name='updateBtn']").click(function(){
						
						//해당 레이어를 제외한 나머지 버튼은 이벤트 제거.
						var thisNotUpdateBtn = $("input[name='updateBtn']").not($(this));
						var thisNotDeleteBtn = $("input[name='deleteBtn']").not($(this));
						thisNotUpdateBtn.off();
						thisNotDeleteBtn.off();
						
						this.classList.add('visibility'); //수정버튼 안보이게
						this.parentElement.childNodes[1].classList.add('visibility'); //삭제버튼 안보이게
						
						this.parentElement.childNodes[2].classList.remove('visibility'); //수정완료버튼 보이게
						this.parentElement.childNodes[3].classList.remove('visibility'); //취소버튼 보이게
						//클릭버튼 부모의 부모(tr)을 변수에 담기.
						var Tr = this.parentElement.parentElement;
						var updateTdSize = Tr.childElementCount-1; //6-1
						
						//아이작을 이용해 기존값을 가져온다.
						var vId = Tr.childNodes[1].innerHTML;
						
						$.ajax({
							url :"visitor/updateVisitor",
							data : {"vId" : vId},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="vId" value="'+result.vId+'" readonly>';
								Tr.childNodes[2].innerHTML ='<input type="text" id ="vName" value="'+result.vName+'">';
								Tr.childNodes[3].innerHTML ='<input type="text" id ="vEmail" value="'+result.vEmail+'">';
								Tr.childNodes[4].innerHTML ='<input type="text" id ="vFrom" value="'+result.vFrom+'">';
								Tr.childNodes[5].innerHTML ='<input type="number" id ="vRoom" value="'+result.vRoom+'" >';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){

							var vId = $("#vId").val();
							var vName = $("#vName").val();
							var vEmail = $("#vEmail").val();
							var vFrom = $("#vFrom").val();
							var vRoom = $("#vRoom").val();
							
							console.log("vId ::: ",vId);
							console.log("vName :::", vName);
							console.log("vEmail ::: ",vEmail);
							console.log("vFrom ::: ",vFrom);
							console.log("vRoom ::: ",vRoom);
							
							$.ajax({
								url :"visitor/updateVisitor",
								data : {"vId" : vId, "vName" : vName, "vEmail" : vEmail, "vFrom" : vFrom, "vRoom" : vRoom},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectVisitor(result);
									visitorAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "visitor/selectAllVisitor",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectVisitor(result);
									visitorAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var vId = Tr.childNodes[1].innerHTML;
						$.ajax({
							url :"visitor/deleteVisitor",
							data : {"vId" : vId},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectVisitor(result);
								visitorAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
