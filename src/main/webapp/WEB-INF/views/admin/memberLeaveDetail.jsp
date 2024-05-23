<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 연차관리 상세페이지</title>
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
                      <li class="breadcrumb-item" aria-current="page">상세정보</li>                      
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

              <div class="row">
                <div class="col-lg-6 mb-4 mb-lg-0">
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${memberVac.memberList[0].memName}" id="example-text-input" disabled/>
                  </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${memberVac.memberList[0].majorNo}" id="example-search-input"  disabled />
                    </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급</label>
                    <div class="col-sm-9">
                      <div class="input-group">
                        <input class="form-control" type="text" value="${memberVac.memberList[0].jobNo}" id="example-search-input"  disabled />
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-6">
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">사용연차</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" value="${memberVac.vacUsed}일" disabled>
                    </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">잔여연차</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" value="${memberVac.memberList[0].leaveCount}일" disabled>
                    </div>
                  </div>

                </div>
              </div>
              <br><br>
              
              <table class="table border text-nowrap mb-0 align-middle">
                <thead class="text-dark fs-3" align="center">
                  <tr>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">번호</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">사용기간</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">비고</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">종류</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">연차사유</h6>
                    </th>
                  </tr>
                </thead>
                <tbody align="center">
                	<c:forEach var="v" items="${vacList}">
                		<input type="hidden" value="${v.vacReason}">
		                <tr class="leaveReason">
		                  <th>
		                    <h6 class="fs-2 mb-0">${v.vacNo}</h6>
		                  </th>
		                  <th>
		                    <h6 class="fs-2 mb-0">${v.startDate} ~ ${v.endDate}</h6>
		                  </th>
		                  <th>
		                    <h6 class="fs-2 mb-0">${v.vacUsed}일 사용</h6>
		                  </th>
		                  <th>
		                    <h6 class="fs-2 mb-0">${v.vacType}</h6>
		                  </th>
		                  <th>
		                    <h6 class="fs-2 mb-0">
		                      <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#leaveContent${v.vacNo}" onclick="vacReasonDetail();">조회</button>
		                    </h6>
		                  </th>
		                </tr>
			              <!-- 연차사유 조회 모달 -->
			              <div class="modal fade" id="leaveContent${v.vacNo}" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
			                <div class="modal-dialog modal-dialog-centered">
			                  <div class="modal-content">
			                    <div class="modal-header d-flex align-items-center">
			                      <h4 class="modal-title" id="myLargeModalLabel">
			                        연차사유 (${v.vacType})
			                      </h4>
			                    </div>
			                    <hr>
			                    <div class="modal-body myModalBody">
			                      <div class="modalText vacReason">
			                      	<h4>
			                      		${v.vacReason}
			                      	</h4>
			                      </div>
			                      <br><br>
			                    </div>
			                    <div class="modal-footer">
			                      <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">닫기</button>
			                    </div>
			                  </div>
			                </div>
			              </div>
	                </c:forEach>
                </tbody>
              </table>

              <br><br>

              <div align="center">
                <button type="button" class="btn btn-secondary"  data-bs-toggle="modal" data-bs-target="#addLeaveModal">연차(보상)추가</button>
                <button type="button" class="btn btn-secondary">뒤로가기</button>
              </div>


              <!-- 연차보상 추가 모달-->
              <form action="" method="">
                <div class="modal fade" id="addLeaveModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">
                          연차(보상)추가
                        </h4>
                      </div>
                      <hr>
                      <!-- 직접입력 체크박스 체크 유무에 따라 disabled 지정 이거 좀 수정해야됨 -->
                      <div class="modal-body myModalBody">
                        <div class="modalText">
                          종류 : 
                          <select class="form-select mb-n2 addSelectLeave" name="" style="width: 180px;">
                          	<c:forEach var="v" items="${vacType}">
                            	<option value="${v.vacTypeDate}">${v.vacType}(${v.vacTypeDate}일)</option>
                            </c:forEach>
                          </select>
                        </div>
                        <br><br>
                        <div class="modalCheck">
                          <input type="checkbox" class="addSelfLeave"> 직접입력 <br>
                          <div style="display: flex;">
                            추가일수 : <input type="number" class="form-control addLeaveDate" name="" placeholder="추가 일수를 입력해주세요. (숫자만)" style="width: 280px;"> <br>
                          </div>
                          <br>
                          <div style="display: flex;">
                            추가사유 : <textarea class="form-control addLeaveReason" rows="3" placeholder="추가 사유를 입력해주세요" style="width: 280px; resize: none;"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">추가</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">닫기</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>

              <script>
              
                $(document).ready(function() {
									// 연차 추가 최초는 비활성화
                  $(".addLeaveDate").attr("disabled", true);
                  $(".addLeaveReason").attr("disabled", true);
                  
                  // 직접입력 체크시 활성화
                  $('.addSelfLeave').change(function() {
                    if ($(this).is(':checked')) {
                      $('.addLeaveReason').attr('disabled', false);
                      $('.addLeaveDate').attr('disabled', false);
                      $('.addSelectLeave').attr('disabled', true);
                    } else {
                      $('.addLeaveReason').attr('disabled', true);
                      $('.addLeaveDate').attr('disabled', true);
                      $('.addSelectLeave').attr('disabled', false);
                    }
                  });                    
                  
                });
                
                // 조회버튼 클릭시 실행되는 함수
                function vacReasonDetail(){
                	
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