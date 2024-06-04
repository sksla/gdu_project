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
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.13/index.global.min.js"></script>
<script>
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
    	googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
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
         
         },
     	eventSources: [ {
         googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
         classNames: 'holiday',
         backgroundColor: 'white',
         textColor: '#e63c09',
         constraint: 'availableForMeeting'
        }
			]    

    });
    calendar.render();
  });
</script>

<style>
	.off{display:none;}
	.my_calendar_toggle, .share_calendar_toggle{cursor:pointer;}
	
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
  .my_calendar_title, .share_calendar_title{
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
	.holiday{
		color:red; 
		background-color:transparent; 
		border-color:transparent;
		pointer-events:none;
	}
	
	
	
	/* 결재선 모달 스타일 */
  .list_box_wrap{
 		width: 30%;
    height: 400px;
  }
  .app_mem .mem_list{
  	height:160px;	
  	overflow: auto;
 	}
  .mem_list_box{
    border: 1px solid lightgrey;
    width: 100%;
    height: 93%;
  }
  .mem_list>div{
    font-size: 14px;
    padding: 8.5px 5px;
  }
  .mem_list>div:hover{
    background-color: #F2F2F2;
    color: rgb(90, 106, 133);
    cursor: pointer;
  }
  .selected_app_mem{
    width: 40%;
  }
  .selected_app_mem>div{
    display: flex;
    flex-direction: row;
  }
  .selected_mem{
    background-color: #03A9F3;
    color: white;
  }
  .calOwner{background-color: #EEEEEE; pointer-events: none;}
  .app_mem_etc{
    height: 100%;
    width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .app_mem_etc:hover{
    cursor: pointer;
  }
  .box_header{
  	height: 20px;
    font-weight: bold;
    font-size: 14px;
    text-align: center;
    border-bottom: 1px solid lightgrey;
  }
  .app_mem{
    width: 80%;
    border: 1px solid lightgrey;
    height: 100%;
    
  }
  .list-group .badge{display:none;}
  .box_content_wrap{
  	height:95%;
  	overflow: auto;
  }
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
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
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
                  <input type="text" class="search-style" name="" id="" placeholder="검색어 입력"  style="display:none;">
                  <button class="btn btn-outline-primary" style="display:none;">검색</button>
                  
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
	                  <div class="my_calendar p-2">
	                    <div class="my_calendar_title">
	                    	<div class="my_calendar_toggle d-flex align-items-baseline" onclick="toggleIcons(1);">
		                    	<span>
			                    		<i class="icon_up ti ti-chevron-up" style="font-size:30px;"></i>
			                    		<i class="off icon_down ti ti-chevron-down " style="font-size:30px;"></i>
	                    		</span>
		                      <span><h4>내 캘린더</h4></span>
	                    	</div>
	                      <button type="button" class="btn" onclick="openInsertMyModal();" data-bs-toggle="modal" data-bs-target="#insert_my"><i class="ti ti-plus"></i></button>
	                    </div>
	                    <div class="my_calendar_list">
	                      <ul>
	                      	
	                      </ul>
	                    </div>
	                  </div>
	
	                  <div class="share_calendar p-2">
	                    <div class="share_calendar_title">
	                    	<div class="share_calendar_toggle d-flex align-items-baseline" onclick="toggleIcons(2);">
	                      	<span>
		                    		<i class="icon_up ti ti-chevron-up" style="font-size:30px;"></i>
		                    		<i class="off icon_down ti ti-chevron-down " style="font-size:30px;"></i>
	                    		</span>
	                      	<span><h4>공유 캘린더</h4></span>
	                      </div>
	                      <button type="button" class="btn" data-bs-toggle="modal" onclick="openInsertShareModal();" data-bs-target="#insert_share">
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
                          <button id="shareListBtn" class="btn btn-sm rounded-circle btn-light">
                          	<i class="ti ti-user"></i>
                          	<span class="shareMemCount"></span>
                         	</button>
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
                      <tr>
                        <th>일정 내용</th>
                        <td id="detail_content">일정 내용내용</td>
                      </tr>
                      <tr class="calWriter_name">
                        <th>최초 등록</th>
                        <td>김사람(yyyy-dd-mm hh:mm)</td>
                      </tr>
                      <tr class="modifier_name">
                        <th>최근 수정</th>
                        <td>김사람(yyyy-dd-mm hh:mm)</td>
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
								
               	<form id="myCtgForm" action="${ contextPath }/calendar/insertCtg.do" method="POST">
	                <!-- Modal body -->
	                <div class="modal-body">
	                	<input type="hidden" name="ctgNo" value="0">	
	                	<input type="hidden" name="ctgType" value="1">
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
		                	<button type="button" class="btn btn-outline-secondary" onclick="ajaxUpdateCalCtg(1);" data-bs-dismiss="modal">수정</button> 
	                		<button type="button" class="btn btn-outline-danger" onclick="ajaxDeleteCtg(1, 'insert_my');" data-bs-dismiss="modal">삭제</button>
	                	</div>
	                	<div class="insertBtn">
		                  <button type="button" class="btn btn-outline-primary insertMyBtn" data-bs-dismiss="modal" onclick="ajaxInsertCalCtg(1);">등록</button>
		                  <button type="button" class="btn btn-info" data-bs-dismiss="modal">취소</button>
	                	</div>
	                </div>
               	</form>

              </div>
            </div>
          </div>


          <!-- 공유 캘린더(일정카테고리) 등록 모달창 -->
          <div class="modal" id="insert_share">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">공유 캘린더 등록</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	<form id="shareCtgForm" action="${contextPath }/calendar/insertCtg.do" method="post">
	                 	<input type="hidden" name="ctgNo" value="0">
                   	<input type="hidden" name="ctgType" value="2">
	                  <table class="table">
	                    <tbody>
	                      <tr>
	                        <th width="120px">공유 캘린더명</th>
	                        <td>
	                        	<input type="text" id="share_ctgName" name="ctgName" style="width:250px;" maxlength="15" required placeholder="15자 이내">
	                        </td>
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
	                        <td colspan="2">
	                        	<div class="input-group">
								              <div class="col-4">
								                <div class="input-group">
								                  <input type="text" id="search_box" class="form-control" placeholder="이름/부서명을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
								                </div>
								              </div>
								              <span class="mx-2">
								                <div class="custom-control py-2 custom-radio">
								                  <input type="radio" id="customRadio1" name="searchRadio" value="name" class="form-check-input searchRadio" checked/>
								                  <label class="form-check-label" for="customRadio1">이름으로 검색</label>
								                </div>
								              </span>
								              <span class="mx-2">
								                <div class="custom-control py-2 custom-radio">
								                  <input type="radio" id="customRadio2" name="searchRadio" value="major" class="form-check-input searchRadio" />
								                  <label class="form-check-label" for="customRadio2">학과로 검색</label>
								                </div>
								              </span>
								            </div>
								            
	            							
									            <div class="d-flex flex-row">
									            	<div class="me-2 list_box_wrap">
									            		<div class="my-1 text-end" style="height: 30px"></div>
										              <div class="mem_list_box">
										                <div class="box_header">학과목록</div>
										                <div id="myTreeview" class="box_content_wrap"></div>
										              </div>
									              </div>
									              <div class="list_box_wrap">
									              	<div class="my-1 text-end" style="height: 30px">
									              		<button type="button" class="btn btn-sm text-info fw-semibold select_all_btn" style="display:none;" onclick="selectAllMem(this);">전체선택</button>
									              	</div>
										              <div class="mem_list_box">
										                <div class="box_header">직원목록</div>
										                <div class="mem_list my_mem_list box_content_wrap" style="overflow-y: auto">
										                  
										                </div>
										              </div>
									              </div>
						            
									            	<div class="selected_app_mem list_box_wrap">
									              	<div class="my-1" style="display: block; height: 30px; text-align:right;">
									              		<button type="button" class="btn btn-sm btn-light fw-semibold resetEnrollLineBtn" onclick="resetEnrollLineModal();">초기화</button>
									              		<button type="button" class="btn btn-sm btn-light fw-semibold resetUpdateLineBtn" onclick="resetUpdateLineModal();">초기화</button>
									              	</div>
									                <div style="height: 180px; margin-bottom: 10px;">
									                  <div class="app_mem_etc">
									                    <div>
									                      <div class="mb-2 add_collaborator" onclick="addAppMember('levelOne');">
									                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
									                      </div>
									                      <div class="remove_collaborator" onclick="removeAppMember('levelOne');">
									                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
									                      </div>
									                    </div>
									                  </div>
									                  <div class="app_levelOne app_mem">
									                    <div class="box_header">조회,등록</div>
									                    <div class="mem_list">
									                    
									                    </div>
									                  </div>
									                </div>
									                <div style="height: 180px; margin-bottom: 10px;">
									                  <div class="app_mem_etc">
									                    <div>
									                      <div class="mb-2 add_approver" onclick="addAppMember('levelTwo');">
									                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
									                      </div>
									                      <div class="remove_approver" onclick="removeAppMember('levelTwo');">
									                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
									                      </div>
									                    </div>
									                  </div>
									                  <div class="app_levelTwo app_mem">
									                    <div class="box_header">조회</div>
									                    <div class="mem_list">
									                    
									                    </div>
									                  </div>
									                </div>
						                
						              		</div> 
						              		<!-- selected_app_mem end --> 
						                </div>
				                  
					                <!-- 직원 선택 끝 -->
					                
	                     	</td>
	                   	</tr>
	               		</tbody>
	                </table>
	
	                <!-- Modal footer -->
	                <div class="modal-footer justify-content-center">
	                  <div class="editBtn">
		                	<button type="button" class="btn btn-outline-secondary" onclick="ajaxUpdateCalCtg(2);" data-bs-dismiss="modal">수정</button> 
		               		<button type="button" class="btn btn-outline-danger" onclick="ajaxDeleteCtg(2, 'insert_share');" data-bs-dismiss="modal">삭제</button>
		               	</div>
		               	<div class="insertBtn">
		                  <button type="button" class="btn btn-outline-primary insertMyBtn" data-bs-dismiss="modal" onclick="ajaxInsertCalCtg(2);">등록</button>
		                  <button type="button" class="btn btn-info" data-bs-dismiss="modal">취소</button>
		               	</div>
	                </div>
								</form>
              </div>
            </div>
          </div>
         </div> 
          
          <!-- 공유 캘린더(일정카테고리) 상세조회 모달창 -->
          <div class="modal" id="detail_share">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">공유 캘린더 조회</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                
               		<input type="hidden" name="ctgNo" value="0">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="120px">공유 캘린더명</th>
                        <td class="ctgName"></td>
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
                      	<th>소유자</th>
                      	<td class="calOwner"></td>
                      </tr>
                      <tr>
                        <th colspan="2">공유대상</th>
                      </tr>
                      <tr>
                        <td colspan="2">
                        	<div class="d-flex flex-row justify-content-evenly">
								            	<div class="list_box_wrap" style="width:40%; height:200px;">
									              <div class="mem_list_box">
									                <div class="box_header">조회/등록</div>
									                <div class="mem_list my_mem_list box_content_wrap" style="overflow-y: auto">
									                	<ul class="levelOne">

                                    </ul>
									                </div>
									              </div>
								              </div>
								              <div class="list_box_wrap" style="width:40%; height:200px;">
									              <div class="mem_list_box" >
									                <div class="box_header">조회</div>
									                <div class="mem_list my_mem_list box_content_wrap" style="overflow-y: auto">
									                  <ul class="levelTwo">

                                    </ul>
									                </div>
									              </div>
								              </div>
								            <!-- selected_app_mem end --> 
					                </div>
			                  
				                <!-- 직원 선택 끝 -->
				                
                     	</td>
                   	</tr>
               		</tbody>
                </table>

                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                  <button type="button" class="btn btn-outline-danger" onclick="ajaxDeleteCtg(3, 'detail_share');" data-bs-dismiss="modal">삭제</button>
               		<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
                </div>
              </div>
            </div>
          </div>
         </div> 
          
          
          
          

          <script>
          	// 현재 로그인한 회원번호 
          	let memNo = ${loginUser.memNo};
          	// 전체 회원(트리뷰에서 조회함)
          	let memList = new Array();
          	
          
		       	// treeview의 부서 목록 전역변수
		      	let majorTree = [];
          
	       		// 카테고리 리스트 배열
	          let ctgList = new Array();
	          // 공유멤버 배열
	          let shareList = new Array();
	          // 기존멤버 매열 
	          let originMembers = new Array();
         		// 일정 담을 배열
       			let calList = [];
         		
         		let cookieName = "user_" + memNo;

            $(document).ready(function(){
            	
            	ajaxSelectListCalCtg();
            	getCookie(cookieName);
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
            	  setCookie();
            	  ajaxSelectCalList();
              })
              
              
              
		          // 결재선 선택 모달용 javascript **************************************
		      		// 부서목록 리스트 조회
		      		createMajorList("");
            	
            	
           		// 공유멤버선택 검색 기능
      				document.getElementById("search_box").onkeyup = function(e) {
		      			console.log("실행");
		      			let $searchType = $(".searchRadio:checked").val();
		      			let $search = $("#search_box").val();
		      			if($searchType == "name"){
		      				if($search == ""){
		          			$("#insert_share .my_mem_list").empty();
		          		}else{
		             		$.ajax({
		             			url:"${contextPath}/approval/searchMember.do",
		             			data:{ search: $search },
		             			type:"get",
		             			success: function(list){
		             				createMemList(list);
		             			},
		             			error: function(){
		             				console.log("부서목록 생성 ajax 통신 실패");
		             			}
		             		})
		          		}
		           	}else{
		           		if($search == ""){
		           			createMajorList("");
		          		}else{
		  	         		createMajorList($search);
		          		}
		           	}
		          }
           		
            	
            	
              
            })
            
            // 쿠키 설정
            function setCookie(){
            	let checkedCtgs = [];
            	// 체크된 체크박스 요소의 value 값을 배열에 저장
            	$('.show_chk:checked').each(function(){
            		checkedCtgs.push($(this).val());
              });
            	// 배열을 콤마로 구분된 문자열로 변환
              let resultString = checkedCtgs.join(' ');
            	console.log("카테고리값 문자열 : '"+ resultString + "'" );
            	
            	let name = "user_" + memNo;
            	let value = checkedCtgs.join(',');
            	
            	// expires 속성에 사용됨 나는 max-age를 쓸거임 초단위임
            	//let date = new Date(Date.now() + 86400e3);
            	//date = date.toUTCString();
            	document.cookie = encodeURIComponent(name) + '=' + encodeURIComponent(value)
            									+ "; path=/; max-age=" + (3600 * 24);
            	
            	console.log("쿠키 오븐에 넣음",document.cookie);
            	
            }
            
            // 주어진 이름의 쿠키를 반환하는데, 조건에 맞는 쿠키가 없다면 undefined 반환
            function getCookie(name){
            	console.log("name : ", name);
            	console.log("getCookie실행");
            	let matches = document.cookie.match(new RegExp(
            			"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
           			));
            	
            	let cookieVal = matches ? decodeURIComponent(matches[1]) : undefined;
            	console.log("오븐에 넣어둔 쿠키가 있나여? : ", cookieVal);
            	if(cookieVal != undefined){
            		cookieValArr = cookieVal.split(",");
            		
            		$(".show_chk").each(function(){
            			let checkValue = $(this).val();
            			if(cookieValArr.includes(checkValue)){
            				$(this).prop("checked", true);
            			}else{
										$(this).prop("checked", false);            				
            			}
            		})
            	}
            }
            
            
            
            
            // 카테고리 접혔다 폈다 하는 funciton
            function toggleIcons(type){
            	let titleName = type == 1 ? ".my_calendar" : ".share_calendar";
            	
            	let $iconUp =$("#ctgList_form " + titleName + " .icon_up");
            	let $iconDown = $("#ctgList_form " + titleName + " .icon_down");
            	
            	if($iconUp.hasClass("off")){
            		$iconUp.removeClass("off");
			          $iconDown.addClass("off"); 		
            		$(titleName + "_list").removeClass("off");
            	}else{
            		$iconUp.addClass("off");
            		$iconDown.removeClass("off");
            		$(titleName + "_list").addClass("off");
            	}
            }
            
            
            
            // 결재선 모달용 javascript ********************************************
			    	// treeview의 부서 목록 생성
			    	function createMajorList(search){    		
			    		$.ajax({
			    			url:"${contextPath}/approval/majorTreeList.do",
			    			type:"get",
			    			data:{search:search},
			    			success: function(list){
			    				//majorTree = [];
			    				for(let i=0; i<list.length; i++){
			    					majorTree[i] = {};
			    					majorTree[i].text = list[i].colName;
			    					majorTree[i].tags = [list[i].colNo, "college"];
			    					majorTree[i].nodes = [];
			    					let majorList = list[i].majorList;
			    					for(let j=0; j<majorList.length; j++){
			    						majorTree[i].nodes[j] = {};
			    						majorTree[i].nodes[j].text = majorList[j].majorName;
			    						majorTree[i].nodes[j].tags = [majorList[j].majorNo, "major"];
			    					}
			    				}
			    				console.log("createMajorList :", list);
			    				console.log("majorTree : ", majorTree);
			    				testTreeView(search);
			    			},
			    			error: function(){
			    				console.log("부서 목록 조회 실패");
			    			}    			
			    		})
			    		
			    	}
            
            function createMemList(list){
            	$("#insert_share .my_mem_list").empty();
				
				
							for(const member of list){
								let $newEl = $("<div>" + member.memName + " (" + member.majorNo + ", " + member.jobNo + ")" + "</div>");
								$newEl.append("<span class='hide'>" + member.memNo + "</span>");
											//.append("<span class='hide'>" + member.majorNo + "</span>")
											//.append("<span class='hide'>" + member.jobNo + "</span>")
											//.append("<span class='hide'>" + member.memName + "</span>");
											
								if(memNo == member.memNo){
									$newEl.addClass("calOwner");
								}
									
								$("#insert_share .my_mem_list").append($newEl);
							
							}
							
							if(list.length == 0 || list.length == 1 && $(".my_mem_list div").hasClass("calOwner")){
								$("#insert_share .select_all_btn").css("display", "none");
								$("#insert_share .select_all_btn").text("전체선택");
							}else{
								$("#insert_share .select_all_btn").css("display", "inline" );
								$("#insert_share .select_all_btn").text("전체선택");
							}
            }
            
	         	// 부서목록 treeview 생성 함수
	        	function testTreeView(search){
	        		console.log("search", search);
	            $("#myTreeview").treeview({
	                levels: (search == "" ? 1 : 99),
	                selectedBackColor: "#03a9f3",
	                onhoverColor: "rgba(0, 0, 0, 0.05)",
	                expandIcon: "ti ti-plus",
	                collapseIcon: "ti ti-minus",
	                nodeIcon: "ti ti-circle",
	                data: majorTree,
	                showTags: true,
	                highlightSelected: true,
	            }).on("click", function(){ // 학과 treeview클릭 이벤트
	            	let $badge = $(".node-selected").find(".badge");
	            	if($badge.eq(1).text() == "major"){
	            		$.ajax({
	            			url:"${contextPath}/approval/memberList.do",
	            			data:{ majorNo: $badge.eq(0).text() },
	            			type:"get",
	            			success: function(list){
	            				//console.log("뭐지",list);
	            				$("#insert_share .my_mem_list").empty();
	            				createMemList(list);
	            				/*
	            				for(const member of list){
	            					let $newEl = $("<div>" + member.memName + " (" + member.majorNo + ", " + member.jobNo + ")" + "</div>");
	            					$newEl.append("<span class='hide'>" + member.memNo + "</span>");
	            								//.append("<span class='hide'>" + member.majorNo + "</span>")
	            								//.append("<span class='hide'>" + member.jobNo + "</span>")
	            								//.append("<span class='hide'>" + member.memName + "</span>");
	            								
	            					if(memNo == member.memNo){
	            						$newEl.addClass("calOwner");
	            					}
	            						
	            					$("#insert_share .my_mem_list").append($newEl);
	            				
	            				}
	            				
	            				if(list.length == 0 || list.length == 1 && $(".my_mem_list div").hasClass("calOwner")){
	            					$("#insert_share .select_all_btn").css("display", "none");
	            					$("#insert_share .select_all_btn").text("전체선택");
	            				}else{
	            					$("#insert_share .select_all_btn").css("display", "inline" );
	            					$("#insert_share .select_all_btn").text("전체선택");
	            				}
	            				*/
	            				
	            				
	            			},
	            			error: function(){
	            				console.log("부서목록 생성 ajax 통신 실패");
	            			}
	            		})
	            	}
	            });
	          }
            
	        	// 직원 목록 선택
	        	$(".mem_list").on("click", "div", function(){
	        		// 컨트롤 누른경우 : 겹처서 선택, 하나씩 해제
	        		// 컨트롤 안 누른 경우 : 해당 객체 하나만 선택(선택되어 있어도)
	        		if(window.event.ctrlKey){
	        			if( $(this).hasClass("selected_mem") ){
	           			$(this).removeClass("selected_mem");
	           		}else{
	           			$(this).addClass("selected_mem");
	           		}
	        		}else{
	           		$(".mem_list > div").removeClass("selected_mem");
	        			if( !$(this).hasClass("selected_mem") ){
	        				$(this).addClass("selected_mem");
	        			}
	        		}
	        	})
        	
	        	// 전체선택 버튼 클릭시
	        	function selectAllMem(target){
	        		if($(target).text() == "전체선택"){
	        			$(".my_mem_list>div").each(function(index, el){
	    	    			if(!$(el).hasClass("selected_mem") && !$(el).hasClass("calOwner")){
	    	    				$(el).addClass("selected_mem");
	    	    			}
	    	    		})
	    	    		$(target).text("전체해제");
	        		}else{
	    	    		$(".my_mem_list>div").each(function(index, el){
	        				$(el).removeClass("selected_mem");    				
	    	    		})
	    	    		$(target).text("전체선택");
	        		}
	        	}
            
	        	// 화살표 클릭시 결재자 추가
	        	function addAppMember(appType){
	        		// 선택된 회원영역
	        		let $selectedMem = $(".my_mem_list>.selected_mem");
	        		// 이동하려는 구역 박스
	        		let $boxMem = $(".app_" + appType + ">.mem_list");
	        		
        			$selectedMem.each(function(index, el1){
        				let isMem = false;
        				$(".selected_app_mem .mem_list").children().each(function(index, el2){
        					if($(el1).children("span").eq(0).text() == $(el2).children("span").eq(0).text()){
        						alert("동일한 직원이 이미 공유 목록에 존재합니다.");
        						isMem = true;
        					}
        				})
        				if(!isMem){
           				let $test = $boxMem.append( $(el1).clone()
           																					.append("<input type='hidden' name='shareMemNo' value='" + $(el1).children("span").eq(0).text() + "'>")
           																					.append("<input type='hidden' name='rightLevel' value='" + (appType == "levelOne" ? "2" : "3" ) + "'>")
           																					.addClass("selected_" + appType));    					
        				}else{
    							return false;
        				}
           		})
           		
	        	}
	        	// 화살표 클릭시 결재자 제거
	        	function removeAppMember(appType){
	        		let $boxMem = $(".app_" + appType + ">.mem_list").children(".selected_mem").each(function(index, el){
	        			$(el).remove();
	        		});
	        	}
        	
	        	// 결재선 등록 모달 초기화 => 공유 멤버 등록 모달 초기화
	         	function resetEnrollLineModal(){
	         		createMajorList("");
             	$("#insert_share .mem_list").each(function(index, el){
             		$(el).empty();
             	})
             	
             	let $loginUserEl = $("<div class='calOwner'>${loginUser.memName} (${loginUser.majorNo}, ${loginUser.jobNo})</div>");
							$loginUserEl.append("<span class='hide'>${loginUser.memNo}</span>")
			    								.append("<input type='hidden' name='shareMemNo' value='${loginUser.memNo}'>")
			    								.append("<input type='hidden' name='rightLevel' value='1'>");
							
						    								
							
							$("#insert_share .app_levelOne>.mem_list").append($loginUserEl); 	
							console.log("등록 멤버 초기화");
	         	}
	        	
            	//console.log("originMem", originMembers);
	        	
	        	// 수정상태일때의 공유직원 등록 모달 초기화
	        	function resetUpdateLineModal(){
	        		
	        		$("#insert_share .mem_list").each(function(index, el) {
        		    //if (!$(el).hasClass("calOwner")) {
       		        $(el).empty();
        		    //}
	        		});
             	
	        		createMajorList("");
	        		$("#insert_share .list_box_wrap input[type='hidden']").remove();
	        		
             	for(let i=0; i< originMembers.length; i++){
	        			
	        			let om = originMembers[i];
	        			if(om.rightLevel == "1"){
	        				
									let $ownerEl = $("<div class='calOwner'></div>").text(om.shareMemName + " (" + om.majorName + ", " + om.jobName + ")");
									$ownerEl.append("<span class='hide'>" + om.shareMemNo + "</span>")
													.append("<input type='hidden' name='shareMemNo' value='" + om.shareMemNo + "'>")
													.append("<input type='hidden' name='rightLevel' value='" + om.rightLevel + "'>");
									
									$("#insert_share .app_levelOne>.mem_list").after("<input type='hidden' name='originMemNo' value='" + om.shareMemNo + "'>"
																																 + "<input type='hidden' name='originRightLv' value='" + om.rightLevel + "'>");
									$("#insert_share .app_levelOne>.mem_list").append($ownerEl);
									
	        			}else if(om.rightLevel == "2"){
	        				let $lvOneEl = $("<div class='selected_levelOne'></div>").text(om.shareMemName + " (" + om.majorName + ", " + om.jobName + ")");
	        				
	        				$lvOneEl.append("<span class='hide'>" + om.shareMemNo + "</span>")
	        								.append("<input type='hidden' name='shareMemNo' value='" + om.shareMemNo + "'>")
													.append("<input type='hidden' name='rightLevel' value='" + om.rightLevel + "'>");
													
	        				$("#insert_share .app_levelOne>.mem_list").after("<input type='hidden' name='originMemNo' value='" + om.shareMemNo + "'>"
	        																											 + "<input type='hidden' name='originRightLv' value='" + om.rightLevel + "'>");
	        				$("#insert_share .app_levelOne>.mem_list").append($lvOneEl);
	        			}else{
	        				let $lvTwoEl = $("<div class='selected_levelTwo'></div>").text(om.shareMemName + " (" + om.majorName + ", " + om.jobName + ")");
	        				$lvTwoEl.append("<span class='hide'>" + om.shareMemNo + "</span>")
	        								.append("<input type='hidden' name='shareMemNo' value='" + om.shareMemNo + "'>")
													.append("<input type='hidden' name='rightLevel' value='" + om.rightLevel + "'>");;
	        				
	        				$("#insert_share .app_levelTwo>.mem_list").after("<input type='hidden' name='originMemNo' value='" + om.shareMemNo + "'>"
	        																											 + "<input type='hidden' name='originRightLv' value='" + om.rightLevel + "'>");
	        				$("#insert_share .app_levelTwo>.mem_list").append($lvTwoEl);
	        			}
	        		}
             	console.log("수정 멤버 초기화");
             	
             	
	        	}
        	
        	

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
         		// + 캘린더명이 빈값이지 않는지 유효성 검사 추가
            function colorChkValidate(type){
         			
              let modalId = type == 1 ? "insert_my" : "insert_share";
              let count = 0;
              
              $("#" + modalId + " input[type='checkbox']").each(function(){
                if($(this).prop("checked")){
    	            count++;
    	          }
           
              })
							if($("#" + modalId + " input[name='ctgName']").val().trim() == ""){
								let typeStr = ( type == 1 ? "내" : "공유" );
								alert(typeStr + " 캘린더명을 입력해주세요!");
								
								return false;
								
							}else if(count == 0){
                alert("색상을 선택해주세요!");
                return false;
              }
              
              
              
              return true;
            }
         		
         		// 공유 캘린더 등록 버튼 클릭시 유효성 검사
         		function insertShareCtgVali(){
         			// 자신 외의 공유할 직원을 선택하지 않았을 때
         			
         			// 
         			//$("#shareCtgForm input[name='ctgName']").val($("#share_ctgName").val());
         			
         			/*
         			$("#insert_share input[type='checkbox']").each(function(){
	              if($(this).prop("checked")){
			         		$("#shareCtgForm input[name='color']").val($(this).val());
	  	          }
                   
              })
         			*/
         			let $shareMemDivEl = $(".selected_app_mem .mem_list").children();
         			console.log("공유직원 수 : ", $shareMemDivEl.length);
         			console.log("이름 : ", $("#shareCtgForm input[name='ctgName']").val());
         			console.log("색상 : ", $("#shareCtgForm input[name='color']").val());
         			
         			if(!colorChkValidate(2)){
         				// 캘린더명 입력 안했을 때
         				// 체크박스 하나도 선택하지 않았을 때
         				return false;
         			}else if($shareMemDivEl.length <= 1) {
         				alert("캘린더를 공유할 직원을 선택해주세요.");
         				return false;
         			}
         			
         			
         			return true;
         		}

         		
         		
         		
         		// 내캘린더 추가버튼 클릭시
         		function openInsertMyModal(){
         			
         			$("#insert_my .modal-title").html("내 캘린더 등록");
         			
         			// 모달창 초기화
         			$("#insert_my input[name='ctgName']").val("");
         			$("#insert_my input[type='checkbox']").each(function(){
	              	$(this).prop("checked", false);
         			})
         			
         			$("#insert_my .editBtn").css("display", "none");
         			$("#insert_my .insertBtn").css("display", "block");
         			
         			$("#insert_my").modal("show");
      	
         		}
         		
         		// 공유 캘린더 추가버튼 클릭시
            function openInsertShareModal(){
         			
         			$("#insert_share .modal-title").html("공유 캘린더 등록");
         			
         			// 모달창 초기화
            	$("#insert_share .list_box_wrap input[type='hidden']").remove();
            	resetEnrollLineModal();
            	$("#insert_share input[name='ctgName']").val("");
		     			$("#insert_share input[type='checkbox']").each(function(){
		     						$(this).prop("disabled", false);
		              	$(this).prop("checked", false);
		     			})
		     			
		     			$("#insert_share #customRadio1").prop("checked", true);
		     			$("#insert_share #customRadio2").prop("checked", false);
		     			$("#insert_share #search_box").val("");
		     			
		     			$("#insert_share .resetEnrollLineBtn").css("display", "inline");
		     			$("#insert_share .resetUpdateLineBtn").css("display", "none");
		     			$("#insert_share .editBtn").css("display", "none");
		     			$("#insert_share .notCalOwnerBtn").css("display", "none");
         			$("#insert_share .insertBtn").css("display", "block");
         			$("#insert_share .select_all_btn").css("display", "none");
         			$("#inser_share .select_all_btn").text("전체선택");
         			
         			
            	$("#insert_share").modal("show");
            }
     				
         		// 내캘린더(개인) 수정버튼 클릭시
         		function openEditMyModal(ctgNo){
							$("#insert_my .modal-title").html("내 캘린더 수정");
         			
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
         		
         		// 공유캘린더 수정버튼 클릭시
         		function openShareModal(ctgNo, memNo){
							for(let i=0; i<ctgList.length; i++){
         				let ctg = ctgList[i];
         				
         				// 클릭한 캘린더 고유번호에 해당하는 캘린더 정보 찾기
         				if(ctgNo == ctg.ctgNo){
         					
         					// 해당되는 공유멤버들 리스트 담기
         	       	//shareList = ctgList[i].shList;
         					// 해당 되는 카테고리의 포함된 공유멤버 리스트
         					let shList = ctg.shList;
       						
         					// 전역변수임
         					originMembers = shList;
         				
         					for(let j=0; j<shList.length; j++){
         						
         						if(memNo == shList[j].shareMemNo){

         							console.log("공유 수정버튼 클릭");
         							
         							
         							let level = shList[j].rightLevel
         							console.log("level: ", level);
         							if(level == "1"){
         								// 공유캘린더 소유자일 경우 => 공유캘린더 수정 모달
         								$("#insert_share #customRadio1").prop("checked", true);
         			     			$("#insert_share #customRadio2").prop("checked", false);
         			     			$("#insert_share #search_box").val("");
         			     			
         			     			$("#insert_share .resetEnrollLineBtn").css("display", "none");
         			     			$("#insert_share .resetUpdateLineBtn").css("display", "inline");
         			     			$("#insert_share .editBtn").css("display", "block");
         			     			$("#insert_share .insertBtn").css("display", "none");
         			     			$("#insert_share .select_all_btn").css("display", "none");
         			    			$("#insert_share .select_all_btn").text("전체선택");
         			    			
         			    			$("#insert_share input[name='ctgNo']").val(ctg.ctgNo);
         			    			$("#insert_share #share_ctgName").val(ctg.ctgName);
         		        		$("#insert_share input[type='checkbox']").each(function(){
         		        			
         		        			$(this).prop("disabled", false);
         		        			
         			 						if($(this).val() == ctg.color){
         			     		      	$(this).prop("checked", true);
         			 						}else{
         			 							$(this).prop("checked", false);
         			 						}
         			 	       	});
         		        		
         			 	       	
         			 	       	$("#insert_share .list_box_wrap input[type='hidden']").remove();
         								resetEnrollLineModal();
         			 	       	
         		        		for(let k=0; k< shList.length; k++){
         		        			
         		        			let sh = shList[k];
         		        			
         		        			if(sh.rightLevel == "1"){
         		        				//let $ownerEl = $("<div class='calOwner'></div>").text(sh.shareMemName + " (" + sh.majorName + ", " + sh.jobName + ")");
			    									//$ownerEl.append("<span class='hide'>" + sh.shareMemNo + "</span>")
			    									//				.append("<input type='hidden' name='shareMemNo' value='" + sh.shareMemNo + "'>")
			    									//				.append("<input type='hidden' name='rightLevel' value='" + sh.rightLevel + "'>");
			    									$("#insert_share .app_levelOne>.mem_list").after("<input type='hidden' name='originMemNo' value='" + sh.shareMemNo + "'>"
																																					 + "<input type='hidden' name='originRightLv' value='" + sh.rightLevel + "'>");
			    									
			    									//$("#insert_share .app_levelOne>.mem_list").append($ownerEl);
         		        			}else if(sh.rightLevel == "2"){
         		        				let $lvOneEl = $("<div class='selected_levelOne'></div>").text(sh.shareMemName + " (" + sh.majorName + ", " + sh.jobName + ")");
         		        				$lvOneEl.append("<span class='hide'>" + sh.shareMemNo + "</span>")
         		        								.append("<input type='hidden' name='shareMemNo' value='" + sh.shareMemNo + "'>")
																		.append("<input type='hidden' name='rightLevel' value='" + sh.rightLevel + "'>");
         		        				
         		        				$("#insert_share .app_levelOne>.mem_list").after("<input type='hidden' name='originMemNo' value='" + sh.shareMemNo + "'>"
         		        																											 + "<input type='hidden' name='originRightLv' value='" + sh.rightLevel + "'>");
         		        				$("#insert_share .app_levelOne>.mem_list").append($lvOneEl);
         		        			}else if(sh.rightLevel == "3"){
         		        				let $lvTwoEl = $("<div class='selected_levelTwo origin'></div>").text(sh.shareMemName + " (" + sh.majorName + ", " + sh.jobName + ")");
         		        				$lvTwoEl.append("<span class='hide'>" + sh.shareMemNo + "</span>")
         		        								.append("<input type='hidden' name='shareMemNo' value='" + sh.shareMemNo + "'>")
																		.append("<input type='hidden' name='rightLevel' value='" + sh.rightLevel + "'>");
         		        				
         		        				$("#insert_share .app_levelTwo>.mem_list").after("<input type='hidden' name='originMemNo' value='" + sh.shareMemNo + "'>"
         		        																											 + "<input type='hidden' name='originRightLv' value='" + sh.rightLevel + "'>");
         		        				$("#insert_share .app_levelTwo>.mem_list").append($lvTwoEl);
         		        			}
         		        		}
         		        		
         		        		$("#insert_share .modal-title").html("공유 캘린더 수정");
         		        		$("#insert_share").modal("show");
         								
         							}else{
         								// 공유캘린더 소유자가 아닐 경우 => 공유캘린더 상세정보 조회모달
         								openDetailShareModal(ctg, 1);
         							}
         						}
         						
         					}
         			
         				}
         				
         				
         			}

         		}// function 끝
         		
         		
         		// 공유캘린더 상세조회 모달 오픈
         		function openDetailShareModal(ctg, openType){
         			// type : 1(캘린더 상세조회에서 열었음) | 2(일정 상세 에서 열었음) 
         			let shList = ctg.shList;
         			console.log(ctgList);
         			console.log(ctg);
         		
         			$("#detail_share .btn-outline-danger").css("display", (openType == 1 ? "inline" : "none"));
         			
         			// 공유캘린더명
         			$("#detail_share .ctgName").text(ctg.ctgName);
         			$("#detail_share input[name='ctgNo']").val(ctg.ctgNo);
         			
         			// 색 체크박스 비활성화 및 해당 캘린더 색깔부분 체크되게
         			$("#detail_share input[type='checkbox']").each(function(){
         				if($(this).val() == ctg.color){
		     		      	$(this).prop("checked", true);
		 						}else{
		 							$(this).prop("checked", false);
		 						}
	 							$(this).prop("disabled", true);
		 	       	})
		 	       	
		 	       	$("#detail_share .custom-checkbox label").each(function(){
		 	       		$(this).css('pointer-events', 'none');
		 	       	})
		 	       	
		 	       	// ul안 초기화
		 	       	$("#detail_share .levelOne").empty();
         			$("#detail_share .levelTwo").empty();
         			
		 	       	
		 	       	for(let i=0; i<shList.length; i++){
		 	       		
		 	       		let sh = shList[i];
		 	       		
		 	       		if(sh.rightLevel != "3"){
				 	       	$("#detail_share .calOwner").text(sh.shareMemName + " (" + sh.majorName + " ,"  + sh.jobName  + ")");
				 	       	
				 	       	let $liEl1 = $("<li></li>").text(sh.shareMemName + " (" + sh.majorName + ", " + sh.jobName + ")");
				 	       	$("#detail_share .levelOne").append($liEl1);
				 	       	
		 	       		}else{
		 	       			
		 	       			let $liEl2 =  $("<li></li>").text(sh.shareMemName + " (" + sh.majorName + ", " + sh.jobName + ")");
		 	       		$("#detail_share .levelTwo").append($liEl2);
		 	       		}
		 	       		
		 	       	}
         			console.log("shList" , shList);
         			$("#detail_share").modal("show");
		 	       	
         		}// function openDetailShareModal 끝
         		
         		
         		
            
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
            			console.log("카테고리 조회용:",rep);
            			
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
	            					
	            					
		            					let list = rep[i].shList; 
		            					for(let j=0; j<list.length; j++){
		            						if(list[j].shareMemNo == memNo && list[j].rightLevel != "3"){
		            							
			            						selectCtg += "<option value='" + rep[i].ctgNo + "'>" + rep[i].ctgName + "(" + rep[i].ctgWriter + ")</option>";
		            						}
		            					}
	            						
	            				
	            					
	            					shVal += "<li>"
				                         +		"<div class='cal_ctg'>"
				                         +			"<div>"
				                         +				"<input type='checkbox' name='showList' value='" + rep[i].ctgNo + "' class='show_chk' style='accent-color: " + rep[i].color +";' checked='" + (rep[i].isShow == "Y" ? "true" : "false")  + "'>&nbsp;"
				                         +				"<span>" + rep[i].ctgName + "</span>"
				                         +			"</div>"
				                         +			"<div>"
				                         +				"<button type='button' class='btn btn-sm' onclick='openShareModal(" + rep[i].ctgNo + ", " + memNo + ");'><i class='ti ti-edit'></i></button>"
				                         +			"</div>"
				                         +		"</div>"
				                         + "</li>";
				                         
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
            
         		// 카테고리 등록 요청
         		function ajaxInsertCalCtg(type){
            	// type = 1 => 개인
            	let formName = ( type == 1 ? "#myCtgForm" : "#shareCtgForm" );
            	let alertStr = ( type == 1 ? "개인" : "공유" );
            	
            	if( (type == 1 ? colorChkValidate(type) : insertShareCtgVali()) ){
            	
           			
            		if(type == 2){
            			
	           			$("#insert_share .selected_app_mem .mem_list input[name='shareMemNo']").each(function(index, el){
	           				$(el).attr("name", "shList[" + index + "].shareMemNo");
	           			});
	           			
	           			$("#insert_share .selected_app_mem .mem_list input[name='rightLevel']").each(function(index, el){
	           				$(el).attr("name", "shList[" + index + "].rightLevel");
	           			});
            		}
	           			
	           			$.ajax({
	           				url:"${contextPath }/calendar/insertCtg.do",
	           				type:"post",
	           				data:$(formName).serialize(),
	           				success:function(result){
	           					if(result == "SUCCESS"){
	           						alert("성공적으로" + alertStr + " 캘린더가 등록되었습니다.");
	           					}else{
	           						alert( alertStr + " 캘린더 등록에 실패했습니다.");
	           					}
	           						
	           				 	ajaxSelectListCalCtg();
	           					ajaxSelectCalList();
	           				}
	           				
	           			})
            			
            		
            	
            	}else{
            		return false;
            	}
            	
            }

            
            // 카테고리 수정 ajax
            function ajaxUpdateCalCtg(type){
            	
            	let modalId = ( type == 1 ? "#insert_my" : "#insert_share" );
            	let formId = ( type == 1 ? "#myCtgForm" : "#shareCtgForm" );
            	
							if( (type == 1 ? colorChkValidate(type) : insertShareCtgVali()) ){
            	
           			
	          		if(type == 2){
	          			
	          			$("#insert_share .selected_app_mem .mem_list input[name='shareMemNo']").each(function(index, el){
	          				$(el).attr("name", "shList[" + index + "].shareMemNo");
	          			});
	          			
	          			$("#insert_share .selected_app_mem .mem_list input[name='rightLevel']").each(function(index, el){
	          				$(el).attr("name", "shList[" + index + "].rightLevel");
	          			});
	          			
	          			$("#insert_share .selected_app_mem input[type='hidden'][name='originMemNo']").each(function(index, el){
	          				$(el).attr("name", "originList[" + index + "].shareMemNo");
	          			});
	          			
	          			$("#insert_share .selected_app_mem input[type='hidden'][name='originRightLv']").each(function(index, el){
	          				$(el).attr("name", "originList[" + index + "].rightLevel");
	          			});
	          			
	          		}
            		
	          		$.ajax({
            			url:"${contextPath}/calendar/updateCtg.do",
            			type:"post",
               		async:false,
               		data:$(formId).serialize(),
               		success:function(result){
               			
               			if(result = "SUCCESS"){
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
            
            function ajaxDeleteCtg(delType, modalId){
            	
            	let $ctgNoVal = $("#" + modalId +  " input[name='ctgNo']").val();
            	let confirmStr = ( delType == 3 ? "공유 받은 캘린더를 삭제하시면, 해당 공유 캘린더에 등록한 일정이 모두 삭제되며, 더 이상 이 캘린더를 볼 수 없습니다. \n정말 삭제하시겠습니까?"
            																: "해당 캘린더에 등록된 모든 일정이 삭제되며 삭제 후엔 복구가 불가합니다. \n 정말 삭제하시겠습니까?" );
            	
            	let successAlertStr =  ( delType == 3 ? "성공적으로 삭제되었습니다. 다시 공유 받으시려면 캘린더 최초 생성자에게 요청하세요."
            												 								: "성공적으로 삭제되었습니다." );
            	if(confirm(confirmStr)){
            		console.log(modalId, $ctgNoVal);
            		console.log(delType);
            		
            		$.ajax({
                		url:"${contextPath}/calendar/deleteCtg.do",
                		type:"post",
                		async:false,
                		data:{
                			ctgNo:$ctgNoVal,
                			delType:delType
                		},
                		success:function(result){
                			console.log(result);
                			if(result == "SUCCESS"){
                				alert(successAlertStr);
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
		   		   		googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
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
		   		   		dayMaxEvents:true,
		   		   		//dayMaxEventRows: 3, 
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
												$("#detailForm .calWriter_name").css("display", "none");
											  $("#detailForm .modifier_name").css("display", "none");
												// 수정삭제버튼 보이고 확인버튼 안보임
												$("#detailForm .editBtnForm").css("display", "block");
												$("#detailForm .onlyConfirmBtn").css("display", "none");
											
												
											}else{ // 공유
												$("#shareListBtn").css("display", "inline");
											  $("#shareListBtn .shareMemCount").text(ctgList[i].shareCount);
											  $("#detailForm .calWriter_name td").text(calWriter + " " + registDate);
											  $("#detailForm .calWriter_name").css("display", "table-row");
											  $("#detailForm .modifier_name td").text(modifier != null ? modifier + " " + modifyDate : "--");
											  $("#detailForm .modifier_name").css("display", "table-row");
											  
											  $("#shareListBtn").on("click", function(){
												  openDetailShareModal(ctgList[i], 2);
											  });
											  
											  
											  let sList = ctgList[i].shList;
											  console.log(ctgList[i].shList);
											  for(let j=0; j<sList.length; j++){
												  if(sList[j].shareMemNo == memNo){
													  
													  if(sList[j].rightLevel != "3"){
														  
														  console.log("버튼 css 실행");
														  // 로그인한 회원의 권한이 조회/등록일 경우 => 수정삭제버튼 보임
														  $("#detailForm .editBtnForm").css("display", "block");
															$("#detailForm .onlyConfirmBtn").css("display", "none");
														  
													  }else{
														  // 로그인한 회원의 권한이 조회만일 경우 => 확인버튼 보임
														  $("#detailForm .editBtnForm").css("display", "none");
															$("#detailForm .onlyConfirmBtn").css("display", "block");
													  }
														  
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
								
		       	
		       			},
		       			eventSources: [ {
                            googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                            classNames: 'holiday',
                            //backgroundColor: 'white',
                            textColor: '#e63c09',
                            constraint: 'availableForMeeting'
                           }
            							]
		   		    
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
	            }else if(evtTitle == null || evtTitle.trim() == ""){
	            	// 제목에 빈값이 들어갔는지 비교
	            	alert("일정 제목을 입력해주세요.");
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
	            }else if(evtTitle == null || evtTitle.trim() == ""){
	            	alert("일정 제목을 입력해주세요");
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
  
   <!-- treeview 연동 스크립트 -->
	<script src="../assets/libs/bootstrap-tree/dist/bootstrap-treeview.min.js"></script>
	<script src="../assets/js/plugins/bootstrap-treeview-init.js"></script>
	
</body>
</html>