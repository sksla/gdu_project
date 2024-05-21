<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 연차신청 현황</title>
<style>
  .leaveReasonContent {
    display: none;
    position: absolute;
    z-index: 100;
  }
  .leaveReasonContent *{
    border-bottom: none;
    margin-bottom: 0px;
  }
  /* 페이징바를 한가운데로 */
  #searchForm {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
  }
  #search{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .memberLeave{
    display: flex;
  }
  .one, .two{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
  }
  .split, .two{
    color: rgb(185, 181, 181);
  }
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">근무</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">연차신청현황</li>
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

              <div class="memberLeave">
                <h2 class="one">직원 연차 신청현황</h2>
                <h2 class="split">|</h2>
                <h2 class="two">직원 연차관리</h2>
              </div>
              <br><br>
              <form action="" method="">
                <table class="table border text-nowrap mb-0 align-middle">
                  <thead class="text-dark fs-3" align="center">
                    <tr>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0"></h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">사번</h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">이름</h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">
                          <select class="form-select mb-n2" name="" style="width: 130px;">
                              <option selected>전체학과</option>
                              <option value="">학과명1</option>
                              <option value="">학과명2</option>
                              <option value="">학과명3</option>
                              <option value="">학과명4</option>
                          </select>
                        </h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">
                          <select class="form-select mb-n2" name="" style="width: 130px;">
                            <option selected>전체직급</option>
                            <option value="">직급명1</option>
                            <option value="">직급명2</option>
                            <option value="">직급명3</option>
                            <option value="">직급명4</option>
                            <option value="">직급명5</option>
                            <option value="">직급명6</option>
                          </select>
                        </h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">시작일</h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">종료일</h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">비고</h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">승인여부</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody align="center">
                    <tr class="leaveReason">
                      <th>
                        <h6 class="fs-2 mb-0">
                          <input type="checkbox" name="" class="selectMember">
                        </h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">15-76096582</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">홍길동</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">경영학과</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">과장</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">YYYY/MM/DD</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">YYYY/MM/DD</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">3일 사용</h6>
                      </th>
                      <th>
                        <h6 class="fs-2 mb-0">Y</h6>
                      </th>
                    </tr>
                    <tr class="leaveReasonContent">
                      <td colspan="4">
                        <div class="card" style="width: 400px; height: 250px;">
                          <div class="card-body">
                            <p class="fs-5 fw-semibold">연차사유(정기)</p>
                            <hr>
                            <p>적혀있는 연차사유</p>
                          </div>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <br><br>
                <div style="text-align: right;">
                  <button type="submit" class="btn btn-secondary">승인</button>
                  <button type="submit" class="btn btn-secondary">거절</button>
                </div>
              </form>

							<script>
							 // 휴가신청현황 호버용 스크립트문
							 document.addEventListener("DOMContentLoaded", function() {
							   var leaveReasons = document.querySelectorAll('.leaveReason');
							
							   leaveReasons.forEach(function(leaveReason) {
							     leaveReason.addEventListener('mouseenter', function(event) {
							       if (!event.target.closest('.selectMember')) {
							         var leaveReasonContent = leaveReason.nextElementSibling;
							         if (leaveReasonContent && leaveReasonContent.classList.contains('leaveReasonContent')) {
							           leaveReasonContent.style.display = 'table-row';
							         }
							       }
							     });
							
							     leaveReason.addEventListener('mouseleave', function(event) {
							       if (!event.target.closest('.selectMember')) {
							         var leaveReasonContent = leaveReason.nextElementSibling;
							         if (leaveReasonContent && leaveReasonContent.classList.contains('leaveReasonContent')) {
							           leaveReasonContent.style.display = 'none';
							         }
							       }
							     });
							   });
							 });
							</script>

              <!-- 페이징바 & 검색창-->
              <div id="search">
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
          </div>

          
					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
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