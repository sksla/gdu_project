<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 목록</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/memberSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">휴가정보</h4>
                  <nav aria-label="breadcrumb" style="--bs-breadcrumb-divider: '>'">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">마이페이지</li>
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
                <div class="table-responsive mb-4">
                    <table class="table table-borderless text-center align-middle mb-0">
                        <tbody >
							              
				              			 <c:set var="totalVac" value="${ (loginUser.leaveCount  + plusVacCount) - usedPlusCount }" scope="session" /> <!-- 총 잔여연차 -->
                            <tr class="bg-light">
                                <td class="bg-transparent">지급연차<br>${ loginUser.leaveCount }일</td>
                                <td class="bg-transparent">보상연차<br>${ plusVacCount - usedPlusCount }일</td>
                                <td class="bg-transparent">잔여연차<br>${ totalVac } 일</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mb-4">
                  <div class="d-flex justify-content-between">
                    
                    <form class="d-flex flex-row" style="height: 38.33px;">
                      <label for="" class="form-label fw-semibold col-form-label fs-3">신청일 :</label>&nbsp;&nbsp;
                      <span class="form-group">
                        <input type="date" class="form-control" value="2024-05-01" id="searchStartDate">
                      </span>
                      &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                      <span class="form-group">
                        <input type="date" class="form-control" value="2024-05-09" id="searchEndDate">
                      </span>
                      <button type="button" class="btn btn-info searchBtn">검색</button>
                    </form>
                    <a type="button" class="btn btn-info" href="${contextPath}/member/vacationForm.page">휴가신청</a> 
                  </div>
                </div>
                <div class="table-responsive mb-4">
                  <table class="vacTable table border text-nowrap mb-0 align-middle text-center app_doc_table overflow-hidden">
                    <thead class="text-dark fs-4 align-middle ">
                        <tr>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가번호</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가구분</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">휴가일수</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">신청일</h6>
                          </th>
                          <th width="200px">
                            <div class="btn-group">
                              <button class="btn dropdown-toggle " type="button" id="dropdownMenuButton"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                상태 : 전체
                              </button>
                              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item"  data-status="1">대기</a></li>
                                <li><a class="dropdown-item"  data-status="2">승인</a></li>
                                <li><a class="dropdown-item"  data-status="3">반려</a></li>
                              </ul>
                            </div>
                          </th>
                          
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    	<c:choose>
                			<c:when test="${ empty list }">
                				<tr>
                					<td colspan="7">조회된 리스트가 없습니다.</td>
                				</tr>
                			</c:when>
				              <c:otherwise>
				                	<c:forEach var="v" items="${list}">
										        <tr onclick="showModal();">
										            <td><p class="mb-0 fw-normal fs-4">${v.vacNo}</p></td>
										            <td><p class="mb-0 fw-normal fs-4">${v.vacOption}</p></td>
										            <td><p class="mb-0 fw-normal fs-4">${v.vacUsed}일</p></td>
										            <td><p class="mb-0 fw-normal fs-4">${v.registDate}</p></td>
										            <td>
										            <c:choose>
										            	<c:when test="${v.status eq 1}">
                            					<span class="badge rounded-pill bg-success-subtle text-success fw-semibold fs-2">대기</span>
										            	</c:when>
										            	<c:when test="${v.status eq 2}">
						                          <span class="badge rounded-pill bg-primary-subtle text-primary fw-semibold fs-2">승인</span>
										            	</c:when>
										            	<c:when test="${v.status eq 3}">
						                          <span class="badge rounded-pill bg-danger-subtle text-danger fw-semibold fs-2">반려</span>
										            	</c:when>
										            	<c:otherwise>
							                        
										            	</c:otherwise>
										            </c:choose>
										            <td>
										        </tr>
                				</c:forEach>
                			</c:otherwise>
                		</c:choose>
                    </tbody>
                  </table>
                </div>
                
                
               <!--  
              <c:if test="${ not empty setStatus }">
              <script>
              $(document).ready(function(){
	              $("#pagingArea a").on("click", function(){
	            	    // 페이징 바 클릭시 기존 setStatus 값 유지
	            	    const setStatus = "${setStatus}";
	            	    
	
	            	    let newUrl = "${contextPath}/member/vacationListSet.do?pape=";
	            	    let currentPage = ${pi.currentPage};
	            	    
	            	    if($(this).hasClass("leftbt")){
	            	        currentPage--;
	            	    } else if($(this).hasClass("rightbt")){
	            	        currentPage++;
	            	    } else {
	            	        currentPage = $(this).text();
	            	    }
	            	    
	            	    // 새로운 URL 생성
	            	    newUrl +=    currentPage + "&setStatus=" + setStatus ;
	
	            	    // 새로운 URL로 이동
	            	    location.href = newUrl;
	
	            	    return false;
	            	});
              })
              </script>
              </c:if>
              -->
  
              <!-- 페이징바 -->
              <div id="pagingArea">
              <ul class="pagination justify-content-center">
                <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
                  <a class="page-link link leftbt " href="${ contextPath }/member/vacationList.do?page=${pi.currentPage-1}" aria-label="Previous">
                    <span aria-hidden="true">
                      <i class="ti ti-chevrons-left fs-4"></i>
                    </span>
                  </a>
                </li>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">	
	                <li class="page-item ">
	                  <a class="page-link link ${ pi.currentPage == p ? 'active' : '' }" href="${ contextPath }/member/vacationList.do?page=${p}">${ p }</a>
	                </li>
                </c:forEach>
                
                <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
                  <a class="page-link link rightbt" href="${ contextPath }/member/vacationList.do?page=${pi.currentPage + 1}" aria-label="Next">
                    <span aria-hidden="true">
                      <i class="ti ti-chevrons-right fs-4"></i>
                    </span>
                  </a>
                </li>
              </ul>
              </div>
              <!-- 페이징바 끝 -->
  
              </div>
          </div>

          <script>
						var selectedStatus = "";
						var searchStartDate = "";
						var searchEndDate = "";
						
						$(document).ready(function(){
							
							searchVacationList(1);
							
							 // 드롭다운 항목 클릭 이벤트 핸들러
				        $(".dropdown-item").click(function() {
				            selectedStatus = $(this).data("status");
				            console.log(selectedStatus);
				            // 선택한 값으로 버튼 텍스트 변경
				            $("#dropdownMenuButton").text("상태 : " + getStatusText(selectedStatus));
				            
				            // 선택 시 바로 searchAttendList 함수 실행
				            searchVacationList(1); // 페이지 번호는 예시로 1로 설정
				        });
							 
							 
							 // 검색버튼 클릭시 함수
							 $(".searchBtn").click(function(){
								 
								searchStartDate = $("#searchStartDate").val();
							  searchEndDate = $("#searchEndDate").val();
									 
									// 받아온 값으로 인풋에 밸류 설정
									 $("#searchStartDate").val(searchStartDate);
									 $("#searchEndDate").val(searchEndDate);
									
									 searchVacationList(1); 
									 
							 });
							
				        
							
							
							
						}) // 레디function
						
						// 구분 변환용
						function getStatusText(statusCode) {
						    switch (statusCode) {
						        case 1:
						            return "대기";
						        case 2:
						            return "승인";
						        case 3:
						            return "반려";
						        default:
						            return "알 수 없음";
						    }
						}
						
						
						
						// 목록 조회용
						function searchVacationList(requestPage){
							 
							 console.log("searchStartDate: " + searchStartDate);
							 console.log("searchEndDate: " + searchEndDate);
							 console.log("keyword: " + selectedStatus);
							
							
							$.ajax({
								url:"${contextPath}/member/vacationList.do",
								type:"get",
								async:false,
								data:{
									page:requestPage,
									searchStartDate:searchStartDate,
									searchEndDate:searchEndDate,
									keyword: selectedStatus
								},
								success:function(rep){
												console.log(rep);

			          				drawVacationList(rep.list);
			          				drawPaging(rep.pi);
									
									
								},error:function(){
									console.log("목록조회 ajax 실패");
								}
							
							
							})
						}
						
						
						// 휴가 목록 출력
						function drawVacationList(list){
	          		
							// 데이터를 반복하여 HTML 코드 생성
							var html = "";
							if(list.length > 0){
								
							
								for (var i = 0; i < list.length; i++) {
								    var v = list[i];
								    
								    let date = new Date(v.registDate);
								    let formattedDate = date.toLocaleDateString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' }).replace(/\./g, '-');
								    
								    formattedDate = formattedDate.replace(/-$/, ''); 
								    
								    // 상태에 따른 클래스와 텍스트 설정
								    var statusClass = "";
								    var statusText = "";
								    switch (v.status) {
								        case "1":
								            statusClass = "bg-success-subtle text-success";
								            statusText = "대기";
								            break;
								        case "2":
								            statusClass = "bg-primary-subtle text-primary";
								            statusText = "승인";
								            break;
								        case "3":
								            statusClass = "bg-danger-subtle text-danger";
								            statusText = "반려";
								            break;
								        default:
								            statusClass = "bg-secondary-subtle text-secondary";
								            statusText = "Unknown";
								            break;
								    }
	
								    html += "<tr onclick='showModal();'>";
								    html += "<td><p class='mb-0 fw-normal fs-4'>" + v.vacNo + "</p></td>";
								    html += "<td><p class='mb-0 fw-normal fs-4'>" + v.vacOption + "</p></td>";
								    html += "<td><p class='mb-0 fw-normal fs-4'>" + v.vacUsed + "일</p></td>";
								    html += "<td><p class='mb-0 fw-normal fs-4'>" + formattedDate + "</p></td>";
								    html += "<td><span class='badge rounded-pill " + statusClass + " fw-semibold fs-2'>" + statusText + "</span></td>";
								    html += "</tr>";
								}
								
								
							}else{
          						html += "<tr><td colspan='5'>조회된 휴가 내역이 없습니다.</td></tr>";
          		}

							// 생성된 HTML을 tbody에 추가
							$(".vacTable tbody").html(html);
						
						}
						
						// 페이징바 화면 출력용 함수
			          	function drawPaging(pi){
			          		
			          		let paging = "";
			          	if(pi.listCount > pi.boardLimit){	
			          		if(pi.currentPage == 1){
			          			paging += "<li class='page-item disabled'>"
			          			        +		"<a class='page-link link' href='#' aria-label='Previous'>"
			          			        +			"<span aria-hidden='true'>"
			          			        +				"<i class='ti ti-chevrons-left fs-4'></i>"
			          			        +			"</span>"
			         			        	+		"</a>"
			          			        +	"</li>";
			          			        
			          		}else{
			          			paging += "<li class='page-item'>"
					      			        +		"<a class='page-link link' href='#' onclick='searchVacationList(" + (pi.currentPage - 1) + ");' aria-label='Previous'>"
					      			        +			"<span aria-hidden='true'>"
					      			        +				"<i class='ti ti-chevrons-left fs-4'></i>"
					      			        +			"</span>"
					     			        	+		"</a>"
					      			        +	"</li>";
			          		}
			          		
			          		for(let p=pi.startPage; p<=pi.endPage; p++){
			          			if(p == pi.currentPage){
			          				paging += "<li class='page-item'><a class='page-link link active' onclick='searchVacationList(" + p + ");' href='#'>" + p + "</a></li>";
			          			}else{
			          				paging += "<li class='page-item'><a class='page-link link' onclick='searchVacationList(" + p + ");' href='#'>" + p + "</a></li>";
			          			}
			          		}
			          		
			             
			          		if(pi.currentPage == pi.maxPage){
			          			paging += "<li class='page-item disabled'>"
					      			        +		"<a class='page-link link' href='#' aria-label='Next'>"
					      			        +			"<span aria-hidden='true'>"
					      			        +				"<i class='ti ti-chevrons-right fs-4'></i>"
					      			        +			"</span>"
					     			        	+		"</a>"
					      			        +	"</li>";
			          		}else{
			          			paging += "<li class='page-item'>"
					      			        +		"<a class='page-link link' href='#' onclick='searchVacationList(" + (pi.currentPage + 1) + ");' aria-label='Next'>"
					      			        +			"<span aria-hidden='true'>"
					      			        +				"<i class='ti ti-chevrons-right fs-4'></i>"
					      			        +			"</span>"
					     			        	+		"</a>"
					      			        +	"</li>";
			          		}
			          		
			          	}	
			          		$(".pagination").html(paging);
			              
			          	
			         }
								
						
						
						
						</script>

          

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