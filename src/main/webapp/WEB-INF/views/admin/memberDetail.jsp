<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_직원 상세페이지</title>
<style>
	.majorAndJob{
	  display: flex;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 주소 api -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
    
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
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">인사</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원관리_상세</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4" />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <div class="card">
            <div class="card-body">
            
              <div align="center" class="">
                <img
                  src="${contextPath}<c:out value='${m.profileUrl}' default='/assets/images/profile/user-2.jpg'/>"
                  class="shadow-warning rounded-2"
                  alt=""
                  width="72"
                  height="72"
                />
              </div> <br><br>

              <form action="${contextPath}/admin/updateMember.do" method="post">
                <input type="hidden" value="${m.memNo}" name="memNo">
                <div class="row">
                  <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">사번</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${m.memNo}" name="memNo" id="example-text-input" readonly disabled />
                    </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">아이디</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control" type="text" value="${m.memId}" name="memId" id="example-search-input" disabled />
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${m.email}" name="email" id="example-email-input" readonly disabled />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${m.memName}" name="memName" id="example-search-input" />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="tel" value="${m.phone}" name="phone" id="example-tel-input" />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <div class="majorAndJob">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                        <div class="col-sm-3">
                          <div class="input-group">
                            <select class="form-select mb-n2 major" name="majorNo" style="width: 65px;">
                            	<c:forEach var="major" items="${majorList}">
                              	<option value="${major.majorNo}">${major.majorName}</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>

                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label" style="padding-left: 50px;">직급</label>
                        <div class="col-sm-3">
                          <div class="input-group">
                            <select class="form-select mb-n2 job" name="jobNo" style="width: 65px;">
                              <c:forEach var="job" items="${jobList}">
                              	<option value="${job.jobNo}">${job.jobName}</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-lg-6">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">생년월일</label>
                      <div class="col-sm-9">
                        <input type="date" class="form-control" value="${m.birth}" name="birth" disabled />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">입사일</label>
                      <div class="col-sm-9">
                        <input type="date" class="form-control" value="${m.hireDate}" disabled>
                      </div>
                    </div>
                    <!-- 퇴사일 null아닐경우에만 보여지게 조건처리  -->
                    <c:if test="${not empty m.endDate}">         
	                    <div class="mb-4 row align-items-center">
	                      <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">퇴사일</label>
	                      <div class="col-sm-9">
	                        <input type="date" class="form-control" value="${m.endDate}" disabled>
	                      </div>
	                    </div>
                    </c:if> 
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control address" type="text" value="${m.address}" name="address" onclick="execPostCode();" id="example-search-input" >
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center addressDetail">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">상세주소</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control address" type="text" id="example-search-input" name="addressDetail" placeholder="상세주소 입력 (필수x)"/>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">서명이미지</label>
                      <div class="col-sm-9">
	                      <c:if test="${ not empty m.signUrl }">
	                          <img
	                              src="${ contextPath }${m.signUrl}"
	                              class="shadow-warning rounded-2"
	                              alt=""
	                              width="100"
	                              height="72"
	                          />
	                     	</c:if>
                      </div>
                    </div>
                  </div>
                </div>
                <br><br>
                <div align="center">
                  <button type="submit" class="btn btn-secondary">수정하기</button>
                  <button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
									<c:choose>
										<c:when test="${m.status eq 'N'}">
                  		<button type="button" class="btn btn-secondary"  data-bs-toggle="modal" data-bs-target="#outModal" onclick="outModal(${m.memNo});">퇴직처리</button>										
										</c:when>
										<c:otherwise>
                  		<button type="button" class="btn btn-secondary"  data-bs-toggle="modal" data-bs-target="#outModal" disabled>퇴직처리</button>												
										</c:otherwise>
									</c:choose>
                </div>
              </form>
              
              
              <!-- 퇴직처리 모달 & form -->
              <form action="${contextPath}/admin/outMember.do" method="get" id="outForm">
                <div class="modal fade" id="outModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">
                          퇴직처리
                        </h4>
                      </div>
                      <hr>
                      <div class="modal-body myModalBody">
                        <div class="modalText">
                          XXX님을 퇴직처리하시겠습니까?<br>
                          퇴직처리시 해당 사용자는 더이상 로그인할 수 없습니다. <br>
                        </div>
                        <br>
                        <div class="modalCheck">
                          <input type="checkbox" required> 소속된 학과의 정보가 사라집니다. <br>
                          <input type="checkbox" required> 그룹웨어 이용권한이 사라집니다.
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">확인</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">취소</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              
              <script>
              	
              	/* document ready function */
              	$(document).ready(function(){
              		
              		// 페이지 로딩시 직원의 학과 및 직급 selected 처리
              		$(".major option").each(function(){
              			if($(this).text() == '${m.majorNo}'){
              				$(this).attr("selected", true);
              			}
              		})
              		
              		$(".job option").each(function(){
              			if($(this).text() == '${m.jobNo}'){
              				$(this).attr("selected", true);
              			}
              		})
              		
              		$(".addressDetail").hide();   		
	              	
              	})
              	
              	function outModal(memNo){
              		let inputHidden = "<input type='hidden' name='memNo' value='" + memNo + "'>";
              		$("#outForm").append(inputHidden);
              	}
	
			        	/* 우편번호 찾기 api부분 */
		            function execPostCode() {
		                new daum.Postcode({
		                    oncomplete: function(data) {
		                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		        
		                       // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                       var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		        
		                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                           extraRoadAddr += data.bname;
		                       }
		                       // 건물명이 있고, 공동주택일 경우 추가한다.
		                       if(data.buildingName !== '' && data.apartment === 'Y'){
		                          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                       }
		                       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                       if(extraRoadAddr !== ''){
		                           extraRoadAddr = ' (' + extraRoadAddr + ')';
		                       }
		                       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                       if(fullRoadAddr !== ''){
		                           fullRoadAddr += extraRoadAddr;
		                       }
		        
		                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                       console.log(data.zonecode);
		                       console.log(fullRoadAddr);
		                       
		                       
		                       $("[name=addr1]").val(data.zonecode);
		                       $("[name=address]").val(fullRoadAddr);
		                       $(".addressDetail").show();
		                       
		                       /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
		                       document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
		                       document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		                   }
		                }).open();              
		            }
		            /* 우편번호 찾기 부분 끝 */
              	
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