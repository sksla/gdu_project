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
                          <select class="form-select mb-n2 ajaxSelect selectMajor" style="width: 130px;">
                              <option value="0" selected>전체학과</option>
                              <c:forEach var="major" items="${majorList}">
                              	<option value="${major.majorNo}">${major.majorName}</option>
                          		</c:forEach>
                          </select>
                        </h6>
                      </th>
                      <th>
                        <h6 class="fs-3 fw-semibold mb-0">
                          <select class="form-select mb-n2 ajaxSelect selectJob" style="width: 130px;">
                            <option value="0" selected>전체직급</option>
                            <c:forEach var="j" items="${jobList}">
                            	<option value="${j.jobNo}">${j.jobName}</option>
                            </c:forEach>
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
                  <tbody align="center" class="tableBody">
                  	<c:choose>
                  		<c:when test="${empty vacList}">
                  			<tr class="leaveReason">
		                      <th colspan="9">
		                        <h6 class="fs-2 mb-0">직원이 없습니다.</h6>
		                      </th>
                  			</tr>
                  		</c:when>
                  		<c:otherwise>
		                  	<c:forEach var="v" items="${vacList}">
		                  		<c:forEach var="member" items="${v.memberList}">
				                    <tr class="leaveReason">
				                      <th>
				                        <h6 class="fs-2 mb-0">
				                          <input type="checkbox" value="${v.vacNo}" class="selectMember">
				                        </h6>
				                      </th>
				                      <th>
				                        <h6 class="fs-2 mb-0">${v.memNo}</h6>
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
				                        <h6 class="fs-2 mb-0">${v.startDate}</h6>
				                      </th>
				                      <th>
				                        <h6 class="fs-2 mb-0">${v.endDate}</h6>
				                      </th>
				                      <th>
				                        <h6 class="fs-2 mb-0">${v.vacUsed}일 사용</h6>
				                      </th>
				                      <th>
				                        <h6 class="fs-2 mb-0">${v.status}</h6>
				                      </th>
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
	                    </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
                <br><br>
                <div style="text-align: right;">
                  <button type="submit" class="btn btn-secondary">승인</button>
                  <button type="submit" class="btn btn-secondary">거절</button>
                </div>
              </form>

							
							
							<script>
								// ajax로 학과 및 직급 필터링 메소드 호출
								$(document).on("change", ".ajaxSelect", function(){
									memberFilter(1);
								})
								
								// ajax로 학과 및 직급 필터링 메소드
								function memberFilter(page){
									let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
									let majorNo = $(".selectMajor option:selected").val();
									let jobNo = $(".selectJob option:selected").val();
									
									$.ajax({
										url:"${contextPath}/admin/filterRequestMemberLeaveList.do",
										type:"get",
										data:"majorNo=" + majorNo + "&jobNo=" + jobNo + "&page=" + page,
										success:function(map){
											$(".tableBody").empty();
											$(".pagination").empty();
											
											let filterTable = "";
											if(map.vacList.length == 0){
												filterTable +=  "<tr class='leaveReason'>"
							                      +			"<th colspan='9'>"
							                      +				"<h6 class='fs-2 mb-0'>직원이 없습니다.</h6>"
							                      +			"</th>"
					                  			  +		"</tr>";
											}else{
												for(let i=0; i<map.vacList.length; i++){
													filterTable +=	"<tr class='leaveReason'>"
								                       +		"<th>"
								                       +			"<h6 class='fs-2 mb-0'>"
								                       +				"<input type='checkbox' class='selectMember' value='" + map.vacList[i].vacNo + "'>"
								                       +			"</h6>"
								                       +		"</th>"
								                       +		"<th>"
								                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].memNo + "</h6>"
								                       +		"</th>"
								                       +		"<th>"
								                       +			"<h6 class='fs-2 mb-0'>" + map.vacList.memName + "</h6>"${member.memName}
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${member.majorNo}</h6>
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${member.jobNo}</h6>
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${v.startDate}</h6>
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${v.endDate}</h6>
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${v.vacUsed}일 사용</h6>
								                      </th>
								                      <th>
								                        <h6 class="fs-2 mb-0">${v.status}</h6>
								                      </th>
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
												}
											}
											
										},
										error:function(){
											console.log("휴가신청인원 학과 및 직급조회 ajax 통신 실패");
										}
									})
									
								}
								
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
                  	<c:if test="${pi.listCount > pi.boardLimit}">
	                    <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
	                      <a class="page-link link" href="${contextPath}/admin/requestMemberLeave.page?page=${pi.currentPage-1}" aria-label="Previous">
	                        <span aria-hidden="true">
	                          <i class="ti ti-chevrons-left fs-4"></i>
	                        </span>
	                      </a>
	                    </li>
	                    
	                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		                    <li class="page-item">
		                      <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/requestMemberLeave.page?page=${p}">
		                      	${p}
		                      </a>
		                    </li>
	                    </c:forEach>
	                    
	                    <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
	                      <a class="page-link link" href="${contextPath}/admin/requestMemberLeave.page?page=${pi.currentPage+1}" aria-label="Next">
	                        <span aria-hidden="true">
	                          <i class="ti ti-chevrons-right fs-4"></i>
	                        </span>
	                      </a>
	                    </li>
                    </c:if>
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