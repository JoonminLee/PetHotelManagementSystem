$(function(){
	$("#reservation").click(function() {
		
		//메소드 실행.
		reserveAdmin();
		
		//reservationSelect메소드
		function selectReserve(result){
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>reNum</td><td>reId</td><td>rePhone</td><td>reSNum</td><td>reRNum</td><td>reCheckIn</td><td>reCheckOut</td><td>관리</td></tr>';
			
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].reNum+'</td><td>'+ result[i].reId+'</td><td>'+ result[i].rePhone+'</td><td>'+ result[i].reSNum+'</td><td>'+ result[i].reRNum+
										'</td><td>'+ result[i].reCheckIn.year+'-'+result[i].reCheckIn.monthValue+'-'+result[i].reCheckIn.dayOfMonth+'</td><td>'+ 
										result[i].reCheckOut.year+'-'+result[i].reCheckOut.monthValue+'-'+result[i].reCheckOut.dayOfMonth+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
										'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
			$('#adminList').append(makeTable);
		
		}
		
		//reservation CRUD메소드
		function reserveAdmin(){
			
			insertRemove();
			
			//select
			$.ajax({
				url : "reserve/selectAllReserve",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectReserve(result);
					
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
						var reId = Tr.childNodes[1].innerHTML;
						
						$.ajax({
							url :"reserve/updateReserveAdmin",
							data : {"reId" : reId},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="reId" value="'+result.reId+'" readonly>';
								Tr.childNodes[2].innerHTML ='<input type="text" id ="rePhone" value="'+result.rePhone+'">';
								Tr.childNodes[3].innerHTML ='<input type="number" id ="reSNum" value="'+result.reSNum+'" readonly>';
								Tr.childNodes[4].innerHTML ='<input type="number" id ="reRNum" value="'+result.reRNum+'" >';
								Tr.childNodes[5].innerHTML ='<input type="date" id ="reCheckIn" value="'+result.reCheckIn+'">';
								Tr.childNodes[6].innerHTML ='<input type="date" id ="reCheckOut" value="'+result.reCheckOut+'">';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){

							var reId = $("#reId").val();
							var rePhone = $("#rePhone").val();
							var reSNum = $("#reSNum").val();
							var reRNum = $("#reRNum").val();
							var reCheckInStr = $("#reCheckIn").val();
							var reCheckOutStr = $("#reCheckOut").val();
							
							console.log("reId ::: ",reId);
							console.log("rePhone ::: ",rePhone);
							console.log("reSNum ::: ",reSNum);
							console.log("reRNum ::: ",reRNum);
							console.log("reCheckIn ::: ",reCheckInStr);
							console.log("reCheckOut ::: ",reCheckOutStr);
							
							$.ajax({
								url :"reserve/updateReserveAdmin",
								data : {"reId" : reId, "rePhone" : rePhone, "reSNum" : reSNum, "reRNum" : reRNum, "reCheckInStr" :reCheckInStr,
									"reCheckOutStr" : reCheckOutStr},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectReserve(result);
									reserveAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "reserve/selectAllReserve",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectReserve(result);
									reserveAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var reNum = Tr.childNodes[0].innerHTML;
						$.ajax({
							url :"reserve/deleteReserveAdmin",
							data : {"reNum" : reNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectReserve(result);
								reserveAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
