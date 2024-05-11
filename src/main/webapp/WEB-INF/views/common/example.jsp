<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 이쪽에 사이드바 포함 할꺼임 -->
		<!--  
    <jsp:include page=""/>
    -->
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(메뉴바) 포함 할꺼임 -->
    	<!--  
	    <jsp:include page=""/>
	    -->
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
            
              <div class="row align-items-center my-3">
              
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">전자결재작성</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">전자결재</li>
                      <li class="breadcrumb-item" aria-current="page">전자결재작성</li>
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
              여기에 내용작성
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              여기에 내용작성
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              여기에 내용작성
            </div>
          </div>

        </div>
        
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 이쪽에 세팅메뉴(바) 포함 할꺼임 -->
    	<!--  
	    <jsp:include page=""/>
	    -->
    
	</div><!-- main-wrapper end -->
	
	<!-- 이쪽에 푸터 포함 할꺼임 -->
 	<!--  
  <jsp:include page=""/>
  -->
	
</body>
</html>