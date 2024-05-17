<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_대시보드</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script>
		// CDN방식이며 전역에 네이스페이스를 사용
	  document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar')
    const calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    })
    calendar.render()
  }) 
</script>
<style>
  #section{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  #content1{
    display: flex;
    align-items: center;
    justify-content: center;
  }
  #leaveAndRegister{
    display: flex;
    flex-direction: column;
  }
  #content1 *, #content2 *, #content3 *{padding: 5px;}
  #content2, #content3{display: flex;}
  .leaveReasonContent {
    display: none;
    position: absolute;
  }
  .leaveReasonContent *{
    border-bottom: none;
    margin-bottom: 0px;
  }
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/calSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
            
              <div class="row align-items-center my-3">
              
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">대시보드</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
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
            
	            <script>
	              // 휴가신청현황 호버용 스크립트문
	              document.addEventListener("DOMContentLoaded", function() {
	                var leaveReasons = document.querySelectorAll('.leaveReason');
	
	                leaveReasons.forEach(function(leaveReason) {
	                  leaveReason.addEventListener('mouseenter', function() {
	                    var leaveReasonContent = leaveReason.nextElementSibling;
	                    if (leaveReasonContent && leaveReasonContent.classList.contains('leaveReasonContent')) {
	                     	leaveReasonContent.style.display = 'table-row';
	                    }
	                  });
	
	                  leaveReason.addEventListener('mouseleave', function() {
	                    var leaveReasonContent = leaveReason.nextElementSibling;
	                    if (leaveReasonContent && leaveReasonContent.classList.contains('leaveReasonContent')) {
	                     	leaveReasonContent.style.display = 'none';
	                    }
	                  });
	                });
	              });
	            </script>

              <div id="section">
                <!--학사일정&신청받은연차&강의학생등록기간-->
                <div id="content1">
	                <!--이달의 학사일정-->
	                <div id="majorSchedule">
	                  <div>
	                    <p class="fs-7 fw-semibold">학사일정 +</p>
	                    <div style="border: 1px solid black; width: 650px; height: 600px;" id="calendar"></div>
	                  </div>
	                </div>
	                
	                <div id="leaveAndRegister"><!--신청받은연차&강의학생등록기간-->
	                  <div id="leave"> <!--신청받은연차-->
	                    <p class="fs-7 fw-semibold">신청받은연차 +</p>
	                    <div class="table-responsive mb-4">
	                      <table class="table border text-nowrap mb-0 align-middle">
	                        <thead class="text-dark fs-4" align="center">
	                          <tr>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">학과</h6>
	                            </th>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">이름</h6>
	                            </th>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">날짜</h6>
	                            </th>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">승인여부</h6>
	                            </th>
	                          </tr>
	                        </thead>
	                        <tbody>
	                          <tr class="leaveReason">
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
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
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">xx과</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">홍길동</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4" align="center">N</p>
	                            </td>
	                          </tr>
	                        </tbody>
	                      </table>
	                    </div>
	                  </div>

	                  <div id="register"> <!--강의학생등록기간-->
	                    <p class="fs-7 fw-semibold">강의&학생등록기간</p>
	                    <div class="table-responsive mb-4">
	                      <table class="table border text-nowrap mb-0 align-middle">
	                        <thead class="text-dark fs-4" align="center">
	                          <tr>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">구분</h6>
	                            </th>
	                            <th>
	                              <h6 class="fs-4 fw-semibold mb-0">등록기간</h6>
	                            </th>
	                          </tr>
	                        </thead>
	                        <tbody align="center">
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">강의등록</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">학생등록</p>
	                            </td>
	                            <td>
	                              <p class="mb-0 fw-normal fs-4">YYYY/MM/DD~YYYY/MM/DD</p>
	                            </td>
	                          </tr>
	                        </tbody>
	                      </table>
	                    </div>
	                  </div>ㅇㅇ
	                </div>
                </div>
        
                <!--단과학과직급-->
                <div id="content2">
	                <div id="college"><!--단과-->
	                  <div>
	                    <p class="fs-7 fw-semibold">단과</p>
	                    <div style="border: 1px solid black; width: 350px; height: 250px;">그래프 표시</div>
	                  </div>
	                </div>
	                <div id="major"><!--학과-->
	                  <div>
	                    <p class="fs-7 fw-semibold">학과</p>
	                    <div style="border: 1px solid black; width: 350px; height: 250px;">그래프 표시</div>
	                  </div>
	                </div>
	                <div id="job"><!--직급-->
	                  <div>
	                    <p class="fs-7 fw-semibold">직급</p>
	                    <div style="border: 1px solid black; width: 350px; height: 250px;">그래프 표시</div>
	                  </div>
	                </div>
                </div>
        
                <!--오늘예약건&미반납비품-->
                <div id="content3">
	                <div> <!--오늘예약건-->
	                  <p class="fs-7 fw-semibold">오늘 예약건 +</p>
	                  <div class="card" style="width: 600px; height: 250px;">
	                    <div class="card-body">
	                      <hr>
	                      홍길동(전자과) : 회의실 예약 <br>
	                      홍길동(전자과) : 회의실 예약 <br>
	                      홍길동(전자과) : 회의실 예약 <br>
	                      홍길동(전자과) : 회의실 예약 <br>
	                      홍길동(전자과) : 회의실 예약 <br>
	                    </div>
	                  </div>
	                </div>
	                <div> <!--미반납비품-->
	                  <p class="fs-7 fw-semibold">미반납비품</p>
	                  <table class="table border text-nowrap mb-0 align-middle">
	                    <thead class="text-dark fs-4" align="center">
	                      <tr>
	                        <th>
	                          <h6 class="fs-4 fw-semibold mb-0">비품명</h6>
	                        </th>
	                        <th>
	                          <h6 class="fs-4 fw-semibold mb-0">사용자</h6>
	                        </th>
	                        <th>
	                          <h6 class="fs-4 fw-semibold mb-0">예약시간</h6>
	                        </th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">xx과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4">홍길동/전자과</p>
	                        </td>
	                        <td>
	                          <p class="mb-0 fw-normal fs-4" align="center">YYYY/MM/DD</p>
	                        </td>
	                      </tr>
	                    </tbody>
	                  </table>
	                </div>
                </div>
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