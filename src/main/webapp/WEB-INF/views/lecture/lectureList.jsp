<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    /* div 스타일 */
    .lec_wrap{
      width:100%;
      max-height: 1100px;
      margin: auto;
      display: flex;
      flex-direction: column;
      border: 1px solid black;
    }
    .lec_content1{
      height: 100px;
      display:flex;
      border: 1px solid lightgray;
    }

    .lec_content2{
      height: 800px;
      display:flex;
      border: 1px solid greenyellow;
    }
  
    .lec_content3{
      height: 100px;
      display:flex;
      border: 1px solid lightgray;
    }
  
  </style>
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
              <h4 class="fw-semibold mb-8">강의목록</h4>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a class="text-muted text-decoration-none" href="../main/index.html"
                      >Home</a
                    >
                  </li>
                  <li class="breadcrumb-item" aria-current="page">강의목록</li>
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
      <div class="card">
        <div class="card-body">
          <div class="lec_wrap">
            <div class="lec_content1">
              강의목록
            </div>
            <div class="d-flex flex-row justify-content-between">
              <div class="searchForm">
                <form class="d-flex">
                  <div class="form-group" style="width: 150px;">
                    <select class="form-select" id="exampleFormControlSelect1">
                        <option selected disabled>검색</option> 
                        <option>학년</option>
                        <option>교수명</option>
                        <option>강의실</option>
                    </select>
                  </div>
                  &nbsp;
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">  
                    <button type="button col-3" class="btn btn-info">검색</button>
                  </div>
                </form>
              </div>
              <div class="col-3">
                <button type="button" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary"
                data-bs-toggle="modal" data-bs-target="#samedata-modal" data-bs-whatever="@mdo">강의등록</button>
              </div>
            </div>

            <!-- 강의 등록 모달 시작 -->
            <div class="modal fade" id="samedata-modal" tabindex="-1" aria-labelledby="exampleModalLabel1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="exampleModalLabel1">
                      강의정보
                    </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form>
                      <div class="mb-3">
                        <label for="lec_name" class="control-label">강의명</label>
                        <input type="text" class="form-control" id="lec_name" />
                      </div>
                      <div class="mb-3">
                        <label for="mem_no" class="control-label">담당교수</label>
                        <input type="text" class="form-control" id="mem_no" />
                      </div>
                      <div class="mb-3">
                        <label for="res_no" class="control-label">강의실</label>
                        <input type="text" class="form-control" id="res_no" />
                      </div>
                      <div class="mb-3">
                        <label for="lec_date" class="control-label">강의기간</label>
                        <input type="date" class="form-control" id="start_date">
                        &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                        <input type="date" class="form-control" id="end_date">
                      </div>
                      <div class="mb-3">
                        <label for="lec_time" class="control-label">강의시간</label>
                        <input type="time" class="form-control" id="start_time" />
                        &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                        <input type="time" class="form-control" id="end_time" />
                      </div>
                      <div class="mb-3">
                        <label for="lec_plan" class="control-label">수업계획서</label>
                        <input type="file" class="form-control" id="validatedCustomFile" required />
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary"
                data-bs-toggle="modal" data-bs-target="#lec_info_save-modal" data-bs-whatever="@mdo">등록하기</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="lec_info_save-modal" tabindex="-1" aria-labelledby="exampleModalLabel1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="exampleModalLabel1">
                    </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form>
                      <div class="mb-3">
                        <h6>등록완</h6>
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- 강의 등록 모달 끝 -->

            <div class="lec_content2">
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
                            <h6 class="fs-4 fw-semibold mb-0">강의코드</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">개설학과</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">학년</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">과목명</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">담당교수</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">수업시간</h6>
                          </th>
                          <th>
                            <h6 class="fs-4 fw-semibold mb-0">강의실</h6>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11-1111111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학원론</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">김교수</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11~12시</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">101호</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11-1111111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학원론</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">김교수</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11~12시</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">101호</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11-1111111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학원론</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">김교수</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11~12시</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">101호</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11-1111111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학원론</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">김교수</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11~12시</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">101호</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11-1111111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학원론</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">김교수</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">11~12시</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">101호</p>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!-- 1번 양식 -->
                </div>
              </div>
            </div>
            <div class="lec_content3">
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
  </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>