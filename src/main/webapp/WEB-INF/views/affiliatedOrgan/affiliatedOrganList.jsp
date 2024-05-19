<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부속기관목록</title>
</head>
<body>
	
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/stuLecSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">부속기관</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html"
                          >Home</a
                        >
                      </li>
                      <li class="breadcrumb-item" aria-current="page">부속기관</li>
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

          <div class="col-md-6" style="width: 1000px;">
            <!-- start Default Tab -->
            <div class="card">
              <div class="card-body">
                <div>
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab">
                        <span>부속기관 목록</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab">
                        <span>부속기관 예약목록</span>
                      </a>
                    </li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div class="tab-pane active" id="home" role="tabpanel">
                      <div class="p-3">
                        <div class="card">
                          <div class="card-body">
                            <div class="content1 d-flex flex-row justify-content-between">
                              <div class="searchForm">
                                <form class="d-flex">
                                  <div class="form-group" style="width: 130px;">
                                    <select class="form-select" id="exampleFormControlSelect1">
                                        <option selected disabled>검색항목</option> 
                                        <option>기관명</option>
                                        <option>위치</option>
                                        <option>관리자</option>
                                    </select>
                                  </div>
                                  &nbsp;
                                  <div class="input-group">
                                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">  
                                    <button type="button col-3" class="btn btn-info">검색</button>
                                  </div>
                                </form>
                              </div>
                              <div class="button">
                                <button type="button" class="btn btn-info" onclick="location.href='${contextPath}/aff/affiliatedOrganEnrollForm.page'">등록하기</button>
                              </div>
                            </div>
                  
                            <div class="content2">
                              <div class="list">
                                <div class="card-body p-4">
                                  <!-- 1번 양식 -->
                                  <div class="table-responsive mb-4" style="overflow-x: hidden;">
                                    <table class="table border text-nowrap mb-0 align-middle">
                                      <thead class="text-dark fs-4">
                                        <tr>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                                          </th>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">기관명</h6>
                                          </th>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">위치</h6>
                                          </th>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">담당학과</h6>
                                          </th>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">예약</h6>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <c:choose>
                                          	<c:when test="${ empty aflist }">
                                          		<tr>
                                          			<td colspan="5"> 조회된 기관이 없습니다.</td>
                                          		</tr>
                                          	</c:when>
                                          	<c:otherwise>
                                          		<c:forEach var="af" items="${ aflist }">
                                          			<tr onclick="location.href='${contextPath}/aff/affiliatedOrganResForm.page?no=${af.affNo}'">
                                          				<td>${ af.affNo }</td>
                                          				<td>${ af.affName }</td>
                                          				<td>${ af.affLocation }</td>
                                          				<td>${ af.majorNo }</td>
                                          				<td><button type="button" class="btn btn-info">예약</button></td>
                                          			</tr>
                                          		</c:forEach>
                                          	</c:otherwise>
                                          </c:choose>
                                        </tr>
                                      </tbody>
                                    </table>
			                                <!--  start Pagination with Icon -->
			                                <div class="card w-100" >
			                                  <div class="card-body"style="margin:auto;">
			                                    <nav aria-label="Page navigation example">
			                                      <ul class="pagination">
			                                        <li class="page-item ${ pi.currentPage == p ? 'disabled' : '' }">
													                    	<a class="page-link" href="${contextPath }/aff/affiliatedOrganList.do?page=${pi.currentPage-1}">&lt;</a>
													                    </li>
			                    									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												                    	<li class="page-item ${ pi.currentPage == p ? 'disabled' : ''}">
												                    		<a class="page-link" href="${ contextPath }/aff/affiliatedOrganList.do?page=${p}">${p}</a>
												                    	</li>
												                    </c:forEach>
											                    		<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : ''}">
											                    			<a class="page-link" href="${contextPath}/aff/affiliatedOrganList.do?page=${ pi.currentPage+1 }">&gt;</a>
											                    		</li>
			                                    	</ul>
			                                    </nav>
			                                  </div>
			                                </div>
			                                <!--  end Pagination with Icon -->           
                                  </div>
                                  <!-- 1번 양식 -->
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane p-3" id="profile" role="tabpanel">
                      <div class="p-3">
                        <div class="card">
                          <div class="card-body">
                            <div class="content-wrap">
                              <div class="content4">
                                <div class="list">
                                  <div class="card-body p-4">
                                    <!-- 1번 양식 -->
                                      <div class="table-responsive mb-4">
                                        <table class="table border text-nowrap mb-0 align-middle">
                                          <thead class="text-dark fs-4">
                                            <tr>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">기관명</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">위치</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">관리자</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">사용기간</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">사유</h6>
                                              </th>
                                            </tr>
                                          </thead>
                                          <tbody>
		                                        <tr>
		                                          <c:choose>
		                                          	<c:when test="${ empty reslist }">
		                                          		<tr>
		                                          			<td colspan="5"> 조회된 기관이 없습니다.</td>
		                                          		</tr>
		                                          	</c:when>
		                                          	<c:otherwise>
		                                          		<c:forEach var="res" items="${ reslist }">
		                                          			<tr>
		                                          				<td></td>
		                                          				<td>${ res.affName }</td>
		                                          				<td>${ res.affLocation }</td>
		                                          				<td>${ res.majorNo }</td>
		                                          				<td>${ res.startDate }~${ res.endDate }</td>
		                                          				<td>${ res.reason }</td>
		                                          			</tr>
		                                          		</c:forEach>
		                                          	</c:otherwise>
		                                          </c:choose>
		                                        </tr>
		                                      </tbody>
                                        </table>
					                                <!--  start Pagination with Icon -->
					                                <div class="card w-100">
					                                  <div class="card-body" style="margin:auto;">
					                                    <nav aria-label="Page navigation example">
					                                      <ul class="pagination">
					                                        <li class="page-item ${ pi.currentPage == p ? 'disabled' : '' }">
															                    	<a class="page-link" href="${contextPath }/aff/affiliatedOrganList.do?page=${pi.currentPage-1}">&lt;</a>
															                    </li>
					                    									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
														                    	<li class="page-item ${ pi.currentPage == p ? 'disabled' : ''}">
														                    		<a class="page-link" href="${ contextPath }/aff/affiliatedOrganList.do?page=${p}">${p}</a>
														                    	</li>
														                    </c:forEach>
													                    		<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : ''}">
													                    			<a class="page-link" href="${contextPath}/aff/affiliatedOrganList.do?page=${ pi.currentPage+1 }">&gt;</a>
													                    		</li>
					                                    	</ul>
					                                    </nav>
					                                  </div>
					                                </div>
					                                <!--  end Pagination with Icon -->
                                      </div>
                                    <!-- 1번 양식 -->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- end Default Tab -->
          </div>

        </div>
      </div>
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>