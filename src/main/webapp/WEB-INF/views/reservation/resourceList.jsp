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
	table {width: 100%;}
	/*
	table thead tr, table tbody tr, table tfoot tr {
	  display: table;
	  width: 500px;
	}
	*/
 
  .search-style{
    height:35px; 
    color:#5a6a85; 
    border: 1px solid #dfe5ef;}
    
  table td{
  	text-overflow: ellipsis;
   	overflow: hidden;
   	white-space: nowrap;
  }  
 	.resource-title{cursor:pointer;} 
  .off{display:none;}
  


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
									<div class="d-flex">
	                  <form id="searchFacilityForm" class="mt-3">
	                    <select name="condition" class="search-style" id="" onchange="ajaxSearchFacilityList();">
	                        <option value="0">전체</option>
	                        <option value="1">회의실</option>
	                        <option value="2">강의실</option>
	                        <option value="3">기타</option>
	                    </select>
	                    <input class="search-style" type="text" name="keyword" id="">
	                    <button type="button" class="btn btn-outline-primary" onclick="clickSearchBtn(1);">검색</button>
	                  </form>
										<div class="d-flex justify-content-start align-items-end">
		                  <a href="#" id="facilityResetBtn" onclick="resetSearch(1);" style="display:none; text-decoration:none; color:#49beff;"><i class="ti ti-reload"></i>검색 취소</a>
		                </div>
									</div>
                  
                  <br>

                  <div>
                    <table class="facility_table table border table-hover" >
                      <thead align="center">
                        <tr>
                          <th style="width:105px;">분류</th>
                          <th style="width:220px;">자원명</th>
                          <th style="width:150px;">예약하기</th>
                        </tr>
                      </thead>
                      <tbody align="center">
                      	
                        <!-- <tr>
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
                        </tr> -->
                      </tbody>
                    </table>
                    <br>
                  	
                  	<ul class="pagination justify-content-center facility_pagination">
                
              			</ul>
                  
                  </div>
    
                </div>
              </div>

              <div class="card w-100">
                <div class="card-body">
                  <h5 class="fw-semibold mb-8">비품 예약 가능 수량</h5>
                  <br>
									
									<div class="d-flex">
	                  <form id="searchEquipmentForm" class="mt-3">
	                    비품명 : 
	                    <input class="search-style" type="text" name="keyword">
	                    <button type="button" class="btn btn-outline-primary" onclick="clickSearchBtn(2);">검색</button>
	                  </form>
										<div class="d-flex justify-content-start align-items-end">
		                  <a href="#" id="equipmentResetBtn" onclick="resetSearch(2);" style="display:none; text-decoration:none; color:#49beff;"><i class="ti ti-reload"></i>검색 취소</a>
		                </div>
									</div>
                  <br>
                
                  <div >
                    <table class="equipment_table table border table-hover">
                      <thead align="center">
                        <tr>
                          <th style='width:130px;'>분류</th>
                          <th style='width:240px;'>자원명</th>
                          <th style='width:130px;'>잔여수량</th>
                        </tr>
                      </thead>
                      <tbody align="center">
                        
                      </tbody>
                    </table>
                  	<br>
                  	
                  	<ul class="pagination justify-content-center equipment_pagination">
                
              			</ul>
                  </div>
    
                </div>
              </div>

            </div>  
          </div>
          
          <script>
          
          	let faciltiyArr;
          	let equipmentArr;
          	
          	$(document).ready(function(){
          		ajaxSearchFacilityList(1);
          		ajaxSearchEquipmentList(1);
          		
          	})
          	
          	// 
          	function clickSearchBtn(type){
          		let formId = type == 1 ? "#searchFacilityForm" :"#searchEquipmentForm";
          		let btn = type == 1 ? "#facility" :"#equipment";
          		
          		if($(formId + " input[name='keyword']").val() == null || $(formId + " input[name='keyword']").val().trim().length == 0){
          			alert("검색어를 입력해주세요!");
          		}else{
          			if(type == 1){
          				ajaxSearchFacilityList();
          			}else{
          				ajaxSearchEquipmentList();
          			}
          			
	          		$(btn + "ResetBtn").css("display", "block");
          		}
          	}
          	
         		// 검색 취소 클릭시 실행되는 함수
          	function resetSearch(type){
          		const selectElement = document.querySelector("#searchFacilityForm select");
              const options = selectElement.options;

              
              let formId = type == 1 ? "#searchFacilityForm" :"#searchEquipmentForm";
            	let btn = type == 1 ? "#facility" :"#equipment";
              
              const $keyword = $(formId +" input[name='keyword']");
              $keyword.val("");
              
              if(type == 1){
	              for (let i = 0; i < options.length; i++) {
	                options[i].selected = false;
	              }
	              ajaxSearchFacilityList();
              }else{
            	  ajaxSearchEquipmentList();
              }
              
              
              $(btn + "ResetBtn").css("display", "none");
              
              
          	}
          	
          	// 시설목록 조회 ajax
          	function ajaxSearchFacilityList(requestPage){
          		
          		faciltiyArr = new Array();
          		
          		// 폼 데이터를 배열 형태로 직렬화
          		let formDataArray = $("#searchFacilityForm").serializeArray();

          		// page 값을 추가
          		formDataArray.push({ name: 'page', value: requestPage });

          		// 배열을 직렬화된 문자열로 변환
          		let formData = $.param(formDataArray);
          		
          		$.ajax({
          			url:"${contextPath}/reservation/searchFacilityList.do",
          			type:"post",
          			data:formData,
          			success:function(rep){
          				let list = rep.list;
          				let tbody = "";
          				
          				if(list.length > 0){
          					for(let i=0; i<list.length; i++){
          						
          						let resType = list[i].resType;
          						let resTypeStr = resType == "1" ? "회의실" 
          																						: (resType == "2" ? "강의실" : "기타"); 
	          					tbody += "<tr class='resource_title'>"
	                            +		"<td style='width:105px;'>" + resTypeStr + "</td>"
	                            +		"<td style='width:220px;' class='resource-title' data-bs-toggle='collapse' data-bs-target='#facility" + i + "'>" + list[i].resName + "</td>"
	                            +		"<td style='width:150px;'><a class='btn btn-sm btn-primary' href='${contextPath}/reservation/reserveForm.do?no=" + list[i].resNo + "'>예약하기</a></td>"
                         	    +	"</tr>"
                         	    + "<tr class='collapse' id='facility" + i + "'>"
                         	    + 	"<td colspan='3' style='width:500px;'>"
                         	    + 		"<div class='card' style='width: 400px; height: 250px;'>"
                         	    + 			"<div class='card-body'>"
                         	    + 				"<p class='fs-5 fw-semibold'>상세정보</p>"
                         	    + 				"<hr>"
                         	    + 				"<p>" + list[i].resDetail + "</p>"
                         	    + 				"<hr>"
                         	    + 				"<p class='fs-5 fw-semibold'>위치</p>"
                         	    + 				"<hr>"
                         	    + 				"<p>" + list[i].resGps + "</p>"
                         	    + 			"</div>"
                         	    + 		"</div>"
                         	    + 	"</td>"
                         	    + "</tr>";
                         	    
                         	    
	          					faciltiyArr.push(list[i]);   	    
          					}
          					
          				}else{
          					tbody += "<tr><td colspan='3'>조회된 결과가 없습니다.</td></tr>";
          				}
          				drawPage(1, rep.pi);
          				$(".facility_table tbody").html(tbody);
          				
          			},
          			error:function(){
          				console.log("시설목록 조회용 ajax통신 실패");
          			}
          		})
          	}
          	
          	
          	
          	// 비품목록 조회 ajax
          	function ajaxSearchEquipmentList(requestPage){
          		
          		equipmentArr = new Array();
          		
          		// 폼 데이터를 배열 형태로 직렬화
          		let formDataArray = $("#searchEquipmentForm").serializeArray();

          		// page 값을 추가
          		formDataArray.push({ name: 'page', value: requestPage });

          		// 배열을 직렬화된 문자열로 변환
          		let formData = $.param(formDataArray);
          		
          		$.ajax({
          			url:"${contextPath}/reservation/searchEquipmentList.do",
          			type:"post",
          			data:formData,
          			success:function(rep){
          				let list = rep.list;
          				let tbody = "";
          				if(list.length > 0){
          					
          					for(let i=0; i<list.length; i++){
          						tbody += "<tr class='resource_title'>"
                             +		"<td style='width:130px;'>" + ( list[i].resType == "4" ? "비품" : "--" ) + "</td>"
                             +		"<td style='width:240px;' class='resource-title' data-bs-toggle='collapse' data-bs-target='#equipment" + i + "'>" + list[i].resName + "</td>"
                             +		"<td style='width:130px;'>" + list[i].stock + " 개</td>"
                       	     + "</tr>"
                       	  	 + "<tr class='collapse' id='equipment" + i + "'>"
                   	    		 +		"<td colspan='3' style='width:500px;'>"
                   	    		 + 			"<div class='card' style='width: 400px; height: 250px;'>"
                   	    		 + 				"<div class='card-body'>"
                   	    		 + 					"<p class='fs-5 fw-semibold'>상세정보</p>"
                   	    		 + 					"<hr>"
                   	    		 + 					"<p>" + list[i].resDetail + "</p>"
                 	   			   + 					"<hr>"
                   	    		 + 					"<p class='fs-5 fw-semibold'>위치</p>"
                   	    		 + 					"<hr>"
                   	   			 + 					"<p>" + list[i].resGps + "</p>"
                   	   			 + 				"</div>"
                   	    		 + 			"</div>"
                   	    		 + 		"</td>"
                   	    		 + "</tr>";
          					
	          					equipmentArr.push(list[i]);
          					}
          					
          				}else{
          					tbody += "<tr><td colspan='3'>조회된 결과가 없습니다.</td></tr>";
          				}
          				drawPage(2, rep.pi);
          				$(".equipment_table tbody").html(tbody);
          				
          			},
          			error:function(){
          				console.log("비품 목록 조회용 ajax통신 실패");
          			}
          		})
          	}
          	
          	// 페이징 처리 function
          	function drawPage(type, pi){
          		console.log(pi);
          		let ulClassName = (type == 1 ? ".facility_pagination" : ".equipment_pagination");
          		let functionName =  (type == 1 ? "ajaxSearchFacilityList" : "ajaxSearchEquipmentList");
          		let paging = "";
          		
          		paging += "<li class='page-item " + (pi.currentPage == 1 ? "disabled" : "") + "'>"
          						+		"<a class='page-link link' href='#' onclick='" + functionName + "(" + (pi.currentPage - 1 ) + ");'" +  " aria-label='Previous'>"
          						+			"<span aria-hidden='true'>"
          						+				"<i class='ti ti-chevrons-left fs-4'></i>"
          						+			"</span>"
          						+		"</a>"
          						+	"</li>";
   						
   						for(let p=pi.startPage; p<=pi.endPage; p++){
          			if(p == pi.currentPage){
          				paging += "<li class='page-item'><a class='page-link link active' onclick='" + functionName + "(" + p + ");' href='#'>" + p + "</a></li>";
          			}else{
          				paging += "<li class='page-item'><a class='page-link link' onclick='" + functionName + "(" + p + ");' href='#'>" + p + "</a></li>";
          			}
        			}
   						
   						paging += "<li class='page-item " + (pi.currentPage == pi.maxPage ? "disabled" : "") + "'>"
				  						+		"<a class='page-link link' href='#' onclick='"+ functionName + "(" + (pi.currentPage + 1 ) + ");'" +  " aria-label='Next'>"
				  						+			"<span aria-hidden='true'>"
				  						+				"<i class='ti ti ti-chevrons-right fs-4'></i>"
				  						+			"</span>"
				  						+		"</a>"
				  						+	"</li>";
          						
          		$(ulClassName).html(paging);
          	}
          	/*
         		// 동적으로 테이블 생성시 호버이벤트 적용용 도큐먼트
						$(document).on("mouseenter", ".resource_title", function() {
					    var leaveReasonContent = $(this).next(".resource_content");
					    if (leaveReasonContent.length > 0) {
					        leaveReasonContent.show();
					    }
						});
			
						$(document).on("mouseleave", ".resource_title", function() {
					    var leaveReasonContent = $(this).next(".resource_content");
					    if (leaveReasonContent.length > 0) {
					        leaveReasonContent.hide();
					    }
						});
						
					  // 휴가신청현황 호버용 스크립트문
					  
					  document.addEventListener("DOMContentLoaded", function() {
					    var resourceTitle = document.querySelectorAll('.resource_title');
					
					    resourceTitle.forEach(function(leaveReason) {
					    	resourceTitle.addEventListener('mouseenter', function(event) {
					        if (!event.target.closest('.selectMember')) {
					          var resourceContent = resourceTitle.nextElementSibling;
					          if (leaveReasonContent && leaveReasonContent.classList.contains('resourceContent')) {
					            leaveReasonContent.style.display = 'table-row';
					          }
					        }
					      });
					
					    	resourceTitle.addEventListener('mouseleave', function(event) {
					        if (!event.target.closest('.selectMember')) {
					          var resourceContent = resourceTitle.nextElementSibling;
					          if (resourceContent && resourceContent.classList.contains('resourceContent')) {
					        	  resourceContent.style.display = 'none';
					          }
					        }
					      });
					    });
					  });	
					  */
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