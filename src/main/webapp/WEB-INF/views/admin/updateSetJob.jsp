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
  .one, .two, .three{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
  }
  .split, .one, .three{
    color: rgb(185, 181, 181);
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
                  <h4 class="fw-semibold mb-8">직급설정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">설정</li>
                      <li class="breadcrumb-item" aria-current="page">직급설정</li>
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
                <h2 class="one" onclick="location.href='${contextPath}/admin/majorSetting.do'">학과설정</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="location.href='${contextPath}/admin/jobSetting.do'">직급설정</h2>
                <h2 class="split">|</h2>
                <h2 class="three" onclick="location.href='${contextPath}/admin/dateSetting.do'">기간설정</h2>
              </div>

              <script>
                $(document).ready(function(){
                	
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

                });
              </script>

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
							<br><br>
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