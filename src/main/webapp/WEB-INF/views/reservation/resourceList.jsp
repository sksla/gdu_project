<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약</title>
<style>
	.reserve_scroll{
    max-height: 700px;
    overflow-y: auto;
  }
  .search-style{
    height:35px; 
    color:#5a6a85; 
    border: 1px solid #dfe5ef;}


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
                  <h4 class="fw-semibold mb-8">자원 예약</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">예약</li>
                      <li class="breadcrumb-item" aria-current="page">자원예약</li>
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
              <h5 class="fw-semibold mb-8">자원 예약</h5>
              <br>
              비품 예약은 xx팀에 전화 또는 직접 방문하여 신청 부탁드립니다.<br>
              전화(xx-xxxx-xxxx) 
            </div>
          </div>

          <div class="row">
            <div class=" d-flex justify-content-between align-items-strech">
              <div class="card w-100" >
                <div class="card-body">
                  <h5 class="fw-semibold mb-8">시설 예약</h5>
                  <br>

                  <form class="mt-3">
                    <select name="condition" class="search-style" id="">
                        <option>전체</option>
                        <option>회의실</option>
                        <option>강의실</option>
                        <option>기타</option>
                    </select>
                    <input class="search-style" type="text" name="" id="">
                    <button class="btn btn-outline-primary">검색</button>
                  </form>
                  <br>

                  <div>
                    <table class="table border">
                      <thead align="center">
                        <tr>
                          <th>분류</th>
                          <th>자원명</th>
                          <th>예약하기</th>
                        </tr>
                      </thead>
                      <tbody class="reserve_scroll" align="center">
                        <tr>
                          <td>강의실</td>
                          <td>강의실명11111</td>
                          <td><button type="button" class="btn btn-sm btn-primary">예약하기</button></td>
                        </tr>
                        <tr>
                          <td>회의실</td>
                          <td>회의실명1111</td>
                          <td><button type="button" class="btn btn-sm btn-primary">예약하기</button></td>
                        </tr>
                        <tr>
                          <td>기타</td>
                          <td>기타시설명11111</td>
                          <td><button type="button" class="btn btn-sm btn-primary">예약하기</button></td>
                        </tr>
                        <tr>
                          <td>기타</td>
                          <td>기타시설명11111</td>
                          <td><button type="button" class="btn btn-sm btn-primary">예약하기</button></td>
                        </tr>
                      </tbody>
                    </table>
                  
                  </div>
    
                </div>
              </div>

              <div class="card w-100">
                <div class="card-body">
                  <h5 class="fw-semibold mb-8">비품 예약 가능 수량</h5>
                  <br>

                  <form class="mt-3">
                    비품명 : 
                    <input class="search-style" type="text" name="" id="">
                    <button class="btn btn-outline-primary">검색</button>
                  </form>
                  <br>
                
                  <div>
                    <table class="table border">
                      <thead align="center">
                        <tr>
                          <th>분류</th>
                          <th>자원명</th>
                          <th>잔여수량</th>
                        </tr>
                      </thead>
                      <tbody class="reserve_scroll" align="center">
                        <tr>
                          <td>비품</td>
                          <td>비품명11111</td>
                          <td>50</td>
                        </tr>
                        <tr>
                          <td>비품</td>
                          <td>비품명22222</td>
                          <td>30</td>
                        </tr>
                        <tr>
                          <td>비품</td>
                          <td>비품명22222</td>
                          <td>10</td>
                        </tr>
                      </tbody>
                    </table>
                  
                  </div>
    
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