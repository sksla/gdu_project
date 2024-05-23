<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 연차관리</title>
<style>
  #searchForm {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
  }
  /* 페이징바를 한가운데로 */
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
  .memberLeave{
    display: flex;
  }
  .one, .two{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
  }
  .split, .one{
    color: rgb(185, 181, 181);
  }
  .tableBody tr{cursor: pointer;}
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
                      <li class="breadcrumb-item" aria-current="page">직원 연차관리</li>
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
                <h2 class="one" onclick="firstPage();">직원 연차 신청현황</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="secondPage();">직원 연차관리</h2>
              </div>
              <br><br>

              <script>
              	function firstPage(){
              		location.href = "${contextPath}/admin/requestMemberLeave.page";
              	}
              	
              	function secondPage(){
              		location.href = "${contextPath}/admin/memberLeaveList.page";
              	}
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
                      <h6 class="fs-3 fw-semibold mb-0">입사일</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">연락처</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">사용연차</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">잔여연차</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">종류</h6>
                    </th>
                  </tr>
                </thead>
                <tbody align="center" class="tableBody">
                	<c:choose>
                		<c:when test="${empty vacList}">
	              			<tr>
	              				<th colspan="9">
	              					<h6 class="fs-2 mb-0">직원들의 휴가사용 이력이 없습니다.</h6>
	              				</th>
	              			</tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="v" items="${vacList}">
                				<c:forEach var="member" items="${v.memberList}">
				                  <tr class="leaveReason" onclick="memberLeaveDetail(${v.memNo});">
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
				                      <h6 class="fs-2 mb-0">${member.hireDate}</h6>
				                    </th>
				                    <th>
				                      <h6 class="fs-2 mb-0">${member.phone}</h6>
				                    </th>
				                    <th>
				                      <h6 class="fs-2 mb-0">${v.vacUsed}일</h6>
				                    </th>
				                    <th>
				                      <h6 class="fs-2 mb-0">${member.leaveCount}일</h6>
				                    </th>
				                    <th>
				                      <h6 class="fs-2 mb-0">${v.vacType}</h6>
				                    </th>
				                  </tr>
			                  </c:forEach>
		                  </c:forEach>
	                  </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
              <br><br><br>
              <!-- 페이징바 & 검색창-->
              <div id="search">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
		                <c:if test="${pi.listCount > pi.boardLimit}">
			                <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/memberLeaveList.page?page=${pi.currentPage-1}" aria-label="Previous">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-left fs-4"></i>
			                    </span>
			                  </a>
			                </li>
			                
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				                <li class="page-item">
				                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/memberLeaveList.page?page=${p}">
				                  	${p}
				                  </a>
				                </li>
			                </c:forEach>
			                
			                <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/memberLeaveList.page?page=${pi.currentPage+1}" aria-label="Next">
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
              
              	// 직원 클릭시 직원연차 상세페이지로 이동
              	function memberLeaveDetail(memNo){
              		location.href = "${contextPath}/admin/memberLeaveDetail.page?memNo=" + memNo;
              	}
              
              	// 드롭다운 필터로 직원조회 기능 함수호출
              	$(document).on("change", ".ajaxSelect", function(){
              		leaveMemberFilter(1);
              	});
             		// 검색창 키업으로 직원조회 기능 함수호출
              	$(document).on("keyup", ".searchName", function(){
              		leaveMemberFilter(1);
              	});
              	
             		// 드롭다운 필터 및 검색창 키업시 ajax 실행 함수
              	function leaveMemberFilter(page){
              		let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
              		
              		let majorNo = $(".selectMajor option:selected").val();
              		let jobNo = $(".selectJob option:selected").val();
              		let memName = $(".searchName").val();
              		
              		console.log("검색창에 입력은? ", memName);

              		$.ajax({
              			url:"${contextPath}/admin/filterMemberLeaveList.do",
              			type:"get",
              			data:"majorNo=" + majorNo + "&jobNo=" + jobNo + "&memName=" + memName + "&page=" + page,
              			success:function(map){
              				
              				$(".tableBody").empty();
              				$(".pagination").empty();              				
              				let filterTable = "";
              				let filterPage = "";
              				
              				if(map.vacList.length == 0){
              					filterTable +=	"<tr>"
              											+			"<th colspan='9'>"
              											+				"<h6 class='fs-2 mb-0'>직원들의 휴가사용 이력이 없습니다.</h6>"
              											+			"</th>"
              											+		"</tr>";
              				}else{
              					for(let i=0; i<map.vacList.length; i++){
              						for(let j=0; j<map.vacList[i].memberList.length; j++){
              							filterTable +=	"<tr class='leaveReason' onclick='memberLeaveDetail(" + map.vacList[i].memNo + ")'>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memNo + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].memName + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].majorNo + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].jobNo + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].hireDate + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].phone + "</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].vacUsed + "일</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].leaveCount + "일</h6>"
              													+			"</th>"
              													+			"<th>"
              													+				"<h6 class='fs-2 mb-0'>" + map.vacList[i].vacType + "</h6>"
              													+			"</th>";

              						}
              					}
              				}
              				$(".tableBody").append(filterTable);
              				
              				// 페이징 처리
											if(map.pi.listCount > map.pi.boardLimit){
												filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																		+		"<a class='page-link link' onclick='leaveMemberFilter(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																		+			"<span aria-hidden='true'>"
																		+				"<i class='ti ti-chevrons-left fs-4'></i>"
																		+			"</span>"
																		+		"</a>"
																		+	"</li>";
												
												for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
													filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
								                      +   "<a class='page-link link' onclick='leaveMemberFilter(" + p + ");' >"
								                      +    	p
								                      +   "</a>"
								                      + "</li>";
												}
												
												filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
								                   +    "<a class='page-link link' onclick='leaveMemberFilter(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
								                   +       "<span aria-hidden='true'>"
								                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
								                   +        "</span>"
								                   +    "</a>"
								                   + 	"</li>";
								        $(".pagination").append(filterPage);
				
											}
              				
              			},
              			error:function(){
              				console.log("직원연차현황 필터 ajax통신실패");
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