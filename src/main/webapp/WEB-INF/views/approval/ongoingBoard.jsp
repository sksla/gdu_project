<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
  .app_doc_table th, .app_doc_table td{
    text-align: center;
    vertical-align: middle;}
  .app_title:hover{cursor: pointer;}
</style>
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
                <h4 class="fw-semibold mb-8">전자결재</h4>
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a class="text-muted text-decoration-none" href="../main/index.html"
                        >Home
                      </a>
                    </li>
                    <li class="breadcrumb-item" aria-current="page">결재문서함</li>
                  </ol>
                </nav>
              </div>
              <div class="col-3">
                <div class="text-center mb-n5">
                  <img
                    src=""
                    alt=""
                    class="img-fluid mb-n4"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 페이지 내용 -->
        <div class="card ">
          <div class="card-body">
            <div class="mb-4">
              <div class="d-flex justify-content-between">
                <div class="" style="height: 38.33px; width: 50%;">
                  <form class="d-flex flex-row">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <button class="btn bg-secondary-subtle text-secondary " type="button">Button</button>
                    </div>
                    <div class="form-group" style="width: 150px;">
                      <select class="form-select" id="">
                          <option selected disabled>검색옵션</option> 
                          <option>제목</option>
                          <option>문서번호</option>
                      </select>
                    </div>
                  </form>
                </div>
                <form class="d-flex flex-row" style="height: 38.33px;">
                  <label for="" class="form-label fw-semibold col-form-label fs-3">기안일 :</label>&nbsp;&nbsp;
                  <span class="form-group">
                    <input type="date" class="form-control" value="2018-05-13">
                  </span>
                  &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                  <span class="form-group">
                    <input type="date" class="form-control" value="2018-05-13">
                  </span>
                  <button class="btn btn-info">검색</button>
                </form>
              </div>
            </div>
            <div class=" mb-4">
              <table class="table border text-nowrap mb-0 align-middle app_doc_table">
                <thead class="text-dark fs-4">
                  <tr>
                    <th width="100px">
                      <h6 class="fs-4 fw-semibold mb-0">문서번호</h6>
                    </th>
                    <th>
                      <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                    </th>
                    <th width="140px">
                      <h6 class="fs-4 fw-semibold mb-0">기안일</h6>
                    </th>
                    <th width="180px">
                      <div class="btn-group">
                        <select class="form-select fs-4 fw-semibold selectGroupping" id="selectCategory" style="border:0;">
                          <option value="all" selected>구분</option>
                          <c:forEach var="appCategory" items="${appCategories}">
                         		<option value="${appCategory}">${appCategory}</option>
                         	</c:forEach>
                      	</select>
                      </div>
                    </th>
                    <th width="180px">
                      <div class="btn-group">
                        <select class="form-select fs-4 fw-semibold selectGroupping" id="selectStatus" style="border:0;">
                          <option value="all">상태</option>
                          <option value="0">기안</option>
                          <option value="10">협조</option>
                          <option value="20">결재</option>
                          <option value="30">수신</option>
                      	</select>
                      </div>
                    </th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${ empty appDocList }">
                			<tr>
		                    <td colspan="5">
		                      <p class="mb-0 fw-normal fs-4">결재문서가 존재하지 않습니다.</p>
		                    </td>
		                  </tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="appDoc" items="${ appDocList }">
                			<tr>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${appDoc.docNo}</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4 app_title">${ appDoc.docTitle }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.draftDate }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.appNo }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.status }</p>
		                    </td>
		                  </tr>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </tbody>
              </table>
            </div>

            <!-- 페이징바 -->
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link link" href="#" aria-label="Previous">
                  <span aria-hidden="true">
                    <i class="ti ti-chevrons-left fs-4"></i>
                  </span>
                </a>
              </li>
              <li class="page-item">
                <a class="page-link link active" href="#">1</a>
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