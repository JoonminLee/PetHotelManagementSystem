$(function(){
	$("#pet").click(function() {
		
		//메소드 실행.
		petAdmin();
		
		//petSelect메소드
		function selectPet(result){
			
			var tableName = document.getElementById('tableName');

			tableName.innerHTML ="";	
			tableName.innerHTML = '<h3 class="h4">Pet</h3>';
			
			
			$("table").remove();
			var makeTable = document.createElement('table');
			
			makeTable.innerHTML = '<tr><td>pNum</td><td>pName</td><td>pType</td><td>pUNum</td><td>pVNum</td><td>pPhoto</td><td>관리</td></tr>';
		
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].pNum+'</td><td>'+ result[i].pName+'</td><td>'+ result[i].pType+'</td><td>'+ result[i].pUNum+
				'</td><td>'+ result[i].pVNum+'</td><td>'+ result[i].pPhoto+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
		
			$('#adminList').append(makeTable);
		}
		
		//pet CRUD메소드
		function petAdmin(){
			
			//insert창 생성.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="petInsert"><input type="text" name="pName" placeholder="펫이름">'+
				'<input type="text" name="pType" placeholder="펫종류">'+
				'<input type="number" name="pUNum" placeholder="펫주인번호">'+
				'<input type="number" name="pVNum" placeholder="방문자번호">'+
				'<input type="text" name="pPhoto" placeholder="펫사진">'+
				'<input type="button" id="PetAddBtn"value="추가"></div>';
			
			$('#adminInsert').append(makeInsert);
			
			//insert버튼button 클릭시 value값이 담김.
			$("#PetAddBtn").click(function(){
				var pName = $("input[name='pName']").val();
				var pType = $("input[name='pType']").val();
				var pUNum = $("input[name='pUNum']").val();
				var pVNum = $("input[name='pVNum']").val();
				var pPhoto =$("input[name='pPhoto']").val();
				
				//insert
				$.ajax({
					url :"pet/insertPet",
					data : {"pName" : pName, "pType" : pType, "pUNum" : pUNum, "pVNum" :pVNum, "pPhoto":pPhoto},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(result){
						alert("추가성공");
						
						selectPet(result);
						petAdmin();
						
						//인풋박스 초기화.
						$("form")[0].reset();
					},
					error : function(e){
						alert("추가실패");
					}
				});
				
			});
			
			
			//select
			$.ajax({
				url : "pet/selectAllPet",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectPet(result);
					
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
						var pNum = Tr.childNodes[0].innerHTML;
						
						$.ajax({
							url :"pet/updatePet",
							data : {"pNum" : pNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="pName" value="'+result.pName+'">';
								Tr.childNodes[2].innerHTML ='<input type="text" id ="pType" value="'+result.pType+'">';
								Tr.childNodes[3].innerHTML ='<input type="number" id ="pUNum" value="'+result.pUNum+'">';
								Tr.childNodes[4].innerHTML ='<input type="number" id ="pVNum" value="'+result.pVNum+'">';
								Tr.childNodes[5].innerHTML ='<input type="text" id ="pPhoto" value="'+result.pPhoto+'">';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){
							
							var pNum = Tr.childNodes[0].innerHTML;
							var pName = $("#pName").val();
							var pType = $("#pType").val();
							var pUNum = $("#pUNum").val();
							var pVNum = $("#pVNum").val();
							var pPhoto = $("#pPhoto").val();
							
							console.log("pNum ::: ",pNum);
							console.log("pName ::: ",pName);
							console.log("pType ::: ",pType);
							console.log("pUNum ::: ",pUNum);
							console.log("pVNum ::: ",pVNum);
							console.log("pPhoto ::: ",pPhoto);
							
							$.ajax({
								url :"pet/updatePet",
								data : {"pNum" : pNum, "pName" : pName, "pType" : pType, "pUNum" : pUNum, "pVNum" :pVNum, "pPhoto" :pPhoto},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectPet(result);
									petAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "pet/selectAllPet",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectPet(result);
									petAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var pNum = Tr.childNodes[0].innerHTML;
						$.ajax({
							url :"pet/deletePet",
							data : {"pNum" : pNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectPet(result);
								petAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
	
});
