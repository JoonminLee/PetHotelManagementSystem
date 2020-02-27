$(function(){
	$("#pet").click(function() {
		
		//select&update 메소드 
		function selectAllpet(){
			
			
			$.ajax({
				url : "pet/selectAllPet",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					$("table").remove();
					var makeTable = document.createElement('table');
					
					//tr의 갯수
					var makeTableSize = makeTable.childElementCount; //8
					
					makeTable.innerHTML = '<tr><td>pNum</td><td>pName</td><td>pType</td><td>pUNum</td><td>pVNum</td><td>관리</td></tr>';
				
					for(var i=0; i<result.length; i++){
						makeTable.innerHTML += '<tr><td>'+ result[i].pNum+'</td><td>'+ result[i].pName+'</td><td>'+ result[i].pType+'</td><td>'+ result[i].pUNum+
						'</td><td>'+ result[i].pVNum+'</td><td><input type="button" name="updateBtn" id="updateBtn" value="수정">&nbsp;<input type="button" name="deleteBtn" id="deleteBtn" value="삭제"></td></tr>';
					}
				
					$('#adminList').append(makeTable);

					//update		
					//수정버튼 클릭 시,
					$("input[id='updateBtn']").click(function(){
						
						var updateBtn = $("input[name='updateBtn']").val();
						//클릭버튼 부모의 부모(tr)을 변수에 담기.
						var updateTr = this.parentElement.parentElement;
						var updateTdSize = updateTr.childElementCount-1; //6-1
						
						//수정버튼 클릭시 헤당 레이어 수정완료 버튼으로 변경x
						var updateBtn = this;
						updateBtn.setAttribute("id", "updateOkBtn");
						updateBtn.setAttribute("value", "수정완료")
						
						//삭제버튼 클릭시 헤당 레이어 취소버튼으로 변경
						var deleteBtn = this.parentElement.childNodes[2];
						deleteBtn.setAttribute("id", "cencelBtn");
						deleteBtn.setAttribute("value", "취소");

						//1은 pk값이므로 변경하지 못하게 막는다.
						//부모의 자식들의 개수만큼 반복
						for(var i=1; i<updateTdSize; i++){
							
							//부모의 자식들의 개수만큼 반복하여 input창을 생성 후 기존 값을 담아 줌.
							var BeforeText = updateTr.childNodes[i].innerText;
							updateTr.childNodes[i].innerHTML ='<input type="text" id ="inputBox" value="'+BeforeText+'">';
							
							//미완성
							//수정완료버튼 클릭시 ajax으로 데이터 전송 후 다시 select
							$("#updateOkBtn").click(function(){
				
								//수정버튼 클릭시 헤당 레이어 수정완료 버튼으로 변경
								var updateBtn = this;
								updateBtn.setAttribute("id", "updateBtn");
								updateBtn.setAttribute("value", "수정")
								
								//삭제버튼 클릭시 헤당 레이어 취소버튼으로 변경
								var deleteBtn = this.parentElement.childNodes[2];
								deleteBtn.setAttribute("id", "deleteBtn");
								deleteBtn.setAttribute("value", "삭제");
								
								selectPet();
							})
							
							//취소버튼 클릭시 input창 사라짐.
							$("#cencelBtn").click(function(){
								
								//수정버튼 클릭시 헤당 레이어 수정완료 버튼으로 변경
								var deleteBtn = this;
								deleteBtn.setAttribute("id", "deleteBtn");
								deleteBtn.setAttribute("value", "삭제")
								
								//삭제버튼 클릭시 헤당 레이어 취소버튼으로 변경
								var updateBtn = this.parentElement.childNodes[0];
								updateBtn.setAttribute("id", "updateBtn");
								updateBtn.setAttribute("value", "수정");
								
								selectAllpet();
								
								
							})
							
							
						}
						
					})
				}
				
			});
		}
		
		//input창 추가.
		var makeInsert = document.createElement('form');
		insertRemove();
		
		makeInsert.innerHTML = 
			'<div id="petInsert"><input type="text" name="pName" placeholder="펫이름">'+
			'<input type="text" name="pType" placeholder="펫종류">'+
			'<input type="number" name="pUNum" placeholder="펫주인번호">'+
			'<input type="number" name="pVNum" placeholder="방문자번호">'+
			'<input type="button" id="PetAddBtn"value="추가"></div>';
		
		$('#adminInsert').append(makeInsert);
		
		//insert버튼button 클릭시 value값이 담김.
		$("#PetAddBtn").click(function(){
			var pName = $("input[name='pName']").val();
			var pType = $("input[name='pType']").val();
			var pUNum = $("input[name='pUNum']").val();
			var pVNum = $("input[name='pVNum']").val();
			
			
			//ajax로 데이터를 보내줌.
			//insert
			$.ajax({
				url :"pet/insertPet",
				data : {"pName" : pName, "pType" : pType, "pUNum" : pUNum, "pVNum" :pVNum},
				dataType : "json",
				type : "post",
				
				//성공시 다시 select해줌
				success :function(){
					selectAllpet();
					
					//인풋박스 초기화.
					$("form")[0].reset();
				},
				error : function(e){
					alert("추가실패");
				}
			})
			
		})
		
		
		/* select  */
		selectAllpet();
		
	})
});
