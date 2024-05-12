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
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h3 class="fw-semibold mb-8">전자결재 양식 등록</h3>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">전자결재</li>
                      <li class="breadcrumb-item" aria-current="page">전자결재 양식 등록</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <img src="" alt="" class="img-fluid mb-n4" />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <form action="" method="post">
            <div class="mb-4">
              <span>
                <button onclick="" class="btn btn-info me-1 mb-1 px-4 fs-4">등록하기</button>
                <button onclick="" class="btn btn-light mx-2 mb-1 px-4 fs-4">임시저장</button>
              </span>
            </div>
            
            <div class="form-with-tabs">
  
              <h5 class="card-title fw-semibold mb-4">문서정보</h5>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="row align-items-center">
                        <div class="col-sm-3" style="vertical-align: top;">
                          <label for="" class="form-label fw-semibold col-form-label fs-4">문서구분</label>
                        </div>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            <option value="인사" selected>인사</option>
                            <option value="총무">총무</option>
                            <option value="교육">교육</option>
                          </select>
                          <input type="hidden" class="form-control" id="" placeholder="신규 문서 구분명">
                        </div>
                        <div class="form-check" style="margin-left: 150px; margin-top: 8px;">
                          <input class="form-check-input" type="checkbox" value="" id="insertDocType">
                          <label class="form-check-label" for="insertDocType">
                            <b>문서구분 항목 신규 등록</b>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-4 row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">문서양식이름</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <br>
              
              <!-- 결재문서 작성 영역 -->
              <h5 class="card-title fw-semibold" style="display: inline;">결재내용</h5><br><br>
              <div class="card">

                <div class="card-body">
                  <label for="example-text-input" class="col-md-2 col-form-label fs-4">내용</label>
                  <div class="col-md-12">
                    <h1>에디터 API</h1>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <br><br><br>

          
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