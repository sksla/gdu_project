<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 예약</title>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js"></script>
<script>

	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'timeGridDay',
      headerToolbar:{
        left: 'prevYear,prev',
        center: 'title',
        right: 'next,nextYear today'
      },
      nowIndicator: true, // 현재 시간 마크
		    locale: 'ko', // 한국어 설정
      buttonText:{ //버튼 텍스트 변환
        today:'오늘'
      },
      slotDuration:'00:30:00',
      slotMinTime:'09:00:00',
      slotMaxTime:'18:01:00',
      contentHeight:650
      
    });
    calendar.render();
  });
 </script>
 
 <style>
 	.card-body{padding:30px 150px;}
  .fc .fc-timegrid-slot {height: 30px;}
 </style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/reservationSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center my-3">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">시설 예약하기</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">예약</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/reservation/resourceList.page">자원 예약</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">시설 예약하기</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <div class="card">
            <div class="card-body">
              <h5 class="fw-semibold mb-8">시설 예약하기</h5>
              <br>
              
              <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insert_reservation" onclick="openInsertModal(1, '', '', '');">
                  예약하기
                </button>

              </div>
              <br><br>

              <table class="table border text-nowrap mb-0 align-middle">
                <tbody align="center">
                  <tr>
                    <th width="200px">분류</th>
                    <td>${ res.resType == "1" ? "회의실" : (res.resType == "2" ? "강의실" : "기타") }</td>
                  </tr>
                  <tr>
                    <th>시설명</th>
                    <td>${ res.resName }</td>
                  </tr>
                  <tr>
                    <th>상세설명</th>
                    <td>${ res.resDetail }</td>
                  </tr>
                  <tr>
                    <th>위치</th>
                    <td>${ res.resGps }</td>
                  </tr>
                </tbody>
              </table>
              <br>

              <!-- 일간 달력으로만 -->
              <div class="calender-sidebar app-calendar">
                <div id="calendar">
                  
                </div>
              </div>
            </div>
          </div>

          <!-- Button to Open the Modal -->
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Open modal
          </button>

          <!-- 예약 상세조회 모달창 -->
          <div class="modal" id="detail_reservation">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">예약 상세 조회</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">자원명</th>
                        <td>자원명111</td>
                      </tr>
                      <tr>
                        <th>예약시간</th>
                        <td>2024-4-23 15:00 ~ 16:00</td>
                        <!--비품예약일 경우-->
                        <!--
                        <td>2024-4-2</td>
                        -->
                      </tr>
                      <tr>
                        <th>신청자</th>
                        <td>김사람</td>
                      </tr>
                      <tr>
                        <th>사용 용도</th>
                        <td>이렇게 저렇게 사용</td>
                      </tr>
                      <!-- * 비품 예약일 경우 -->
                      <!--
                      <tr>
                        <th>예약 수량</th>
                        <td>2개</td>
                      </tr>
                      -->
                      <tr>
                        <th>예약 상태</th>
                        <!--비품예약일 경우-->
                        <!--
                        <td>반납 or 미반납</td>
                        -->
                        <td>예약 완료</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-danger">삭제</button>
                </div>

              </div>
            </div>
          </div>


          

          <!-- 예약 등록 모달창 -->
          <div class="modal" id="insert_reservation">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">시설 예약 하기</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
               	<form id="insertForm">
	                <div class="modal-body">
	                	<input type="hidden" name="resNo" value="${ res.resNo }">
	                	<input type="hidden" name="memNo" value="${loginUser.memNo }">
	                  <table class="table">
	                    <tbody>
	                      <tr>
	                        <th width="100px">자원명</th>
	                        <td>${ res.resName }</td>
	                      </tr>
	                      <tr>
	                        <th>예약일</th>
	                        <td><input id="inputDate" name="rev_date" type="date" required></td>
	                      </tr>
	                      <tr>
	                        <th>예약 시간</th>
	                        <td>
	                          <select name="startTime" id="selectStartTime">
	                            <c:forEach var="hour" begin="9" end="18">
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
	                          ~
	                          <select name="endTime" id="selectEndTime">
	                            <c:forEach var="hour" begin="9" end="18">
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
	                        <th>사용 용도</th>
	                        <td><textarea name="revReason" cols="35" rows="5" required></textarea></td>
	                      </tr>
	                    </tbody>
	                  </table>
	                </div>
	
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                  <button type="button" class="btn btn-primary">등록</button>
	                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                </div>
								</form>
              </div>
            </div>
          </div>
          
          <!-- 예약 상세조회 모달창 -->
          <div class="modal" id="detail_reservation">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">예약 상세 조회</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	<input type="hidden" name="resNo" value="${ res.resNo }">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">자원명</th>
                        <td>${ res.resName }</td>
                      </tr>
                      <tr>
                        <th>예약 시간</th>
                        <td></td>
                      </tr>
                      <tr>
                        <th>등록자</th>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <th>사용 용도</th>
                        <td><textarea name="" cols="35" rows="5"></textarea></td>
                      </tr>
                      <tr>
                      	<th>예약 상태</th>
                      	<td></td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-danger">삭제</button>
                  <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
                </div>

              </div>
            </div>
          </div>
          
          
          <script>
          	let memNo = ${loginUser.memNo};
          	let resNo = ${res.resNo};
          	let revList;
          	
          	$(document).ready(function(){
          		ajaxSelectReservationList();
          	});
          	
          	function ajaxSelectReservationList(){
          		console.log("ajax실행");
          		$.ajax({
          			url:"${contextPath}/reservation/reservationList.do",
          			type:"post",
          			data:"resNo=" + resNo,
          			success:function(list){
          				revList = new Array();
          				
          				if(list.length > 0){
          					for(let i=0; i<list.length; i++){
          						
          						revList.push({
          							id: list[i].revNo,
          							title: list[i].memName,
          							start: new Date(list[i].revDate),
          							end: new Date(list[i].revDate),
          							startTime: list[i].startTime,
          							endTime: list[i].endTime,
          							content: list[i].revReason,
          							color: (list[i].memNo == memNo ? "#4FC3F7" : "#BDBDBD" )
          						});
          						
          					}
          					
          				}
          				
          				
          			},
          			error:function(){
          				console.log("예약내역 조회용 ajax 통신 실패");
          			}
          			
          		})
          		
          		var calendarEl = document.getElementById('calendar');
         	    var calendar = new FullCalendar.Calendar(calendarEl, {
         	      initialView: 'timeGridDay',
         	      headerToolbar:{
         	        left: 'prevYear,prev',
         	        center: 'title',
         	        right: 'next,nextYear today'
         	      },
         	      nowIndicator: true, // 현재 시간 마크
         	      timeZone:'local',
       			    locale: 'ko', // 한국어 설정
         	      buttonText:{ //버튼 텍스트 변환
         	        today:'오늘'
         	      },
         	      slotDuration:'00:30:00',
         	      slotMinTime:'09:00:00',
         	      slotMaxTime:'18:01:00',
         	      contentHeight:650,
         	      selectable: true,
         	      selectMirror:true,
         	      selectAllow: function(selectInfo){
         	    	  let events = calendar.getEvents();
         	    	  for(let i=0; i<events.length; i++){
         	    		  let event = events[i];
         	    		  
         	    		  if( (selectInfo.start >= event.start && selectInfo.start < event.end)
         	    				  	|| (selectInfo.end > event.start && selectInfo.end <= event.end) 
         	    				  		|| (selectInfo.start <= event.start && selectInfo.end >= event.end)){
         	    			 
         	    			  alert("이미 존재하는 예약이 있습니다.");
         	    			  return false;
         	    		  }
         	    	  }
         	    	  return true;
         	      },
         	      select:function(info){
         	    	 	let startStr = info.startStr;
       	          let endStr = info.endStr;
       	          let now = new Date();
       	          let selectedStart = new Date(info.start);
       	          let selectdEnd = new Date(info.end);
	         	          
	         	          
       	          if((selectedStart.toDateString() === now.toDateString() && selectedStart < now )
       	                || selectedStart < now.setHours(0,0,0,0)){
       	            alert("현재 시간보다 이전 시간은 선택하실 수 없습니다.");
       	            calendar.unselect();
       	            return;
       	          }
	
       	       		openInsertModal(2, startStr.slice(0,10), startStr.slice(11, 16), endStr.slice(11,16));
         	    	  // 예약 내역이 있는 영역은 선택 불가
         	      },
         	      events:revList,
         	      eventsDataTransform:function(event){
         	    	  
         	      },
         	      eventClick:function(info){
         	    	  let event = info.event;
         	    	  
         	    	  
         	      }
         	      
         	    });
         	    calendar.render();
          		
          		
          	}
          	
          	function openInsertModal(type, date, start, end){
          		let today = new Date();
          		let year = today.getFullYear();
          		let month = today.getMonth() + 1 < 10 ? "0" + (today.getMonth() + 1) : (today.getMonth() + 1);
          		let day = today.getDate() < 10 ?  "0" + today.getDate() : today.getDate();
             	let todayStr = year + "-" + month + "-" + day;
             	
             	let inputDate = document.getElementById("inputDate");
             	let selectStartTime = document.getElementById("selectStartTime");
             	let selectEndTime = document.getElementById("selectEndTime");
             	
             	inputDate.setAttribute("min", todayStr);
             	
             	if(type == 1){
             		inputDate.value = todayStr;
             		selectStartTime.value = '09:00';
             		selectEndTime.value = '09:30';
             		
             	}else{
             		inputDate.value = date;
             		selectStartTime.value = start;
             		selectEndTime.value = end;
             	}
             	
             	$("#insert_reservation").modal("show");
          	}
          	
          	function openDetailModal(rev){
          		
          		$("#detail_reservation").modal('show');
          	}
          
          </script>
          
					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>