<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.alert-body{max-height: 360px; overflow-y:auto;}
.alert-item i{font-size:20px;}
.read-alert{background-color:#EEEEEE;}
.read-alert h6{color:#9E9E9E;}
.alert-item h6{width:210px; white-space:normal}
.alert-item p{font-size:10px;margin:auto}

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
	<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>  -->
	<%-- <script src="${contextPath}/resources/js/alert.js"></script> --%>

	<header class="topbar">
	  <div class="with-vertical"><!-- ---------------------------------- -->
	    <!-- Start Vertical Layout Header -->
	    <!-- ---------------------------------- -->
	    <nav class="navbar navbar-expand-lg p-0">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link sidebartoggler nav-icon-hover ms-n3" id="headerCollapse" href="javascript:void(0)">
	            <i class="ti ti-menu-2"></i>
	          </a>
	        </li>
	      </ul>
	
	      <ul class="navbar-nav quick-links d-none d-lg-flex">
	        <!-- ----------------메인 메뉴들--------------- -->
	        <li class="nav-item dropdown-hover d-none d-lg-block">
	          <a class="nav-link" href="${contextPath}/approval/main.do">전자결재</a>
	        </li>
	        <li class="nav-item dropdown-hover d-none d-lg-block">
	          <a class="nav-link" href="./main/app-calendar.html">메일</a>
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
	          <a class="nav-link" href="${ contextPath }/lec/lecList.do">학생&수업</a>
	        </li>
	      </ul>
	
	      <div class="d-block d-lg-none">
	        <a href="${ contextPath }/member/mainpage" class="text-nowrap logo-img">
	          <img src="${ contextPath }/assets/images/logos/dark-logo.svg" class="dark-logo" alt="Logo-Dark" />
	          <img src="${ contextPath }/assets/images/logos/light-logo.svg" class="light-logo" alt="Logo-light" />
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
	        <div class="d-flex align-items-center justify-content-between">
	          <a href="javascript:void(0)" class="nav-link d-flex d-lg-none align-items-center justify-content-center"
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
	            	})
	            	
	            	// 관리자 메인페이지로 이동
	            	$(document).on("click", ".admin", function(){
	            		location.href="${contextPath}/admin/adminDashboard.do";
	            	})
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
	              <!--  
	              <div class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
	                aria-labelledby="drop2">
	                <div class="d-flex align-items-center justify-content-between py-3 px-7">
	                  <h5 class="mb-0 fs-5 fw-semibold">Notifications</h5>
	                  <span class="badge text-bg-primary rounded-4 px-3 py-1 lh-sm">5 new</span>
	                </div>
	                <div class="message-body" data-simplebar>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-2.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">Roman Joined the Team!</h6>
	                      <span class="fs-2 d-block text-body-secondary">Congratulate him</span>
	                    </div>
	                  </a>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-3.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">New message</h6>
	                      <span class="fs-2 d-block text-body-secondary">Salma sent you new message</span>
	                    </div>
	                  </a>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-4.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">Bianca sent payment</h6>
	                      <span class="fs-2 d-block text-body-secondary">Check your earnings</span>
	                    </div>
	                  </a>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-5.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">Jolly completed tasks</h6>
	                      <span class="fs-2 d-block text-body-secondary">Assign her new tasks</span>
	                    </div>
	                  </a>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-6.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">John received payment</h6>
	                      <span class="fs-2 d-block text-body-secondary">$230 deducted from account</span>
	                    </div>
	                  </a>
	                  <a href="javascript:void(0)" class="py-6 px-7 d-flex align-items-center dropdown-item">
	                    <span class="me-3">
	                      <img src="${ contextPath }/assets/images/profile/user-7.jpg" alt="user" class="rounded-circle" width="48"
	                        height="48" />
	                    </span>
	                    <div class="w-75 d-inline-block v-middle">
	                      <h6 class="mb-1 fw-semibold lh-base">Roman Joined the Team!</h6>
	                      <span class="fs-2 d-block text-body-secondary">Congratulate him</span>
	                    </div>
	                  </a>
	                </div>
	                <div class="py-6 px-7 mb-1">
	                  <button class="btn btn-outline-primary w-100">See All Notifications</button>
	                </div>
	
	              </div>
	              -->
	              <div class="alert-area dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up"
                  aria-labelledby="drop2">
                  <div class="alert-title d-flex align-items-center justify-content-between py-3 px-7">
                    <h5 class="mb-0 fs-5 fw-semibold">알림</h5>
                    <span class="new-alert-count badge text-bg-primary rounded-4 px-3 py-1 lh-sm">0 new</span>
                  </div>
                  <div class="alert-body message-body">
                  
                    <div class="no-alert-item py-6 px-7 d-flex justify-content-between align-items-center dropdown-item">
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
	            <!-- start profile Dropdown -->
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
	                    <a href="${ contextPath }/member/mypage.page" class="py-8 px-7 mt-8 d-flex align-items-center">
	                      <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
	                        <img src="${ contextPath }/assets/images/svgs/icon-account.svg" alt="" width="24" height="24" />
	                      </span>
	                      <div class="w-75 d-inline-block v-middle ps-3">
	                        <h6 class="mb-1 fs-3 fw-semibold lh-base">My Profile</h6>
	                        <span class="fs-2 d-block text-body-secondary">Account Settings</span>
	                      </div>
	                    </a>
	                    <a href="./main/app-email.html" class="py-8 px-7 d-flex align-items-center">
	                      <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
	                        <img src="${ contextPath }/assets/images/svgs/icon-inbox.svg" alt="" width="24" height="24" />
	                      </span>
	                      <div class="w-75 d-inline-block v-middle ps-3">
	                        <h6 class="mb-1 fs-3 fw-semibold lh-base">My Inbox</h6>
	                        <span class="fs-2 d-block text-body-secondary">Messages & Emails</span>
	                      </div>
	                    </a>
	                    <a href="${ contextPath }/member/vacationList.do" class="py-8 px-7 d-flex align-items-center">
	                      <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
	                        <img src="${ contextPath }/assets/images/svgs/icon-tasks.svg" alt="" width="24" height="24" />
	                      </span>
	                      <div class="w-75 d-inline-block v-middle ps-3">
	                        <h6 class="mb-1 fs-3 fw-semibold lh-base">My Attend</h6>
	                        <span class="fs-2 d-block text-body-secondary">Attend and Vacation</span>
	                      </div>
	                    </a>
	                  </div>
	                  <div class="d-grid py-4 px-7 pt-8">
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
	    <!-- ---------------------------------- -->
	    <!-- End Vertical Layout Header -->
	    <!-- ---------------------------------- -->
	
	    <!-- ------------------------------- -->
	    <!-- apps Dropdown in Small screen -->
	    <!-- ------------------------------- -->
	    <!--  Mobilenavbar -->
	    
	    <!-- 알림 기능 include -->
			<jsp:include page="/WEB-INF/views/common/alert.jsp"/>
			
	  </div>

  </header>
</body>
</html>