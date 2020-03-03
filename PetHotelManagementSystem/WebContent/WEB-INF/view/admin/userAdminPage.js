$(function(){
	$("#user").click(function() {
		
		//메소드 실행.
		userAdmin();
		
		//userSelect메소드
		function selectUser(result){
			
			$("table").remove();
			var makeTable = document.createElement('table');
			
			makeTable.innerHTML = '<tr><td>uNum</td><td>uId</td><td>uPwd</td><td>uName</td><td>uGender</td><td>uPhone</td><td>uEmail</td><td>uBirth</td><td>관리</td></tr>';
			
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].uNum+'</td><td>'+ result[i].uId+'</td><td>'+ result[i].uPwd+'</td><td>'+ result[i].uName+'</td><td>'+ result[i].uGender+'</td><td>'+ result[i].uPhone+'</td><td>'+ result[i].uEmail+'</td><td>'+ 
				result[i].uBirth.year+'-'+result[i].uBirth.monthValue+'-'+result[i].uBirth.dayOfMonth+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
			$('#adminList').append(makeTable);
		
		}
		
		//user CRUD메소드
		function userAdmin(){
			
			//insert창 생성.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="userInsert"><input type="text" name="uId" placeholder="아이디 입력" required="required">'+
				'<input type="password" name="uPwd" placeholder="패스워드 입력">'+
				'<input type="text" name="uName" placeholder="이름 입력"><br>'+
				'<label><input type="radio" name="uGender" value="남">남</label>'+
				'<label><input type="radio" name="uGender" value="여">여</label><br>'+
				'<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="uPhone1"> - <input type="text" maxlength="4" name="uPhone2"><br>'+
				'<input type="text" name="uEmail" placeholder="이메일 입력">'+
				'<input type="date" name="uBirthStr"><br>'+
				'<input type="button" id="UserAddBtn"value="추가"></div>';
			
			$('#adminInsert').append(makeInsert);
			
			//insert버튼button 클릭시 value값이 담김.
			$("#UserAddBtn").click(function(){
				
				var uId = $("input[name='uId']").val();
				var uPwd = $("input[name='uPwd']").val();
				var uName = $("input[name='uName']").val();
				var uGender = $("input[name='uGender']").val();
				var uPhone1 = $("input[name='uPhone1']").val();
				var uPhone2 = $("input[name='uPhone2']").val();
				var uEmail = $("input[name='uEmail']").val();
				var uBirthStr = $("input[name='uBirthStr']").val();
				
				//ajax로 데이터를 보내줌.
				//insert
				$.ajax({
					url :"user/insertUser",
					data : {"uId" : uId, "uPwd" : uPwd, "uName" : uName, "uGender" :uGender, 
						"uPhone1" : uPhone1, "uPhone2" : uPhone2, "uEmail" : uEmail, "uBirthStr" :uBirthStr},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(result){
						alert("추가성공");
						
						selectUser(result);
						userAdmin();
						
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
				url : "user/selectAllUser",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectUser(result);
					
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
						var uId = Tr.childNodes[1].innerHTML;
						
						$.ajax({
							url :"user/updateUserAdmin",
							data : {"uId" : uId},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="uId" value="'+result.uId+'" readonly>';
								Tr.childNodes[2].innerHTML ='<input type="text" id ="uPwd" value="'+result.uPwd+'">';
								Tr.childNodes[3].innerHTML ='<input type="text" id ="uName" value="'+result.uName+'">';
								Tr.childNodes[4].innerHTML ='<input type="text" id ="uGender" value="'+result.uGender+'" readonly>';
								Tr.childNodes[5].innerHTML ='<input type="text" id ="uPhone" value="'+result.uPhone+'">';
								Tr.childNodes[6].innerHTML ='<input type="text" id ="uEmail" value="'+result.uEmail+'">';
								Tr.childNodes[7].innerHTML ='<input type="date" id ="uBirth" value="'+result.uBirth+'">';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){

							var uId = $("#uId").val();
							var uPwd = $("#uPwd").val();
							var uName = $("#uName").val();
							var uGender = $("#uGender").val();
							var uPhone = $("#uPhone").val();
							var uEmail = $("#uEmail").val();
							var uBirthStr = $("#uBirth").val();
							
							console.log("uId ::: ",uId);
							console.log("uPwd ::: ",uPwd);
							console.log("uName ::: ",uName);
							console.log("uGender ::: ",uGender);
							console.log("uPhone ::: ",uPhone);
							console.log("uEmail ::: ",uEmail);
							console.log("uBirth ::: ",uBirthStr);
							
							$.ajax({
								url :"user/updateUser",
								data : {"uId" : uId, "uPwd" : uPwd, "uName" : uName, "uGender" : uGender, "uPhone" :uPhone,
									"uEmail" : uEmail, "uBirthStr" : uBirthStr},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectUser(result);
									userAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "user/selectAllUser",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectUser(result);
									userAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var uId = Tr.childNodes[1].innerHTML;
						$.ajax({
							url :"user/deleteUser",
							data : {"uId" : uId},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectUser(result);
								userAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
