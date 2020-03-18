$(function(){
	$("#size").click(function() {
		
		//메소드 실행.
		sizeAdmin();
		
		//sizeSelect메소드
		function selectSize(result){ 
			
			var tableName = document.getElementById('tableName');

			tableName.innerHTML ="";	
			tableName.innerHTML = '<h3 class="h4">Size</h3>';
			
			$("table").remove();
			var makeTable = document.createElement('table');
			makeTable.innerHTML = '<tr><td>sNum</td><td>sSize</td><td>sRPrice</td><td>sWPrice</td><td>sMax</td><td>sSpace</td><td>sView</td><td>sBed</td><td>sLounge</td><td>sLimit</td><td>sCare</td><td>sBath</td><td>관리</td></tr>';
			
			console.log(result.length);
			for(var i=0; i<result.length; i++){
				makeTable.innerHTML += '<tr><td>'+ result[i].sNum+'</td><td>'+ result[i].sSize+'</td><td>'+ result[i].sRPrice+'</td><td>'+ result[i].sWPrice+'</td><td>'+ result[i].sMax+'</td><td>'+ result[i].sSpace+'</td><td>'+ result[i].sView+'</td>'+
				'<td>'+ result[i].sBed+'</td><td>'+ result[i].sLounge+'</td><td>'+ result[i].sLimit+'</td><td>'+ result[i].sCare+'</td><td>'+ result[i].sBath+'</td><td><input type="button" name="updateBtn" value="수정"><input type="button" name="deleteBtn" value="삭제">'+
				'<input type="button" class="visibility" name="updateOkBtn" value="수정완료"><input type="button" class="visibility" name="cencleBtn" value="취소"></td></tr>';
			}
			
			$('#adminList').append(makeTable);
		}
		
		// size CRUD메소드
		function sizeAdmin(){
			
			//insert창 생성.
			var makeInsert = document.createElement('form');
			insertRemove();
			
			makeInsert.innerHTML = 
				'<div id="sizeInsert">'+
				'<input type="text" name="sSize" placeholder="방크기">'+
				'<input type="number" name="sRPrice" placeholder="평일요금">'+
				'<input type="number" name="sWPrice" placeholder="주말요금">'+
				'<input type="text" name="sMax" placeholder="최대인원수">'+
				'<input type="text" name="sSpace" placeholder="면적(m²)">'+
				'<select name="sView">'+
				'<option value="City View">City View</option>'+
				'<option value="Park View">Park View</option>'+
				'</select>'+
				'<input type="text" name="sBed" placeholder="ex)1 Double 1 Single">'+
				'<select name="sLounge">'+
				'<option value="YES">YES</option>'+
				'<option value="NO">NO</option>'+
				'</select>'+
				'<input type="text" name="sLimit" placeholder="sLimit">'+
				'<input type="number" name="sCare" placeholder="sCare">'+
				'<input type="number" name="sBath" placeholder="sBath">'+
				'<input type="button" id="sizeAddBtn"value="추가"></div>'; 
			
			$('#adminInsert').append(makeInsert);
			
			//button 클릭시 value값이 담김.
			$("#sizeAddBtn").click(function(){
				var sSize = $("input[name='sSize']").val();
				var sRPrice = $("input[name='sRPrice']").val();
				var sWPrice = $("input[name='sWPrice']").val();
				var sMax = $("input[name='sMax']").val();
				var sSpace = $("input[name='sSpace']").val();
				var sView = $("select[name='sView']").val();
				var sBed = $("input[name='sBed']").val();
				var sLounge = $("select[name='sLounge']").val();
				var sLimit = $("input[name='sLimit']").val();
				var sCare = $("input[name='sCare']").val();
				var sBath = $("input[name='sBath']").val();
				
				//insert 
				$.ajax({
					url :"size/insertSize",
					data : {"sSize" : sSize, "sRPrice" : sRPrice, "sWPrice" : sWPrice,
						"sMax" : sMax, "sSpace" : sSpace, "sView" : sView, "sBed" : sBed, "sLounge" : sLounge, "sLimit" :sLimit,
						"sCare" : sCare, "sBath" : sBath},
					dataType : "json",
					type : "post",
					
					//성공시 다시 select해줌
					success :function(result){
						alert("추가성공");
						
						selectSize(result);
						sizeAdmin();
						
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
				url : "size/selectAllSize",
				dataType : "json",
				type : "post",
				success : function(result) {
				
					selectSize(result);
					
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
						var sNum = Tr.childNodes[0].innerHTML;
						
						$.ajax({
							url :"size/updateSize",
							data : {"sNum" : sNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								Tr.childNodes[1].innerHTML ='<input type="text" id ="sSize" value="'+result.sSize+'">';
								Tr.childNodes[2].innerHTML ='<input type="number" id ="sRPrice" value="'+result.sRPrice+'">';
								Tr.childNodes[3].innerHTML ='<input type="number" id ="sWPrice" value="'+result.sWPrice+'">';
								Tr.childNodes[4].innerHTML ='<input type="text" id ="sMax" value="'+result.sMax+'">';
								Tr.childNodes[5].innerHTML ='<input type="text" id ="sSpace" value="'+result.sSpace+'">';
								Tr.childNodes[6].innerHTML ='<input type="text" id ="sView" value="'+result.sView+'">';
								Tr.childNodes[7].innerHTML ='<input type="text" id ="sBed" value="'+result.sBed+'">';
								Tr.childNodes[8].innerHTML ='<input type="text" id ="sLounge" value="'+result.sLounge+'">';
								Tr.childNodes[9].innerHTML ='<input type="text" id ="sLimit" value="'+result.sLimit+'">';
								Tr.childNodes[10].innerHTML ='<input type="number" id ="sCare" value="'+result.sCare+'">';
								Tr.childNodes[11].innerHTML ='<input type="number" id ="sBath" value="'+result.sBath+'">';
							}
						});
						
						//수정완료버튼 클릭시 ajax으로 데이터 전송 후 select
						$("input[name='updateOkBtn']").click(function(){
							
							var sNum = Tr.childNodes[0].innerHTML;
							var sSize = $("#sSize").val();
							var sRPrice = $("#sRPrice").val();
							var sWPrice = $("#sWPrice").val();
							var sMax = $("#sMax").val();
							var sSpace = $("#sSpace").val();
							var sView = $("#sView").val();
							var sBed = $("#sBed").val();
							var sLounge = $("#sLounge").val();
							var sLimit = $("#sLimit").val();
							var sCare = $("#sCare").val();
							var sBath = $("#sBath").val();
							
							
							console.log("sNum ::: ",sNum);
							console.log("sSize ::: ",sSize);
							console.log("sRPrice ::: ",sRPrice);
							console.log("sWPrice ::: ",sWPrice);
							console.log("sMax ::: ",sMax);
							console.log("sSpace ::: ",sSpace);
							console.log("sView ::: ",sView);
							console.log("sBed ::: ",sBed);
							console.log("sLounge ::: ",sLounge);
							console.log("sLimit ::: ",sLimit);
							console.log("sCare ::: ",sCare);
							console.log("sBath ::: ",sBath);
							
							
							
							$.ajax({
								url :"size/updateSize",
								data : {"sNum" : sNum, "sSize" : sSize, "sRPrice" : sRPrice, "sWPrice" : sWPrice,
									"sMax" : sMax, "sSpace" : sSpace, "sView" : sView, "sBed" : sBed, "sLounge" : sLounge, "sLimit" :sLimit,
									"sCare" : sCare, "sBath" : sBath},
								dataType : "json",
								type : "post",
								
								//성공시 다시 select해줌
								success :function(result){
									alert("수정성공");
									
									selectSize(result);
									sizeAdmin();
									
								},
								error : function(e){
									alert("수정실패");
								}
							});
						})
							
						
						//취소버튼 클릭시 input창 사라짐.
						$("input[name='cencleBtn']").click(function(){
							$.ajax({
								url : "size/selectAllSize",
								dataType : "json",
								type : "post",
								success : function(result) {
									alert("취소성공");
									
									selectSize(result);
									sizeAdmin();
								}
							})
						})
						
					})
					
					//삭제버튼 클릭 시,
					$("input[name='deleteBtn']").click(function(){
						
						var Tr = this.parentElement.parentElement;
						var sNum = Tr.childNodes[0].innerHTML;
						$.ajax({
							url :"size/deleteSize",
							data : {"sNum" : sNum},
							dataType : "json",
							type : "get",
							
							//성공시 다시 select해줌
							success :function(result){
								alert("삭제성공");
								
								selectSize(result);
								sizeAdmin();
							}
						})
						
					})
					
				}
				
			});
		}
		//여기까지 메소드
	});
});
