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
           <!-- 게시판 -->
            <!-- ---------------------------------- -->
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">게시판</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="${contextPath}/board/noticeList.do" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-check"></i>
                </span>
                <span class="hide-menu">공지사항</span>
              </a>
            </li>
						<!-- 
            <li class="sidebar-item">
              <a class="sidebar-link" href="./main/app-kanban.html" aria-expanded="false">
                <span>
                  <i class="ti ti-clipboard-text"></i>
                </span>
                <span class="hide-menu">자유게시판</span>
              </a>
            </li>
						 -->
            <li class="sidebar-item">
              <a class="sidebar-link" href="${ contextPath }/board/dataBoardList.page" aria-expanded="false">
                <span>
                  <i class="ti ti-paperclip"></i>
                </span>
                <span class="hide-menu">자료게시판</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="${contextPath}/board/proposalList.do" aria-expanded="false">
                <span>
                  <i class="ti ti-note"></i>
                </span>
                <span class="hide-menu">건의 게시판</span>
              </a>
            </li>
         </ul>
       </nav>

     </div>      
   </aside>
        
</body>

</html>