$(function(){
	$("#position").click(function() {
		
		//메소드 실행.
		positionAdmin();
		
		//petSelect메소드
		function selectPosition(result){
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>poNum</td><td>poName</td><td>관리</td></tr>';
			
			console.log(result.length);
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].poNum+'</td><td>'+ result[i].poName+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
		 	console.log(makeTable);
			$('#adminList').append(makeTable);
		}
		
		// Position CRUD메소드
		function positionAdmin(){
			
			//insert창 생성.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="positionInsert"><input type="text" name="poName" placeholder="poName">'+
				'<input type="button" id="PositionAddBtn"value="추가"></div>';
			
			$('#adminInsert').append(makeInsert);
			
			//insert버튼button 클릭시 value값이 담김.
			$("#PositionAddBtn").click(function(){
				var poName = $("input[name='poName']").val();
				
				//insert
				$.ajax({
					url :"posi/insertPosition",
					data : {"poName" : poName},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(){
						alert("추가성공");
						
						selectPosition(result);
						positionAdmin();
						
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
				url : "posi/selectAllPosition",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectPosition(result);
					
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
						var poNum = Tr.childNodes[0].innerHTML;
						
						$.ajax({
							url :"posi/updatePosition",
							data : {"poNum" : poNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="poName" value="'+result.poName+'">';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){
							
							var poNum = Tr.childNodes[0].innerHTML;
							var poName = $("#poName").val();
							
							console.log("poNum ::: ",poNum);
							console.log("poName ::: ",poName);
							
							$.ajax({
								url :"posi/updatePosition",
								data : {"poNum" : poNum, "poName" : poName},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectPosition(result);
									positionAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "posi/selectAllPosition",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectPosition(result);
									positionAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var poNum = Tr.childNodes[0].innerHTML;
						$.ajax({
							url :"posi/deletePosition",
							data : {"poNum" : poNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectPosition(result);
								positionAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
