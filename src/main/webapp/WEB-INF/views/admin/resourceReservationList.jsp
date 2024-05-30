<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 예약내역</title>
<style>
  .filter *{display: inline;}
  .resourcesBody *{
    font-size: 15px;
  }
  /* 페이징바를 한가운데로 */
  #search{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  #searchName{width: 250px;}
  .text, .searchBtn {margin: 5px;}
  .tableBody tr{cursor: pointer;}
  .selectMember{
  	max-height: 200px;
  	overflow-y: scroll;
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
                  <h4 class="fw-semibold mb-8">일정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자원 예약내역</li>
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
                <select class="form-select mb-n2 ajaxSelect" style="width: 130px; display: inline-block;">
                  <option value="0" selected>전체</option>
                  <option value="1">회의실</option>
                  <option value="2">강의실</option>
                  <option value="3">기타</option>
                  <option value="4">비품</option>
                  <option value="5">미반납비품</option>
                </select>
              </div>
              <input id="searchName" type="text" class="form-control searchName" placeholder="자원명으로 검색">
              <br>
              <table class="table border text-nowrap mb-0 align-middle">
                <thead class="text-dark fs-3" align="center">
                  <tr>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">번호</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">타입</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">예약자원</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">예약일</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">사용자</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">비고</h6>
                    </th>
                  </tr>
                </thead>
                <tbody align="center" class="tableBody">
                	<c:forEach var="r" items="${reserList}">
	                  <tr class="leaveReason" onclick="reservationDetail(${r.revNo});">
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.revNo}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.resType}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.resNo}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.revDate}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.memberList[0].memName}/${r.memberList[0].majorNo}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0">${r.status}</h6>
	                    </th>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              <br>
              <div style="text-align: right;">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#resourcesUse">비품사용기록 등록</button>
              </div>

              <!-- 비품사용기록 모달 -->
              <form action="${contextPath}/admin/insertResourceReservation.do" method="post" id="insertReservationForm">
                <div class="modal fade" id="resourcesUse" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">비품사용기록</h4>
                      </div>
                      <hr>
                      <div class="modal-body myModalBody resourcesBody">
                      	<div class="addResourceReservation">
                      		<table>
		                      	<tr>
		                      		<th>&nbsp;&nbsp;&nbsp;비품명:</th>
		                      		<td><input type="text" class="form-control searchResource" placeholder="비품명을 검색 후 선택해주세요." style="width: 280px;"></td>
		                      	</tr>          			
                      		</table>
                      		<br>
                      		<div class="reservationResourceCheck">
                      		<!-- 전부 동적생성 -->
                      		</div>
	                      	<table>
		                      	<tr>
		                      		<td>&nbsp;&nbsp;&nbsp;수량:</td>
		                      		<td><input type="number" class="form-control" name="revCount" required placeholder="수량을 작성해주세요(숫자만)" style="width: 280px;"></td>
		                      	</tr>
		                      	<tr>
		                      		<td>&nbsp;&nbsp;&nbsp;사용자:</td>
		                      		<td><input type="text" class="form-control searchReservationMember" placeholder="사용자 이름 검색" style="width: 280px;"></td>
		                      	</tr>
		                      	<tr>
		                      		<td>&nbsp;&nbsp;&nbsp;대여일:</td>
		                      		<td><input type="date" class="form-control" name="revDate" required style="width: 280px;"></td>
		                      	</tr>
	                      	</table>
                      	</div>
                        <div class="selectMember">
                        	<!-- 동적으로 생성 -->
                        </div>
                        <br>
                        <div class="resourceReservationReason">
													<textarea class="form-control addLeaveReason" rows="3" placeholder="상세설명을 작성해주세요" required style="width: 280px; resize:none;" name="revReason"></textarea> 	
                        </div>
                        <hr>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">등록</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">취소</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>

              <!-- 페이징바 & 검색창-->
              <div id="search">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
		                <c:if test="${pi.listCount > pi.boardLimit}">
			                <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/resourceReservation.page?page=${pi.currentPage-1}" aria-label="Previous">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-left fs-4"></i>
			                    </span>
			                  </a>
			                </li>
			                
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				                <li class="page-item">
				                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/resourceReservation.page?page=${p}">
				                  	${p}
				                  </a>
				                </li>
			                </c:forEach>
			                
			                <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/resourceReservation.page?page=${pi.currentPage+1}" aria-label="Next">
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
              
              	// 비품사용기록 등록시 사용자 조회 ajax 함수 요청
              	$(document).on("keyup", ".searchReservationMember", function(){
              		if($(this).val().trim() != ""){
              			searchReservationMember();
              		}else{
              			$(".selectMember").text("");
              		}
              	});
              
              	// 비품사용기록 등록시 비품명 조회 ajax 함수 요청
              	$(document).on("keyup", ".searchResource", function(){
              		if($(this).val().trim() != ""){
              			searchResource();
              		}else{
              			$(".reservationResourceCheck").text("");
              		}
              	});
              	
              	// 비품사용기록 등록시 사용자 조회 ajax 함수
              	function searchReservationMember(){
              		let memName = $(".searchReservationMember").val();
              		
              		$.ajax({
              			url:"${contextPath}/admin/searchReservationMember.do",
              			type:"post",
              			data:"memName=" + memName,
              			success:function(memList){
              				let mem = "";
              				$(".selectMember").text("");
              				if(memList.length == 0){
              					mem +=	"<hr>"
              							+			"<span>조회된 직원이 없습니다.</span> <br>"
              							+		"<hr>";
              				}else{
              					mem +=	"<hr>";
              					for(let i=0; i<memList.length; i++){
              						mem +=	"<span class='addMem'>" + memList[i].memNo + " / " + memList[i].memName + " / " + memList[i].majorNo +"</span><input type='checkbox' class='checkMem' value='" + memList[i].memNo + "'><br>"
              					}
              					mem +=	"<hr>";
              				}
              				$(".selectMember").append(mem);
              			},
              			error:function(){
              				console.log("비품사용기록 등록시 사용자 조회 ajax 통신 실패");
              			}
              		});
              	}
              	
              	// 비품사용기록 등록시 비품 조회 ajax 함수
              	function searchResource(){
              		let resName = $(".searchResource").val();
              		
              		$.ajax({
              			url:"${contextPath}/admin/searchResource.do",
              			type:"post",
              			data:"resName=" + resName,
              			success:function(resourceList){
              				let resource = "";
              				$(".reservationResourceCheck").text("");
              				if(resourceList.length == 0){
              					resource += "<hr>"
              										+		"<span>검색하신 비품은 조회되지 않습니다.</span>"
              										+	"<hr>";
              				}else{
              					resource += "<hr>";
              					for(let i=0; i<resourceList.length; i++){
              						resource += "<span>" + resourceList[i].resName + " / " + resourceList[i].stock +"개</span><input type='checkbox' class='checkResource' value='" + resourceList[i].resNo + "'> <br>"
              					}
              					resource += "<hr>";
              				}
              				$(".reservationResourceCheck").append(resource);           				
              			},
              			error:function(){
              				console.log("비품사용기록 등록시 비품조회 ajax 통신 실패");
              			}
              		});
              	}
              	
              	// 비품사용기록 등록 submit시 비품 및 사용자 체크박스 체크 안돼있으면 alert로 알려주는 구문
              	$(document).on("submit", "#insertReservationForm", function(){
              		
              		let checkedResource = $(".checkResource").filter(":checked");
              		let checkedMem = $(".checkMem:checked").filter(":checked");
              		
              		if(checkedMem.length == 0 && checkedResource.length == 0){
              			event.preventDefault();
              			alert("비품과 사용자를 선택해주세요.");
              		}else if(checkedMem.length != 0 && checkedResource.length == 0){
              			event.preventDefault();
              			alert("비품을 선택해주세요.");
              		}else if(checkedMem.length == 0 && checkedResource.length != 0){
              			event.preventDefault();
              			alert("사용자를 선택해주세요.");
              		}
              		
              		// 입력된 수량 가져오기
              		let inputStock = $("input[name='stock']").val();
              		
            	    // 선택한 비품의 재고 가져오기
            	    let stockFullText = $(".checkResource:checked").prev().text().trim();
            	    let stockText = stockFullText.split("/")[1];
            	    let stock = parseInt(stockText);
            	    
            	    if(inputStock > stock){
            	    	event.preventDefault();
            	    	alert("입력하신 수량이 비품의 재고보다 많습니다.");
            	    	$("input[name='revCount']").val("");
            	    }
              		
              	});
              	
              	// 사용자선택 체크박스 여부에 따라 체크되지 않은 체크박스 name 속성 지우는 스크립트
              	$(document).on("change", ".checkMem", function(){
              		$(".checkMem").not(this).prop("checked", false).removeAttr("name");
              		
              		if($(this).is(":checked")){
              			$(this).attr("name", "memNo");
              			$(this).attr("checked", true);
              		}else{
              			$(this).removeAttr("name");
              		}
              	});
              	
              	// 비품 체크박스 여부에 따라 체크되지 않은 체크박스의 name 속성 지우는 스크립트
              	$(document).on("change", ".checkResource", function(){
              		$(".checkResource").not(this).prop("checked", false).removeAttr("name");
              		
              		if($(this).is(":checked")){
              			$(this).attr("name", "resNo");
              			$(this).attr("checked", true);
              		}else{
              			$(this).removeAttr("name");
              		}
              		
              	});
              	
              	// 검색 및 필터로 ajax 함수 요청
              	$(document).on("keyup change", ".searchName, .ajaxSelect", function(){
              		resourceReservationFilter(1);
              	});
              	
              	// 예약내용 상세페이지로 이동
              	function reservationDetail(revNo){
              		let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
              		location.href = contextPath + "/admin/resourceReservationDetail.do?revNo=" + revNo;
              	}
              	
              	// 검색 및 필터로 ajax 실행 함수
              	function resourceReservationFilter(page){
              		// 드롭다운 및 검색창 값 담기
              		let resType = $(".ajaxSelect option:selected").val();
              		let resName = $(".searchName").val();
              		
              		$.ajax({
              			url:"${contextPath}/admin/ajaxFilterResourceReservationList.do",
              			type:"post",
              			data:"resType=" + resType + "&resName=" + resName + "&page=" + page,
              			success:function(map){
              				console.log(map);
              				$(".tableBody").empty();
              				$(".pagination").empty();
              				let filterTable = "";
              				let filterPage = "";
              				
              				if(map.reserList.length == 0){
              					filterTable +=	"<tr class='leaveReason'>"
              											+			"<th colspan='6'>"
              											+				"<h6 class='fs-2 mb-0'>조건에 맞는 예약내역이 없습니다.</h6>"
              											+			"</th>"
              											+		"</tr>";
              				}else{
              					for(let i=0; i<map.reserList.length; i++){
													for(let j=0; j<map.reserList[i].memberList.length; j++){
														filterTable +=	"<tr class='leaveReason' onclick='reservationDetail(" + map.reserList[i].revNo + ");'>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].revNo + "</h6>"
																				+			"</th>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].resType + "</h6>"
																				+			"</th>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].resNo + "</h6>"
																				+			"</th>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].revDate + "</h6>"	
																				+			"</th>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].memberList[j].memName + "/" + map.reserList[i].memberList[j].majorNo + "</h6>"
																				+			"</th>"
																				+			"<th>"
																				+				"<h6 class='fs-2 mb-0'>" + map.reserList[i].status + "</h6>"
																				+			"</th>";										
													}
              					}
              				}
             					$(".tableBody").append(filterTable);
				              // 페이징 처리
											if(map.pi.listCount > map.pi.boardLimit){
												filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																		+		"<a class='page-link link' onclick='resourceReservationFilter(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																		+			"<span aria-hidden='true'>"
																		+				"<i class='ti ti-chevrons-left fs-4'></i>"
																		+			"</span>"
																		+		"</a>"
																		+	"</li>";
												
												for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
													filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
								                      +   "<a class='page-link link' onclick='resourceReservationFilter(" + p + ");' >"
								                      +    	p
								                      +   "</a>"
								                      + "</li>";
												}
												
												filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
								                   +    "<a class='page-link link' onclick='resourceReservationFilter(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
								                   +       "<span aria-hidden='true'>"
								                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
								                   +        "</span>"
								                   +    "</a>"
								                   + 	"</li>";
								        $(".pagination").append(filterPage);
											}
              			},
              			error:function(){
              				console.log("예약목록 필터 및 검색 조회 ajax 통신 실패");
              			}
              		});
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