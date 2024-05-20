<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사 일정</title>

<style>
  .search-style{
    height:35px; 
    color:#5a6a85; 
    border: 1px solid #dfe5ef;
  }
</style>

<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,list'
    }
    });
    calendar.render();
  });

  </script>

</head>
<body>
	<div class="main-wrapper">

		<!-- 각 페이지 별 사이드 바 -->
		<jsp:include page="/WEB-INF/views/common/calSidebar.jsp" />

		<div class="page-wrapper">

			<!-- 이쪽에 헤더(상단바) -->
			<jsp:include page="/WEB-INF/views/common/header.jsp" />

			<!----------------------------- 본문 시작 -------------------->
			<div class="body-wrapper">
				<div class="container-fluid">
					<!-- 페이지 타이틀 -->
					<div
						class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
						<div class="card-body px-4 py-3">
							<div class="row align-items-center">
								<div class="col-9">
									<h4 class="fw-semibold mb-8">학사 일정</h4>
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a
												class="text-muted text-decoration-none"
												href="../main/index.html">Home</a></li>
											<li class="breadcrumb-item" aria-current="page">일정</li>
											<li class="breadcrumb-item" aria-current="page">학사 일정</li>
										</ol>
									</nav>
								</div>
								<div class="col-3">
									<div class="text-center mb-n5"></div>
								</div>
							</div>
						</div>
					</div>

					<!-- 페이지 내용 -->
					<div class="card">
						<div class="card-body">
							<h5 class="fw-semibold mb-8">학사 일정</h5>
							<br>
							<div class="d-flex justify-content-between">
								<div>
									<!--관리자만 보이는 버튼-->
									<c:if test="${ not empty loginUser and loginUser.status eq 'A' }">
										<a class="btn btn-primary" href=""> 학사 일정 등록 </a>
									</c:if>
									<!-- ----------------- -->
								</div>

								<form class="">
									<input type="text" class="search-style" name="" id=""
										placeholder="검색어 입력">
									<button class="btn btn-outline-primary">검색</button>

								</form>
							</div>

							<!-- -------------------- -->
							<br>
							<br> <br>

							<!-- 학사 일정 달력 -->
							<div class="calender-sidebar app-calendar">
								<div id="calendar"></div>
							</div>
						</div>
					</div>

					<!-- 학사 일정 상세조회 모달창 -->
					<div class="modal" id="detailForm">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">일정 상세 조회</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<input type="hidden" name="calNo" value="">
									<table class="table">
										<tbody>
											<tr>
												<th width="100px">캘린더</th>
												<td>학사일정</td>
											</tr>
											<tr>
												<th>일정 제목</th>
												<td id="detail_calTitle">김사람</td>
											</tr>
											<tr>
												<th>일정 시간</th>
												<td id="detail_date">2024-4-23 15:00 ~ 2024-4-23 16:00</td>
											</tr>
											<tr>
												<th>일정 내용</th>
												<td id="detail_content">이렇게 저렇게 사용</td>
											</tr>
										</tbody>
									</table>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer justify-content-center">
									<c:choose>
										<c:when test="${ not empty loginUser and loginUser.status eq 'A'}">
											<!-- 관리자만 보여지는 버튼-->
											<button type="button" class="btn btn-outline-secondary"
												data-bs-toggle="modal" data-bs-target="#updateForm">수정</button>
											<button type="button" class="btn btn-outline-danger">삭제</button>
											<!-- ------------------- -->
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-info"
												data-bs-dismiss="modal">닫기</button>
										</c:otherwise>
									</c:choose>
								</div>

							</div>
						</div>
					</div>

					<!-- 학사 일정 등록, 수정 모달창 -->
					<div class="modal" id="editForm">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">학사 일정 수정</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<input type="hidden" id="calNo" name="calNo" value="0">
									<table class="table">
										<tbody>
											<tr>
												<th width="100px">캘린더</th>
												<td>학사일정</td>
											</tr>
											<tr>
												<th>일정 제목</th>
												<td><input type="text" id="calTitle" style="width:250px;" value="" required></td>
											</tr>
											<tr>
                        <th>시작</th>
                        <td>
                          <input type="date" id="startDate" name="" required>
                          <select id="startTime">
                          
	                       	 	<c:forEach var="hour" begin="0" end="23">
											        <c:set var="am_pm" value="${hour < 12 ? '오전' : '오후'}" />
											        <c:set var="displayHour" value="${hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)}" />
											        <c:forEach var="minute" begin="0" end="30" step="30">
											            <c:set var="hourStr" value="${hour < 10 ? '0' : ''}${hour}" />
											            <c:set var="minuteStr" value="${minute < 10 ? '0' : ''}${minute}" />
											            <option value="${hourStr}:${minuteStr}">
											                ${am_pm} ${ displayHour < 10 ? '0' : ''}${displayHour}:${minuteStr}
											            </option>
											        </c:forEach>
											    	</c:forEach>
                          	
                          </select>&nbsp;
                          <input type="checkbox" name="isAllday" id="isAllday">
                          <label for="isAllday">종일</label>
                        </td>
                      </tr>
                      <tr>
                        <th>종료</th>
                        <td>
                          <input type="date" id="endDate" name="" required>
                          <select id="endTime">
                            <c:forEach var="hour" begin="0" end="23">
											        <c:set var="am_pm" value="${hour < 12 ? '오전' : '오후'}" />
											        <c:set var="displayHour" value="${hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)}" />
											        <c:forEach var="minute" begin="0" end="30" step="30">
											            <c:set var="hourStr" value="${hour < 10 ? '0' : ''}${hour}" />
											            <c:set var="minuteStr" value="${minute < 10 ? '0' : ''}${minute}" />
											            <option value="${hourStr}:${minuteStr}">
											                ${am_pm} ${ displayHour < 10 ? '0' : ''}${displayHour}:${minuteStr}
											            </option>
											        </c:forEach>
											    	</c:forEach>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <th>일정 내용</th>
                        <td><textarea name="" cols="35" rows="5" id="calContent"></textarea></td>
                      </tr>
										</tbody>
									</table>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer justify-content-center">
									
									<c:if test="${ not empty loginUser and loginUser.status eq 'A' }">
										<!-- 관리자만 보여지는 버튼-->
										<button type="button" class="btn btn-outline-secondary updateEvtBtn" data-bs-dismiss="modal">등록</button>
										<button type="button" class="btn btn-outline-primary insertEvtBtn" data-bs-dismiss="modal">수정</button>
										<!-- ------------------- -->
									</c:if>
									<button type="button" class="btn btn-info"
											data-bs-dismiss="modal">닫기</button>
									
								</div>

							</div>
						</div>
					</div>
					
					<script>
						$(document).ready(function(){
							 ajaxSelectUnivCalList();
							 
							// 종일 버튼 클릭시 시간input 선택 가능 여부 결정
              $("#isAllday").on("click", function(){
            	  
                if($("#isAllday").prop("checked")){
                  $("#startTime").prop("disabled", true);
                  $("#endTime").prop("disabled", true);
                }else{
                  $("#startTime").prop("disabled", false);
                  $("#endTime").prop("disabled", false);
                }
                
              })
						})
						
						let calList = new Array();
						
						// 학사일정 조회용 ajax
						function ajaxSelectUnivCalList(){
							
							calList.length = 0;
							
							$.ajax({
         				url:"${contextPath}/calendar/univCalList.do",
         				type:"post",
         				async:false,
         				data:{},
         				success:function(rep){
         					
         					console.log(rep);
         					
         					if(rep.length > 0){
         						for(let i=0; i<rep.length; i++){
         							
         							let isAllday = rep[i].isAllday;
         							let startTimeStr = isAllday == 'N' ? rep[i].startDate.split(" ")[1] : '';
         							let endTimeStr = isAllday == 'N' ? rep[i].endDate.split(" ")[1] : '';
         							
         							
         							calList.push({
         								id:rep[i].calNo,
         								ctgNo:rep[i].ctg.ctgNo,
         								title:rep[i].calTitle,
         								start:new Date(rep[i].startDate),
         								end:new Date(rep[i].endDate),
         								startStr:rep[i].startDate, // 일정 상세조회용
         								endStr:rep[i].endDate, // 일정 상세조회용
         								stTime:startTimeStr, // 일정 수정용
         								edTime:endTimeStr,	// 일정 수정용
         								allDay:(rep[i].isAllday == 'Y' ? true : false),
         								content:rep[i].calContent,
         								color:rep[i].ctg.color,
       		
         							})
         						}
         						
         						console.log("calList",calList);
				         			
         					}
         					
         				},
         				error:function(){
         					console.log("일정 조회용 ajax 통신 실패");
         				}
         				  				
         			})
         			
         			var calendarEl = document.getElementById('calendar');
		   		    var calendar = new FullCalendar.Calendar(calendarEl, {
		   		      initialView: 'dayGridMonth',
		   		      headerToolbar: {
		   		        left: 'prev,next today',
		   		        center: 'title',
		   		        right: 'dayGridMonth,timeGridWeek,timeGridDay,list',
		   		      },
		   		      nowIndicator: true, // 현재 시간 마크
		   		      timeZone:'local', // 우리나라 시간
		   		    	locale: 'ko', // 한국어 설정
		   		      buttonText:{ //버튼 텍스트 변환
		   		        today:'오늘',
		   		        day:'일간',
		   		        week:'주간',
		   		        month:'월간',
		   		        list:'목록'
		   		      },
		   		   		dayHeaderFormat: { weekday: 'short' },
		   		   		dayMaxEventRows: 3, 
		   		   		eventMaxStack: 3,
		   		      selectable: true,
		   		      selectMirror: true,
	       	      select:function(info){
	       	    		let startStr = info.startStr;
	                let endStr = info.endStr;
	
	                $("#editForm .modal-title").html("학사 일정 등록");
	                
	                if(startStr.indexOf("T") == -1 || endStr.indexOf("T") == -1){
	                	// 월간 달력에서 날짜 선택했을 때(yyyy-mm-dd);
	                  let endDate = new Date(info.end); // 2024-05-16까지 선택했을 경우 날짜는 2024-05-17T00:00:00으로 됨
	                  endDate.setDate(endDate.getDate() - 1);
	                  let eYear = endDate.getFullYear();
	                  let eMonth = (endDate.getMonth() + 1) < 10 ? "0" + (endDate.getMonth() + 1) : (endDate.getMonth() + 1);
	                  let eDate = endDate.getDate() < 10 ? "0" + endDate.getDate() : endDate.getDate();
	                  let endDateStr = eYear + "-" + eMonth + "-" + eDate;
	                  $("#startDate").val(info.startStr);
	                  $("#endDate").val(endDateStr);
	                  $("#startTime").val("09:00");
	                  $("#endTime").val("09:30");
	                }else{
	                	// 주간, 일간 달력에서 날짜 선택했을 때(yyyy-mm-ddThh:mm:00~)
	                  $("#startDate").val(info.startStr.slice(0, 10));
	                  $("#endDate").val(info.endStr.slice(0, 10));
	                  $("#startTime").val(info.startStr.slice(11, 16));
	                  $("#endTime").val(info.endStr.slice(11, 16));
	                }
	                
		             	// 수정 버튼 안보이게
	                $("#editForm .updateEvtBtn").css("display", "none");
	                // 등록 버튼 보이게
	                $("#editForm .insertEvtBtn").css("display", "inline");
	                
	                $("#editForm").modal("show");
	                
	       	      },
	   		      	events:calList,
		       		  eventDataTransform: function(event) {                                                                                                                                
		       				if(event.allDay && event.start !== event.end) {                                                                                                                                               
			       				// 이벤트 데이터에서 end 날짜 값을 가져옴
			       			 	let end = new Date(event.end);
	
			       			  // 하루를 더함
			       			  end.setDate(end.getDate() + 1);
	
			       			  event.end = end; 
	
				       			return event;  
		       			                                                                                                                  
		       				}
		       			}, 
		       			eventClick:function(info){ // 일정 클릭시
		       				let event = info.event;
		       			
		       				
		       				let id = event.id;
									let ctgNo = event.extendedProps.ctgNo;
									let title= event.title;
									let start = event.start;
									let end = event.end;
									let startStr = event.extendedProps.startStr;
									let endStr = event.extendedProps.endStr;
									let stTime = event.extendedProps.stTime;
									let edTime = event.extendedProps.edTime;
									let allDay = event.allDay;
									let isAllday = ( event.allDay ? 'Y' : 'N' );
									let content = event.extendedProps.content;
									let color = event.color
									
									
									if(event.allDay && start !== end){
										// 이벤트 데이터에서 end 날짜 값을 가져옴
			       			 	let fixedEnd = new Date(end);
	
			       			  // 하루를 다시 빼기
			       			  fixedEnd.setDate(end.getDate() - 1);
	
			       			  end = fixedEnd;
									}
									
									
									// 일정 번호
									$("#detailForm input[name='calNo']").val(id);
									
									
									// 일정제목
									$("#detailForm #detail_calTitle").text(title);
									
									// 일정 시간(기간)
									if(allDay && startStr == endStr){
										// 종일 일정이고 시작날짜와 끝날짜가 같을 때
										$("#detailForm #detail_date").text(startStr);
									}else{
										$("#detailForm #detail_date").text(startStr + " ~ " + endStr);
									}
									
									// 일정 내용
									if(content == "" || content == null){
										$("#detail_content").text("내용 없음");
									}else{
										
										$("#detailForm #detail_content").text(content);
									}
									
			       			// 수정 버튼 클릭시 모달창
									$("#detailForm .editBtnForm .editModalBtn").on("click", function(){
										
										$("#editForm .modal-title").html("학사 일정 수정");
										
										// 모달창 초기화
										resetEditModal();
										$("#editForm #calNo").val(id); // 일정번호
										$("#editForm #selectCtg").val(ctgNo);
										$("#editForm #calTitle").val(title);
										$("#editForm #startTime").val(stTime)
										$("#editForm #endTime").val(edTime);
										
										if(allDay){
											
											$("#editForm #startDate").val(startStr);
											$("#editForm #endDate").val(endStr);
											$("#isAllday").prop("checked", true);
											$("#startTime").val("09:00");
		                  $("#endTime").val("09:30");
											$("#startTime").prop("disabled", true);
		                  $("#endTime").prop("disabled", true);
		           
										}else{
											$("#isAllday").prop("checked", false);
											$("#startTime").prop("disabled", false);
		                  $("#endTime").prop("disabled", false);
											$("#editForm #startDate").val(startStr.slice(0,10));
											$("#editForm #endDate").val(endStr.slice(0,10));
											
										}
										
										$("#editForm #calContent").val(content);
										
										// 수정 버튼 보이게
			              $("#editForm .updateEvtBtn").css("display", "inline");
			              // 등록 버튼 안보이게
			              $("#editForm .insertEvtBtn").css("display", "none");
										
										$("#editForm").modal("show");
										
										
									});
			       			
									$("#detailForm .editBtnForm .deleteEvtBtn").val(id);
									
									$("#detailForm").modal("show");
								
		       	
		       			}
		       			
		       			/*
		       			dayCellContent: function(e) {
	
			       			// 날짜 셀의 내용을 수정하는 로직을 작성합니다.
	
			       			// e.date는 현재 날짜를 나타냅니다.
	
			       			// e.dayNumberText는 현재 날짜의 숫자를 나타냅니다.
	
			       			// 이를 활용하여 일을 제거하거나 다른 형식으로 변경할 수 있습니다.
	
			       			return e.dayNumberText.replace('일', '');
	
		       			}
								*/
		   		    
		   		    });
		   		    
		 		 			calendar.render();
						}
						
						// 일정 수정, 등록용 모달창 초기화
            function resetEditModal(){
            	// 등록, 수정 모달창 안의 입력창 값 초기화
            	let today = new Date();
						
							if($("isAllday").prop("checked")){
								$("#startTime").prop("disabled", false);
								$("#endTime").prop("disabled", false);
							}
            	$("#editForm #calNo").val("");
							$("#calTitle").val("");
              $("#startDate").val( today.toISOString().slice(0, 10));
              $("#endDate").val( today.toISOString().slice(0, 10));
							$("#startTime").val("09:00");
							$("#endTime").val("09:30");
							$("#isAllday").prop("checked", false);
							$("#calContent").val("");
            }
						
					</script>

				</div>
			</div>
			<!-- body-wrapper end 본문 끝-->

		</div>
		<!-- page-wrapper end -->

		<!-- 세팅메뉴(바) -->
		<jsp:include page="/WEB-INF/views/common/settingbar.jsp" />

	</div>
	<!-- main-wrapper end -->

	<!-- footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>