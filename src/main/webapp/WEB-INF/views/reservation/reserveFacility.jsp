<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 예약</title>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'timeGridDay',
      headerToolbar:{
        left: 'prevYear,prev',
        center: 'title',
        right: 'next,nextYear today'
      },
      nowIndicator: true, // 현재 시간 마크
    locale: 'ko', // 한국어 설정
      buttonText:{ //버튼 텍스트 변환
        today:'오늘'
      }
    });
    calendar.render();
  });
 </script>

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
                  <h4 class="fw-semibold mb-8">시설 예약하기</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">예약</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/reservation/resourceList.page">자원 예약</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">시설 예약하기</li>
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
              <h5 class="fw-semibold mb-8">시설 예약하기</h5>
              <br>
              
              <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal2">
                  예약하기
                </button>

              </div>
              <br><br>

              <table class="table border text-nowrap mb-0 align-middle">
                <tbody align="center">
                  <tr>
                    <th width="200px">분류</th>
                    <td>회의실</td>
                  </tr>
                  <tr>
                    <th>시설명</th>
                    <td>시설11111</td>
                  </tr>
                  <tr>
                    <th>상세설명</th>
                    <td>회의하는 공간</td>
                  </tr>
                  <tr>
                    <th>위치</th>
                    <td>xx동 xxxx호</td>
                  </tr>
                </tbody>
              </table>
              <br>

              <!-- 일간 달력으로만 -->
              <div class="calender-sidebar app-calendar">
                <div id="calendar">
                  
                </div>
              </div>
            </div>
          </div>

          <!-- Button to Open the Modal -->
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Open modal
          </button>

          <!-- 예약 상세조회 모달창 -->
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


          

          <!-- 예약 등록 모달창 -->
          <div class="modal" id="myModal2">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">시설 예약 하기</h4>
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
                        <th>예약일</th>
                        <td><input type="date" required></td>
                      </tr>
                      <tr>
                        <th>예약 시간</th>
                        <td>
                          <select>
                            <option>오전 7시 00분</option>
                            <option>오전 7시 30분</option>
                          </select>
                          ~
                          <select>
                            <option>오전 7시 00분</option>
                            <option>오전 7시 30분</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <th>사용 용도</th>
                        <td><textarea name="" cols="35" rows="5"></textarea></td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">등록</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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