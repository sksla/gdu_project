<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
 <!-- daterangepicker 관련 ------------------------------------------------------->
  <link rel="stylesheet" href="${ contextPath }/assets/libs/daterangepicker/daterangepicker.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.js"></script>
   <style>
        #selectedDatediv {
            display: flex; /* 부모 요소를 플렉스 컨테이너로 설정 */
            align-items: center; /* 아이템들을 세로 중앙에 정렬 */
            white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
            height: 100%; 
        }
        .timeselected {
            display: none; /* 처음에는 숨김 */
        }
    </style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/memberSidebar.jsp"/>
    
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
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">휴가신청</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">마이페이지</li>
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
               <div style="width:80%; ">  
                 <form id="enrollForm" action="${ contextPath }/member/vacationRegist.do" method="post">
                 <input type="hidden" name="memNo" value="${ loginUser.memNo }">
                <div>
                    <h5 class="card-title fw-semibold mb-3">휴가 현황 <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="none"><path fill="currentColor" d="m19.98 9.063l.75.002v-.002zm-15.96 0h-.75v.002zM19.1 10.66l-.573.485l.084.1l.114.065zm-.272-1.265a.75.75 0 0 0-.888 1.21zM4.02 15h-.75zm2.04-4.395a.75.75 0 1 0-.888-1.21zM12 5.656c-.772 0-1.21.041-1.556.084c-.34.042-.512.072-.838.072v1.5c.44 0 .725-.047 1.02-.083c.29-.036.666-.073 1.374-.073zm0 1.5c.708 0 1.085.037 1.373.073c.296.036.58.083 1.021.083v-1.5c-.326 0-.498-.03-.838-.072A11.885 11.885 0 0 0 12 5.656zm2.394.157c.213 0 .412-.061.555-.114c.156-.058.317-.134.472-.214c.305-.157.659-.367.983-.554c.34-.195.66-.373.947-.503c.308-.14.484-.178.554-.178v-1.5c-.408 0-.83.157-1.171.31a12.82 12.82 0 0 0-1.078.571c-.354.204-.658.385-.922.52c-.13.067-.23.113-.306.141c-.087.032-.087.02-.034.02zm3.511-1.563c.345 0 .675.103.907.303c.212.182.418.51.418 1.135h1.5c0-1-.352-1.766-.939-2.272c-.566-.487-1.272-.666-1.886-.666zm1.325 1.438v1.875h1.5V7.188zM9.606 5.813c.053 0 .053.011-.034-.02a2.92 2.92 0 0 1-.306-.141c-.264-.136-.568-.317-.922-.52c-.34-.196-.716-.408-1.078-.571c-.34-.154-.763-.311-1.171-.311v1.5c.07 0 .246.039.554.178c.287.13.608.308.947.503c.324.187.678.397.983.554c.155.08.316.156.472.214c.143.053.342.114.555.114zM6.095 4.25c-.614 0-1.32.179-1.886.666c-.587.505-.939 1.272-.939 2.271h1.5c0-.625.206-.952.418-1.134c.232-.2.563-.303.907-.303zM3.27 7.188v1.875h1.5V7.187zM12 20.75c1.431 0 3.54-.285 5.32-1.104c1.784-.82 3.41-2.273 3.41-4.646h-1.5c0 1.533-1.007 2.58-2.536 3.284c-1.53.704-3.412.966-4.694.966zm7.672-10.574a4.883 4.883 0 0 0-.844-.78l-.888 1.208c.24.177.433.359.587.54zM19.23 9.06c0 .198-.041.61-.138.895c-.055.159-.086.155-.03.11a.419.419 0 0 1 .412-.055l-.749 1.3c.18.104.402.18.65.167c.255-.013.466-.114.626-.242c.287-.23.432-.566.51-.796c.168-.491.218-1.08.22-1.374zM12 19.25c-1.282 0-3.163-.262-4.694-.966C5.776 17.58 4.77 16.533 4.77 15h-1.5c0 2.373 1.626 3.826 3.41 4.646c1.78.82 3.889 1.104 5.32 1.104zM4.77 15c0-.788-.057-1.437.019-2.128c.07-.645.253-1.218.684-1.727l-1.145-.97c-.68.805-.938 1.693-1.03 2.534c-.087.797-.028 1.66-.028 2.291zm.703-3.855a3.35 3.35 0 0 1 .587-.54l-.888-1.21c-.33.242-.609.503-.844.78zM3.27 9.065c.001.294.051.883.219 1.374c.078.23.223.566.51.796c.16.128.371.229.625.242c.249.012.47-.063.651-.167l-.749-1.3a.419.419 0 0 1 .411.055c.057.045.026.049-.029-.11a3.329 3.329 0 0 1-.138-.895z"/><path stroke="currentColor" stroke-width="1.5" d="M12.826 16c0 .173-.361.313-.806.313c-.446 0-.807-.14-.807-.313s.361-.312.807-.312c.445 0 .806.14.806.312Zm2.674-2.406c0 .431-.217.781-.484.781s-.484-.35-.484-.781c0-.432.217-.781.484-.781s.484.35.484.78Zm-6 0c0 .431-.217.781-.484.781s-.484-.35-.484-.781c0-.432.217-.781.484-.781s.484.35.484.78Z"/><path stroke="currentColor" stroke-linecap="round" stroke-width="1.5" d="M22 15.469c-.483-.313-2.58-1.094-3.387-1.094m1.774 3.594c-.484-.313-1.613-1.094-2.42-1.094M2 15.469c.484-.313 2.58-1.094 3.387-1.094m-1.774 3.594c.484-.313 1.613-1.094 2.42-1.094"/></g></svg></h5>
                    <p class="card-subtitle mb-4">잔여 휴가 <span class="text-primary">${ totalVac }일</span> (연차 ${ loginUser.leaveCount }일)</p>
                    <p>
                     아래 캘린더에서 휴가낼 날짜의 일자 또는 휴가선택 영역을 클릭하여 휴가를 신청할 수 있습니다.<br>
                     또는, 사용된 휴가 영역을 클릭하여 이미 신청된 휴가를 취소할 수 있습니다.
                    </p>
                    <div id="paginator1"></div>
                    
                    
                    <div class="input-group" style="width:50%;">
                      <input type="text" class="form-control pickadate-monyear-dropdown daterange"
                        placeholder="Month &amp; Year Dropdown" />
                        <input type="hidden" name="startDate" value="" id="startDate" >
                        <input type="hidden" name="endDate" value="" id="endDate" >

                      <span class="input-group-text">
                        <i class="ti ti-calendar fs-5"></i>
                      </span>
                    </div>
                    
                    <br><br>
                </div>
                <div class="mt-8">
                    <p class="card-title fw-semibold mb-4">휴가 신청 &nbsp;&nbsp; 
                        <span class="card-subtitle mb-2">선택일수 <span class="text-primary" id="dateRangeDays">0일</span></span>
                        <input type="hidden" name="vacUsed" value="" id="vacUsed" >
                    </p> 
                    
                    <hr>
                    
                   
                    <!-- 결과 표시를 위한 <p> 태그 -->
                    <div id="selectedDatediv" >
                    <p id="selectedDate" style="display: inline; margin-right: 10px;"></p>
                        <select class="form-select w-auto" name="vacType" id="vacTypeSelect" style="display: inline; width: auto; margin-left: 12px;">
                            <option value="정기">연차</option>
                            <option value="포상">보상</option>
                            <option value="반차" >반차</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                          <input class="form-check-input primary check-light-primary" type="radio" name="radio-light-primary" id="primary-light-radio" value="option1" checked>
                          <label class="form-check-label" for="primary-light-radio">종일</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input primary check-light-primary" type="radio" name="radio-light-primary" id="primary2-light-radio" value="option1" >
                          <label class="form-check-label" for="primary2-light-radio">시간</label>
                        </div>
                        <div class="timeselected">
	                        <select class="form-select w-auto" id="hoursSelect" style="display: inline; width: auto; margin-left: 15px;">
	                          <option value="1">4시간</option>
	                          <option value="2">8시간</option>
	                        </select>
	                        &nbsp;&nbsp; &nbsp;&nbsp; 
	                        <a href="javascript:void(0)" class=" fs-4">
	                          <i class="ti ti-xbox-x"></i>
	                        </a>
                        </div>
                    </div>
                    
                </div>
                <br>
                <div class="mt-8">
                  <p class="card-title fw-semibold mb-4">사유</p>

                 
                    <div class="form-floating mb-8">
                      <textarea class="form-control h-140" name="vacReason" placeholder="Leave a comment here" id="floatingTextarea2"></textarea>
                      <label for="floatingTextarea2">사유를 입력해주세요.</label>
                    </div>
                    <br>
                    <div class="d-flex align-items-center gap-6 flex-wrap mb-8 mt-8 ">
                      <button type="submit" class="btn btn-primary ms-auto">신청하기</button>
                    </div>
                  
                  <br><br>

                </div>


              </form>
                
            	</div>
            </div>
          </div>
					
					<!-- 날짜 선택 부분 -->
					 <script>
					 // moment.js를 사용하여 한글 요일로 변환하는 함수
				    function formatKoreanDate(dateString) {
				        return moment(dateString).format('YYYY-MM-DD (ddd)');
				    }
					 
					 
					 $(document).ready(function() {
					 	 moment.locale('ko'); // Moment.js 로케일을 한글로 설정
						 $('#selectedDatediv').hide(); // 페이지가 로드될 때 요소를 숨깁니다.
						 
						 $('.daterange').daterangepicker({
							     locale: {
							     "separator": " ~ ",                     // 시작일시와 종료일시 구분자
							     "format": 'YYYY-MM-DD',     // 일시 노출 포맷
							     "applyLabel": "확인",                    // 확인 버튼 텍스트
							     "cancelLabel": "취소",                   // 취소 버튼 텍스트
							     "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
							     "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
							     },
							     timePicker: false,                        // 시간 노출 여부
							     showDropdowns: true,                     // 년월 수동 설정 여부
							     autoApply: true,                         // 확인/취소 버튼 사용여부
							     timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
							     timePickerSeconds: false,                 // 초 노출 여부
							     singleDatePicker: false                   // 하나의 달력 사용 여부
							 });
						 
							 $('.daterange').on('apply.daterangepicker', function(ev, picker) {
								 // 한글 요일로 포맷된 시작 날짜와 끝 날짜 계산
							        let startDateFormatted = formatKoreanDate(picker.startDate.toDate());
							        let endDateFormatted = formatKoreanDate(picker.endDate.toDate());
											
				         // 선택한 날짜가 같은 경우에는 시작 날짜만 표시, 아닌 경우에는 시작 날짜부터 끝 날짜까지 표시
				            let displayDate = (startDateFormatted === endDateFormatted) ?
				                startDateFormatted :
				                startDateFormatted + ' ~ ' + endDateFormatted;

						        $('#selectedDate').text(displayDate);

						        // Calculate the number of days
						        let daysDiff = picker.endDate.diff(picker.startDate, 'days') + 1; // Include both start and end date
						        $('#dateRangeDays').text(daysDiff + '일');
						        $('#vacUsed').val(daysDiff); // hidden input에 값 설정
						        
						     		// 시작 날짜와 끝 날짜를 hidden input에 값 설정
		                $('#startDate').val(picker.startDate.format('YYYY-MM-DD'));
		                $('#endDate').val(picker.endDate.format('YYYY-MM-DD'));
						        
						    		 // 날짜가 선택되면 #selectedDatediv를 보이게 함
						        $('#selectedDatediv').show();
						    });
							  
							 $('.daterange').on('show.daterangepicker', function (ev, picker) {
							     $(".yearselect").css("float", "left");
							     $(".monthselect").css("float", "right");
							     $(".cancelBtn").css("float", "right");
							 });
						 
							 $(document).ready(function() {
								    $('input[name="radio-light-primary"]').change(function() {
								        if ($(this).attr('id') === 'primary2-light-radio') {
								            $('.timeselected').show();
								        } else {
								            $('.timeselected').hide();
								        }
								    });
								});
							 
							
							 $('#hoursSelect').on('change', function() {
		                if ($('#vacTypeSelect').val() === '정기' && $(this).val() === '1') {
		                    $('#vacTypeSelect option[value="반차"]').show();
		                    $('#vacTypeSelect').val('반차');
		                }else{
		                	 // 시간이 4시간이 아닌 경우 "반차" 옵션을 숨김
		                    $('#vacTypeSelect option[value="반차"]').hide();
		                }
		            })
		            
		            
			 
					 })
					 
					
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
  
  <!-- Date 피커 관련 -->
  <script src="${ contextPath }/assets/libs/daterangepicker/daterangepicker.js"></script>
  
	
</body>
</html>