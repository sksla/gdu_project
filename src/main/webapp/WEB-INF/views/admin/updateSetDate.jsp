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
  .split, .one, .two{
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
                  <h4 class="fw-semibold mb-8">기간설정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">설정</li>
                      <li class="breadcrumb-item" aria-current="page">기간설정</li>
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
							<br><br>
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
							<br><br>
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