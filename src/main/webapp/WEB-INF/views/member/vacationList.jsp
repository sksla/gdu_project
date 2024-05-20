<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 목록</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/memberSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">휴가정보</h4>
                  <nav aria-label="breadcrumb" style="--bs-breadcrumb-divider: '>'">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">마이페이지</li>
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
                <div class="table-responsive mb-4">
                    <table class="table table-borderless text-center align-middle mb-0">
                        <tbody >
                            <tr class="bg-light">
                                <td class="bg-transparent">지급연차<br>${ loginUser.leaveCount }일</td>
                                <td class="bg-transparent">보상연차<br>2일</td>
                                <td class="bg-transparent">잔여연차<br>10일</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mb-4">
                  <div class="d-flex justify-content-between">
                    
                    <form class="d-flex flex-row" style="height: 38.33px;">
                      <label for="" class="form-label fw-semibold col-form-label fs-3">신청일 :</label>&nbsp;&nbsp;
                      <span class="form-group">
                        <input type="date" class="form-control" value="2024-05-01">
                      </span>
                      &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                      <span class="form-group">
                        <input type="date" class="form-control" value="2024-05-09">
                      </span>
                      <button class="btn btn-info">검색</button>
                    </form>
                    <a type="button" class="btn btn-info" href="${contextPath}/member/vacationForm.page">휴가신청</a> 
                  </div>
                </div>
                <div class="table-responsive mb-4">
                  <table class="table border text-nowrap mb-0 align-middle text-center app_doc_table overflow-hidden">
                    <thead class="text-dark fs-4 align-middle ">
                        <tr>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가번호</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가구분</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가일수</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">신청일</h6>
                          </th>
                          <th width="200px">
                            <div class="btn-group">
                              <button class="btn dropdown-toggle " type="button" id="dropdownMenuButton"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                상태 : 전체
                              </button>
                              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#">대기</a></li>
                                <li><a class="dropdown-item" href="#">승인</a></li>
                                <li><a class="dropdown-item" href="#">반려</a></li>
                              </ul>
                            </div>
                          </th>
                          
                        </tr>
                    </thead>
                    <tbody class="text-center">
                      <tr>
                        <td>
                          <p class="mb-0 fw-normal fs-4">1</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">연차</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">1일</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2024-05-07</p>
                        </td>
                        <td>
                            <span class="badge rounded-pill bg-success-subtle text-success fw-semibold fs-2">대기</span>
                        </td>
                       
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">반차</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">0.5일</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2024-05-05</p>
                        </td>
                        <td>
                            <span
                          class="badge rounded-pill bg-primary-subtle text-primary fw-semibold fs-2">승인</span>
                        </td>
                        
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-0 fw-normal fs-4">3</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">병가</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2일</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2024-05-01</p>
                        </td>
                        <td>
                            <span class="badge rounded-pill bg-danger-subtle text-danger fw-semibold fs-2">반려</span>
                        </td>
                        
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-0 fw-normal fs-4">4</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">연차</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2일</p>
                        </td>
                        <td>
                          <p class="mb-0 fw-normal fs-4">2024-04-12</p>
                        </td>
                        <td>
                            <span
                            class="badge rounded-pill bg-primary-subtle text-primary fw-semibold fs-2">승인</span>
                        </td>
                        
                      </tr>
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

          

          

        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>