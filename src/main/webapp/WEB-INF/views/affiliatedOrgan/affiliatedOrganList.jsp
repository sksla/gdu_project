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

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- sidebar -->
	
	<!-- 본문 -->
	<!-- 바디 -->
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
                                <button type="button" class="btn btn-info" onclick="location.href='부속기관등록수정.html'">등록하기</button>
                              </div>
                            </div>
                  
                            <div class="content2">
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
                                            <h6 class="fs-4 fw-semibold mb-0">연락처</h6>
                                          </th>
                                          <th>
                                            <h6 class="fs-4 fw-semibold mb-0">예약</h6>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td>
                                            <div class="d-flex align-items-center">
                                              <div class="ms-3">
                                                <h6 class="fs-4 fw-semibold mb-0">1</h6>
                                              </div>
                                            </div>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">연구실1</p>
                                          </td>
                                          <td>
                                            <div class="d-flex align-items-center">
                                              <p class="mb-0 fw-normal fs-4">11호</p>
                                            </div>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">02-1111-1111</p>
                                          </td>
                                          <td>
                                            <button type="button" class="btn btn-info" onclick="location.href='부속기관예약.html'">예약</button>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <div class="d-flex align-items-center">
                                              <div class="ms-3">
                                                <h6 class="fs-4 fw-semibold mb-0">1</h6>
                                              </div>
                                            </div>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">연구실1</p>
                                          </td>
                                          <td>
                                            <div class="d-flex align-items-center">
                                              <p class="mb-0 fw-normal fs-4">11호</p>
                                            </div>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                                          </td>
                                          <td>
                                            <p class="mb-0 fw-normal fs-4">02-1111-1111</p>
                                          </td>
                                          <td>
                                            <button type="button" class="btn btn-info" onclick="location.href='부속기관예약.html'">예약</button>
                                          </td>
                                        </tr>
                                        
                                      </tbody>
                                    </table>
                                  </div>
                                  <!-- 1번 양식 -->
                                </div>
                              </div>
                            </div>
                  
                            <div class="content3">
                              <!-- ------------------------------------------------ -->
                              <!-- 2. Pagination with Icon -->
                              <!-- ------------------------------------------------ -->
                              <div class="col-lg-4 d-flex align-items-stretch">
                                <!--  start Pagination with Icon -->
                                <div class="card w-100">
                                  <div class="card-body">
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
                                  </div>
                                </div>
                                <!--  end Pagination with Icon -->
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
                                                <h6 class="fs-4 fw-semibold mb-0">연락처</h6>
                                              </th>
                                              <th>
                                                <h6 class="fs-4 fw-semibold mb-0">사용기간</h6>
                                              </th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>
                                                <div class="d-flex align-items-center">
                                                  <div class="ms-3">
                                                    <h6 class="fs-4 fw-semibold mb-0">1</h6>
                                                  </div>
                                                </div>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">연구실1</p>
                                              </td>
                                              <td>
                                                <div class="d-flex align-items-center">
                                                  <p class="mb-0 fw-normal fs-4">11호</p>
                                                </div>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">경영학과</p>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">02-1111-1111</p>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">2024-04-05</p>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td>
                                                <div class="d-flex align-items-center">
                                                  <div class="ms-3">
                                                    <h6 class="fs-4 fw-semibold mb-0">1</h6>
                                                  </div>
                                                </div>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">연구실1</p>
                                              </td>
                                              <td>
                                                <div class="d-flex align-items-center">
                                                  <p class="mb-0 fw-normal fs-4">11호</p>
                                                </div>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">경영학과</p>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">02-1111-1111</p>
                                              </td>
                                              <td>
                                                <p class="mb-0 fw-normal fs-4">2024-04-05</p>
                                              </td>
                                            </tr>
                                            
                                          </tbody>
                                        </table>
                                      </div>
                                    <!-- 1번 양식 -->
                                  </div>
                                </div>
                              </div>
                          
                              <div class="content5">
                                <!-- ------------------------------------------------ -->
                                <!-- 2. Pagination with Icon -->
                                <!-- ------------------------------------------------ -->
                                <div class="col-lg-4 d-flex align-items-stretch">
                                <!--  start Pagination with Icon -->
                                  <div class="card w-100">
                                    <div class="card-body">
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
                                    </div>
                                  </div>
                                <!--  end Pagination with Icon -->
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
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>