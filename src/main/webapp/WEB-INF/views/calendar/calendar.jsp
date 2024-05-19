<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script>
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,list',
      },
      nowIndicator: true, // 현재 시간 마크
    	locale: 'ko', // 한국어 설정
      buttonText:{ //버튼 텍스트 변환
        today:'오늘',
        day:'일간',
        week:'주간',
        month:'월간',
        list:'목록'
      },
			views:{
        
      },
      events:{
    	  
      }

    });
    calendar.render();
  });
</script>

<style>
	/*사이드바 스타일*/
  .schedule-sidebar{
    background-color: aliceblue;
  }
  .cal_ctg{
    display: flex;
    justify-content: space-between;
  }

  /*검색바 스타일*/
  .search-style{
    height:35px; 
    color:#5a6a85; 
    border: 1px solid #dfe5ef;
  }
  
  /* 캘린더(일정 카테고리) 제목 스타일*/
  .my_calender_title, .share_calendar_title{
    display: flex;
    justify-content: space-between;
  }
  
  /* 캘린더 필터링 조회 체크박스 스타일 */
  .show_chk{width:16px; height: 16px;}

  /* 일정 상세 캘린더 색상 박스 스타일 */
  .label{
    width:16px;
    height: 16px;
    padding: 1px;
    border: 1px solid lightgray;
  }
  .label span{display:block; width:12px; height: 12px;}

  /* ----- 캘린더(일정카테) 등록 또는 수정할 때 색상 체크박스 스타일 ------ */
  .mc1{background-color: red;}
  .mc2{background-color: orange;}
  .mc3{background-color: yellow;}
  .mc4{background-color: #a3b90a;}
  .mc5{background-color: skyblue;}
  .mc6{background-color: #2985db;}
  .mc7{background-color: purple;}


  .sc1{background-color: #ff96b5; }
  .sc2{background-color: #ffed54;}
  .sc3{background-color: #e2b1a0;}
  .sc4{background-color: #87dc54;}
  .sc5{background-color: #7be2e9;}
  .sc6{background-color: #ac9ef4;}
  .sc7{background-color: #ee9aee;}
  
  
  /* 체크되기 전의 상태에 대한 스타일 */
  .custom-checkbox input[type="checkbox"] {
    display: none; /* 기본 체크박스 숨김 */
  }

  .custom-checkbox label {
    display: inline-block;
    width: 17px; /* 체크박스의 크기 */
    height: 17px;
    border-radius: 5px; /* 둥근 모서리 */
  }

  /* 체크된 상태에 대한 스타일 */
  .custom-checkbox input[type="checkbox"]:checked + label {
    color: white; /* 체크된 상태의 텍스트 색상 */
    border: 2px solid black ;
  }
  /* ----- ------------------------------------- ------ */
  
 	.app-calendar .fc .fc-day-sun .fc-daygrid-day-number{
	  color: red;
	  text-decoration: none;
	}
	
	
	/* 토요일 날짜 파란색 */
	.app-calendar .fc .fc-day-sat .fc-daygrid-day-number{
	  color: blue;
	  text-decoration: none;
	}
	.app-calendar .fc-v-event .fc-event-main  {
		border:1px solid white;
	}
	
	.fc-event{cursor:pointer;}
</style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/calSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center my-3">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">일정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">일정</li>

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
              <h5 class="fw-semibold mb-8">일정</h5>
              <br>

              <div class="d-flex justify-content-between">
                <div class="">
                  <!-- 기회되면 인쇄 기능 되는 버튼...넣고싶다-->
                </div>

                <form action="" method="" class="">
                  <input type="text" class="search-style" name="" id="" placeholder="검색어 입력">
                  <button class="btn btn-outline-primary">검색</button>
                  
                </form>
              </div>
              <br>
              
              <div class="d-flex justify-content-between">
                <div class="calender-sidebar app-calendar" style="width:78%">
                  <div id="calendar">
                    
                  </div>
                </div>

                <div class="schedule-sidebar"  style="width:20%">
                  <div class="mt-3 d-flex justify-content-center mb-9">
                    <button type="button" id="addEventBtn" class="btn btn-lg btn-primary" onclick="clickEvtBtn();">일정등록</button>
                  </div>
									<form id="ctgList_form">
	                  <div class="my_calender p-2">
	                    <div class="my_calender_title">
	                      <span><h4>내 캘린더</h4></span>
	                      <button type="button" class="btn" onclick="openInsertMyModal();" data-bs-toggle="modal" data-bs-target="#insert_my"><i class="ti ti-plus"></i></button>
	                    </div>
	                    <div class="my_calendar_list">
	                      <ul>
	                      	
	                      </ul>
	                    </div>
	                  </div>
	
	                  <div class="share_calendar p-2">
	                    <div class="share_calendar_title">
	                      <span><h4>공유 캘린더</h4></span>
	                      <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#insert_share">
	                        <i class="ti ti-plus"></i>
	                      </button>
	                    </div>
	
	                    <div class="share_calendar_list">
	                      <ul>
	                        <li>
	                          <span>조회된 공유 일정이 없습니다.</span>
	                        </li>
	                        
	                      </ul>
	                    </div>
	
	                  </div>
									</form>
                </div>

              </div>
              
            </div>
          </div>

          

          <!-- Button to Open the Modal -->
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#detailForm">
            Open modal
          </button>

          <!-- 일정 상세조회 모달창 -->
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
                        <td>
                          <button type="button" class="label" disabled>
                            <span id="ctgColor" style="background-color: red;"></span>
                          </button> &nbsp;
                          <span id="ctgName"></span>
                          <button id="shareListBtn" class="btn btn-sm">4(공유하는 사람 수)</button>
                        </td> 
                      </tr>
                      <tr>
                        <th>일정 제목</th>
                        <td id="detail_calTitle">일정 제목111</td>
                      </tr>
                      <tr>
                        <th>일정 시간</th>
                        <td id="detail_date">yyyy-mm-dd hh:mm ~ yyyy-mm-dd hh:mm</td>
                      </tr>
                      <!-- * 공유 캘린더 일정일 경우 -->
                      <!--
                      <tr>
                        <th>최초 등록</th>
                        <td>김사람(yyyy-dd-mm hh:mm)</td>
                      </tr>
                      <tr>
                        <th>최근 수정</th>
                        <td>김사람(yyyy-dd-mm hh:mm)</td>
                      </tr>
                      -->
                      <tr>
                        <th>일정 내용</th>
                        <td id="detail_content">일정 내용내용</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                  <!--개인 캘린더 또는 공유캘린더의 등록자, 등록권한이 있는 경우-->
                  <div class="editBtnForm">
	                  <button type="button" class="btn btn-outline-secondary editModalBtn" data-bs-dismiss="modal">수정</button>
	                  <button type="button" class="btn btn-outline-danger deleteEvtBtn" onclick="ajaxDeleteEvent();" data-bs-dismiss="modal">삭제</button> 
                  </div>
                  <!-- 공유 캘린더일 경우 조회권한만 있는 사람-->
                  <div class="onlyConfirmBtn" style="display:none;">
                  	<button type="button" class="btn bg-info-subtle text-info" data-bs-dismiss="modal">확인</button>
                  </div>
                </div>

              </div>
            </div>
          </div>


          

          <!-- 일정 등록 모달창, 수정 모달창 -->
          <div class="modal" id="editForm">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">일정 등록</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	<!-- 일정 수정시 일정번호 전달할 input:hidden-->
                	<input type="hidden" id="calNo" name="calNo" value="">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">캘린더</th>
                        <td>
                          <select id="selectCtg" name="ctgNo" style="width:250px;">
                            <!-- 해당 회원의 개인,공유캘린더(일정카테고리) 목록-->
                            <option>나의 프로젝트</option>
                            <option>공유 캘린더(공유캘린더 생성자 이름)</option>
                            <option></option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <th>일정 제목</th>
                        <td><input type="text" id="calTitle" name="calTitle" style="width:250px;" required></td>
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
                	<button type="button" class="btn btn-outline-secondary updateEvtBtn" onclick="ajaxUpdateEvent();" data-bs-dismiss="modal">수정</button>
                  <button type="button" class="btn btn-outline-primary insertEvtBtn" onclick="ajaxInsertEvt();" data-bs-dismiss="modal">등록</button>
                  <button type="button" class="btn btn bg-info-subtle text-info" data-bs-dismiss="modal">취소</button>
                </div>

              </div>
            </div>
          </div>

          
          <!-- 개인 캘린더(일정카테고리) 등록 모달창 -->
          <div class="modal" id="insert_my">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">내 캘린더 등록</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
								
               	<form action="${ contextPath }/calendar/insertCtg.do?ctgType=1" method="POST">
	                <!-- Modal body -->
	                <div class="modal-body">
	                	<input type="hidden" name="ctgNo" value="0">	
	                  <table class="table">
	                    <tbody>
	                      <tr>
	                        <th width="120px">내 캘린더명</th>
	                        <td><input type="text" name="ctgName" style="width:250px;" maxlength="15" required placeholder="15자 이내"></td>
	                      </tr>
	                      <tr>
	                        <th>캘린더 색</th>
	                        <td>
	                          <div class="custom-checkbox">
	                            <input type="checkbox" id="mc_check1" name="color" value="red" onclick="onlyOneCheck(this);">
	                            <label for="mc_check1" class="mc1"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check2" name="color" value="orange" onclick="onlyOneCheck(this);">
	                            <label for="mc_check2" class="mc2"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check3" name="color" value="yellow" onclick="onlyOneCheck(this);">
	                            <label for="mc_check3" class="mc3"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check4" name="color" value="#a3b90a" onclick="onlyOneCheck(this);">
	                            <label for="mc_check4" class="mc4"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check5" name="color" value="skyblue" onclick="onlyOneCheck(this);">
	                            <label for="mc_check5" class="mc5"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check6" name="color" value="#2985db" onclick="onlyOneCheck(this);"> 
	                            <label for="mc_check6" class="mc6"></label>
	                            &nbsp;
	                            <input type="checkbox" id="mc_check7" name="color" value="purple" onclick="onlyOneCheck(this);">
	                            <label for="mc_check7" class="mc7"></label>
	                          </div>
	                        </td>
	                      </tr>
	                    </tbody>
	                  </table>
	                </div>
	
	                <!-- Modal footer -->
	                <div class="modal-footer justify-content-center">
	                	<div class="editBtn">
		                	<button type="button" class="btn btn-outline-secondary" onclick="ajaxUpdateCalCtg()" data-bs-dismiss="modal">수정</button> 
	                		<button type="button" class="btn btn-outline-danger" onclick="ajaxDeleteCtg();" data-bs-dismiss="modal">삭제</button>
	                	</div>
	                	<div class="insertBtn">
		                  <button type="submit" class="btn btn-outline-primary insertMyBtn" onclick="return colorChkValidate(1);">등록</button>
		                  <button type="button" class="btn btn-info" data-bs-dismiss="modal">취소</button>
	                	</div>
	                </div>
               	</form>

              </div>
            </div>
          </div>



          <!-- 공유 캘린더(일정카테고리) 등록 모달창 -->
          <div class="modal" id="insert_share">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">공유 캘린더 등록</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="120px">공유 캘린더명</th>
                        <td><input type="text" style="width:250px;" required></td>
                      </tr>
                      <tr>
                        <th>캘린더 색</th>
                        <td>
                          <div>
                            <div class="custom-checkbox">
                              <input type="checkbox" id="sc_check1" name="color" value="#ff96b5" onclick="onlyOneCheck(this);">
                              <label for="sc_check1" class="sc1"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check2" name="color" value="#ffed54" onclick="onlyOneCheck(this);">
                              <label for="sc_check2" class="sc2"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check3" name="color" value="#e2b1a0" onclick="onlyOneCheck(this);">
                              <label for="sc_check3" class="sc3"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check4" name="color" value="#87dc54" onclick="onlyOneCheck(this);">
                              <label for="sc_check4" class="sc4"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check5" name="color" value="#7be2e9" onclick="onlyOneCheck(this);">
                              <label for="sc_check5" class="sc5"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check6" name="color" value="#ac9ef4" onclick="onlyOneCheck(this);"> 
                              <label for="sc_check6" class="sc6"></label>
                              &nbsp;
                              <input type="checkbox" id="sc_check7" name="color" value="#ee9aee" onclick="onlyOneCheck(this);">
                              <label for="sc_check7" class="sc7"></label>
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <th colspan="2">공유대상</th>
                      </tr>
                      <tr>
                        <td colspan="2"></td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                  <button type="button" class="btn btn-primary">등록</button>
                  <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
                </div>

              </div>
            </div>
          </div>

          <script>
          
	       		// 카테고리 리스트 배열
	          let ctgList = new Array();
	          // 공유 캘린더 리스트 배열
	          let shareList = new Array();
         		// 일정 담을 배열
       			let calList = [];

            $(document).ready(function(){
            	
            	ajaxSelectListCalCtg();
            	ajaxSelectCalList();
            	
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
              
              // 카테고리 체크박스 클릭시 일정 조회
              $(".show_chk").on("click", function(){
            	  ajaxSelectCalList();
              })
              
              
              
              
            })
            

            // 캘린더 색상 체크박스 중복 선택 방지
            function onlyOneCheck(chk){
              const obj = document.getElementsByName("color");

              for(var i=0; i<obj.length; i++){
                if(obj[i] != chk){
                  obj[i].checked = false;
                }
              }
            }
            
            // 일정 등록 버튼 클릭
            function clickEvtBtn(){
            	
            	$("#editForm .modal-title").html("일정 등록");
            	
            	let today = new Date();
            	
              $("#startDate").val( today.toISOString().slice(0, 10));
              $("#endDate").val( today.toISOString().slice(0, 10));

              $("#startTime").val("09:00");
              $("#endTime").val("09:30");
              
              // 수정 버튼 안보이게
              $("#editForm .updateEvtBtn").css("display", "none");
              // 등록 버튼 보이게
              $("#editForm .insertEvtBtn").css("display", "inline");
              
            	$("#editForm").modal("show");
    
            }
            
            
            
         		// 캘린더 색상 체크여부 유효성검사(type=1:개인, type=2:공유)
            function colorChkValidate(type){
              let modalId = "";
              let count = 0;

              if(type == 1){
                modalId = "insert_my";
              }else if(type == 2){
                modalId = "insert_share";
              }

              $("#" + modalId + " input[type='checkbox']").each(function(){
                if($(this).prop("checked")){
    	            count++;
    	          }
           
              })

              if(count == 0){
                alert("색깔을 선택해주세요!");
                return false;
              }
              
              return true;
            }

         		
         		
         		
         		// 내캘린더 추가버튼 클릭시
         		function openInsertMyModal(){
         			
         			$("#insert_my modal-title").html("내 캘린더 등록");
         			
         			// 모달창 초기화
         			$("#insert_my input[name='ctgName']").val("");
         			$("#insert_my input[type='checkbox']").each(function(){
	              	$(this).prop("checked", false);
         			})
         			
         			$("#insert_my .editBtn").css("display", "none");
         			$("#insert_my .insertBtn").css("display", "block");
         			
         			$("#insert_my").modal("show");
      	
         		}
         		
         		// 내캘린더(개인) 수정버튼 클릭시
         		function openEditMyModal(ctgNo){
							$("#insert_my modal-title").html("내 캘린더 수정");
         			
         			// 모달창 초기화
         			$("#insert_my input[name='ctgName']").val("");
         			$("#insert_my input[type='checkbox']").each(function(){
	              	$(this).prop("checked", false);
         			})
         			
         			// 해당 캘린더(카테고리) 값 채우기
         			$("#insert_my input[name='ctgNo']").val(ctgNo);
         			for(let i=0; i<ctgList.length; i++){
         				
         				if(ctgNo == ctgList[i].ctgNo){
         					$("#insert_my input[name='ctgName']").val(ctgList[i].ctgName);
         					$("#insert_my input[type='checkbox']").each(function(){
         						if($(this).val() == ctgList[i].color){
	         		      	$(this).prop("checked", true);
         						}
         	       	})
         				}
         				
         			}
         			
         			
         			$("#insert_my .editBtn").css("display", "block");
         			$("#insert_my .insertBtn").css("display", "none");
         			
         			$("#insert_my").modal("show");
         		}
         		
            
            // 캘린더 카테고리 조회용 ajax
            function ajaxSelectListCalCtg(){
            	// 카테고리 리스트 배열 초기화
            	ctgList.length = 0;
            	
            	$.ajax({
            		url:"${contextPath}/calendar/ctgList.do",
            		type:"post",
            		async:false,
            		data:{},
            		success:function(rep){
            			console.log(rep);
            			
            			let selectCtg = "";
            			let myVal = "";
            			let shVal = "";
            			
            			if(rep.length > 0){
            				
	            			for(let i=0; i<rep.length; i++){
	            				
	            				// 조회된 CalCtgDto를 카테고리 배열에 넣기
	            				ctgList.push(rep[i]);
	            				
	            				if(rep[i].ctgType == "1"){
	            					
	            					selectCtg += "<option value='" + rep[i].ctgNo + "'>" + rep[i].ctgName + "</option>";
	            					
	            					myVal += "<li>"
			                         +		"<div class='cal_ctg'>"
			                         +			"<div>"
			                         +				"<input type='checkbox' name='showList' value='" + rep[i].ctgNo + "' class='show_chk' style='accent-color: " + rep[i].color +";' checked='" + (rep[i].isShow == "Y" ? "true" : "false")  + "'>&nbsp;"
			                         +				"<span>" + rep[i].ctgName + "</span>"
			                         +			"</div>"
			                         +			"<div>"
			                         +				"<button type='button' class='btn btn-sm' onclick='openEditMyModal(" + rep[i].ctgNo + ");'><i class='ti ti-edit'></i></button>"
			                         +			"</div>"
			                         +		"</div>"
			                         + "</li>";
			                   
	            				}else if(rep[i].ctgType == "2"){
	            					
	            					selectCtg += "<option value='" + rep[i].ctgNo + "'>" + rep[i].ctgName + "(" + rep[i].ctgWriter + ")</option>";
	            					
	            					shVal += "<li>"
				                         +		"<div class='cal_ctg'>"
				                         +			"<div>"
				                         +				"<input type='checkbox' name='showList' value='" + rep[i].ctgNo + "' class='show_chk' style='accent-color: " + rep[i].color +";'>&nbsp;"
				                         +				"<span>" + rep[i].ctgName + "</span>"
				                         +			"</div>"
				                         +			"<div>"
				                         +				"<button type='button' class='btn btn-sm btn-outline-primary'><i class='ti ti-edit'></button>"
				                         +			"</div>"
				                         +		"</div>"
				                         + "</li>";
				                         
				                // 공유멤버 담기         
				                shareList.push(rep[i].sList);         
	            				}
	            			}
            			}else{
										myVal = "<li><span>조회된 개인 캘린더가 없습니다.</span></li>";            				
										shVal = "<li><span>조회된 공유 캘린더가 없습니다.</span></li>";
										selectCtg = "<option value='0'>없음</option>"
            			}
            			
            			
            			$(".my_calendar_list ul").html(myVal);
            			$(".share_calendar_list ul").html(shVal);
            			$("#editForm #selectCtg").html(selectCtg);
            			
            		},
            		error:function(){
            			console.log("캘린더 카테고리 조회용 ajax 통신 실패");
            		}
            		
            	})
         
            } // 카테고리 조회 끝

            
            // 카테고리 수정 ajax
            function ajaxUpdateCalCtg(){
            	
            	let $ctgNameVal = $("#insert_my input[name='ctgName']").val();
            	let $ctgNoVal = $("#insert_my input[name='ctgNo']").val();
            	let $color = "";
            	
            	if( $ctgNameVal == null || $ctgNameVal == ""){
            		alert("캘린더 이름을 입력해주세요!");
            	}else if(colorChkValidate(1)){
            		
            		$("#insert_my input[type='checkbox']").each(function(){
                  if($(this).prop("checked")){
      	            $color = $(this).val();
    	           	}
                   
                })
            		
            		$.ajax({
            			url:"${contextPath}/calendar/updateCtg.do",
            			type:"post",
               		async:false,
               		data:{
               			ctgNo:$ctgNoVal,
               			ctgName:$ctgNameVal,
               			color:$color
               		},
               		success:function(result){
               			if(result > 0){
               				alert("성공적으로 수정되었습니다.");
               			}else{
               				alert("수정에 실패했습니다. 잠시후 다시 시도해주세요");
               			}
	               		
               			ajaxSelectListCalCtg();
               			ajaxSelectCalList();
               			
               			
               		},
               		error:function(result){
               			console.log("카테고리 수정용 ajax통신 실패")
               		}
               		
            		
            		})
            	}
            }// 카테고리 수정 끝
            
            
            // 카테고리 삭제 ajax
            function ajaxDeleteCtg(){
            	
            	let $ctgNoVal = $("#insert_my input[name='ctgNo']").val();
            	if(confirm("등록된 모든 일정이 삭제되며 삭제 후엔 복구가 불가합니다. \n 정말 삭제하시겠습니까?")){
            		
            		$.ajax({
                		url:"${contextPath}/calendar/deleteCtg.do",
                		type:"post",
                		async:false,
                		data:"ctgNo=" + $ctgNoVal,
                		success:function(result){
                			
                			if(result > 0){
                				alert("성공적으로 삭제되었습니다.");
                			}else{
                				alert("삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
                			}
                			
                			ajaxSelectListCalCtg();
                 			ajaxSelectCalList();
                		},
                		error:function(result){
                			console.log("카테고리 삭제용 ajax통신 실패");
                		}
                		
                	})
            		
            	}
            	
            }// 카테고리 삭제 끝
            
            
         		// 일정 조회용 ajax
		     		function ajaxSelectCalList(){
		     			
		     			calList.length = 0;
		     			
		     			// 조회하고자 하는 캘린더 카테고리 배열
		     			let ctgArray = [];
		     			
		     			$(".show_chk").each(function(){
		     				if($(this).prop("checked")){
		     					ctgArray.push($(this).val());		
		     				}
		     			})
		     			
		     			if(ctgArray.length > 0){// 카테고리 하나 이상 선택
		     				$.ajax({
		         				url:"${contextPath}/calendar/calList.do",
		         				type:"post",
		         				async:false,
		         				data:$("#ctgList_form").serialize(),
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
		         								ctgType:rep[i].ctg.ctgType,
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
		         								calWriter:rep[i].calWriter,
		         								registDate:rep[i].registDate,
		         								modifier:rep[i].modifier,
		         								modifyDate:rep[i].modifyDate
		       		
		         							})
		         						}
		         						
		         						console.log("calList",calList);
						         			
		         					}
		         					
		         				},
		         				error:function(){
		         					console.log("일정 조회용 ajax 통신 실패");
		         				}
		         				  				
		         			})
		
		     			}else{ // 카테고리 하나도 선택하지 않음
		     				console.log("조회할 일정 없음");
		     			}
		     			
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
		   		   		dayHeaderFormat: { weekday: 'short' }, // 일 제거
		   		   		dayMaxEventRows: 3, 
		   		   		eventMaxStack: 3,
		   		      selectable: true,
		   		      selectMirror: true,
	       	      select:function(info){
	       	    		let startStr = info.startStr;
	                let endStr = info.endStr;
	
	                $("#editForm .modal-title").html("일정 등록");
	                
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
									let ctgType = event.extendedProps.ctgType;
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
									let calWriter = event.extendedProps.calWriter;
									let registDate = event.extendedProps.registDate;
									let modifier = event.extendedProps.modifier;
									let modifyDate = event.extendedProps.modifyDate;
									
									
									if(event.allDay && start !== end){
										// 이벤트 데이터에서 end 날짜 값을 가져옴
			       			 	let fixedEnd = new Date(end);
	
			       			  // 하루를 다시 빼기
			       			  fixedEnd.setDate(end.getDate() - 1);
	
			       			  end = fixedEnd;
									}
									
									// 일정이 속한 캘린더(카테고리) 찾기
									for(let i=0; i<ctgList.length; i++){
										if(ctgNo == ctgList[i].ctgNo){
											$("#ctgColor").css("background-color", ctgList[i].color);
											$("#ctgName").html(ctgList[i].ctgName);
											
											// 공유 개인 일정에 따라 공유멤버 볼 수 있는 버튼 보이기 여부 결정
											if(ctgType == "1"){ // 개인
												$("#shareListBtn").css("display", "none");
												// 수정삭제버튼 보이고 확인버튼 안보임
												$("#detailForm .editBtnForm").css("display", "block");
												$("#detailForm .onlyConfirmBtn").css("display", "hidden");
											
												
											}else{ // 공유
												$("#shareListBtn").css("display", "inline");
											  $("#shareListBtn").html(ctgList[i].shareCount);
											  
											  let sList = ctgList[i].sList;
											  
											  for(let j=0; j<sList.length; j++){
												  if(sList[j].shareMemNo == "${loginUser.memNo}" || sList[j].rightLevel == "1"){
													  // 로그인한 회원의 권한이 조회/등록일 경우 => 수정삭제버튼 보임
													  $("#detailForm .editBtnForm").css("display", "block");
														$("#detailForm .onlyConfirmBtn").css("display", "hidden");
												  }else{
													  // 로그인한 회원의 권한이 조회만일 경우 => 확인버튼 보임
													  $("#detailForm .editBtnForm").css("display", "hidden");
														$("#detailForm .onlyConfirmBtn").css("display", "block");
												  }
											  }
											}
											
										}
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
										
										$("#editForm .modal-title").html("일정 수정");
										
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
		   		    /*
		       		  $(".fc-daygrid-day-number").each(function(){
		
		       				var day = $(this).text();
		       				$(this).text("");
		
			       			day = day.replace("일","");
		
		       				$(this).text(day);
		
		       			});
		   		    */
		     			
		     		}// 일정 조회 끝
            
            // 일정 수정, 등록용 모달창 초기화
            function resetEditModal(){
            	// 등록, 수정 모달창 안의 입력창 값 초기화
            	let today = new Date();
            	
            	
							$("#selectCtg option").each(function(){
								if($(this).prop("selected")){
									$(this).prop("selected", false);
								}
							})
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
            
            
         		// 일정 등록용 ajax
         		function ajaxInsertEvt(){
         			// 일정 제목, 내용 value값 가져오기
         			let evtTitle = document.getElementById("calTitle").value;
         			let evtContent = document.getElementById("calContent").value;
         			
         			// 캘린더 카테고리 생성 여부, 카테고리 번호
         			let ctgValue = document.getElementById("selectCtg").value;
         			
         			// 종일 체크박스 체크박스 체크 여부 가져오기
	            let isAlldayChecked = document.getElementById("isAllday").checked;
         			let isAllday = isAlldayChecked ? 'Y' : 'N';
	
	            // 시작 및 종료 날짜 가져오기
	            let startDate = new Date(document.getElementById("startDate").value);
	            let endDate = new Date(document.getElementById("endDate").value);
	
	            // 시작 및 종료 시간 가져오기
	            let startTime = document.getElementById("startTime").value;
	            let endTime = document.getElementById("endTime").value;
	
	            // 시간 비교 (시간 형식을 24시간 형식으로 변환하여 비교)
	            let startHour = parseInt(startTime.split(":")[0]);
	            let endHour = parseInt(endTime.split(":")[0]);
	            
	            if(ctgValue == 0){
	            	// 캘린더 x = value값 0 | 캘린더 o = value값 > 0
	            	alert("생성된 캘린더가 없습니다. 캘린더를 먼저 생성해주세요.");
	            }else if (startDate > endDate) { 
	            	// 날짜 비교
	            	alert("종료 날짜는 시작 날짜보다 이후여야 합니다.");
	                
	            }else if (!isAlldayChecked && (startHour > endHour || (startHour === endHour && parseInt(startTime.split(":")[1]) >= parseInt(endTime.split(":")[1])) ) ) {
	            	// 종일선택되지 않았을 때의 시간 비교
	            	alert("종료 시간은 시작 시간보다 이후여야 합니다.");
	                
	            }else{ //
	            	//console.log("ajax요청 가능");
	            	let startDateTime = document.getElementById("startDate").value;
	            	let endDateTime = document.getElementById("endDate").value;
	            	
	            	if(!isAlldayChecked){
	            		startDateTime += " " + startTime;
	            		endDateTime += " " + endTime;
	            	}
	            	/*
	            	console.log("ctgValue", ctgValue);
	            	console.log("evtTitle", evtTitle);
	            	console.log("startDateTime", startDateTime);
	            	console.log("endDateTime", endDateTime);
	            	console.log("evtContent", evtContent);
	            	console.log("isAllday", isAllday);
	            	*/
	            	$.ajax({
	            		url:"${contextPath}/calendar/insertEvt.do",
	            		type:"post",
	            		data:{
	            			ctgNo:ctgValue,
	            			calTitle:evtTitle,
	            			calContent:evtContent,
	            			startDate:startDateTime,
	            			endDate:endDateTime,
	            			isAllday:isAllday
	            		},
	            		success:function(result){
	            			
            				// 모든 입력창 값 초기화
            				resetEditModal();
            				
	            			if(result > 0){
	            				
	            				
	            				alert("일정을 성공적으로 등록했습니다.");
	            			}else{
	            				
	            				alert("일정 등록에 실패했습니다. 잠시후 다시 시도해주세요.");
	            			}
	            			
	            			ajaxSelectCalList();
	            			
	            		},
	            		error:function(){
	            			console.log("일정 등록용 ajax 통신 실패");
	            		}
	            	})
	            	
	            }
	
	           
	         	}
         		
         		
         		
         		// 일정 수정용 ajax
         		function ajaxUpdateEvent(){
         			// 일정 번호 value값 가져오기
         			let calNoValue = document.getElementById("calNo").value;
         			
         			// 일정 제목, 내용 value값 가져오기
         			let evtTitle = document.getElementById("calTitle").value;
         			let evtContent = document.getElementById("calContent").value;
         			
         			// 캘린더 카테고리 생성 여부, 카테고리 번호값
         			let ctgValue = document.getElementById("selectCtg").value;
         			
         			// 종일 체크박스 체크박스 체크 여부 가져오기
	            let isAlldayChecked = document.getElementById("isAllday").checked;
         			let isAllday = isAlldayChecked ? 'Y' : 'N';
	
	            // 시작 및 종료 날짜 가져오기
	            let startDate = new Date(document.getElementById("startDate").value);
	            let endDate = new Date(document.getElementById("endDate").value);
	
	            // 시작 및 종료 시간 가져오기
	            let startTime = document.getElementById("startTime").value;
	            let endTime = document.getElementById("endTime").value;
	
	            // 시간 비교 (시간 형식을 24시간 형식으로 변환하여 비교)
	            let startHour = parseInt(startTime.split(":")[0]);
	            let endHour = parseInt(endTime.split(":")[0]);
	            
	            if(ctgValue == 0){
	            	// 캘린더 x = value값 0 | 캘린더 o = value값 > 0
	            	alert("생성된 캘린더가 없습니다. 캘린더를 먼저 생성해주세요.");
	            }else if (startDate > endDate) { 
	            	// 날짜 비교
	            	alert("종료 날짜는 시작 날짜보다 이후여야 합니다.");
	                
	            }else if (!isAlldayChecked && (startHour > endHour || (startHour === endHour && parseInt(startTime.split(":")[1]) >= parseInt(endTime.split(":")[1])) ) ) {
	            	// 종일선택되지 않았을 때의 시간 비교
	            	alert("종료 시간은 시작 시간보다 이후여야 합니다.");
	                
	            }else{ //
	            	//console.log("ajax요청 가능");
	            	let startDateTime = document.getElementById("startDate").value;
	            	let endDateTime = document.getElementById("endDate").value;
	            	
	            	if(!isAlldayChecked){
	            		startDateTime += " " + startTime;
	            		endDateTime += " " + endTime;
	            	}
	            	
	            	$.ajax({
	            		url:"${contextPath}/calendar/updateEvt.do",
	            		type:"post",
	            		data:{
	            			calNo:calNoValue,
	            			ctgNo:ctgValue,
	            			calTitle:evtTitle,
	            			calContent:evtContent,
	            			startDate:startDateTime,
	            			endDate:endDateTime,
	            			isAllday:isAllday
	            		},
	            		success:function(result){
	            			console.log(result);
	            			
            				// 모든 입력창 값 초기화
            				resetEditModal();
            				
	            			if(result > 0){
	            				alert("일정을 성공적으로 수정했습니다.");
	            			}else{
	            				alert("일정 수정에 실패했습니다. 잠시후 다시 시도해주세요.");
	            			}
	            			
	            			ajaxSelectCalList();
	            			
	            		},
	            		error:function(){
	            			console.log("일정 수정용 ajax 통신 실패");
	            		}
	            	})
	            	
	            }
	            
         		}
         		
            // 일정 삭제용 ajax
            function ajaxDeleteEvent(){
            	
            	if(confirm("일정 삭제 후에는 복구가 불가합니다. \n정말 삭제하시겠습니까?")){
            		
            		$.ajax({
            			url:"${contextPath}/calendar/deleteEvt.do",
            			type:"post",
            			data:{
            				type:1,
            				delNo:$("#detailForm input[name='calNo']").val()
            			},
            			success:function(result){
            				if(result > 0){
            					alert("일정이 성공적으로 삭제되었습니다.");
            				}else{
            					alert("일정 삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
            				}
            				
           					ajaxSelectCalList();
            				
            			},
            			error:function(){
            				console.log("일정 삭제용 ajax통신실패");
            			}
            		})
            		
            	}
            	
            }
         		
         		
           
          </script>

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