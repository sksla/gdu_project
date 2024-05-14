<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/appSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
        
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <div class="row">
          	<div class="col-lg-6 d-flex align-items-strech">
          		<div class="card w-100">
	          		<div class="card-body">
	          		분할1
	          		</div>
	          	</div>
          	</div>
          	<div class="col-lg-6 d-flex align-items-strech">
          		<div class="card w-100">
	          		<div class="card-body">
	          		분할2
	          		</div>
	          	</div>
          	</div>
          </div>
          
          <div class="row">
          	<div class="col-lg-6 d-flex align-items-strech">
          		<div class="card w-100">
	          		<div class="card-body">
	          		분할1
	          		</div>
	          	</div>
          	</div>
          	<div class="col-lg-6 d-flex align-items-strech">
          		<div class="card w-100">
	          		<div class="card-body">
	          		분할2
	          		</div>
	          	</div>
          	</div>
          </div>
          
					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 해당 페이지 JavaScript 영역 start -->
    <script>
    	
    </script>
    <!-- 해당 페이지 JavaScript 영역 end-->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>