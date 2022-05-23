<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 입력</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
	<body>
	${semester.size()}<br>
	${semester}<br>
	${semester[0].sem}<br>
	${semester[1].sem}<br>
	
		<h1> 시간표 입력화면</h1>
		
		<fieldset style="width:610px">
		<legend>수강신청</legend>
		<form>
			<label>학기:
			  <select id="semesterSelect" onchange="changedSemester()">
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label>
			<label>요일:
			  <select id="weekSelect" onchange="changedWeek()">
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label> 
			<label>시간:  
			  <select id="timeSelect" onchange="changedTime()">
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label> 
			<label>과목:  
			  <select id="subjectSelect">
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label>
		</form>
		</fieldset>
	
	</body>
	
	<script>
	
	//main test
	<%-- controller에서 넘어온 List 결과값들을 JS의 배열로 저장 --%>
	function inputAry(str, strAry){
		if(str.length > 0){		  // column 값들이 존재하는지 검사
			  let idx = 0;		  // indexOf()에서 사용할 문자열 시작위치 index
			  let element;		  // 배열에 담을 테이블 column 행들의 값들
			  let findEqual;      // '=' 문자 index
			  let findBracket;    // '}' 문자 index
			  let findLastBracket;// 문자열 마지막 '}' 문자 index
			  do{
				  findEqual = str.indexOf('=', idx);
				  idx = findEqual;
				  findBracket = str.indexOf('}', idx);
				  idx = findBracket;
				  findLastBracket = str.lastIndexOf('}');
				  
				  element = str.substring((findEqual+1), findBracket);
				  strAry.push(element);
				  
			  }while(idx != findLastBracket); // 마지막 '}' 문자인지 검사
		  }
	}
	
	$(function() {
		
		$.ajax({
			  url : "/input.do",
			  type : 'GET',
			  success : function() {
				  alert("ajax 성공");
				  
				  let str = '${semester}'; 
				  let strAry = []; // str 문자열 값들 중에서 DB column값만 저장.
				  
				  inputAry(str, strAry);
				  console.log(strAry);
				  <%-- 학기 메뉴에 메뉴값들을 추가 --%>
				  for(let i = 0; i < ${semester.size()}; i++) {
		                let option = $("<option>"+ strAry[i] +"</option>");
		                $('#semesterSelect').append(option); 
		            } 
		            
			  }, 
			  error : function(){
				  alert("ajax 실패"); 
			}
		});
	});
	
	
	<%-- 학기 메뉴값을 변경했을때 --%>
	function changedSemester(){ 
		<%-- 요일 메뉴값 추가하기 위해 최초 1회 실행--%>
		if($('#weekSelect').children('option').length == 1){
			let str = '${week}';
			let strAry = []; // str 문자열 값들 중에서 DB column값만 저장.
			  
			inputAry(str, strAry);
			for(let i = 0; i < ${week.size()}; i++) {                
				let option = $("<option>"+ strAry[i] +"</option>"); 
                $('#weekSelect').append(option);
            }
		}
		<%-- 학기를 변경하면 요일 메뉴 초기화--%>
		$("#weekSelect").val("none").prop("selected", true);
	}
	
	<%-- 요일 메뉴값을 변경했을때 --%>
	function changedWeek(){
		<%-- 시간 메뉴값 추가하기 위해 최초 1회 실행--%>
		if($('#timeSelect').children('option').length == 1){
			let str = '${time}';
			let strAry = []; // str 문자열 값들 중에서 DB column값만 저장.
			  
			inputAry(str, strAry);
			for(let i = 0; i < ${time.size()}; i++){                
				let option = $("<option>"+ strAry[i] +"</option>");
                $('#timeSelect').append(option);
            }
		}
		<%-- 요일을 변경하면 시간 메뉴 초기화--%>
		$("#timeSelect").val("none").prop("selected", true);
	}
	
	<%-- 시간 메뉴값을 변경했을때 --%>
	function changedTime(){
		<%-- 과목 메뉴값 추가하기 위해 최초 1회 실행--%>
		if($('#subjectSelect').children('option').length == 1){
			let str = '${subject}'; 
			let strAry = []; // str 문자열 값들 중에서 DB column값만 저장.
			  
			inputAry(str, strAry);
			for(let i = 0; i < ${subject.size()}; i++){                
				let option = $("<option>"+ strAry[i] +"</option>");
                $('#subjectSelect').append(option);
            }
		}
		<%-- 시간을 변경하면 과목 메뉴 초기화--%>
		$("#subjectSelect").val("none").prop("selected", true);
	}
	
</script>
</html>