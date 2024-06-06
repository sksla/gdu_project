<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="horizontal">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- 날씨관련 라이브러리 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.10/css/weather-icons.min.css"> 
	
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="${ contextPath }/assets/images/logos/favicon.png" />

  <!-- Core Css -->
  <link rel="stylesheet" href="${ contextPath }/assets/css/styles.css" />

  <title>메인페이지</title>
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="${ contextPath }/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.13/index.global.min.js"></script>
  
  <script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
          left: 'prevYear,prev,next,nextYear',
          center: 'title',
          right:'today'
        },
        nowIndicator: true, // 현재 시간 마크
        timeZone:'local', // 우리나라 시간
        locale: 'ko', // 한국어 설정
      });
      calendar.render();
    });

  </script>
	
	<style>
		.container {
        display: flex;
        
    }
    .container *{box-sizing: border-box;}
      .left-box {
        width:25%;
        min-height: 800px;
        padding: 20px;
        text-align: center;
    }
    .right-box {
        width:75%;
        min-height: 800px;
        padding: 20px;
        text-align: center;
    }
  
    .card-body {
        box-sizing: border-box;
    }
    .card-body > div,
    .card-body > button {
       
        white-space: nowrap; /* Prevent text from wrapping */
    }
    .card-body > button {
        width: auto; /* Adjust button width automatically */
    }
     .bg-info-subtle {
        height: 35px;
        width: 100px;
        margin-right: 3px;
        white-space: nowrap;
        padding: 0 5px;
    }

    #checkInTime, #checkOutTime {
        width: 70px;
        margin-right: 3px;
    }   
    .preview_table td{padding: 10px;}
    .view_more:hover{cursor:pointer;}
    
    .card-body h4{color:#64B5F6;}
    
    /*투두리스트 관련 스타일*/
    .todo-area{
			height: 350px; padding:15px;
		}
		
		.todo-body{
			border:2px dashed #ebf3fe; 
			border-radius: 10px; 
			height: 260px; 
			padding:5px; 
			overflow-y: auto;
		}
		
		.todo-item{
			display: flex; 
			justify-content: space-between; 
			align-items: center; 
			padding: 10px; 
			background-color: #ebf3fe; 
			border-radius: 10px;
			margin-bottom: 5px;
		}
		.form-check-input[type=checkbox]{
			border-color:gray;
		}
    
    /* 달력 스타일*/
    #calendar * {padding:0px;}
	  #calendar .fc-header-toolbar{margin:5px;}
	  #calendar{height: 400px;}
		.app-calendar .fc .fc-day-sun .fc-daygrid-day-number{
		  color: red;
		  text-decoration: none;
		}
		.app-calendar .fc .fc-day-sat .fc-daygrid-day-number{
		  color: blue;
		  text-decoration: none;
		}
    .holiday{
			color:red; 
			background-color:transparent !important; 
			border-color:transparent;
			pointer-events:none;
		}
		.fc-today-button.fc-button.fc-button-primary{font-size:12px; padding:2px;}
		.fc .fc-toolbar-title{font-size:20px;}
    .app-calendar .fc .fc-daygrid-day-number{font-size:12px;}
    .fc-day-today .fc-daygird-number{font-size:12px;}
    .fc-scrollgrid-sync-table{font-size:12px;}
    .fc-event-title-container{height:15px;font-size:10px;}
    

    .board_title:hover, .app_doc_title:hover{cursor: pointer;}

    /*알림 스타일*/
    .alert-body{max-height: 360px; overflow-y:auto;}
		.alert-item i{font-size:20px;}
		.read-alert{background-color:#EEEEEE;}
		.read-alert h6{color:#9E9E9E;}
		.alert-item h6{width:210px; white-space:normal}
		.alert-item p{font-size:10px;margin:auto}
		.alert-item{cursor:pointer;} 
    
    /* 스크롤바 스타일 */
		.alert-body::-webkit-scrollbar {
		  width: 8px;
		  
		}
		.alert-body::-webkit-scrollbar-thumb {
		  background-color: #EEEEEE;
		  border-radius: 5px;
   	}

	</style>
</head>

<body>
	<script>
    if ("${alertMsg}" !== "") { // 어떤 메세지 문구가 존재할 경우
        alert("${alertMsg}");
        
        // 이하의 코드는 alert 창을 띄운 후 추가적으로 실행할 내용
        if ("${historyBackYN}" === "Y") {
            history.back();
        }
    }
	</script>
  
  <!-- Preloader -->
  <div class="preloader">
    <img src="${ contextPath }/assets/images/logos/favicon.png" alt="loader" class="lds-ripple img-fluid" />
  </div>
  <div id="main-wrapper">
    
    <div class="page-wrapper">
      <!-- -----------------  Header Start 헤더 시작 ---------------- -->
      <header class="topbar">
        
        <div class="app-header with-horizontal">
          <nav class="navbar navbar-expand-xl container-fluid p-0">
            <ul class="navbar-nav">
              <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler ms-n3" id="sidebarCollapse" href="javascript:void(0)">
                  <i class="ti ti-menu-2"></i>
                </a>
              </li>
              <li class="nav-item d-none d-xl-block d-flex align-items-center">
                <a href="${ contextPath }" class="text-nowrap nav-link">
                  <img src="${ contextPath }/assets/images/logos/longlogo.png" class="dark-logo pt-3 pb-3" width="" height="72" />
                  <img src="${ contextPath }/assets/images/logos/light-logo.svg" class="light-logo" width="180" alt="" />
                </a>
              </li>
            </ul>
            <ul class="navbar-nav quick-links d-none d-xl-flex">
              <!-- 메인 메뉴들 -->
              <!-- ----------------메인 메뉴들--------------- -->
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${contextPath}/approval/ongoingBoard.do">전자결재</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${contextPath}/chat/room.page">채팅</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${ contextPath }/calendar/calendar.page">일정</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${ contextPath }/reservation/reservationList.page">예약</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${ contextPath }/board/noticeList.do">게시판</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${ contextPath }/lec/lecList.do" >학생&수업</a>
              </li>
            </ul>
            <div class="d-block d-xl-none">
              <a href="${ contextPath }/horizontal/index.html" class="text-nowrap nav-link">
                <img src="${ contextPath }/assets/images/logos/dark-logo.svg" width="180" alt="" />
              </a>
            </div>
            <a class="navbar-toggler nav-icon-hover p-0 border-0" href="javascript:void(0)" data-bs-toggle="collapse"
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="p-2">
                <i class="ti ti-dots fs-7"></i>
              </span>
            </a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <div class="d-flex align-items-center justify-content-between px-0 px-xl-8">
                <a href="javascript:void(0)"
                  class="nav-link round-40 p-1 ps-0 d-flex d-xl-none align-items-center justify-content-center"
                  type="button" data-bs-toggle="offcanvas" data-bs-target="#mobilenavbar"
                  aria-controls="offcanvasWithBothOptions">
                  <i class="ti ti-align-justified fs-7"></i>
                </a>
                <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-center">
         
                  
                  <!-- --- 관리자일때만 보이는 버튼 (톱니바퀴)---------------------------- -->
                  <c:if test="${not empty loginUser and loginUser.jobNo eq '행정관리'}">
	                  <li class="nav-item">
	                    <a class="nav-link nav-icon-hover admin" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
	                      aria-expanded="false">
	                      <span>
	                        <i class="ti ti-settings"></i>
	                      </span>
	                    </a>
	                  </li>
                  </c:if>
                  <!-- ------------------------------- -->
                  <!-- ---------조직도 버튼------------- -->
                  <li class="nav-item">
                    <a class="nav-link nav-icon-hover chart" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                      aria-expanded="false">
                      <span>
                        <i class="ti ti-tournament"></i>
                      </span>
                    </a>
                  </li>
			            <script>
			            	// 조직도 페이지로 이동
			            	$(document).on("click", ".chart", function(){
			            		location.href="${contextPath}/admin/chart.do";
			            	});
			            	
			            	// 관리자 메인페이지로 이동
			            	$(document).on("click", ".admin", function(){
			            		location.href="${contextPath}/admin/adminDashboard.do";
			            	});
			            </script>
                  <!-- ------------------------------- -->

                  <!-- ------------------------------- -->
                  <!-- start notification Dropdown 알람 아이콘 드롭다운 -->
                  <!-- ------------------------------- -->
                  <li class="nav-item dropdown">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                      aria-expanded="false">
                      <i class="ti ti-bell-ringing"></i>
                      <div class="notification bg-primary rounded-circle"></div>
                    </a>
                  	<div class="alert-area dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
		                  aria-labelledby="drop2">
		                  <div class="alert-title d-flex align-items-center justify-content-between py-3 px-7">
		                    <h5 class="mb-0 fs-5 fw-semibold">알림</h5>
		                    <span class="new-alert-count badge text-bg-primary rounded-4 px-3 py-1 lh-sm">0 new</span>
		                  </div>
		                  <div class="alert-body message-body">
		                  
		                    <div class="no-alert-item py-6 px-7 dropdown-item">
		                    	새로운 알림이 없습니다.
		                    </div>
		                    	
		                  </div>
		                  <div class="py-6 px-7 mb-1">
		                    <button class="btn btn-outline-primary w-100 " id="delAllAlertBtn" onclick="ajaxDeleteAlert(2, 0, this);">알림 전체 삭제</button>
		                  </div>
		
		                </div>
                      

                    
                  </li>
                  <!-- ------------------------------- -->
                  <!-- end notification Dropdown -->
                  <!-- ------------------------------- -->

                  <!-- ------------------------------- -->
                  <!-- start profile Dropdown 프로필 드롭다운 -->
                  <!-- ------------------------------- -->
                  <li class="nav-item dropdown">
                    <a class="nav-link pe-0" href="javascript:void(0)" id="drop1" data-bs-toggle="dropdown"
                      aria-expanded="false">
                      <div class="d-flex align-items-center">
                        <div class="user-profile-img">
                          <img src="${ contextPath }<c:out value='${loginUser.profileUrl}' default='/assets/images/profile/user-1.jpg'/>" class="rounded-circle" width="35" height="35"
                            alt="" />
                        </div>
                      </div>
                    </a>
                    <div class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
                      aria-labelledby="drop1">
                      <div class="profile-dropdown position-relative" data-simplebar>
                        <div class="py-3 px-7 pb-0">
                          <h5 class="mb-0 fs-5 fw-semibold">User Profile</h5>
                        </div>
                        <div class="d-flex align-items-center py-9 mx-7 border-bottom">
                          <img src="${ contextPath }<c:out value='${loginUser.profileUrl}' default='/assets/images/profile/user-1.jpg'/>" class="rounded-circle" width="80" height="80"
                            alt="" />
                          <div class="ms-3">
                            <h5 class="mb-1 fs-3">${ loginUser.memName }</h5>
                            <span class="mb-1 d-block">${ loginUser.jobNo }</span>
                            <p class="mb-0 d-flex align-items-center gap-2">
                              <i class="ti ti-mail fs-4"></i> ${ loginUser.email }
                            </p>
                          </div>
                        </div>
                        <div class="message-body">
                          <a href="${ contextPath }/member/mypage.page"
                            class="py-8 px-7 mt-8 d-flex align-items-center">
                            <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
                              <img src="${ contextPath }/assets/images/svgs/icon-account.svg" alt="" width="24" height="24" />
                            </span>
                            <div class="w-75 d-inline-block v-middle ps-3">
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">마이페이지</h6>
                              <span class="fs-2 d-block text-body-secondary">Account Settings</span>
                            </div>
                          </a>
                          <a href="${contextPath}/chat/room.page" class="py-8 px-7 d-flex align-items-center">
                            <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
                              <img src="${ contextPath }/assets/images/svgs/icon-inbox.svg" alt="" width="24" height="24" />
                            </span>
                            <div class="w-75 d-inline-block v-middle ps-3">
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">채팅</h6>
                              <span class="fs-2 d-block text-body-secondary">Chat Messages</span>
                            </div>
                          </a>
                          <a href="${ contextPath }/member/vacationList.page" class="py-8 px-7 d-flex align-items-center">
                            <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
                              <img src="${ contextPath }/assets/images/svgs/icon-tasks.svg" alt="" width="24" height="24" />
                            </span>
                            <div class="w-75 d-inline-block v-middle ps-3">
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">근태관리</h6>
                              <span class="fs-2 d-block text-body-secondary">Attend and Vacation</span>
                            </div>
                          </a>
                        </div>
                        <div class="d-grid py-4 px-7 pt-8">
                        	<!-- 
                          <div
                            class="upgrade-plan bg-primary-subtle position-relative overflow-hidden rounded-4 p-4 mb-9">
                            <div class="row">
                              <div class="col-6">
                                <h5 class="fs-4 mb-3 fw-semibold">Unlimited Access</h5>
                                <button class="btn btn-primary">Upgrade</button>
                              </div>
                              <div class="col-6">
                                <div class="m-n4 unlimited-img">
                                  <img src="${ contextPath }/assets/images/backgrounds/unlimited-bg.png" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                           -->
                          <a href="${ contextPath }/member/signout.do" class="btn btn-outline-primary">Log Out</a>
                        </div>
                      </div>

                    </div>
                  </li>
                  <!-- ------------------------------- -->
                  <!-- end profile Dropdown -->
                  <!-- ------------------------------- -->
                </ul>
              </div>
            </div>
          </nav>
          
          <!-- 알림 기능 include -->
					<jsp:include page="/WEB-INF/views/common/alert.jsp"/>

        </div>
      </header>
      <!--  Header End 헤더 끝 ----------------------------->
      
      <!----------------------------- 본문 시작 -------------------->
      <div class="body-wrapper flex-row">
        <div class="container">
          <!-- 메인 전체  -->
          <div class="container">
          
          <!-- 왼쪽 박스 부분 -->
          <div class="left-box">
            <div class="card py-3 " style="height:185px; margin-bottom:10px;">
            	<div class="d-flex" style="align-items: center; padding-top: 15px;">
            			<h4 class="todayDate" style="float: left;  padding-left: 25px; color: gray;"></h4>
            			<h2 class="todayTime" style="padding-left: 10px; color: gray;"></h2>
            	</div>
            	
              <div class="d-flex flex-row align-items-center" style="margin: auto;">
	              <button type="button" class="btn btn-secondary px-5 py-2"  id="checkInBtn" style="font-size: 18px;">
	                출근
	              </button>
	              
	              <button type="button" class="btn btn-secondary px-5 py-2" id="checkOutBtn" style="display: none; font-size: 18px;">
	                퇴근
	              </button>
              </div>
              <div class="d-flex flex-row align-items-center" style="margin: auto; padding-top: 10px;">
              	<div id="checkInTime" ><h5 style="color: gray;"></h5></div> <div id="checkOutTime"><h5 style="color: gray;"></h5></div>
              </div>
              
            </div>

						<div class="card" style=" margin-bottom: 10px;">
						  <div class="card-body weather" style="height: 150px; color:black; padding:15px; display: flex; align-items: center; justify-content: center;">
						  	
								<div style="display: flex; font-size:15px; align-items: flex-start;">
							    <div class="weather_icon" style="padding-right:15px; color: rgb(127, 127, 127);"></div><br>
							    <div class="mainWeather" style="display:flex; flex-direction:column; padding-right:20px;">
						        <span class="current_temp"></span> 				<!-- 현재기온 -->
						        <span class="weather_description"></span> <!-- 현재 날씨상태 영문표기 -->
						        <span class="city"></span> 								<!-- 서울 -->
					        </div><br>
					        <div class="serveWeather" style="display:flex; flex-direction:column; align-items: flex-start;">
				            <div class="temp_max"></div> 				<!-- 최고온도 -->
				            <div class="temp_min"></div> 				<!-- 최저온도 -->
				           	<div class="humidity"></div> 				<!-- 습도 -->
				            <!-- <div class="wind"></div> --> 	<!-- 풍속 -->
				            <!-- <div class="cloud"></div> --> 	<!-- 구름지수 -->
			            </div>
								</div>

						  </div>
						</div>
						<script src="https://kit.fontawesome.com/2f1ece6450.js" crossorigin="anonymous"></script>
						<script>
						
							// 날씨 api 아이콘용 배열
							let weatherIcon = {
						    '01' : 'fas fa-sun',
						    '02' : 'fas fa-cloud-sun',
						    '03' : 'fas fa-cloud',
						    '04' : 'fas fa-cloud-meatball',
						    '09' : 'fas fa-cloud-sun-rain',
						    '10' : 'fas fa-cloud-showers-heavy',
						    '11' : 'fas fa-poo-storm',
						    '13' : 'far fa-snowflake',
						    '50' : 'fas fa-smog'
							};
						
							// 날씨 api 접속
							$(document).ready(function(){
								
								var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'seoul'+"&appid="+"b5f0d4fff3cb1be4470073be5caf09a0";
								$.ajax({
								    url: apiURI,
								    dataType: "json",
								    type: "GET",
								    async: "false",
								    success: function(resp) {
											console.log(resp);
							        var $Icon = (resp.weather[0].icon).substr(0,2);
							        var $weather_description = resp.weather[0].main;
							        var $Temp = Math.floor(resp.main.temp- 273.15) + ' ºC';
							        var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
							        var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
							        var $city = '서울';
							        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
							        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + ' ºC';
							        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + ' ºC';
							        
	
							        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-4x"></i>'); // 날씨아이콘
							        $('.weather_description').prepend($weather_description); // 현재 날씨상태 영문
							        $('.current_temp').prepend($Temp); // 현재 기온
							        $('.humidity').prepend($humidity); // 습도
							        $('.wind').prepend($wind); // 바람
							        $('.city').append($city); // 서울
							        $('.cloud').append($cloud); // 구름
							        $('.temp_min').append($temp_min); // 최저온도
							        $('.temp_max').append($temp_max); // 최고온도              
								    }
								})
								
							});
						</script>

            <div class="card " style="height: 90px; margin-bottom: 10px; align-content: center;">
              <div class="card-body" style="padding-top: 23px; align-content: center; margin: auto;">
                <a class="btn bg-secondary-subtle  text-secondary px-4 py-2" href="${ contextPath }/chat/room.page" style="font-size: 18px; display: flex; align-items: center; justify-content: center; width: 180px; ">
	                <i class="ti ti-message-chatbot"  style="font-size: 28px;"></i>
	                &nbsp; 채팅
                </a>
              </div>
            </div>
            
            <!-- 투두리스트 -->
            <div class="card">
              <div class="card-body todo-area" style="height: 350px; padding:15px;">
                <div class="w-100 mb-3 d-flex justify-content-between" style="padding:0px; margin-bottom: 0px;">
                  <div><h4 class="fw-semibold">오늘의 할일</h4></h4></div>
                  <div class="view_more" onclick="location.href='${contextPath}/calendar/todoList.page';"><b><i class="ti ti-plus"></i></b></div>
                </div>
                
                <div class="todo-body">
                  
                  
                  <div class="no-todo-item" style="text-align:center">
                    <p><i class='ti ti-pencil-plus fs-7'></i><br>오늘의 할 일이 없습니다. <br>할 일을 추가하여 목록을 채워보세요!</p>
                  </div>
                  
                  
                </div>
              </div>
            </div>
          
          </div>

          
          <!-- 오른쪽 박스 부분 -->
	          <div class="r-8 right-box">
					      <div class="row" style="height:450px">
					      	<!-- 오늘의 시설예약 -->
			          	<div class="col-lg-6 d-flex align-items-stretch">
			          		<div class="card w-100">
				          		<div class="card-body">
				          			<div class="w-100 mb-3 d-flex justify-content-between">
				          				<div><h4><b>오늘의 시설예약</b></h4></div>
				          				<div class="view_more" onclick="location.href='${contextPath}/reservation/reservationList.page'"><b>더보기</b></div>
				          			</div>
				          			<div class="w-100">
				          				<table class="reservation_table preview_table w-100 table text-nowrap mb-0 overflow-hidden">
				                  <thead class="text-dark fs-4">
				                    <tr>
				                      <th width="30%">
				                        <h6 class="fs-4 fw-semibold mb-0">시설명</h6>
				                      </th>
				                      <th width="">
				                        <h6 class="fs-4 fw-semibold mb-0">시간</h6>
				                      </th>
				                    </tr>
				                  </thead>
				                  <tbody>
				                    
				                    
				                  </tbody>
				                </table>
				          			</div>
				          		</div>
				          	</div>
			          	</div>
			          	
			          	<!--  학사일정 조회 -->
			          	<div class="col-lg-6 d-flex align-items-strech">
			          		<div class="card w-100">
				          		<div class="card-body" style="padding:10px;">
				          			<div class="w-100 mb-3 d-flex justify-content-between">
				          				<!-- <div><h4><b>학사일정</b></h4></div> -->
				          				<!-- <div class="view_more"><b></b></div> -->
				          			</div>
                        
				          			<div class="calender-sidebar app-calendar w-100" style="height: fit-content;">
				          				<div id="calendar">

                          </div>
				          			</div>
                        
				          		</div>
				          	</div>
			          	</div>
			          </div>
			          
			          <div class="row" style="height:390px">
			          	<div class="col-lg-6 d-flex align-items-strech">
			          		<div class="card w-100">
				          		<div class="card-body">
				          			<div class="w-100 mb-3 d-flex justify-content-between">
				          				<div><h4><b>공지사항</b></h4></div>
				          				<div class="view_more" onclick="location.href='${contextPath}/board/noticeList.do'"><b>더보기</b></div>
				          			</div>
				          			<div class="w-100">
				          				<table class="preview_table w-100 table text-nowrap mb-0 overflow-hidden table-hover">
					                  <thead class="text-dark fs-4">
					                    <tr>
					                      <th width="50%">
					                        <h6 class="fs-4 fw-semibold mb-0">제목</h6>
					                      </th>
					                      <th width="">
					                        <h6 class="fs-4 fw-semibold mb-0">작성일</h6>
					                      </th>
					                      <th width="">
					                        <h6 class="fs-4 fw-semibold mb-0">첨부</h6>
					                      </th>
					                    </tr>
					                  </thead>
					                  <tbody>
					                    <c:choose>
					                  		<c:when test="${ empty boardList }">
					                  			<tr>
							                    	<td colspan="3">
							                        공지사항이 없습니다.
							                      </td>
							                    </tr>
					                  		</c:when>
					                  		<c:otherwise>
					                  			<c:forEach var="board" items="${ boardList }">
							                    <tr>
							                    	<td width="" class="board_title" onclick="location.href='${contextPath}/board/noticeDetail.do?no=${ board.boardNo }'">
							                        ${ board.boardTitle }
							                      </td>
							                      <td width="">
							                        ${ board.registDate }
							                      </td>
							                      <td width="">
							                        ${ board.attachCount > 0 ? 
												                      	'<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
													                         <g fill="none">
														                         <path fill="currentColor" d="m15.393 4.054l-.502.557zm3.959 3.563l-.502.557zm2.302 2.537l-.685.305zM3.172 20.828l.53-.53zm17.656 0l-.53-.53zM14 21.25h-4v1.5h4zM2.75 14v-4h-1.5v4zm18.5-.437V14h1.5v-.437zM14.891 4.61l3.959 3.563l1.003-1.115l-3.958-3.563zm7.859 8.952c0-1.689.015-2.758-.41-3.714l-1.371.61c.266.598.281 1.283.281 3.104zm-3.9-5.389c1.353 1.218 1.853 1.688 2.119 2.285l1.37-.61c-.426-.957-1.23-1.66-2.486-2.79zM10.03 2.75c1.582 0 2.179.012 2.71.216l.538-1.4c-.852-.328-1.78-.316-3.248-.316zm5.865.746c-1.086-.977-1.765-1.604-2.617-1.93l-.537 1.4c.532.204.98.592 2.15 1.645zM10 21.25c-1.907 0-3.261-.002-4.29-.14c-1.005-.135-1.585-.389-2.008-.812l-1.06 1.06c.748.75 1.697 1.081 2.869 1.239c1.15.155 2.625.153 4.489.153zM1.25 14c0 1.864-.002 3.338.153 4.489c.158 1.172.49 2.121 1.238 2.87l1.06-1.06c-.422-.424-.676-1.004-.811-2.01c-.138-1.027-.14-2.382-.14-4.289zM14 22.75c1.864 0 3.338.002 4.489-.153c1.172-.158 2.121-.49 2.87-1.238l-1.06-1.06c-.424.422-1.004.676-2.01.811c-1.027.138-2.382.14-4.289.14zM21.25 14c0 1.907-.002 3.262-.14 4.29c-.135 1.005-.389 1.585-.812 2.008l1.06 1.06c.75-.748 1.081-1.697 1.239-2.869c.155-1.15.153-2.625.153-4.489zm-18.5-4c0-1.907.002-3.261.14-4.29c.135-1.005.389-1.585.812-2.008l-1.06-1.06c-.75.748-1.081 1.697-1.239 2.869C1.248 6.661 1.25 8.136 1.25 10zm7.28-8.75c-1.875 0-3.356-.002-4.511.153c-1.177.158-2.129.49-2.878 1.238l1.06 1.06c.424-.422 1.005-.676 2.017-.811c1.033-.138 2.395-.14 4.312-.14z"/><path stroke="currentColor" stroke-width="1.5" d="M13 2.5V5c0 2.357 0 3.536.732 4.268C14.464 10 15.643 10 18 10h4"/>
														                         <ellipse cx="17" cy="14.5" fill="currentColor" rx="1" ry="1.5"/>
														                         <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 17.5a5.408 5.408 0 0 0 6 0"/>
														                         <ellipse cx="7" cy="14.5" fill="currentColor" rx="1" ry="1.5"/>
													                         </g>
												                         </svg>' : '' }
							                      </td>
							                    </tr>
							                    </c:forEach>
					                  		</c:otherwise>
					                  	</c:choose>
					                  </tbody>
					                </table>
				          			</div>
				          		</div>
				          	</div>
			          	</div>
			          	<div class="col-lg-6 d-flex align-items-strech">
			          		<div class="card w-100">
				          		<div class="card-body">
				          			<div class="w-100 mb-3 d-flex justify-content-between">
				          				<div><h4><b>진행중 전자결재</b></h4></div>
				          				<div class="view_more" onclick="location.href='${contextPath}/approval/ongoingBoard.do'"><b>더보기</b></div>
				          			</div>
				          			<div class="w-100">
				          				<table class="preview_table w-100 table text-nowrap mb-0 overflow-hidden table-hover">
					                  <thead class="text-dark fs-4">
					                    <tr>
					                      <th width="50%">
					                        <h6 class="fs-4 fw-semibold mb-0">
					                        	제목
					                        </h6>
					                      </th>
					                      <th width="">
					                        <h6 class="fs-4 fw-semibold mb-0">작성일</h6>
					                      </th>
					                      <th width="">
					                        <h6 class="fs-4 fw-semibold mb-0">상태</h6>
					                      </th>
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:choose>
					                  		<c:when test="${ empty appDocList }">
					                  			<tr>
							                    	<td colspan="3">
							                        결재문서가 존재하지 않습니다.
							                      </td>
							                    </tr>
					                  		</c:when>
					                  		<c:otherwise>
					                  			<c:forEach var="appDoc" items="${ appDocList }">
							                    <tr>
							                    	<td width="" class="app_doc_title">
							                        ${ appDoc.docTitle }
							                        <input type="hidden" name="no" value="${ appDoc.docNo }">
							                      </td>
							                      <td width="">
							                        ${ appDoc.draftDate }
							                      </td>
							                      <td width="">
							                        ${ appDoc.status }
							                      </td>
							                    </tr>
							                    </c:forEach>
					                  		</c:otherwise>
					                  	</c:choose>
					                  </tbody>
					                </table>
				          			</div>
				          		</div>
				          	</div>
			          	</div>
			          </div>
		          
						</div> <!-- 오른쪽 박스 부분 끝 -->
					
				</div>
        </div>
        
        <!-- 출퇴근 부분 -->
        <script> 
	        $(document).ready(function(){
	        	ajaxAttend();
	        	ajaxSelectTodoList();
	        	ajaxSelectTodayReservationList();
	        	ajaxSelectUnivCalList();
	        	updateTime();
	        	
	        		// 1초마다 시간 업데이트
	            setInterval(updateTime, 1000);
	        	
		        	// 요일 배열
		        	const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
	
		        	// 현재 날짜를 가져오기
		        	const currentDate = new Date();
	
		        	// 월, 일, 요일 구하기
		        	const month = currentDate.getMonth() + 1;
		        	const day = currentDate.getDate();
		        	const dayOfWeek = weekdays[currentDate.getDay()];

		        	// 날짜 표시
		        	$(".todayDate").text(month +"월 " +day + "일 ("+ dayOfWeek +")");
		        	
		        	
	        	
	        	
	        		// 출근 버튼
	            $("#checkInBtn").click(function(){
	            	const options = { hour12: false, timeZone: 'Asia/Seoul' };
	            	const currentTimeString = new Date().toLocaleTimeString('ko-KR', options);
	            	
	                $.ajax({
	                    url: "${contextPath}/member/checkin.do",
	                    type: "POST",
	                    data: {
					  						startTime:currentTimeString,
					  						memNo:${loginUser.memNo}
					  					},
	                    success: function(result) {
	                        if(result == "SUCCESS") {
	                        	alert("출근되었습니다.");
														ajaxAttend();
	                        } 
	                    }
	                    
	                })
	                
	             // 출근 버튼 감추고
	            	document.getElementById("checkInBtn").style.display = "none";
	            	// 퇴근 버튼 보이기
	            	document.getElementById("checkOutBtn").style.display = "inline-block";
	            })
	            
	            // 퇴근 버튼
	            $("#checkOutBtn").click(function(){
	            	const registDate = new Date().toISOString().split('T')[0]; // 오늘 날짜만 추출
	                $.ajax({
	                    url: "${contextPath}/member/checkout.do",
	                    type: "POST",
	                    data: {
						  						registDate:registDate,
						  						memNo:${loginUser.memNo}
						  					},
	                    success: function(result) {
	                        if(result == "SUCCESS") {
	                        	alert("퇴근되었습니다.");
														ajaxAttend();
	                        }
	                    }
	                    
	                })
	            })
	            
	        }) // document.ready function 끝
	        
	     		
	        // 시간만드는 함수
        	function updateTime() {
             var curDate = new Date();
             var timeString = curDate.getHours().toString().padStart(2, '0') + ":" +
                              curDate.getMinutes().toString().padStart(2, '0') + ":" +
                            curDate.getSeconds().toString().padStart(2, '0');
             
             $(".todayTime").text(timeString);
           };
	        
	        
	        
	        // 근태 조회 함수
          function ajaxAttend(){
          	const registDate = new Date().toISOString().split('T')[0]; // 오늘 날짜만 추출
          	
          	$.ajax({
          		url:"${contextPath}/member/selectAttend.do",
       			type:"get",
       			data: {
    						registDate:registDate,
    						memNo:${loginUser.memNo}
    					},
       			success:function(result){
       				
       				 if(result.startTime) {
                     $("#checkInTime").find("h5").text(result.startTime);
                     $("#checkInBtn").prop("disabled", true);
                     document.getElementById("checkInBtn").style.display = "none";
                     document.getElementById("checkOutBtn").style.display = "inline-block";
                 }
                 if(result.endTime) {
                     $("#checkOutTime").find("h5").text(result.endTime);
                     $("#checkOutBtn").prop("disabled", true);
                 }
       			}
       			
          	})
          	
          }
	        
	       
	        
	        // 투두, 오늘의 시설예약, 학사일정
	        let now = new Date();
          let year = now.getFullYear();
          let month = String(now.getMonth() + 1).padStart(2, '0');
          let date = String(now.getDate()).padStart(2, '0');
          let nowStr = year + "-" + month + "-" + date;
          
       		// 오늘 날짜에 해당하는 투두리스트 조회해오는 function
          function ajaxSelectTodoList(){

            $.ajax({
              url:"${contextPath}/calendar/todoList.do",
              type:"post",
              data:{
                tdlDate:nowStr
              },
              success:function(list){
                console.log("조회 ajax실행");
                
                //$('.todo-body .todo-item').remove();
                let todoBodyHtml =  $(".todo-body").html();
                let todoItems = "";
                let doneList = "";
                console.log("list:", list);
                if(list.length > 0){
                	console.log(list);
                  for(let i=0; i<list.length; i++){
                    if(list[i].isCompleted == "N"){
                      todoItems += "<div class='todo-item'>"
                                 +   "<div class='form-check form-check-inline'>"
                                 +      "<input class='form-check-input primary' type='checkbox' name='tdlNo' value='" + list[i].tdlNo + "'  onclick='checkTodoCompletion(this);'>"
                                 +      "<span class='text' >" + list[i].tdlContent + "</span>"
                                 +    "</div>"
                                 + "</div>";
                      
                      
                    }
                  }
                  
                  $(".todo-body").html( todoBodyHtml + todoItems);
                }
                
                countTodoList();
                
              },error:function(){
                console.log("투두리스트 조회용 ajax 통신 실패");
              }
            })
          }
       		
          function countTodoList(){
            let todoItemCount = $(".todo-body .todo-item").length;
            
            console.log("투두개수", todoItemCount);
            $('.todo-body .no-todo-item').css("display", ( todoItemCount > 0 ? "none" : "block") );
            
          }
          

          // 체크박스 여부에 따라 상태값 변경하는 function
          function checkTodoCompletion(chkbox){
            const todoItem = chkbox.closest(".todo-item");
            const isCompleted = "Y";
            const tdlNo = chkbox.value;
					
						$.ajax({
	         		url:"${contextPath}/calendar/toggleTodoStatus.do",
	         		type:"post",
	         		data:{
	         			tdlNo:tdlNo,
	         			isCompleted:isCompleted
	         		},
	         		success:function(result){
	         			//console.log(result);
	         			if(result == "SUCCESS"){
	                 todoItem.remove();
	               }else{
	         				alert("완료여부 변경에 실패했습니다.");
	               }
		            countTodoList();
	         			
	         		},
	         		error:function(){
	         			console.log("투두리스트 체크용 ajax통신 실패");
	         		}
	         	})
						
          }
          
       		// 오늘의 시설예약 조회용 ajax function
          function ajaxSelectTodayReservationList(){
            $.ajax({
              url:"${contextPath}/reservation/todayReservationList.do",
              type:"post",
              data:{
                revDate:nowStr
              },
              success:function(list){
                
                let tbody = "";
                
                if(list.length > 0){
                  for(let i=0; i<list.length; i++){
                    tbody += "<tr>"
                           + "<td width='30%'>" + list[i].resNo + "</td>"
    				               + "<td width=''>" + list[i].revDate + " " + list[i].startTime + " ~ " + list[i].endTime + "</td>"        
				                   + "</tr>";   
				                      
                  }
                }else{
                  tbody += "<tr><td colspan='2'>오늘의 시설 예약 내역이 없습니다.</td></tr>";
                }

                $(".reservation_table tbody").html(tbody);
              },
              error:function(){
                console.log("오늘 시설예약 조회용 ajax통신 실패");
              }
              

            })
          }
	        
       		// 학사일정 조회용 ajax
          function ajaxSelectUnivCalList(){

            let calList = new Array();
            
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
              googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
              headerToolbar: {
                left: 'prevYear,prev,next,nextYear',
                center: 'title',
                right:'today'
              },
              nowIndicator: true, // 현재 시간 마크
              timeZone:'local', // 우리나라 시간
              locale: 'ko', // 한국어 설정
              dayMaxEvents:true,
              selectable: true,
              selectMirror: true,
              dateClick:function(){
                  location.href="${contextPath}/calendar/univCalendar.page";
              },
              eventClick:function(){
                location.href="${contextPath}/calendar/univCalendar.page";
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
          }
	        
      // 전자결재/공지사항
      // 제목 글자수 제한
      $(document).ready(function(){
    	  $(".board_title").each(function(index, el){
    		  console.log("실행 : " + $(el).text());
    		  if($(el).text().trim().length > 10){
    			  let $str = el.innerText.substr(0, 10) + "...";
    			  $(el).text($str);
    		  }
    	  })
    	  $(".app_doc_title").each(function(index, el){
    		  if($(el).text().trim().length > 10){
    			  let $str = el.innerText.substr(0, 10) + "...";
    			  $(el).text($str);
    		  }
    	  })
      })
      // 전자결재 상세페이지 이동
     	$(".app_doc_title").on("click", function(){
     		var $form = $("<form>", {
     		    "action": "${contextPath}/approval/detail.do",
     		    "method": "post"
     		});
     		console.log($(this).children());
     		return false;
     		$("body").append($form);
     		$form.append($(this).children("input").clone()).submit();
     	})
	    
    </script>
        
      </div><!-- body-wrapper end-->

      <!-- setting start 세팅 시작 ------------------------------------->
      <script>
        function handleColorTheme(e) {
          $("html").attr("data-color-theme", e);
          $(e).prop("checked", !0);
        }
      </script>
      <button class="btn btn-primary p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"
        type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <i class="icon ti ti-settings fs-7"></i>
      </button>

      <div class="offcanvas customizer offcanvas-end" tabindex="-1" id="offcanvasExample"
        aria-labelledby="offcanvasExampleLabel">
        <div class="d-flex align-items-center justify-content-between p-3 border-bottom">
          <h4 class="offcanvas-title fw-semibold" id="offcanvasExampleLabel">
            Settings
          </h4>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body h-n80" data-simplebar>
          <h6 class="fw-semibold fs-4 mb-2">Theme</h6>

          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <input type="radio" class="btn-check" name="theme-layout" id="light-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="light-layout"><i
                class="icon ti ti-brightness-up fs-7 me-2"></i>Light</label>

            <input type="radio" class="btn-check" name="theme-layout" id="dark-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="dark-layout"><i
                class="icon ti ti-moon fs-7 me-2"></i>Dark</label>
          </div>

          <h6 class="mt-5 fw-semibold fs-4 mb-2">Theme Direction</h6>
          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <input type="radio" class="btn-check" name="direction-l" id="ltr-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="ltr-layout"><i
                class="icon ti ti-text-direction-ltr fs-7 me-2"></i>LTR</label>

            <input type="radio" class="btn-check" name="direction-l" id="rtl-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="rtl-layout"><i
                class="icon ti ti-text-direction-rtl fs-7 me-2"></i>RTL</label>
          </div>

          <h6 class="mt-5 fw-semibold fs-4 mb-2">Theme Colors</h6>

          <div class="d-flex flex-row flex-wrap gap-3 customizer-box color-pallete" role="group">
            <input type="radio" class="btn-check" name="color-theme-layout" id="Blue_Theme" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Blue_Theme')" for="Blue_Theme" data-bs-toggle="tooltip" data-bs-placement="top"
              data-bs-title="BLUE_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-1">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>

            <input type="radio" class="btn-check" name="color-theme-layout" id="Aqua_Theme" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Aqua_Theme')" for="Aqua_Theme" data-bs-toggle="tooltip" data-bs-placement="top"
              data-bs-title="AQUA_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-2">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>

            <input type="radio" class="btn-check" name="color-theme-layout" id="Purple_Theme" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Purple_Theme')" for="Purple_Theme" data-bs-toggle="tooltip"
              data-bs-placement="top" data-bs-title="PURPLE_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-3">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>

            <input type="radio" class="btn-check" name="color-theme-layout" id="green-theme-layout"
              autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Green_Theme')" for="green-theme-layout" data-bs-toggle="tooltip"
              data-bs-placement="top" data-bs-title="GREEN_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-4">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>

            <input type="radio" class="btn-check" name="color-theme-layout" id="cyan-theme-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Cyan_Theme')" for="cyan-theme-layout" data-bs-toggle="tooltip"
              data-bs-placement="top" data-bs-title="CYAN_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-5">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>

            <input type="radio" class="btn-check" name="color-theme-layout" id="orange-theme-layout"
              autocomplete="off" />
            <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center"
              onclick="handleColorTheme('Orange_Theme')" for="orange-theme-layout" data-bs-toggle="tooltip"
              data-bs-placement="top" data-bs-title="ORANGE_THEME">
              <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-6">
                <i class="ti ti-check text-white d-flex icon fs-5"></i>
              </div>
            </label>
          </div>

          <h6 class="mt-5 fw-semibold fs-4 mb-2">Layout Type</h6>
          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <div>
              <input type="radio" class="btn-check" name="page-layout" id="vertical-layout" autocomplete="off" />
              <label class="btn p-9 btn-outline-primary" for="vertical-layout"><i
                  class="icon ti ti-layout-sidebar-right fs-7 me-2"></i>Vertical</label>
            </div>
            <div>
              <input type="radio" class="btn-check" name="page-layout" id="horizontal-layout" autocomplete="off" />
              <label class="btn p-9 btn-outline-primary" for="horizontal-layout"><i
                  class="icon ti ti-layout-navbar fs-7 me-2"></i>Horizontal</label>
            </div>
          </div>

          <h6 class="mt-5 fw-semibold fs-4 mb-2">Container Option</h6>

          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <input type="radio" class="btn-check" name="layout" id="boxed-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="boxed-layout"><i
                class="icon ti ti-layout-distribute-vertical fs-7 me-2"></i>Boxed</label>

            <input type="radio" class="btn-check" name="layout" id="full-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="full-layout"><i
                class="icon ti ti-layout-distribute-horizontal fs-7 me-2"></i>Full</label>
          </div>

          <h6 class="fw-semibold fs-4 mb-2 mt-5">Sidebar Type</h6>
          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <a href="javascript:void(0)" class="fullsidebar">
              <input type="radio" class="btn-check" name="sidebar-type" id="full-sidebar" autocomplete="off" />
              <label class="btn p-9 btn-outline-primary" for="full-sidebar"><i
                  class="icon ti ti-layout-sidebar-right fs-7 me-2"></i>Full</label>
            </a>
            <div>
              <input type="radio" class="btn-check " name="sidebar-type" id="mini-sidebar" autocomplete="off" />
              <label class="btn p-9 btn-outline-primary" for="mini-sidebar"><i
                  class="icon ti ti-layout-sidebar fs-7 me-2"></i>Collapse</label>
            </div>
          </div>

          <h6 class="mt-5 fw-semibold fs-4 mb-2">Card With</h6>

          <div class="d-flex flex-row gap-3 customizer-box" role="group">
            <input type="radio" class="btn-check" name="card-layout" id="card-with-border" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="card-with-border"><i
                class="icon ti ti-border-outer fs-7 me-2"></i>Border</label>

            <input type="radio" class="btn-check" name="card-layout" id="card-without-border" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="card-without-border"><i
                class="icon ti ti-border-none fs-7 me-2"></i>Shadow</label>
          </div>
        </div>
      </div>
      <!-- setting end 세팅 끝 ------------------------------------->


    </div>

  </div>

  <!-- footer start 푸터 시작 -------------------->
  <div class="dark-transparent sidebartoggler"></div>
  <script src="${ contextPath }/assets/js/vendor.min.js"></script>
  <!-- Import Js Files -->
  <script src="${ contextPath }/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${ contextPath }/assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="${ contextPath }/assets/js/theme/app.horizontal.init.js"></script>
  <script src="${ contextPath }/assets/js/theme/theme.js"></script>
  <script src="${ contextPath }/assets/js/theme/app.min.js"></script>
  <script src="${ contextPath }/assets/js/theme/sidebarmenu.js"></script>

  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="${ contextPath }/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="${ contextPath }/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="${ contextPath }/assets/js/dashboards/dashboard.js"></script>
  <!-- footer end 푸터 끝 -------------------->

</body>

</html>