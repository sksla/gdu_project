<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="${ contextPath }/assets/images/logos/favicon.png" />

  <!-- Core Css -->
  <link rel="stylesheet" href="${ contextPath }/assets/css/styles.css" />

  <title>Modernize Bootstrap Admin</title>
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="${ contextPath }/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css" />
</head>

<body>

  
  <!-- Sidebar Start 사이드바 -->
  <aside class="left-sidebar with-vertical">
    <div>

      <!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
      
      <!-- 로고 -->
      <div class="brand-logo d-flex align-items-center justify-content-between">
         <a href="${ contextPath }" class="text-nowrap logo-img">
           <img src="../assets/images/logos/longlogo.png" class="dark-logo pt-3 pb-3" width="" height="72" />
           <img src="${ contextPath }/assets/images/logos/light-logo.svg" class="light-logo" alt="Logo-light" />
         </a>
         <a href="javascript:void(0)" class="sidebartoggler ms-auto text-decoration-none fs-5 d-block d-xl-none">
           <i class="ti ti-x"></i>
         </a>
       </div>


      <nav class="sidebar-nav scroll-sidebar" data-simplebar>
        <ul id="sidebarnav">
          <!-- ---------------------------------- -->
          <!-- 전자결재 사이드 바 -->
          <!-- ---------------------------------- -->
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">전자결재</span>
          </li>
          <li class="sidebar-item">
            <a href="${contextPath}/approval/enrollAppDoc.page" class="btn btn-lg my-3 fw-semibold" style="width:100%;">
            	<i class="ti ti-clipboard-text"></i>&nbsp;&nbsp;기안하기
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-clipboard"></i>
              </span>
              <span class="hide-menu">내 문서함</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="${contextPath}/approval/ongoingBoard.do" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">진행중 문서</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/ongoingBoard.do?docStatus=40" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">완료문서</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/ongoingBoard.do?docStatus=2" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">반려문서</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/ongoingBoard.do?docStatus=1" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">회수문서</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/ongoingBoard.do?docStatus=0" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">임시보관 문서</span>
                </a>
              </li>
            </ul>
          </li>
         <li class="sidebar-item">
           <a class="sidebar-link" href="${contextPath}/approval/receiveBoard.do" aria-expanded="false">
             <span>
               <i class="ti ti-clipboard"></i>
             </span>
             <span class="hide-menu">수신문서</span>
           </a>
         </li>
				 <li class="sidebar-item">
            <a class="sidebar-link" href="" aria-expanded="false">
              <span>
                <i class="ti ti-clipboard"></i>
              </span>
              <span class="hide-menu">참조문서</span>
            </a>
          </li>						
          <li class="sidebar-item">
            <a class="sidebar-link" href="" aria-expanded="false">
              <span>
                <i class="ti ti-clipboard"></i>
              </span>
              <span class="hide-menu">공람문서</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="" aria-expanded="false">
              <span>
                <i class="ti ti-settings"></i>
              </span>
              <span class="hide-menu">자주쓰는 결재선 관리</span>
            </a>
          </li>	
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-clipboard"></i>
              </span>
              <span class="hide-menu">결재양식</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="${contextPath}/approval/enrollCategory.page" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">결재양식 등록</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/categoryList.do?tmp=N" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">결재양식 보관함</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="${contextPath}/approval/categoryList.do?tmp=Y" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">임시보관함</span>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>

    </div>      
  </aside>
        
</body>

</html>