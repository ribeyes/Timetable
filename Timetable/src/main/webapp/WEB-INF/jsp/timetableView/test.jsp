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
		<h1> 시간표 입력화면</h1>
		
		<fieldset style="width:610px">
		<legend>수강신청</legend>
		<form>
			<label>학기:
			  <select id="semesterSelect">
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label>
			<label>요일:
			  <select id="weekSelect" >
			    <option value="none">=== 선택 ===</option>
			  </select>
			</label> 
			<label>시간:  
			  <select id="timeSelect">
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
			  url : "/json.do",
			  type : 'GET',
			  dataType : 'json',
			  success : function(data) {
				  alert("ajax 성공");
				  
				  let semester = data.semester; // 학기 열 값들을 저장
				  let week = data.week; // 요일 열 값들을 저장
				  let time = data.time; // 시간 열 값들을 저장
				  let subject = data.subject; // 학기 열 값들을 저장
				  
				  /* 학기 dropdown 목록에 추가 */
				  for(let i = 0; i < semester.length; i++) {
		                let option = $("<option>"+ semester[i].sem +"</option>");
		                $('#semesterSelect').append(option); 
		            }
		          
				  
				  <%-- 학기 메뉴값을 변경했을때 --%>
				  $("#semesterSelect").change(function(){
					  
					 <%-- 요일 메뉴값 추가하기 위해 최초 1회 실행--%>
					  if($('#weekSelect').children('option').length == 1){
								
							
					  /* 요일 dropdown 목록에 추가 */
							for(let i = 0; i < week.length; i++) {
					            let option = $("<option>"+ week[i].day_kr +"</option>");
					            $('#weekSelect').append(option); 
					        }
				            
						}
					  
					  <%-- 학기를 변경하면 요일 메뉴 초기화--%>
					$("#weekSelect").val("none").prop("selected", true);
				  });
				  
				  <%-- 요일 메뉴값을 변경했을때 --%>
				  $("#weekSelect").change(function(){
					  
					  <%-- 시간 메뉴값 추가하기 위해 최초 1회 실행--%>
					  if($('#timeSelect').children('option').length == 1){
							
							
						  /* 시간 dropdown 목록에 추가 */
								for(let i = 0; i < week.length; i++) {
						            let option = $("<option>"+ week[i].day_kr +"</option>");
						            $('#timeSelect').append(option); 
						        }
					            
							}
					  
					  <%-- 요일을 변경하면 시간 메뉴 초기화--%>
						$("#timeSelect").val("none").prop("selected", true);
				  });
				  
				  <%-- 시간 메뉴값을 변경했을때 --%>
				  $("#timeSelect").change(function(){
					  
					  <%-- 과목 메뉴값 추가하기 위해 최초 1회 실행--%>
					  if($('#subjectSelect').children('option').length == 1){
						  
					  
					  /* 과목 dropdown 목록에 추가 */
						for(let i = 0; i < time.length; i++) {
				            let option = $("<option>"+ time[i].time_nm +"</option>");
				            $('#subjectSelect').append(option); 
				        }
			           
					  }
					  <%-- 시간을 변경하면 과목 메뉴 초기화--%>
						$("#subjectSelect").val("none").prop("selected", true); 
					  
				  });
				  
			  }, 
			  error : function(){
				  alert("ajax 실패"); 
			}
		});
	});
	
	
	
</script>
</html>