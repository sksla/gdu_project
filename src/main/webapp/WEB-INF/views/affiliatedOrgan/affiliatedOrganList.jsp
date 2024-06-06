<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부속기관</title>
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
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
            
              <div class="row align-items-center my-3">
              
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">부속기관</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">부속기관</li>
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
              <div>
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" data-bs-toggle="tab" href="#affList" role="tab">
                        <span>부속기관 목록</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#resList" role="tab">
                        <span>부속기관 예약목록</span>
                      </a>
                    </li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div class="tab-pane active" id="affList" role="tabpanel">
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
                                    <input type="text" class="form-control" name="keyword" value="${ search.keyword }" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">  
                                    <button class="btn btn-info" type="submit">검색</button>
                                  </div>
                                </form>
                                <c:if test="${ not empty search }">
						                      <script>
									                  $(document).ready(function(){
									                     $("#searchForm select").val("${search.condition}");
									                  
									                     // 검색후 페이지일 경우 페이징바의 페이지 클릭시
									                     $("#pagingArea a").on("click", function(){
									                        
									                        if($(this).hasClass("ti-chevrons-left")){
									                           $("#searchForm input[name=page]").val(${affPi.currentPage-1});                    
									                        }else if($(this).hasClass("ti-chevrons-right")){
									                           $("#searchForm input[name=page]").val(${affPi.currentPage+1});
									                        }else {
									                           $("#searchForm input[name=page]").val($(this).text());
									                        }
									                        $("#searchForm").submit();
									                        
									                        return false; // 기본 이벤트 제거(즉, a태그에 작성되어있는 href="/list.do" 실행안되도록)
									                     })
									                  })
									            	 </script>
					                     </c:if>
                                
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
                                   </div>
										              <!-- 페이징바 -->
											            <ul class="pagination justify-content-center">
															        <li class="page-item ${affPi.currentPage == 1 ? 'disabled' : ''}">
															            <a class="page-link link" href="${contextPath}/aff/affiliatedOrganList.do?page=${affPi.currentPage-1}&tab=affList" aria-label="Previous">
															                <span aria-hidden="true">
															                    <i class="ti ti-chevrons-left fs-4"></i>
															                </span>
															            </a>
															        </li>
															        <c:forEach var="p" begin="${affPi.startPage}" end="${affPi.endPage}">
															            <li class="page-item ${affPi.currentPage == p ? 'active' : ''}">
															                <a class="page-link link" href="${contextPath}/aff/affiliatedOrganList.do?page=${p}&tab=affList">${p}</a>
															            </li>
															        </c:forEach>
															        <li class="page-item ${affPi.currentPage == affPi.maxPage ? 'disabled' : ''}">
															            <a class="page-link link" href="${contextPath}/aff/affiliatedOrganList.do?page=${affPi.currentPage+1}&tab=affList" aria-label="Next">
															                <span aria-hidden="true">
															                    <i class="ti ti-chevrons-right fs-4"></i>
															                </span>
															            </a>
															        </li>
															    </ul>
										 							<!-- 페이징바 -->             
										              </div> 
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                    <div class="tab-pane p-3" id="resList" role="tabpanel">
                      <div class="p-3">
                        <div class="card">
                          <div class="card-body">
                            <div class="content-wrap">
                              <div class="content4">
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
                                                <h6 class="fs-4 fw-semibold mb-0">예약자</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">사용기간</h6>
                                              </th>   
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">예약사유</h6>
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
		                                          		<c:forEach var="res" items="${ reslist }"  varStatus="status">
		                                          			<tr>
		                                          				<td>${ res.rownum }</td>
		                                          				<td>${ res.affNo }</td>
		                                          				<td>${ res.memNo }</td>
		                                          				<td>${ res.startDate }~${ res.endDate }</td>
		                                          				<td>${ res.reason }</td>
		                                          			</tr>
		                                          		</c:forEach>
		                                          	</c:otherwise>
		                                          </c:choose>
		                                        </tr>
		                                      </tbody>
                                        </table>
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
              </div>
            </div>
            <!-- end Default Tab -->
          </div>

        </div>
      </div>
      
    </div><!-- page-wrapper end -->
		<script>
			document.addEventListener('DOMContentLoaded', function () {
			// Initialize Bootstrap tab
				var triggerTabList = [].slice.call(document.querySelectorAll('.nav-tabs a[data-bs-toggle="tab"]'));
				triggerTabList.forEach(function (triggerEl) {
					var tabTrigger = new bootstrap.Tab(triggerEl);
					triggerEl.addEventListener('click', function (event) {
						event.preventDefault();
						tabTrigger.show();
						// Get the target tab id and update the URL
						var targetTabId = triggerEl.getAttribute('href').replace('#', '');
						var currentTabId = getCurrentTabId();
						if (currentTabId !== targetTabId) {
							window.history.pushState({}, '', window.location.pathname + '?tab=' + targetTabId);
						}
					});
				});
				
				// Check for tab parameter in URL and activate corresponding tab
				var urlParams = new URLSearchParams(window.location.search);
				var tab = urlParams.get('tab');
				if (tab) {
					var tabElement = document.querySelector('.nav-tabs a[href="#' + tab + '"]');
					if (tabElement) {
						var tab = new bootstrap.Tab(tabElement);
						tab.show();
					}
				}
				        
				function getCurrentTabId() {
					var currentTabElement = document.querySelector('.nav-tabs a.nav-link.active');
					if (currentTabElement) {
						return currentTabElement.getAttribute('href').replace('#', '');
					}
						return null;
				}
			});			
    </script>
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>