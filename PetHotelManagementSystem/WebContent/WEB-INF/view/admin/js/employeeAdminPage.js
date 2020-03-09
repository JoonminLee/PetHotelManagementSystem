$(function(){
	$("#employee").click(function() {
		
		//메소드 실행.
		employeeAdmin();
		
		//empSelect메소드
		function selectEmployee(result){ 
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>eNum</td><td>eName</td><td>eDNum</td><td>ePoNum</td><td>ePhone</td><td>eHireDate</td><td>eSalary</td><td>관리</td></tr>';
			
			console.log(result.length);
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].eNum+'</td><td>'+ result[i].eName+'</td><td>'+ result[i].eDNum+'</td><td>'+ result[i].ePoNum+'</td><td>'+ result[i].ePhone+
				'</td><td>'+ result[i].eHireDate.year+'-'+result[i].eHireDate.monthValue+'-'+result[i].eHireDate.dayOfMonth+'</td><td>'+ result[i].eSalary+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
		 	console.log(makeTable);
			$('#adminList').append(makeTable);
		}
		
		// emp CRUD메소드
		function employeeAdmin(){
			
			//insert창 생성.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="employeeInsert">'+
				'<input type="text" name="eNum" placeholder="사원번호 입력" readonly>'+
				'<input type="text" name="eName" placeholder="사원이름 입력">'+
				'<select name="eDNum">'+
					'<option value="1">사무관리부</option>'+
					'<option value="2">객실관리부</option>'+
				'</select>'+
				'<select name="ePoNum">'+
					'<option value="1">영업부</option>'+
					'<option value="2">총무부</option>'+
					'<option value="3">리셉션</option>'+
					'<option value="4">미화부</option>'+
					'<option value="5">마케팅부</option>'+	
					'<option value="6">관리자</option>'+
				'</select><br>'+
				'<input type="text" value="010" readonly> - <input type="text" maxlength="4" name="ePhone1"> - <input type="text" maxlength="4" name="ePhone2">'+
				'<input type="date" name="eHireDateStr"><br>'+
				'<input type="number" name="eSalary" placeholder="월급">'+
				'<input type="button" id="EmployeeAddBtn"value="추가"></div>';
			
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#EmployeeAddBtn").click(function(){
				//var eNum = $("input[name='eNum']").val(); 사원번호 AI
				var eNum = 0;
				var eName = $("input[name='eName']").val();
				var eDNum = $("select[name='eDNum']").val();	
				var ePoNum = $("select[name='ePoNum']").val();
				var ePhone1 = $("input[name='ePhone1']").val();
				var ePhone2 = $("input[name='ePhone2']").val();
				var eHireDateStr = $("input[name='eHireDateStr']").val();
				var eSalary = $("input[name='eSalary']").val();
				
				//insert 
				$.ajax({
					url :"emp/insertEmp",
					data : {"eNum" : eNum, "eName" : eName, "eDNum" : eDNum, "ePoNum" : ePoNum,
						"ePhone1" : ePhone1, "ePhone2" : ePhone2, "eHireDateStr" : eHireDateStr, "eSalary" : eSalary},
					dataType : "json", 
					type : "post",
					
					//성공시 다시 select해줌
					success :function(result){
						alert("추가성공");
						
						selectEmployee(result);
						employeeAdmin();
						
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
				url : "emp/selectAllEmp",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectEmployee(result);
					
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
						var eNum = Tr.childNodes[0].innerHTML;
						
						$.ajax({
							url :"emp/updateEmp",
							data : {"eNum" : eNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="eName" value="'+result.eName+'">';
								Tr.childNodes[2].innerHTML ='<input type="number" id ="eDNum" value="'+result.eDNum+'">';
								Tr.childNodes[3].innerHTML ='<input type="number" id ="ePoNum" value="'+result.ePoNum+'">';
								Tr.childNodes[4].innerHTML ='<input type="text" id ="ePhone" value="'+result.ePhone+'">';
								//날짜 고정해보기.
								Tr.childNodes[5].innerHTML ='<input type="date" id ="eHireDate" value="'+result.eHireDate+'" readonly>';
								Tr.childNodes[6].innerHTML ='<input type="number" id ="eSalary" value="'+result.eSalary+'">';

							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){
							
							var eNum = Tr.childNodes[0].innerHTML;
							var eName = $("#eName").val();
							var eDNum = $("#eDNum").val();
							var ePoNum = $("#ePoNum").val();
							var ePhone = $("#ePhone").val();
							var eHireDateStr = $("#eHireDate").val();
							var eSalary = $("#eSalary").val();
							
							console.log("eNum ::: ",eNum);
							console.log("eName ::: ",eName);
							console.log("eDNum ::: ",eDNum);
							console.log("ePoNum ::: ",ePoNum);
							console.log("ePhone ::: ",ePhone);
							console.log("eHireDateStr ::: ",eHireDateStr);
							console.log("eSalary ::: ",eSalary);
							
							$.ajax({
								url :"emp/updateEmp",
								data : {"eNum" : eNum, "eName" : eName, "eDNum" : eDNum, "ePoNum" :ePoNum, "ePhone" : ePhone, "eHireDateStr" : eHireDateStr, "eSalary" : eSalary},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectEmployee(result);
									employeeAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "emp/selectAllEmp",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectEmployee(result);
									employeeAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var eNum = Tr.childNodes[0].innerHTML;
						$.ajax({
							url :"emp/deleteEmp",
							data : {"eNum" : eNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectEmployee(result);
								employeeAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
