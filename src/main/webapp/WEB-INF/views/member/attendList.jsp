<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 조회</title>
 <style>
     .custom-input {
            cursor: pointer;
            padding: 5px;
            border: 1px solid #ccc;
            width: 150px;
            text-align: center;
        }

        /* 숨겨진 input 요소 */
        #hiddenInput {
            position: absolute;
            display: none;
           
        }
</style>
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
                  <h4 class="fw-semibold mb-8">근태 현황 조회</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
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
                <div>
                    <div>
                        <div >
                            <!-- 숨겨진 input 요소 
                            
                            <div class="input-group">
                                <input type="text" class="form-control pickadate-monyear-dropdown"
                                  placeholder="Month &amp; Year Dropdown" />
          
                                <span class="input-group-text">
                                  <i class="ti ti-calendar fs-5"></i>
                                </span>
                            </div>
                            -->
                            <!-- 클릭하여 달력을 표시할 입력 필드 
                            <div class="custom-input" onclick="showCalendar()"> &lt;2024.04&gt; </div>
                            <input type="month" id="hiddenInput">
                            -->
                            
                            <div class="todo-date form-group d-flex justify-content-center">
				                      <button type="button" class="btn" onclick="moveDate(1);"><i class="ti ti-chevrons-left" style="font-size: 20px;"></i></button>
				                      <input type="date" class="form-control"  style="width:15%;" id="targetYearMonth">
				                      <button type="button" class="btn" onclick="moveDate(2);"><i class="ti ti-chevrons-right" style="font-size: 20px;"></i></button>
				                    </div>
                        </div>
												
												<!--  
                        <script>
                            var hiddenInput = document.getElementById('hiddenInput');
                        
                            // 입력 필드를 클릭하여 달력을 표시합니다.
                            function showCalendar() {
                                hiddenInput.click(); // 숨겨진 input 요소를 클릭하여 브라우저 기본 달력 표시
                                hiddenInput.style.display = 'block';
                            }
                        
                            // 월을 선택하면 선택된 월을 처리합니다.
                            hiddenInput.addEventListener('change', function() {
                                var selectedDate = this.value; // 선택된 날짜 값을 가져옵니다. (YYYY-MM 형식)
                                var selectedYearMonth = formatYearMonth(selectedDate);
                                var customInput = document.querySelector('.custom-input');
                                customInput.textContent = '<' + selectedYearMonth + '>'; // 선택된 연도와 월을 표시
                            });
                        
                            // YYYY-MM 형식의 날짜를 YYYY.MM 형식으로 변환합니다.
                            function formatYearMonth(dateString) {
                                var [year, month] = dateString.split('-');
                                return year + '.' + month;
                            }
                        </script>
                        -->



                    </div>


                    <!-- ---------------------------------------------------------------------->
                    <div class="d-flex justify-content-between">
                        <div></div>
                        <div>
                        <!--  <button type="button" class="btn btn-info margin-right">달력보기</button>-->
                        <button type="button" class="btn btn-info allbutton">전체보기</button>
                        </div>
                    </div>
                    <br>
                    <div class="table-responsive mb-4">
                        <table class="atdTable table border text-nowrap mb-0 align-middle text-center app_doc_table overflow-hidden">
                          <thead class="text-dark fs-4 align-middle ">
                              <tr>
                                <th width="200px">
                                  <h6 class="fs-4 fw-semibold mb-0">일자</h6>
                                </th>
                                <th width="200px">
                                  <h6 class="fs-4 fw-semibold mb-0">출근시간</h6>
                                </th>
                                <th width="200px">
                                  <h6 class="fs-4 fw-semibold mb-0">퇴근시간</h6>
                                </th>
                                
                                <th width="200px">
                                  <div class="btn-group">
                                    <button class="btn dropdown-toggle " type="button" id="dropdownMenuButton"
                                      data-bs-toggle="dropdown" aria-expanded="false">
                                      상태 : 전체
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                      <li><a class="dropdown-item" href="#" data-status="정상">정상</a></li>
                                      <li><a class="dropdown-item" href="#" data-status="결근">결근</a></li>
                                      <li><a class="dropdown-item" href="#" data-status="지각">지각</a></li>
                                    </ul>
                                    <!--  
                                    <select class="form-select fs-4 fw-semibold "
																			id="selectCategory" style="border: 0;">
																			<option value="all" selected>구분</option>
																			<option value="">정상</option>
																			<option value="">지각</option>
																			<option value="">결근</option>
																		</select>
																		-->
                                  </div>
                                </th>
                                
                              </tr>
                          </thead>
                          <tbody class="text-center">
                            
                            <tr>
                              <td>
                                <p class="mb-0 fw-normal fs-4">2024-04-28</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">08:50</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">13:00</p>
                              </td>
                             
                              <td>
                                  <span
                                class="badge rounded-pill bg-primary-subtle text-primary fw-semibold fs-2">반차</span>
                              </td>
                              
                            </tr>
                            
                             
                          </tbody>
                        </table>
                      </div>
        
                      <!-- 페이징바 -->
                      <ul class="pagination justify-content-center">
                        <li class="page-item">
                          <a class="page-link link" href="#" aria-label="Previous">
                            <span aria-hidden="true">
                              <i class="ti ti-chevrons-left fs-4"></i>
                            </span>
                          </a>
                        </li>
                        <li class="page-item">
                          <a class="page-link link active" href="#">1</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link link" href="#">2</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link link" href="#">3</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link link" href="#" aria-label="Next">
                            <span aria-hidden="true">
                              <i class="ti ti-chevrons-right fs-4"></i>
                            </span>
                          </a>
                        </li>
                      </ul>
        
                    </div>

                </div>


						<script>
						var selectedStatus = "";
						
						$(document).ready(function(){
							setToday();
							searchAttendList(1);
							
							 // 드롭다운 항목 클릭 이벤트 핸들러
				        $(".dropdown-item").click(function() {
				            selectedStatus = $(this).data("status");
				            
				            // 선택한 값으로 버튼 텍스트 변경
				            $("#dropdownMenuButton").text("상태 : " + selectedStatus);
				            
				            // 선택 시 바로 searchAttendList 함수 실행
				            searchAttendList(1); // 페이지 번호는 예시로 1로 설정
				        });
							
				        $(".allbutton").click(function() {
				        	selectedStatus = "";	
				        	// 선택한 값으로 버튼 텍스트 변경
				            $("#dropdownMenuButton").text("상태 : 전체" );
				        	searchAttendList(1);
				        		
				        })
				        
				        $("#targetYearMonth").change(function(){
				        	searchAttendList(1);
				        });
							
							
							
						}) // 레디function
						
						
						
						// input[type="date"] value값 오늘로 지정하는 함수
            function setToday(){
              let now = new Date();
              let year = now.getFullYear();
              let month = (now.getMonth() + 1 ) < 10 ? "0" + (now.getMonth() + 1) : (now.getMonth() + 1);
              let date = now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
              
              let nowStr = year + "-" + month + "-"+ date ;
              $("#targetYearMonth").val(nowStr);
              
            }
						
						
						// 월 하나씩 이동하는 버튼
						function moveDate(dir) {
						  let dateVal = $(".todo-date input[type='date']").val();
						  let date = new Date(dateVal);
						  let moveDate = new Date(dateVal);
						  
						  if (dir == 1) {
						    // 한 달 뒤로 이동
						    moveDate.setMonth(date.getMonth() - 1);
						  } else {
						    // 한 달 앞으로 이동
						    moveDate.setMonth(date.getMonth() + 1);
						  }
						  
						  let yyyy = moveDate.getFullYear();
						  let mm = String(moveDate.getMonth() + 1).padStart(2, "0");
						  let dd = String(moveDate.getDate()).padStart(2, "0");
						  
						  $(".todo-date input[type='date']").val(yyyy + "-" + mm + "-" + dd);
						  searchAttendList(1);
						}
						
						// 목록 조회용
						function searchAttendList(requestPage){
								// 현재 년 월 값을 가져옴
						    let targetYearMonth = document.getElementById("targetYearMonth").value;
						    
						    // "-"를 기준으로 분리하여 년과 월을 추출
						    let yearMonthArray = targetYearMonth.split("-");
						    let year = yearMonthArray[0];
						    let month = yearMonthArray[1];
						    
						    // 추출한 년 월을 년-월 형식으로 재구성
						    let formattedYearMonth = year + "-" + month;
							
							
							
							$.ajax({
								url:"${contextPath}/member/attendList.do",
								type:"get",
								async:false,
								data:{
									page:requestPage,
									targetYearMonth:formattedYearMonth,
									keyword: selectedStatus
								},
								success:function(rep){

			          				drawBoardList(rep.list);
			          				drawPaging(rep.pi);
									
									
								},error:function(){
									console.log("목록조회 ajax 실패");
								}
							
							
							})
						}
						
						// 자료게시판 목록 화면 출력용 함수
	          	function drawBoardList(list){
	          		
			          	var html = "";
			          	if(list.length > 0){
		
			          			// 데이터를 반복하여 HTML 코드 생성
					          	for (var i = 0; i < list.length; i++) {
					          		
					          		 	var statusClass = "";
					          	    var statusText = "";

					          	    // 상태에 따라 클래스와 텍스트 지정
					          	    switch (list[i].status) {
					          	        case "정상":
					          	            statusClass = "bg-success-subtle text-success";
					          	            statusText = "정상";
					          	            break;
					          	        case "지각":
					          	            statusClass = "bg-primary-subtle text-primary";
					          	            statusText = "지각";
					          	            break;
					          	        case "결근":
					          	            statusClass = "bg-danger-subtle text-danger";
					          	            statusText = "결근";
					          	            break;
					          	        default:
					          	            statusClass = "bg-secondary-subtle text-secondary";
					          	            statusText = "Unknown";
					          	            break;
					          	    }
					          		
					          		
					          	    html += "<tr>";
					          	    html += "<td><p class='mb-0 fw-normal fs-4'>" + list[i].registDate + "</p></td>";
					          	    html += "<td><p class='mb-0 fw-normal fs-4'>" + list[i].startTime + "</p></td>";
					          	    html += "<td><p class='mb-0 fw-normal fs-4'>" + list[i].endTime + "</p></td>";
					          	  	html += "<td><span class='badge rounded-pill " + statusClass + " fw-semibold fs-2'>" + statusText + "</span></td>";
					          	   	html += "</tr>";
					          	}
			          	}else{
		          						html += "<tr><td colspan='4'>조회된 근태 내역이 없습니다.</td></tr>";
		          		}
		
			          	// tbody에 생성된 HTML 코드 추가
			          	$(".atdTable tbody").html(html);
			          		
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
			      			        +		"<a class='page-link link' href='#' onclick='searchAttendList(" + (pi.currentPage - 1) + ");' aria-label='Previous'>"
			      			        +			"<span aria-hidden='true'>"
			      			        +				"<i class='ti ti-chevrons-left fs-4'></i>"
			      			        +			"</span>"
			     			        	+		"</a>"
			      			        +	"</li>";
	          		}
	          		
	          		for(let p=pi.startPage; p<=pi.endPage; p++){
	          			if(p == pi.currentPage){
	          				paging += "<li class='page-item'><a class='page-link link active' onclick='searchAttendList(" + p + ");' href='#'>" + p + "</a></li>";
	          			}else{
	          				paging += "<li class='page-item'><a class='page-link link' onclick='searchAttendList(" + p + ");' href='#'>" + p + "</a></li>";
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
			      			        +		"<a class='page-link link' href='#' onclick='searchAttendList(" + (pi.currentPage + 1) + ");' aria-label='Next'>"
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