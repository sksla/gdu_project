<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 목록</title>

<style>
	.search-style{
	  height:35px; 
	  color:#5a6a85; 
	  border: 1px solid #dfe5ef;
	}

</style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/reservationSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">나의 예약 목록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">예약</li>
                      <li class="breadcrumb-item" aria-current="page">나의 예약 목록</li>
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
              <h5 class="fw-semibold mb-8">미반납 비품 내역</h5>
              <br>

              <table class="table border text-nowrap mb-0 align-middle">
                <thead align="center">
                  <tr>
                    <th>자원명</th>
                    <th>예약시간</th>
                    <th>예약수량</th>
                    <th>상세조회</th>
                  </tr>
                </thead>
                <tbody align="center">
                  <tr>
                    <td>비품11111</td>
                    <td>2024-4-23</td>
                    <td>5개</td>
                    <td><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">상세조회</button></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              <h5 class="fw-semibold mb-8">예약 내역</h5>
              <br>

              <form class="mt-3">
                <select name="condition" class="search-style" id="">
               		<option>전체</option>
                   <option>회의실</option>
                   <option>강의실</option>
                   <option>기타</option>
                   <option>비품</option>
                </select>
                <input type="text" class="search-style" name="" id="">
                <button class="btn btn-outline-primary">검색</button>
                
              </form>
              <br>

              <table class="table border">
                <thead align="center">
                  <tr>
                    <th>분류</th>
                    <th>자원명</th>
                    <th>예약시간</th>
                    <th>상세조회</th>
                  </tr>
                </thead>
                <tbody align="center">
                  <tr>
                    <td>비품</td>
                    <td>비품11111</td>
                    <td>2024-4-23</td>
                    <td><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">상세조회</button></td>
                  </tr>
                  <tr>
                    <td>강의실</td>
                    <td>강의실명1111</td>
                    <td>2024-4-23 15:00 ~ 16:00</td>
                    <td><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">상세조회</button></td>
                  </tr>
                  <tr>
                    <td>회의실</td>
                    <td>회의실명11111</td>
                    <td>2024-4-23 15:00 ~ 16:00</td>
                    <td><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModal">상세조회</button></td>
                  </tr>
                </tbody>
              </table>
              <br>

              <ul class="pagination justify-content-center">
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

            </div>
          </div>

          <!-- The Modal -->
          <div class="modal" id="myModal">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">예약 상세 조회</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">자원명</th>
                        <td>자원명111</td>
                      </tr>
                      <tr>
                        <th>예약시간</th>
                        <td>2024-4-23 15:00 ~ 16:00</td>
                        <!--비품예약일 경우-->
                        <!--
                        <td>2024-4-2</td>
                        -->
                      </tr>
                      <tr>
                        <th>신청자</th>
                        <td>김사람</td>
                      </tr>
                      <tr>
                        <th>사용 용도</th>
                        <td>이렇게 저렇게 사용</td>
                      </tr>
                      <!-- * 비품 예약일 경우 -->
                      <!--
                      <tr>
                        <th>예약 수량</th>
                        <td>2개</td>
                      </tr>
                      -->
                      <tr>
                        <th>예약 상태</th>
                        <!--비품예약일 경우-->
                        <!--
                        <td>반납 or 미반납</td>
                        -->
                        <td>예약 완료</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-danger">삭제</button>
                </div>

              </div>
            </div>
          </div>
          
          <script>
          
          </script>
          
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