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

  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="${ contextPath }/assets/images/logos/favicon.png" />

  <!-- Core Css -->
  <link rel="stylesheet" href="${ contextPath }/assets/css/styles.css" />

  <title>조직도</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="${ contextPath }/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css" />
<style>
	/* 조직도 css */
	* {margin: 0; padding: 0;}
	.tree ul {
	    padding-top: 20px; position: relative;
	    
	    transition: all 0.5s;
	    -webkit-transition: all 0.5s;
	    -moz-transition: all 0.5s;
	}
	.tree li {
	    float: left; text-align: center;
	    list-style-type: none;
	    position: relative;
	    padding: 20px 5px 0 5px;
	    
	    transition: all 0.5s;
	    -webkit-transition: all 0.5s;
	    -moz-transition: all 0.5s;
	}
	.tree li::before, .tree li::after{
	    content: '';
	    position: absolute; top: 0; right: 50%;
	    border-top: 1px solid #ccc;
	    width: 50%; height: 20px;
	}
	.tree li::after{
	    right: auto; left: 50%;
	    border-left: 1px solid #ccc;
	}
	.tree li:only-child::after, .tree li:only-child::before {
	    display: none;
	}
	.tree li:only-child{ padding-top: 0;}
	.tree li:first-child::before, .tree li:last-child::after{
	    border: 0 none;
	}
	.tree li:last-child::before{
	    border-right: 1px solid #ccc;
	    border-radius: 0 5px 0 0;
	    -webkit-border-radius: 0 5px 0 0;
	    -moz-border-radius: 0 5px 0 0;
	}
	.tree li:first-child::after{
	    border-radius: 5px 0 0 0;
	    -webkit-border-radius: 5px 0 0 0;
	    -moz-border-radius: 5px 0 0 0;
	}
	.tree ul ul::before{
	    content: '';
	    position: absolute; top: 0; left: 50%;
	    border-left: 1px solid #ccc;
	    width: 0; height: 20px;
	}
	.tree li a{
	    border: 1px solid #ccc;
	    padding: 25px 35px; /*텍스트 주변 여백조정*/
	    text-decoration: none;
	    color: #666;
	    font-family: arial, verdana, tahoma;
	    font-size: 20px; /* 글자크기 */
	    display: inline-block;
	    
	    border-radius: 5px;
	    -webkit-border-radius: 5px;
	    -moz-border-radius: 5px;
	    
	    transition: all 0.5s;
	    -webkit-transition: all 0.5s;
	    -moz-transition: all 0.5s;
	}
	
	/* ******************내가 추가한****************** css*/
	.major:hover {
	    background: #c8e4f8; /* 마우스를 올린 학과명의 배경색 변경 */
	    color: #000; /* 마우스를 올린 학과명의 글자색 변경 */
	    border: 1px solid #94a0b4; /* 마우스를 올린 학과명의 테두리 변경 */
	}
	#admin{
	    font-weight: bold;
	    font-size: 15px;
	    text-align: center; /* 글자 가로세로 기준 한가운데로(없어도 됨) */
	    color: black;
	}
	.college{
	    font-weight: bold;
	    background: skyblue;
	}
	#admin, .college{ 
	    cursor: default; /* 마우스커서가 포인터로 안변하게 */
	}
	#content_1{
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	}
	/* 각 요소 사이의 간격을 조정. */
	.text, .searchBtn {
	    margin: 5px;
	}
	#searchForm {
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    justify-content: center;
	}
	/* 페이징바를 한가운데로 */
	#search{
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	#searchName{
	    width: 250px;
	}
	.btn{
	  --bs-btn-padding-x:55px;
	  font-size: 16px;
	}
	.btn-gruop{
	  margin-left: 450px;
	}
	#btnGroupVerticalDrop1{
	  margin-right: 15px;
	}
	.btn-college{
	  --bs-btn-padding-x: 30px;
	}
	.nameSpan{
	  font-size: 18px;
	}
	.createdCollege{
	  display: flex;
	}
	.updateMajor{
	  display: flex;
	}
	.majorUser>tbody{
	  cursor: pointer;
	}
</style>
</head>

