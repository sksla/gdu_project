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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	// js 파일을 로드하고 jsp 전역에 FullCalendar namespace 설정
	document.addEventListener('DOMContentLoaded', function(){
		const calendarEl = document.getElementById('calendar')
		const calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
     	},
     	nowIndicator: true, // 현재 시간 마크
			locale:'ko',
	    buttonText:{ //버튼 텍스트 변환
        today:'오 늘',
        day:'일간',
        week:'주간',
        month:'월간',
      },
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
  #content3{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 1100px;
  }
  .leaveReasonContent {
    display: none;
    position: absolute;
  }
  .leaveReasonContent *{
    border-bottom: none;
    margin-bottom: 0px;
  }
  .todayReserve, .noReturn{
    flex: 1; /* 화면 너비에 맞춰 균등 배분 */
    margin: 0 10px; /* 좌우 여백 추가 */
  }
  /* 캘린더 스타일*/
  .fc-icon{
  	width:40px;
  }
	#calendar *{
    padding: 0px;
	}
	/* 그래프 스타일 */
	#content2{
		width: 1100px;
    display: flex;
    align-items: center;
    justify-content: space-between;
	}
  canvas {
    width: 100% !important; /* 캔버스 너비를 부모 요소의 너비에 맞춤 */
    height: 100% !important; /* 캔버스 높이를 부모 요소의 높이에 맞춤 */
  }
  .chart1 {
    height: 300px; /* 모든 그래프 컨테이너의 높이를 동일하게 설정 */
  }
  #college {
    flex: 1; /* 화면 너비에 맞춰 균등 배분 */
    margin: 0 10px; /* 좌우 여백 추가 */
  }
  #major {
    flex: 2; /* 비율을 맞추기 위해 더 넓게 */
    margin: 0 10px; /* 좌우 여백 추가 */
  }
  #job {
    flex: 1; /* 화면 너비에 맞춰 균등 배분 */
    margin: 0 10px; /* 좌우 여백 추가 */
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
          
          <!-- 페이지 내용 -->
          <div class="card">
            <div class="card-body">
            

              <div id="section">
                <!--학사일정&신청받은연차&강의학생등록기간-->
                <div id="content1">
	                <!--이달의 학사일정-->
	                <div id="majorSchedule">
	                  <div>
	                    <p class="fs-7 fw-semibold">학사일정 +</p>
	                    <div style="border: 1px solid black; width: 650px; height: 600px;" class="calendar-sidebar app-calendar">
												<div id="calendar">
												
												</div>
	                    </div>
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
	                        	<c:forEach var="v" items="${vacList}">
	                        		<c:forEach var="major" items="${v.majorList}">
	                        			<c:forEach var="member" items="${v.memberList}">
				                          <tr class="leaveReason">
				                            <td>
				                              <p class="mb-0 fw-normal fs-4">${major.majorName}</p>
				                            </td>
				                            <td>
				                              <p class="mb-0 fw-normal fs-4">${member.memName}</p>
				                            </td>
				                            <td>
				                              <p class="mb-0 fw-normal fs-4">${v.startDate}~${v.endDate}</p>
				                            </td>
				                            <td>
				                              <p class="mb-0 fw-normal fs-4" align="center">${v.status}</p>
				                            </td>
				                          </tr>
				                          <tr class="leaveReasonContent">
				                            <td colspan="4">
				                              <div class="card" style="width: 400px; height: 250px;">
				                                <div class="card-body">
				                                  <p class="fs-5 fw-semibold">연차사유(${v.vacType})</p>
				                                  <hr>
				                                  <p>${v.vacReason}</p>
				                                </div>
				                              </div>
				                            </td>
				                          </tr>
			                          </c:forEach>
		                          </c:forEach>
	                          </c:forEach>
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
	                  </div>
	                </div>
                </div>
        
                <!--단과학과직급-->
                <div id="content2">
	                <div id="college"><!--단과-->
	                  <div>
	                    <p class="fs-7 fw-semibold">단과</p>
	                    <div class="chart1">
	                    	<canvas id="collegeChart"></canvas>
	                    </div>
	                  </div>
	                </div>
	                <div id="major"><!--학과-->
	                  <div>
	                    <p class="fs-7 fw-semibold">학과</p>
	                    <div class="chart1">
	                    	<canvas id="majorChart"></canvas>
	                    </div>
	                  </div>
	                </div>
	                <div id="job"><!--직급-->
	                  <div>
	                    <p class="fs-7 fw-semibold">직급</p>
	                    <div class="chart1">
	                    	<canvas id="jobChart"></canvas>
	                    </div>
	                  </div>
	                </div>
                </div>
                
								<script>
									
									// 차트 그래프
									$(document).ready(function(){
										
										$.ajax({
											url:"${contextPath}/admin/adminChart.do",
											type:"get",
											success:function(chartList){
												console.log(chartList);
												
												// 단과그래프------------------------------------------
											  let ctx1 = document.getElementById('collegeChart');
											  let collegeName = []; // 학과명들을 담을 배열
											  let collegeLength = []; // 학과별 직원수를 담을 배열
						            
						            for(let i=0; i<chartList.colList.length; i++){ // 단과 갯수만큼 접근
						            	let collegeCount = 0; // 0으로 시작
						            	let colName = chartList.colList[i].colName; // 단과명 추출
						            	for(let j=0; j<chartList.majorList.length; j++){ // 학과 갯수만큼 접근
						            		if(chartList.majorList[j].colNo == chartList.colList[i].colNo){ // 학과번호와 단과번호 대조
						            			let maName = chartList.majorList[j].majorName; // 학과이름 추출
						            			for(let k=0; k<chartList.memList.length; k++){
						            				if(chartList.memList[k].majorNo == maName){ // 직원의학과명과 추출한 학과명 비교 후 collegeCount 증가
						            					collegeCount++;
						            				}
						            			}
						            		}
						            	}
						            	collegeName.push(colName);
						            	collegeLength.push(collegeCount);
						            }

						            console.log(collegeLength);
						            
											  new Chart(ctx1, {
											    type: 'bar',
											    data: {
											      labels: collegeName,
											      datasets: [{
											        label: '직원수',
											        data: collegeLength,
											        borderWidth: 1, // 가장자리 크기
											        barThickness: 20
											      }]
											    },
											    options: {
										        maintainAspectRatio: false,
										        height: 300,
											      scales: {
											        y: {
											          beginAtZero: true
											        }
											      }
											    }
											  });								  						  
												// 학과그래프------------------------------------------
											   
												let ctx2 = document.getElementById('majorChart');
												let majorName = []; // 학과명들을 담을 배열
												let majorLength = []; // 학과별 직원수를 담을 배열

						            for(let i=0; i<chartList.majorList.length; i++){
						            	let majorCount = 0; // 0부터 시작
						            	let majorNames = chartList.majorList[i].majorName; // 학과이름 추출
						            	for(let j=0; j<chartList.memList.length; j++){
						            		if(chartList.memList[j].majorNo == majorNames){ // 직원소속학과와 추출한 학과명 대조
						            			majorCount++; // 
						            		}
						            	}
						            	majorName.push(majorNames);
						            	majorLength.push(majorCount);
						            }
						            
						            console.log(majorName);
						            console.log(majorLength);
						            
											  new Chart(ctx2, {
											    type: 'bar',
											    data: {
											      labels: majorName,
											      datasets: [{
											        label: '직원수',
											        data: majorLength,
											        borderWidth: 1, // 가장자리 크기
											        barThickness: 20
											      }]
											    },
											    options: {
										        maintainAspectRatio: false,
										        height: 300,
											      scales: {
											        y: {
											          beginAtZero: true
											        }
											      }
											    }
											  });	
											  
											  // 직급그래프------------------------------------------
											  let ctx3 = document.getElementById('jobChart');
											  let jobName = []; // 학과명들을 담을 배열
											  let jobLength = []; // 학과별 직원수를 담을 배열                 

											  for(let i=0; i<chartList.jobList.length; i++){
												  let jobCount = 0; // 0부터 시작
												  let jobTitle = chartList.jobList[i].jobName; // 직급명 추출
												  for(let j=0; j<chartList.memList.length; j++){
													  if(chartList.memList[j].jobNo == jobTitle){ // 직원직급명과 추출한 직급명 대조
														  jobCount++;
													  }
												  }
												  jobName.push(jobTitle);
												  jobLength.push(jobCount);
											  }
											  
											  new Chart(ctx3, {
											    type: 'bar',
											    data: {
											      labels: jobName,
											      datasets: [{
											        label: '직원수',
											        data: jobLength,
											        borderWidth: 1, // 가장자리 크기
											        barThickness: 20
											      }]
											    },
											    options: {
										        maintainAspectRatio: false,
										        height: 300,
											      scales: {
											        y: {
											          beginAtZero: true
											        }
											      }
											    }
											  });								   
											  
											  
												// success function 종료
											},
											error:function(){
												console.log("관리자 대시보드 그래프를 위한 ajax통신 실패");
											}
										})
										
									})	
								</script>
        
                <!--오늘예약건&미반납비품-->
                <div id="content3">
	                <div class="todayReserve"> <!--오늘예약건-->
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
	                <div class="noReturn"> <!--미반납비품-->
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