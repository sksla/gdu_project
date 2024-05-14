<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 개별등록</title>
<style>
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
</style>
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
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원개별등록</li>
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

              <div class="memberLeave">
                <h2 class="one">직원개별등록</h2>
                <h2 class="split">|</h2>
                <h2 class="two">직원일괄등록</h2>
              </div>

              <br><br><br>
              <form action="${contextPath}/admin/insertOneMember.do" method="post">
                <!-- 비번1111, 연차12개 인풋타입히든-->
                <div class="row">
                  <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="memName" id="example-search-input" placeholder="이름을 입력해주세요" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">아이디</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="memId" id="example-text-input" placeholder="아이디를 입력해주세요" required/>
                    </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <select class="form-select mb-n2" name="majorNo" style="width: 130px;">
                            <c:forEach var="m" items="${majorList}">
                            	<option value="${m.majorNo}">${m.majorName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <select class="form-select mb-n2" name="jobNo" style="width: 130px;">
                            <c:forEach var="j" items="${jobList}">
                            	<option value="${j.jobNo}">${j.jobName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="tel" name="phone" id="example-tel-input" placeholder="010-xxxx-xxxx" required/>
                      </div>
                    </div>
                  </div>

                  <div class="col-lg-6">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="email" id="example-email-input" placeholder="아이디@gdu.com" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control" type="text" id="example-search-input" name="address" placeholder="주소를 입력해주세요" required/>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">급여</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="" id="example-email-input" name="salary" placeholder="숫자만 입력" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">주민등록번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="" id="example-email-input" name="resident" placeholder="-포함 입력" required/>
                      </div>
                    </div>
                  </div>
                </div>

                <br><br>

                <div align="center">
                  <button type="submit" class="btn btn-secondary">등록하기</button>
                  <button type="button" class="btn btn-secondary">뒤로가기</button>
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