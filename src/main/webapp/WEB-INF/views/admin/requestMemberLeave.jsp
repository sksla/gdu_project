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
  .modalText{
    color: black;
    font-size: 18px;
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
                  <h4 class="fw-semibold mb-8">신청받은연차</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">근무</li>
                      <li class="breadcrumb-item" aria-current="page">연차</li>
                      <li class="breadcrumb-item" aria-current="page">신청받은연차</li>
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
                <h2 class="one" onclick="firstPage();">신청받은 연차</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="secondPage();">연차 사용내역</h2>
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
                        <select class="form-select mb-n2 ajaxSelect selectMajor" style="width: 130px; border: 0;">
                            <option value="0" selected>전체학과</option>
                            <c:forEach var="major" items="${majorList}">
                            	<option value="${major.majorNo}">${major.majorName}</option>
                        		</c:forEach>
                        </select>
                      </h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">
                        <select class="form-select mb-n2 ajaxSelect selectJob" style="width: 130px; border: 0;">
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
		                          <input type="checkbox" value="${v.vacNo}" class="selectMember" name="checkedMember">
		                        </h6>
		                      </th>
		                      <th>
		                        <h6 class="fs-2 mb-0">${v.memNo}</h6>
		                      </th>
		                      <th>
		                        <h6 class="fs-2 mb-0 memName">${member.memName}</h6>
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
                <button type="button" class="btn btn-secondary modalButton" data-bs-toggle="modal" data-bs-target="#yesModal" onclick="yesModal();">승인</button>
                <button type="button" class="btn btn-danger modalButton" data-bs-toggle="modal" data-bs-target="#noModal" onclick="noModal();">거절</button>
              </div>
              
              <!-- 휴가승인 모달 -->
		          <form class="mt-4" action="${contextPath}/admin/requestLeaveYesMember.do" method="get" id="yesForm">
		            <div class="modal fade" id="yesModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
		              <div class="modal-dialog modal-dialog-centered">
		                <div class="modal-content">
		                  <div class="modal-header d-flex align-items-center">
		                    <h4 class="modal-title" id="myLargeModalLabel">
		                      연차승인
		                    </h4>
		                  </div>
		                  <hr>
		                  <div class="modal-body myModalBody">
		                    <div class="modalText">
		                    	<div class="yesOne" style="display: none;">
		                    	  <span class="yesName"></span>님의 연차신청을 승인하시겠습니까?<br>
		                    	</div>
		                    	<div class="yesMulti" style="display: none;">
		                    		선택한 <span class="yesCount"></span>명의 연차신청을 승인하시겠습니까? <br>
		                    	</div>
		                    </div>
		                    <br>
		                  </div>
		                  <div class="modal-footer">
		                    <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">
		                      확인
		                    </button>
		                    <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start cencelButton" data-bs-dismiss="modal">
		                      취소
		                    </button>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </form>
		          
              <!-- 휴가거절 모달 -->
		          <form class="mt-4" action="${contextPath}/admin/requestLeaveNoMember.do" method="get" id="noForm">
		            <div class="modal fade" id="noModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
		              <div class="modal-dialog modal-dialog-centered">
		                <div class="modal-content">
		                  <div class="modal-header d-flex align-items-center">
		                    <h4 class="modal-title" id="myLargeModalLabel">
		                      연차거절
		                    </h4>
		                  </div>
		                  <hr>
		                  <div class="modal-body myModalBody">
		                    <div class="modalText">
		                    	<div class="noOne" style="display: none;">
		                    	  <span class="noName"></span>님의 연차신청을 거절하시겠습니까?<br>
		                    	</div>
		                    	<div class="noMulti" style="display: none;">
		                    		선택한 <span class="noCount"></span>명의 연차신청을 거절하시겠습니까? <br>
		                    	</div>
		                    </div>
		                    <br>
		                  </div>
		                  <div class="modal-footer">
		                    <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">
		                      확인
		                    </button>
		                    <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">
		                      취소
		                    </button>
		                  </div>
		                </div>
		              </div>
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
													for(let j=0; j<map.vacList[i].memberList.length; j++){
														filterTable +=	"<tr class='leaveReason'>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>"
									                       +				"<input type='checkbox' name='checkedMember' class='selectMember' value='" + map.vacList[i].vacNo + "'>"
									                       +			"</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].memNo + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0 memName'>" + map.vacList[i].memberList[j].memName + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].majorNo + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].memberList[j].jobNo + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].startDate + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].endDate + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].vacUsed + "일 사용" + "</h6>"
									                       +		"</th>"
									                       +		"<th>"
									                       +			"<h6 class='fs-2 mb-0'>" + map.vacList[i].status + "</h6>"
									                       +		"</th>"
									                    	 +	"</tr>"
									                    	 +	"<tr class='leaveReasonContent'>"
									                       +		"<td colspan='4'>"
									                       +			"<div class='card' style='width: 400px; height: 250px;'>"
									                       +				"<div class='card-body'>"
									                       +					"<p class='fs-5 fw-semibold'>연차사유(" + map.vacList[i].vacType + ")</p>"
									                       +					"<hr>"
									                       +					"<p>" + map.vacList[i].vacReason + "</p>"
									                       +				"</div>"
									                       +			"</div>"
									                       +		"</td>"
									                    	 +	"</tr>";
													}          	 
												}
											}
											
											$(".tableBody").append(filterTable);
											
											// 페이징처리
											let filterPage = "";
											if(map.pi.listCount > map.pi.boardLimit){
												filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																		+		"<a class='page-link link' onclick='memberFilter(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																		+			"<span aria-hidden='true'>"
																		+				"<i class='ti ti-chevrons-left fs-4'></i>"
																		+			"</span>"
																		+		"</a>"
																		+	"</li>";
												
												for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
													filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
								                      +   "<a class='page-link link' onclick='memberFilter(" + p + ");' >"
								                      +    	p
								                      +   "</a>"
								                      + "</li>";
												}
												
												filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
								                   +    "<a class='page-link link' onclick='memberFilter(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
								                   +       "<span aria-hidden='true'>"
								                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
								                   +        "</span>"
								                   +    "</a>"
								                   + 	"</li>";
								        $(".pagination").append(filterPage);

											}
											
										},
										error:function(){
											console.log("휴가신청인원 학과 및 직급조회 ajax 통신 실패");
										}
									})
									
								}
								
								// 최초에는 승인/거절버튼 비활성화
								$(document).ready(function(){
									$(".modalButton").attr("disabled", true);
								});
								
								// 체크박스 체크시만 승인/거절버튼 활성화
								$(document).on("change", ".selectMember", function(){

									//$("input:checkbox[name=checkedMember]:checked").length;
									/*if($(this).is(":checked")){*/
									if($("input:checkbox[name=checkedMember]:checked").length != 0){
										$(".modalButton").removeAttr("disabled", true);
									}else{
										$(".modalButton").attr("disabled", true);
									}
								})
								
								// 휴가승인시 이미 승인된 휴가인지 검사			
								$(document).on("submit", "#yesForm", function(event){
									let yesStatus = $(".selectMember:checked").closest("tr").find("th:contains('승인')").length > 0;
									if(yesStatus){
										event.preventDefault();
										alert("이미 승인된 휴가입니다.");
										$(".cencelButton").click();
									}
								})
								
								// 휴가승인 함수
								function yesModal(){
									let checkedbox = $(".selectMember:checked");
									let checkedboxCount = checkedbox.length;
									console.log(checkedboxCount);
									
									if(checkedboxCount == 1){
										
										// div 요소 활성화 및 비활성화 선택
										$(".yesOne").css("display", "block");
										$(".yesMulti").css("display", "none");
										// 한명일 때 회원이름 가져오기
										let oneName = checkedbox.closest("tr").find(".memName").text();
										$(".yesName").text(oneName);
										// 체크박스의 밸류값 가져오기
										let oneValue = checkedbox.val();
										// 인풋타입 히든 만들어서 변수에 담고 승인 form에 어펜드
										let inputHidden = "<input type='hidden' name='vacNo' value='" + oneValue + "'>";
										$("#yesForm").append(inputHidden);
										
	               		$('#yesModal').on('hidden.bs.modal', function () {
	               		    $('#yesForm').find('input[name="vacNo"]').remove();
	               		});
	               		
									}else{
										
										// div 요소 활성화 및 비활성화 선택
										$(".yesOne").css("display", "none");
										$(".yesMulti").css("display", "block");
										// 여러명일때 인원수 span요소에 추가
										$(".yesCount").text(checkedboxCount);
										
										// 체크박스 밸류값들 가져온 뒤 인풋타입 히든 만들어서 변수에 담고 휴가승인form에 어펜드를 반복
										checkedbox.each(function(){
											let multiValue = $(this).val();
											let inputHidden = "<input type='hidden' name='vacNo' value='" + multiValue + "'>";
											$("#yesForm").append(inputHidden);
											
		               		$('#yesModal').on('hidden.bs.modal', function () {
		               		    $('#yesForm').find('input[name="vacNo"]').remove();
		               		});
						               		
										})
										
									}
								}
								
								// 휴가거절 함수
								function noModal(){
									let checkedbox = $(".selectMember:checked");
									let checkedboxCount = checkedbox.length;
									console.log(checkedboxCount);
									
									if(checkedboxCount == 1){
										
										// div 요소 활성화 및 비활성화 선택
										$(".noOne").css("display", "block");
										$(".noMulti").css("display", "none");
										// 한명일 때 회원이름 가져오기
										let oneName = checkedbox.closest("tr").find(".memName").text();
										$(".noName").text(oneName);
										// 체크박스의 밸류값 가져오기
										let oneValue = checkedbox.val();
										// 인풋타입 히든 만들어서 변수에 담고 승인 form에 어펜드
										let inputHidden = "<input type='hidden' name='vacNo' value='" + oneValue + "'>";
										$("#noForm").append(inputHidden);
										
	               		$('#noModal').on('hidden.bs.modal', function () {
	               		    $('#noForm').find('input[name="vacNo"]').remove();
	               		});
	               		
									}else{
										
										// div 요소 활성화 및 비활성화 선택
										$(".noOne").css("display", "none");
										$(".noMulti").css("display", "block");
										// 여러명일때 인원수 span요소에 추가
										$(".noCount").text(checkedboxCount);
										
										// 체크박스 밸류값들 가져온 뒤 인풋타입 히든 만들어서 변수에 담고 휴가승인form에 어펜드를 반복
										checkedbox.each(function(){
											let multiValue = $(this).val();
											let inputHidden = "<input type='hidden' name='vacNo' value='" + multiValue + "'>";
											$("#noForm").append(inputHidden);
											
		               		$('#noModal').on('hidden.bs.modal', function () {
		               		    $('#noForm').find('input[name="vacNo"]').remove();
		               		});
						               		
										})
										
									}
								}
								
								// 동적으로 테이블 생성시 호버이벤트 적용용 도큐먼트
								$(document).on("mouseenter", ".leaveReason", function() {
							    var leaveReasonContent = $(this).next(".leaveReasonContent");
							    if (leaveReasonContent.length > 0) {
							        leaveReasonContent.show();
							    }
								});

								$(document).on("mouseleave", ".leaveReason", function() {
							    var leaveReasonContent = $(this).next(".leaveReasonContent");
							    if (leaveReasonContent.length > 0) {
							        leaveReasonContent.hide();
							    }
								});
								
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