<body>
  
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
                <a href="${ contextPath }/horizontal/index.html" class="text-nowrap nav-link">
                  <img src="../assets/images/logos/longlogo.png" class="dark-logo pt-3 pb-3" width="" height="72" />
                  <img src="${ contextPath }/assets/images/logos/light-logo.svg" class="light-logo" width="180" alt="" />
                </a>
              </li>
            </ul>
            <ul class="navbar-nav quick-links d-none d-xl-flex">
              <!-- 메인 메뉴들 -->
              <!-- ----------------메인 메뉴들--------------- -->
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-chat.html">전자결재</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-calendar.html">메일</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="${ contextPath }/calendar/calendar.page">일정</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-email.html">예약</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-email.html">공지</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-email.html">게시판</a>
              </li>
              <li class="nav-item dropdown-hover d-none d-lg-block">
                <a class="nav-link" href="./main/app-email.html">학생&수업</a>
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
                  <li class="nav-item">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                      aria-expanded="false">
                      <span>
                        <i class="ti ti-settings"></i>
                      </span>
                    </a>
                  </li>
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
			            	$(document).on("click", ".chart", function(){
			            		location.href="${contextPath}/admin/chart.do";
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
                          <img src="${ contextPath }/assets/images/profile/user-1.jpg" class="rounded-circle" width="35" height="35"
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
                          <img src="${ contextPath }/assets/images/profile/user-1.jpg" class="rounded-circle" width="80" height="80"
                            alt="" />
                          <div class="ms-3">
                            <h5 class="mb-1 fs-3">Mathew Anderson</h5>
                            <span class="mb-1 d-block">Designer</span>
                            <p class="mb-0 d-flex align-items-center gap-2">
                              <i class="ti ti-mail fs-4"></i> info@modernize.com
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
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">My Profile</h6>
                              <span class="fs-2 d-block text-body-secondary">Account Settings</span>
                            </div>
                          </a>
                          <a href="${ contextPath }/horizontal/app-email.html" class="py-8 px-7 d-flex align-items-center">
                            <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
                              <img src="${ contextPath }/assets/images/svgs/icon-inbox.svg" alt="" width="24" height="24" />
                            </span>
                            <div class="w-75 d-inline-block v-middle ps-3">
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">My Inbox</h6>
                              <span class="fs-2 d-block text-body-secondary">Messages & Emails</span>
                            </div>
                          </a>
                          <a href="${ contextPath }/horizontal/app-notes.html" class="py-8 px-7 d-flex align-items-center">
                            <span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
                              <img src="${ contextPath }/assets/images/svgs/icon-tasks.svg" alt="" width="24" height="24" />
                            </span>
                            <div class="w-75 d-inline-block v-middle ps-3">
                              <h6 class="mb-1 fs-3 fw-semibold lh-base">My Task</h6>
                              <span class="fs-2 d-block text-body-secondary">To-do and Daily Tasks</span>
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
                          <a href="${ contextPath }/horizontal/authentication-login.html" class="btn btn-outline-primary">Log Out</a>
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

        </div>
      </header>
      <!--  Header End 헤더 끝 ----------------------------->
      
      <!----------------------------- 본문 시작 -------------------->
      <div class="body-wrapper">
        <div class="container-fluid">
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center my-3">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">조직도</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <!-- <img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4" /> -->
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <div class="card">
            <div class="card-body">

					    <script>
					    	
					    	var isHidden = true;
					    
				        $(document).ready(function(){
				        	
				        	$("#major").hide();
					        $("#search").hide();
				        	
							    console.log(${majorList.get(1)});
					      
					        	for(var i=0; i<${majorList.size()}; i++){
						        	//console.log("음");
											//console.log(${majorList.get(i).majorName})
											//${majorList.get(1).colNo}
											var aTag = document.createElement("a");
											aTag.textContent = "${majorList.get(i).majorName}";
											aTag.href = "#";
											aTag.classList.add("major");
											aTag.classList.add(${majorList.get(i).colNo});
											
											var laTag = document.createElement("li");
											laTag.appendChild(aTag);
											
											var ulTag = document.createElement("ul");
											ulTag.appendChild(laTag);
											
											var college1Li = document.getElementById("college1");
											college1Li.appendChild(ulTag);
		
					        	}
					       
											/*	
		                	<ul>
		                    <li>
		                      <a href="#" class="major">학과명</a>
		                    </li>
		                  </ul> 
					        		*/
				
				        });

				        
				        $(document).on("click", ".major", function(){
				        	if(isHidden){
				        		$("#major").show();
				        		$("#search").show();
				        		isHidden = false;
				        	}else{
				            $("#major").hide();
				            $("#search").hide();
				            isHidden = true;
				        	}
				        })
					    </script>
					    
					    <c:forEach var="i" items="${majorList}">
					    	${i.majorName}
					    </c:forEach>

	            <div id="content_1">
	              <div class="tree originTree">
	                <ul class="oneUl">
	                  <li class="oneLi">
	                    <a href="#" id="admin" class="fs-8 gdu">GDU</a>
	                    <ul class="twoUl">
	                    <!-- 동적으로 조직도 생성범위 -->
	                      <li id="college1">
	                        <a href="#" class="college college1">${colList[0].colName}</a>
	<!--                               <ul>
	                                <li>
	                                  <a href="#" class="major">학과명</a>
	                                  <ul>
	                                    <li>
	                                      <a href="#" class="major">학과명</a>
	                                      <ul>
	                                        <li>
	                                          <a href="#" class="major">학과명</a>
	                                        </li>
	                                      </ul>
	                                    </li>
	                                  </ul>
	                                </li>
	                              </ul> -->
	                      </li>
	                      <li id="college2">
	                        <a href="#" class="college college2">${colList[1].colName}</a>
	                        <ul>
	                          <li>
	                            <a href="#" class="major">학과명</a>
	                            <ul>
	                              <li>
	                                <a href="#" class="major">학과명</a>
	                                <ul>
	                                  <li>
	                                    <a href="#" class="major">학과명</a>
	                                  </li>
	                                </ul>
	                              </li>
	                            </ul>
	                          </li>
	                        </ul>
	                      </li>
	                      <li id="college3">
	                        <a href="#" class="college college3">${colList[2].colName}</a>
	                        <ul>
	                          <li>
	                            <a href="#" class="major">학과명</a>
	                            <ul>
	                              <li>
	                                <a href="#" class="major">학과명</a>
	                                <ul>
	                                  <li>
	                                    <a href="#" class="major">학과명</a>
	                                  </li>
	                                </ul>
	                              </li>
	                            </ul>
	                          </li>
	                        </ul>
	                      </li>
	                    <!-- 동적으로 조직도 생성범위 -->
	                    </ul>
	                  </li>
	                </ul>
	              </div> 
	              <br><br><br><br>ㅇㅇ
	
                <div id="major">
                  <!--학과 펼쳐질 영역-->
                  <!-- ajax 통해 동적스크립트로 처리 예정-->
                  <p class="fs-7 fw-semibold">XX과</p>
                  <div class="table-responsive mb-4">
                    <table class="table border text-nowrap mb-0 align-middle majorUser">
                      <thead class="text-dark fs-4">
                        <tr align="center">
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">이름</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">사번</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">직급</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">연락처</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">이메일</h6>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                              <div class="ms-3">
                                <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">15-76096582</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">대리</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                              <div class="ms-3">
                                <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">15-76096582</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">대리</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                              <div class="ms-3">
                                <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">15-76096582</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">대리</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                              <div class="ms-3">
                                <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">15-76096582</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">대리</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                              <div class="ms-3">
                                <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">15-76096582</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">대리</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <br><br>
	
	              <div id="search">
	                <nav aria-label="Page navigation example">
	                  <ul class="pagination">
	                    <li class="page-item">
	                      <a class="page-link link" href="#" aria-label="Previous">
	                        <span aria-hidden="true">
	                          <i class="ti ti-chevrons-left fs-4"></i>
	                        </span>
	                      </a>
	                    </li>
	                    <li class="page-item">
	                      <a class="page-link link" href="#">1</a>
	                    </li>
	                    <li class="page-item">
	                      <a class="page-link link" href="#">2</a>
	                    </li>
	                    <li class="page-item">
	                      <a class="page-link link" href="#">3</a>
	                    </li>
	                    <li class="page-item">
	                      <a class="page-link link" href="#" aria-label="Next">
	                        <span aria-hidden="true">
	                          <i class="ti ti-chevrons-right fs-4"></i>
	                        </span>
	                      </a>
	                    </li>
	                  </ul>
	                </nav>
	
	                <form id="searchForm" action="" method="Get" align="center">
	                  <input id="searchName" type="text" class="form-control" name="" placeholder="이름으로 검색">
	                  <button type="submit" class="searchBtn btn btn-secondary">검색</button>
	                </form>
	              </div>
	            </div>

            </div>
          </div>


        </div>
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