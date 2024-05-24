<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 출퇴근이력</title>
<style>
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
  #searchName{
    width: 250px;
  }
  .text, .searchBtn {
    margin: 5px;
  }
  .filter *{
    /* display: inline; */
    /* flex-direction: row; */
    /* border: 0.5px solid skyblue; */
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
                      <li class="breadcrumb-item" aria-current="page">근태</li>
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

              <div class="filter" style="text-align: right;">
                <div class="searchDate">
                  <input type="checkbox" class="checkDate">
                  <span>조회기간설정</span>
                </div>
                <div class="dateToDate">
                  <div style="display: inline-block;">
                    탐색시작일
                    <input type="date" class="startDate">
                  </div>
                  <br>
                  <div style="display: inline-block;">
                    탐색종료일
                    <input type="date" class="endDate">
                  </div>
                </div>
              </div>

              <script>
              	// 조회기간 설정 숨기기
                $(document).ready(function(){ 
                  $(".dateToDate").hide();

                    $(".checkDate").change(function() {
                      if ($(this).is(":checked")) {
                        $(".dateToDate").show();
                      } else {
                        $(".dateToDate").hide();
                      }
                    });

                });
              </script>
							<input id="searchName" type="text" class="form-control searchName" placeholder="이름으로 검색">
              <br>
              <table class="table border text-nowrap mb-0 align-middle">
                <thead class="text-dark fs-3" align="center">
                  <tr>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">사번</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">이름</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">
                        <select class="form-select mb-n2 ajaxSelect selectMajor" style="width: 130px;">
                            <option selected value="0">전체학과</option>
	                          <c:forEach var="major" items="${majorList}">
	                          	<option value="${major.majorNo}">${major.majorName}</option>
	                          </c:forEach>
                        </select>
                      </h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">
                        <select class="form-select mb-n2 ajaxSelect selectJob" style="width: 130px;">
	                        <option selected value="0">전체직급</option>
	                        <c:forEach var="j" items="${jobList}">
	                        	<option value="${j.jobNo}">${j.jobName}</option>
	                        </c:forEach>
                        </select>
                      </h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">출근시간</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">퇴근시간</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">비고</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">날짜</h6>
                    </th>
                  </tr>
                </thead>
                <tbody align="center" class="tableBody">
                	<c:forEach var="a" items="${attendList}">
	                	<c:forEach var="member" items="${a.memberList}">
		                  <tr>
		                    <th>
		                      <h6 class="fs-2 mb-0">${a.memNo}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${member.memName}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${member.majorNo}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${member.jobNo}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${a.startTime}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${a.endTime}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${a.status}</h6>
		                    </th>
		                    <th>
		                      <h6 class="fs-2 mb-0">${a.registDate}</h6>
		                    </th>
		                  </tr>
	                  </c:forEach>
                  </c:forEach>
                </tbody>
              </table>
              <br><br>
              <div style="text-align: right;">
                <button type="button" class="btn btn-secondary" onclick="today(1);">오늘날짜</button>
              </div>
              <br><br><br>
              <!-- 페이징바 & 검색창-->
              <div id="search">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
		                <c:if test="${pi.listCount > pi.boardLimit}">
			                <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/memberAttend.do?page=${pi.currentPage-1}" aria-label="Previous">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-left fs-4"></i>
			                    </span>
			                  </a>
			                </li>
			                
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				                <li class="page-item">
				                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/memberAttend.do?page=${p}">
				                  	${p}
				                  </a>
				                </li>
			                </c:forEach>
			                
			                <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/memberAttend.do?page=${pi.currentPage+1}" aria-label="Next">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-right fs-4"></i>
			                    </span>
			                  </a>
			                </li>
		                </c:if>
                  </ul>
                </nav>
              </div>
              
              <script>
              
		            $(document).on("change", ".checkDate", function(){
	           	     // 체크박스의 체크 여부 확인
	           	     if(!$(this).is("checked")) {
           	         // 체크가 해제되면 startDate와 endDate 값을 지워줍니다.
           	         $(".startDate").val("");
           	         $(".endDate").val("");
	           	    }
		           	});
              
	            	// 드롭다운 필터로 직원조회 기능 함수호출
	            	$(document).on("change", ".ajaxSelect", function(){
            	    let startDate = $(".startDate").val();
            	    let endDate = $(".endDate").val();

            	    // startDate 또는 endDate가 없는 경우에만 함수 호출
            	    if (!startDate && !endDate) {
           	        attendMemberFilter(1);
            	    } else {
            	    	if(startDate && endDate){
	           	        // startDate와 endDate의 값이 모두 존재할 때만 비교
	           	        let startDateObj = new Date(startDate);
	           	        let endDateObj = new Date(endDate);
	
	           	        // startDate가 endDate보다 이전인 경우에만 함수 호출하지 않음
	           	        if (!(startDateObj > endDateObj)) {
	           	            attendMemberFilter(1);
	           	        }
            	    	}
            	    }
	            	});
	            	
	            	// 조회기간 설정으로 직원조회 기능 함수호출
	            	$(document).on("change", ".startDate, .endDate", function(){
            	    // 해당값 가져오기
            	    let startDate = $(".startDate").val();
            	    let endDate = $(".endDate").val();

            	    if(startDate && endDate){
            	    	
	            	    // 해당값 날짜로 변환
	            	    let startDateObj = new Date(startDate);
	            	    let endDateObj = new Date(endDate);
	
	            	    // startDate가 endDate보다 이후인 경우에만 함수 호출
           	        if (!(startDateObj > endDateObj)) {
           	            attendMemberFilter(1);
           	        }
            	    }
	            	});
	            	
	           		// 검색창 키업으로 직원조회 기능 함수호출
	            	$(document).on("keyup", ".searchName", function(){
            	    let startDate = $(".startDate").val();
            	    let endDate = $(".endDate").val();

            	    // startDate 또는 endDate가 없는 경우에만 함수 호출
            	    if (!startDate && !endDate) {
           	        attendMemberFilter(1);
            	    } else {
            	    	if(startDate && endDate){
	           	        // startDate와 endDate의 값이 모두 존재할 때만 비교
	           	        let startDateObj = new Date(startDate);
	           	        let endDateObj = new Date(endDate);
	
	           	        // startDate가 endDate보다 이전인 경우에만 함수 호출하지 않음
	           	        if (!(startDateObj > endDateObj)) {
	           	            attendMemberFilter(1);
	           	        }            	    		
            	    	}
            	    }
	            	});
	           		
	           		// 필터 함수
	           		function attendMemberFilter(page){
	           			let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
	           			
	           			let majorNo = $(".selectMajor option:selected").val();
              		let jobNo = $(".selectJob option:selected").val();
              		let memName = $(".searchName").val();
              		let startDate = $(".startDate").val();
            	    let endDate = $(".endDate").val();
            	    
            	    $.ajax({
            	    	url:"${contextPath}/admin/filterMemberAttend.do",
            	    	type:"get",
            	    	data:"majorNo=" + majorNo + "&jobNo=" + jobNo + "&memName=" + memName + "&page=" + page + "&startDate=" + startDate + "&endDate=" + endDate,
            	    	success:function(map){
            	    		
              				$(".tableBody").empty();
              				$(".pagination").empty();              				
              				let filterTable = "";
              				let filterPage = "";
              				
              				for(let i=0; i<map.attendList.length; i++){
              					for(let j=0; j<map.attendList[i].memberList.length; j++){
              						filterTable +=	"<tr>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memNo + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].memName + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].majorNo + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].jobNo + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].startTime + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].endTime + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].status + "</h6>"
              												+			"</th>"
              												+			"<th>"
              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].registDate + "</h6>"
              												+			"</th>"
              												+		"</tr>";
              					}
              				}
              				$(".tableBody").append(filterTable);
              				
              				// 페이징 처리
											if(map.pi.listCount > map.pi.boardLimit){
												filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																		+		"<a class='page-link link' onclick='attendMemberFilter(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																		+			"<span aria-hidden='true'>"
																		+				"<i class='ti ti-chevrons-left fs-4'></i>"
																		+			"</span>"
																		+		"</a>"
																		+	"</li>";
												
												for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
													filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
								                      +   "<a class='page-link link' onclick='attendMemberFilter(" + p + ");' >"
								                      +    	p
								                      +   "</a>"
								                      + "</li>";
												}
												
												filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
								                   +    "<a class='page-link link' onclick='attendMemberFilter(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
								                   +       "<span aria-hidden='true'>"
								                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
								                   +        "</span>"
								                   +    "</a>"
								                   + 	"</li>";
								        $(".pagination").append(filterPage);
											}
            	    	},
            	    	error:function(){
            	    		
            	    	}
            	    })
              		
	           		}
	           		
	           		function today(page){
	           			$.ajax({
	           				url:"${contextPath}/admin/todayMemberAttend.do",
	           				type:"get",
	           				data:"page=" + page,
	           				success:function(map){
	           					
	              				$(".tableBody").empty();
	              				$(".pagination").empty();              				
	              				let filterTable = "";
	              				let filterPage = "";
	              				
	              				for(let i=0; i<map.attendList.length; i++){
	              					for(let j=0; j<map.attendList[i].memberList.length; j++){
	              						filterTable +=	"<tr>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memNo + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].memName + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].majorNo + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].memberList[j].jobNo + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].startTime + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].endTime + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].status + "</h6>"
	              												+			"</th>"
	              												+			"<th>"
	              												+				"<h6 class='fs-2 mb-0'>" + map.attendList[i].registDate + "</h6>"
	              												+			"</th>"
	              												+		"</tr>";
	              					}
	              				}
	              				$(".tableBody").append(filterTable);
	              				
	              				// 페이징 처리
												if(map.pi.listCount > map.pi.boardLimit){
													filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																			+		"<a class='page-link link' onclick='today(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																			+			"<span aria-hidden='true'>"
																			+				"<i class='ti ti-chevrons-left fs-4'></i>"
																			+			"</span>"
																			+		"</a>"
																			+	"</li>";
													
													for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
														filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
									                      +   "<a class='page-link link' onclick='today(" + p + ");' >"
									                      +    	p
									                      +   "</a>"
									                      + "</li>";
													}
													
													filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
									                   +    "<a class='page-link link' onclick='today(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
									                   +       "<span aria-hidden='true'>"
									                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
									                   +        "</span>"
									                   +    "</a>"
									                   + 	"</li>";
									        $(".pagination").append(filterPage);
												}
	           				},
	           				error:function(){
	           					
	           				}
	           			})
	           		}
	           		
              </script>

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