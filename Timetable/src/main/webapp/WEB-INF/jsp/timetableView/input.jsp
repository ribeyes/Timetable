<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	$(function() {
		
		$.ajax({
			  url : "/input.do",
			  type : 'GET',
			  success : function() {
				  alert("ajax 성공");
				  
				  let semester = []; // 학기 열 값들을 저장
				  
				  <c:forEach var="semester" items="${semester}" >  
				  	semester.push("${semester.sem}");
				  </c:forEach>
				  
				  /* 학기 dropdown 목록에 추가 */
				  for(let i = 0; i < ${semester.size()}; i++) {
		                let option = $("<option>"+ semester[i] +"</option>");
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
			  
			let week = []; // 요일 열 값들을 저장
			  
		    <c:forEach var="week" items="${week}" >  
		    	week.push("${week.day_kr}");
		    </c:forEach>
			  
		    /* 요일 dropdown 목록에 추가 */
			for(let i = 0; i < ${week.size()}; i++) {
	            let option = $("<option>"+ week[i] +"</option>");
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
			  
			let time = []; // 시간 열 값들을 저장
			  
		    <c:forEach var="time" items="${time}" >  
		    	time.push("${time.time_nm}");
		    </c:forEach>
			  
		    /* 시간 dropdown 목록에 추가 */
			for(let i = 0; i < ${time.size()}; i++) {
	            let option = $("<option>"+ time[i] +"</option>");
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
			  
			let subject = []; // 과목 열 값들을 저장
			  
		    <c:forEach var="subject" items="${subject}" >  
		    	subject.push("${subject.sbjt_nm}");
		    </c:forEach>
			  
		    /* 과목 dropdown 목록에 추가 */
			for(let i = 0; i < ${subject.size()}; i++) {
	            let option = $("<option>"+ subject[i] +"</option>");
	            $('#subjectSelect').append(option); 
	        }
		}
		
		<%-- 시간을 변경하면 과목 메뉴 초기화--%>
		$("#subjectSelect").val("none").prop("selected", true);
	}
	
</script>
</html>