<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    /* div 스타일 */
    .lec_wrap{
      width:100%;
      max-height: 1100px;
      margin: auto;
      display: flex;
      flex-direction: column;
    }
    .lec_content1{
      height: 100px;
      display: flex;
    }

    .lec_content2{
      height: 800px;
      display:flex;
    }
  
    .lec_content3{
      height: 100px;
      display:flex;
    }
  
  </style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/stuLecSidebar.jsp"/>
    
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
              <h4 class="fw-semibold mb-8">강의목록</h4>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a class="text-muted text-decoration-none" href="../main/index.html"
                      >Home</a
                    >
                  </li>
                  <li class="breadcrumb-item" aria-current="page">강의목록</li>
                </ol>
              </nav>
            </div>
            <div class="col-3">
              <div class="text-center mb-n5">
                <img
                  src=""
                  alt=""
                  class="img-fluid mb-n4"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 페이지 내용 -->
      <div class="card">
        <div class="card-body">
          <div class="lec_wrap">
            <div class="lec_content1">
             <h5 class="fw-semibold mb-8">강의목록</h5>
            </div>
            <!-- 강의 등록 모달 시작 -->
            <div class="modal fade" id="samedata-modal" tabindex="-1" aria-labelledby="exampleModalLabel1">
              <div class="modal-dialog" role="document">
                <form method="post" action="${contextPath}/lec/enrollLec.do"  enctype="multipart/form-data">
                	<div class="modal-content">
                  	<div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="exampleModalLabel1">
                      강의등록
                    </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  	</div>
	                  <div class="modal-body">
	                  	<div class="mb-3">
	                    	<label for="lec_name" class="control-label">강의명</label><!-- 드롭다운으로 바꾸기 -->
	                    	<select class="form-select" id="lectureList" name="lecNo">
	                        <c:forEach var="lec" items="${lecList}">
	                        	<option value="${lec.lecNo}">${lec.lecName}</option>
	                        </c:forEach> 
                        </select>
                      </div>
                      <div class="mb-3">
						            <label for="mem_no" class="control-label">담당교수</label>
						            <select class="form-select" id="profList1" name="memNo">
	                        <c:forEach var="prof" items="${profList}">
	                        	<option value="${prof.memNo}">${prof.memName}</option>
	                        </c:forEach> 
                        </select>
						          </div>
	                 		<div class="mb-3">
                        <label for="lec_date" class="control-label">강의기간</label>
                        <input type="date" class="form-control" id="start_date1"  name="startDate">
                        &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                        <input type="date" class="form-control" id="end_date1" name="endDate">
                      </div>
                      <div class="mb-3">
                        <label for="lec_date1" class="control-label">요일</label><br><!-- 요일로바꾸고 -->
                        <input type="radio" id="mon1" name="lectureDate" value="월"><label for="scales">월</label>
                        <input type="radio" id="tue1" name="lectureDate" value="화"><label for="scales">화</label>
                        <input type="radio" id="wed1" name="lectureDate" value="수"><label for="scales">수</label>
                        <input type="radio" id="thu1" name="lectureDate" value="목"><label for="scales">목</label>
                        <input type="radio" id="fri1" name="lectureDate" value="금"><label for="scales">금</label>
                        <input type="radio" id="sat1" name="lectureDate" value="토"><label for="scales">토</label>
                      </div>
                      <div class="mb-3">
                        <label for="lec_time" class="control-label">강의시간</label><!-- 교시로 바꾸기 -->
                        <select class="form-select" id="start_time1" name="startTime">
	                        	<option value="1">1교시</option>
	                        	<option value="2">2교시</option>
	                        	<option value="3">3교시</option>
	                        	<option value="4">4교시</option>
	                        	<option value="5">5교시</option>
	                        	<option value="6">6교시</option>
	                        	<option value="7">7교시</option>
	                        	<option value="8">8교시</option>
	                        	<option value="9">9교시</option>
	                        	<option value="10">10교시</option>
	                        	<option value="11">11교시</option>
	                        	<option value="12">12교시</option>
                        </select>
                        &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                        <select class="form-select" id="end_time1" name="endTime">
	                        	<option value="1">1교시</option>
	                        	<option value="2">2교시</option>
	                        	<option value="3">3교시</option>
	                        	<option value="4">4교시</option>
	                        	<option value="5">5교시</option>
	                        	<option value="6">6교시</option>
	                        	<option value="7">7교시</option>
	                        	<option value="8">8교시</option>
	                        	<option value="9">9교시</option>
	                        	<option value="10">10교시</option>
	                        	<option value="11">11교시</option>
	                        	<option value="12">12교시</option>
                        </select>   
                      </div>
		                  <div class="mb-3">
		                    <label for="res_no" class="control-label">강의실</label><!-- 쓸수 있는 강의실 다 불러오기 -->
		                    <select class="form-select" id="resList1" name="resNo">
		                    	<c:forEach var="res" items="${resList}">
		                      	<option value="${res.resNo}">${res.resName}</option>
		                    	</c:forEach> 
	                      </select>
		                  </div>
		                	<div class="modal-footer">
			                	<button type="submit" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary" id="enrollButton">등록하기</button>
		                	</div>
		              	</div>
	             		</div>
                </form>
              </div>
            </div>
            <!-- 강의 등록 모달 끝 -->
          </div>
						<!-- 강의 리스트 시작 -->
            <div class="lec_content2">
              <div class="list">
                <div class="card-body p-4" style="justify-content: center;">
	                <div class="d-flex flex-row justify-content-between">
		              	<div class="lec"></div>
			              <div class="col-3">
			                <button type="button" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary"
			                data-bs-toggle="modal" data-bs-target="#samedata-modal" data-bs-whatever="@mdo">강의등록</button>
			              </div>
            			</div>
                  <div class="table-responsive mb-4" >
	                  <form id="lecListForm" method="get" action="${contextPath}/lec/lecList.do">
	                    <table class="table border text-nowrap mb-0 align-middle app_doc_table overflow-hidden">
	                      <thead class="text-dark fs-4">
	                        <tr>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">번호</h6>
	                          </th>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">강의코드</h6>
	                          </th>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">개설학과</h6>
	                          </th>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">과목명</h6>
	                          </th>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">담당교수</h6>
	                          </th>
	                          <th>
	                            <h6 class="fs-4 fw-semibold mb-0">강의실</h6>
	                          </th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                      	<c:choose>
	                      		<c:when test="${ empty lecList }">
	                      			<tr>
	                      				<td colspan="6">등록된 강의가 없습니다.</td>
	                      			</tr>
	                      		</c:when>
		                      	<c:otherwise>
		                      		<c:forEach var="openLec" items="${openLecList}" varStatus="status">
		                      			<tr onclick="detail('${openLec.openLecNo}');">
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${status.count}</p>
				                          </td>
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${openLec.lecNo}</p>
				                          </td>
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${openLec.majorName}</p>
				                          </td>
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${openLec.lecName}</p>
				                          </td>
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${openLec.memName}</p>
				                          </td>
				                          <td>
				                            <p class="mb-0 fw-normal fs-4">${openLec.resName}</p>
				                          </td>
				                        </tr>
		                      		</c:forEach>
		                      	</c:otherwise>
													</c:choose>   
	                      </tbody>   
	                    </table>
                    </form>
                  </div>
                     
                </div>
              </div>
            </div>
            <!-- 강의 리스트 끝-->
            <!-- 강의 상세 모달 시작 -->
						<div class="modal fade" id="lecDetail-modal" tabindex="-1" aria-labelledby="exampleModalLabel1">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header d-flex align-items-center">
						        <h4 class="modal-title" id="exampleModalLabel1">
						          강의정보
						        </h4>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <form id="lecDetailForm" method="post" action="${ contextPath }/lec/modifyLec.do">
						          <div class="mb-3">
						            <label for="lec_no" class="control-label">강의코드</label>
						            <input type="text" class="form-control" name="lecNo" id="lec_no" value="" readonly/>
						            <input type="hidden" class="form-control" name="openLecNo" id="open_lec_no" value=""/>
						          </div>
						          <div class="mb-3">
						            <label for="lec_name" class="control-label">강의명</label>
						            <input type="text" class="form-control" name="lecName" id="lec_name" value=""/>
						          </div>
						          <div class="mb-3">
						            <label for="mem_no" class="control-label">담당교수</label>
						            <input type="text" class="form-control" name="memName" id="mem_name" value="" readonly/>
						            <input type="hidden" class="form-control" name="memNo" id="mem_no" value=""/>
						          </div>
						          <div class="mb-3">
						            <label for="lec_date" class="control-label">강의기간</label>
						            <input type="date" class="form-control" name="startDate" id="start_date" value="">
						            <label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>
						            <input type="date" class="form-control" name="endDate" id="end_date" value="">
						          </div>
						          <div class="mb-3">
                        <label for="lec_date" class="control-label">요일</label><br>
                        <input type="radio" id="mon" name="lectureDate" value="월"><label for="scales">월</label>
                        <input type="radio" id="tue" name="lectureDate" value="화"><label for="scales">화</label>
                        <input type="radio" id="wed" name="lectureDate" value="수"><label for="scales">수</label>
                        <input type="radio" id="thu" name="lectureDate" value="목"><label for="scales">목</label>
                        <input type="radio" id="fri" name="lectureDate" value="금"><label for="scales">금</label>
                        <input type="radio" id="sat" name="lectureDate" value="토"><label for="scales">토</label>
                      </div>
						          <div class="mb-3">
						          	<label for="lec_time" class="control-label">강의시간</label>
						         		<select class="form-select" id="start_time" name="startTime">
	                        	<option value="1">1교시</option>
	                        	<option value="2">2교시</option>
	                        	<option value="3">3교시</option>
	                        	<option value="4">4교시</option>
	                        	<option value="5">5교시</option>
	                        	<option value="6">6교시</option>
	                        	<option value="7">7교시</option>
	                        	<option value="8">8교시</option>
	                        	<option value="9">9교시</option>
	                        	<option value="10">10교시</option>
	                        	<option value="11">11교시</option>
	                        	<option value="12">12교시</option>
                        </select>
                        &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                        <select class="form-select" id="end_time" name="endTime">
	                        	<option value="1">1교시</option>
	                        	<option value="2">2교시</option>
	                        	<option value="3">3교시</option>
	                        	<option value="4">4교시</option>
	                        	<option value="5">5교시</option>
	                        	<option value="6">6교시</option>
	                        	<option value="7">7교시</option>
	                        	<option value="8">8교시</option>
	                        	<option value="9">9교시</option>
	                        	<option value="10">10교시</option>
	                        	<option value="11">11교시</option>
	                        	<option value="12">12교시</option>
                        </select>  
						          </div>
						          <div class="mb-3">
		                    <label for="res_no" class="control-label">강의실</label><!-- 쓸수 있는 강의실 다 불러오기 -->
		                    <select class="form-select" id="resList" name="resNo">
		                    	<c:forEach var="res" items="${resList}">
		                      	<option value="${res.resNo}">${res.resName}</option>
		                    	</c:forEach> 
	                      </select>
		                  </div>
						        </form>
						      </div>
						      <div class="modal-footer">
						        <button type="submit" form="lecDetailForm" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary" id="modifyButton" onclick="return frmSubmit(1);">수정하기</button>
						        <button type="submit" form="lecDetailForm" class="btn mb-1 px-4 fs-4 bg-primary-subtle text-primary" id="deleteButton" onclick="frmSubmit(2);">삭제하기</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- 강의 상세 모달 끝 -->
        </div>
      </div>

    </div>
  </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
  	// 교수목록
  	$(document).ready(function() {
  		console.log('${openLec}');
  		
	    // 첫 번째 select 요소가 변경될 때마다 이벤트를 실행
	    $('#majorList').change(function() {
	        // 선택된 값을 가져오기
	        var selectedValue = $(this).val();
	
	        // AJAX를 통해 서버에 요청하여 두 번째 select 요소의 옵션을 업데이트
	        $.ajax({
	            url: '${contextPath}/lec/enrollLec.do', // 서버의 엔드포인트를 지정
	            type: 'POST', // GET 또는 POST 요청 중 선택합니다.
	            data: { selectedValue: selectedValue }, // 선택된 값을 서버에 전달
	            success: function(response) {
	                // 서버에서 반환된 데이터를 기반으로 두 번째 select 요소를 업데이트
	                $('#memList').html(response);
	            },
	            error: function(xhr, status, error) {
	                // 오류 처리를 수행
	                console.error(xhr.responseText);
	            }
	        });
	    });
		});

	
	// 페이지가 로드되면 실행될 JavaScript 코드
  document.addEventListener('DOMContentLoaded', function() {
    // 등록하기 버튼 요소를 가져옴
    var enrollButton = document.getElementById('enrollButton');

    // 등록하기 버튼에 클릭 이벤트 리스너 추가
    enrollButton.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 동작 중지

      // 폼 요소를 가져옴
      var form = document.querySelector('#samedata-modal form');

      // 폼을 서버로 제출
      form.submit();
    });
  });
	
  // 강의목록
	
	//JavaScript로 선택된 값에 따라 hidden input 업데이트
	document.getElementById("lectureList").addEventListener("change", function() {
	    var selectedValue = this.value;
	    document.getElementById("selectedLecNo").value = selectedValue;
	});
  
  // 강의 상세정보 ajax 호출
  function detail(openLecNo){
	  $.ajax({
		  url:'${contextPath}/lec/lecDetail.do',
		  method:'GET',
		  data:{openLecNo:openLecNo
			},
			success: function(result){
				console.log(result);
				// 제ㅇㅣ쿼리방식
				// input type=text, date들 value에 해당하는 값 넣기
				$("#open_lec_no").val(result.openLecNo);
				$("#lec_no").val(result.lecNo);
				//document.getElemenById("lec_no").value = result.lecNo;
				$("#lec_name").val(result.lecName);
				$("#mem_name").val(result.memName);
				$("#mem_no").val(result.memNo);
				$("#start_date").val(result.startDate);
				$("#end_date").val(result.endDate);

				// 조회해온 요일이랑 같은 value값을 가진 checkbox 체크되게 (나머지 체크해제 되게) 삼항연산자
				$("#mon").prop("checked", result.lectureDate=="월" ? true : false);
				$("#tue").prop("checked", result.lectureDate=="화" ? true : false);
				$("#wed").prop("checked", result.lectureDate=="수" ? true : false);
				$("#thu").prop("checked", result.lectureDate=="목" ? true : false);
				$("#fri").prop("checked", result.lectureDate=="금" ? true : false);
				$("#sat").prop("checked", result.lectureDate=="토" ? true : false);
				
				// select안 옵션도 같은 value값 가진 option요소 selected 속성 부여
				$("#start_time").val(result.startTime);
				$("#end_time").val(result.endTime);
	
				$("#max_student").val(result.maxStudent);
				$("#resList").val(result.resNo);
				
				$("#lecDetail-modal").modal("show");
				
				
			},
			error: function(xhr, status, error) {
				console.error(xhr, status, error); // 에러 처리
				console.log("ajax 통신실패");
	  	}
  	});	
	  
	  // 수정, 삭제버튼 클릭시
	  function frmSubmit(num){
  		$("#lecDetailForm").attr("action", num==1 ? "${contextPath}/lec/modifyLec.do" : "${contextPath}/lec/deleteLec.do");	
  	}  
	  
	  $(document).ready(function() {
		    $("#modifyButton").click(function() {
		        frmSubmit(1);
		    });

		    $("#deleteButton").click(function() {
		        frmSubmit(2);
		    });
		});
  }

	</script>
</body>
</html>