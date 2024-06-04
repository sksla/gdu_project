<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 설정
</title>
<style>
  .updateSet{
    display: flex;
  }
  .one, .two{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
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
                  <h4 class="fw-semibold mb-8">학과·직급·기간 설정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">설정</li>
                      <li class="breadcrumb-item" aria-current="page">학과·직급·기간 설정</li>
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
          <!-- 학과생성-->
          <div class="card">
            <div class="card-body">
            
              <div class="updateSet">
                <h2 class="one" onclick="location.href='${contextPath}/admin/insertOneMemberEnrollForm.do'">학과설정</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="location.href='${contextPath}/admin/insertManyMember.page'">직급설정</h2>
                <h2 class="split">|</h2>
                <h2 class="three" onclick="location.href='${contextPath}/admin/insertManyMember.page'">기간설정</h2>
              </div>

              <script>
                $(document).ready(function(){
                	
              		// 학과생성
                  $(".selectCollege").attr("disabled", true);
                  $(".newMajorName").attr("disabled", true);
                  $(".createMajor").attr("disabled", true);

                  $(".majorCreateCheck").change(function(){
                    if($(this).is(":checked")){
                      $(".selectCollege").removeAttr("disabled");
                      $(".newMajorName").removeAttr("disabled");
                      $(".createMajor").removeAttr("disabled");
                    }else{
                      $(".selectCollege").attr("disabled", true);
                      $(".newMajorName").attr("disabled", true);
                      $(".createMajor").attr("disabled", true);
                    }
                  });
                  
                  // 학과수정
                  $(".selectMajor").attr("disabled", true);
                  $(".updateMajorName").attr("disabled", true);
                  $(".selectMajorStatus").attr("disabled", true);
                  $(".updateMajor").attr("disabled", true);
                  $(".majorUpdateCheck").change(function(){
                    if($(this).is(":checked")){
                      $(".selectMajor").removeAttr("disabled");
                      $(".updateMajorName").removeAttr("disabled");
                      $(".selectMajorStatus").removeAttr("disabled");
                      $(".updateMajor").removeAttr("disabled");
                    }else{
                      $(".selectMajor").attr("disabled", true);
                      $(".updateMajorName").attr("disabled", true);
                      $(".selectMajorStatus").attr("disabled", true);
                      $(".updateMajor").attr("disabled", true);
                    }
                  });
                  
                	// 직급 생성
                  $(".selectMemberLevel").hide();

                  $(".newJobName").attr("disabled", true);
                  $(".selectJobType").attr("disabled", true);
                  $(".selectProLevel").attr("disabled", true);
                  $(".selectMemberLevel").attr("disabled", true);
                  $(".createJob").attr("disabled", true);
                  
                  $(".jobCreateCheck").change(function(){
                    if($(this).is(":checked")){
                      $(".newJobName").removeAttr("disabled");
                      $(".selectJobType").removeAttr("disabled");
                      $(".selectProLevel").removeAttr("disabled");
                      $(".selectMemberLevel").removeAttr("disabled");
                      $(".createJob").removeAttr("disabled");
                    }else{
                      $(".newJobName").attr("disabled", true);
                      $(".selectJobType").attr("disabled", true);
                      $(".selectProLevel").attr("disabled", true);
                      $(".selectMemberLevel").attr("disabled", true);
                      $(".createJob").attr("disabled", true);
                    }
                  });
    
                  $(".selectJobType").change(function(){
                    if($(this).val() == "P"){
                      $(".selectMemberLevel").hide();
                      $(".selectProLevel").show();
                    }else{
                      $(".selectProLevel").hide();
                      $(".selectMemberLevel").show();
                    }
                  });
    
                  $("form").submit(function(){
                	  if($(".selectJobType").val() == "P"){
                		  $(".selectMemberLevel").removeAttr("name");
                	  }else{
                		  $(".selectProLevel").removeAttr("name");
                	  }
                  });
                  
             			// 직급수정
                  $(".selecJob").attr("disabled", true);
                  $(".updateJobName").attr("disabled", true);
                  $(".selectJobStatus").attr("disabled", true);
                  $(".updateJob").attr("disabled", true);

                  $(".jobUpdateCheck").change(function(){
                    if($(this).is(":checked")){
                      $(".selecJob").removeAttr("disabled");
                      $(".updateJobName").removeAttr("disabled");
                      $(".selectJobStatus").removeAttr("disabled");
                      $(".updateJob").removeAttr("disabled");
                    }else{
                      $(".selecJob").attr("disabled", true);
                      $(".updateJobName").attr("disabled", true);
                      $(".selectJobStatus").attr("disabled", true);
                      $(".updateJob").attr("disabled", true);
                    }
                  });
                  
                  // 강의등록기간 
                  $(".startRectureDate").attr("disabled", true);
                  $(".endRectureDate").attr("disabled", true);
                  $(".updateRetureDate").attr("disabled", true);

                  $(document).on("change", ".setRectureCheck", function(){
                    if($(this).is(":checked")){
                      $(".startRectureDate").removeAttr("disabled");
                      $(".endRectureDate").removeAttr("disabled");
                      $(".updateRetureDate").removeAttr("disabled");
                    }else{
                      $(".startRectureDate").attr("disabled", true);
                      $(".endRectureDate").attr("disabled", true);
                      $(".updateRetureDate").attr("disabled", true);
                    }
                  });
                  
                  // 학생등록기간
                  $(".startStuDate").attr("disabled", true);
                  $(".endStuDate").attr("disabled", true);
                  $(".updateStuDate").attr("disabled", true);

                  $(document).on("change", ".setStudentCheck", function(){
                    if($(this).is(":checked")){
                      $(".startStuDate").removeAttr("disabled");
                      $(".endStuDate").removeAttr("disabled");
                      $(".updateStuDate").removeAttr("disabled");
                    }else{
                      $(".startStuDate").attr("disabled", true);
                      $(".endStuDate").attr("disabled", true);
                      $(".updateStuDate").attr("disabled", true);
                    }
                  });
                  
                });
              </script>

							<!-- 학과생성 -->
              <form action="${contextPath}/admin/insertMajor.do" method="get">
                <div id="createMojor">
                  <br><br>
                  <span style="font-size: 30px; font-weight: bold; color: black;">학과생성</span>
                  <input type="checkbox" style="zoom: 2.0;" class="majorCreateCheck">
                  <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">소속단과</label>
                        <div class="col-sm-9">
                          <select class="form-select mb-n2 selectCollege" name="colNo">
                          	<c:forEach var="c" items="${colList}">
                            	<option value="${c.colNo}">${c.colName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과명</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control newMajorName" type="text" name="majorName" id="example-search-input" placeholder="학과명을 입력해주세요" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary createMajor">학과생성</button>
                    </div>
                  </div>
                </div>
              </form>
							
							<!-- 학과수정 -->
              <form action="${contextPath}/admin/updateMajor.do" method="get">
                <div id="updateMajor">
                  <br><br>
                  <span style="font-size: 30px; font-weight: bold; color: black;">학과수정</span>
                  <input type="checkbox" style="zoom: 2.0;" class="majorUpdateCheck">
                  <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">수정학과</label>
                        <div class="col-sm-9">
                          <select class="form-select mb-n2 selectMajor" name="majorNo">
                            <c:forEach var="m" items="${majorList}">
                            	<option value="${m.majorNo}">${m.majorName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">수정명</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control updateMajorName" type="text" name="majorName" id="example-search-input" placeholder="수정할 학과명을 입력해주세요" required />
                          </div>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">활성화유무</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <select class="form-select mb-n2 selectMajorStatus" name="status">
                              <option value="Y">Y</option>
                              <option value="N">N</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary updateMajor">학과수정</button>
                    </div>
                  </div>
                </div>
              </form>
              
          		<!-- 직급생성 -->
              <form action="${contextPath}/admin/insertJob.do" method="get">
                <div id="createJob">
                  <br><br>
                  <span style="font-size: 30px; font-weight: bold; color: black;">직급생성</span>
                  <input type="checkbox" style="zoom: 2.0;" class="jobCreateCheck">
                  <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급명</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control newJobName" type="text" name="jobName" id="example-search-input" placeholder="직급명을 입력해주세요" required />
                          </div>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">직급분류</label>
                        <div class="col-sm-9">
                          <select class="form-select mb-n2 selectJobType" name="jobType">
                            <option value="P">교수</option>
                            <option value="M">직원</option>
                          </select>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">상위직급</label>
                        <div class="col-sm-9">
                          <select class="form-select mb-n2 selectProLevel" name="jobLevel">
                          	<c:forEach var="j" items="${jobList}">
                          		<c:if test="${j.jobType eq 'P'}">
                            		<option value="${j.jobLevel}">${j.jobName}</option>
                            	</c:if>
                            </c:forEach>
                          </select>
                          <select class="form-select mb-n2 selectMemberLevel" name="jobLevel">
                          	<c:forEach var="j" items="${jobList}">
                          		<c:if test="${j.jobType eq 'M'}">
                            		<option value="${j.jobLevel}">${j.jobName}</option>
                            	</c:if>
                          	</c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary createJob">직급생성</button>
                    </div>
                  </div>
                </div>
              </form>
              
          		<!-- 직급수정 -->
              <form action="${contextPath}/admin/updateJob.do" method="get">
                <div id="updateJob">
                  <br><br>
                  <span style="font-size: 30px; font-weight: bold; color: black;">직급수정</span>
                  <input type="checkbox" style="zoom: 2.0;" class="jobUpdateCheck">
                  <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">수정직급</label>
                        <div class="col-sm-9">
                          <select class="form-select mb-n2 selecJob" name="jobNo">
                          	<c:forEach var="j" items="${jobListAll}">
                            	<option value="${j.jobNo}">${j.jobName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">수정명</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control updateJobName" type="text" name="jobName" id="example-search-input" placeholder="수정할 직급명을 입력해주세요" required />
                          </div>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">활성화유무</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <select class="form-select mb-n2 selectJobStatus" name="status">
                              <option value="Y">Y</option>
                              <option value="N">N</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary updateJob">직급수정</button>
                    </div>
                  </div>
                </div>
              </form>
              
              <!-- 강의등록기간 -->
              <form action="${contextPath}/admin/updateLecDate.do" method="get">
              	<input type="hidden" name="insertType" value="1">
                <div class="setRecture">
                  <span style="font-size: 30px; font-weight: bold; color: black;">강의등록기간</span>
                  <input type="checkbox" style="zoom: 2.0;" class="setRectureCheck"> <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">기존 강의등록기간</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control" type="text" value="${lecDate.startDate} ~ ${lecDate.endDate}" id="example-search-input" disabled/>
                          </div>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">신규 강의등록시작일</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control startRectureDate" type="date" name="startDate" id="example-search-input" required />
                          </div>
                        </div>
                        <br><br>
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">신규 강의등록종료일</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control endRectureDate" type="date" name="endDate" id="example-search-input" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary updateRetureDate">등록기간수정</button>
                    </div>
                  </div>
                </div>
              </form>
                
              <!-- 학생등록기간 -->
              <form action="${contextPath}/admin/updateStuDate.do" method="get">
              	<input type="hidden" name="insertType" value="2">
                <div class="setStudent">
                  <span style="font-size: 30px; font-weight: bold; color: black;">학생등록기간</span>
                  <input type="checkbox" style="zoom: 2.0;" class="setStudentCheck"> <br><br>
                  <div class="row">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">기존 학생등록기간</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control" type="text" value="${stuDate.startDate} ~ ${stuDate.endDate}" id="example-search-input" disabled/>
                          </div>
                        </div>
                      </div>
                      <div class="mb-4 row align-items-center">
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">신규 학생등록시작일</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control startStuDate" type="date" name="startDate" id="example-search-input" required />
                          </div>
                        </div>
                        <br><br>
                        <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">신규 학생등록종료일</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <input class="form-control endStuDate" type="date" name="endDate" id="example-search-input" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-secondary updateStuDate">등록기간수정</button>
                    </div>
                  </div>
                </div>
              </form>
                
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