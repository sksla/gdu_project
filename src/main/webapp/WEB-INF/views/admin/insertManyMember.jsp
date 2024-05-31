<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 일괄등록</title>
<style>
  .memberLeave{
    display: flex;
  }
  .one, .two{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
  }
  .split, .one{
    color: rgb(185, 181, 181);
  }
  .sample{color: blue;}
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
            
              <div class="row align-items-center my-3">
              
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">인사</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원일괄등록</li>
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

	              <div class="memberLeave">
	                <h2 class="one" onclick="location.href='${contextPath}/admin/insertOneMemberEnrollForm.do'">직원개별등록</h2>
	                <h2 class="split">|</h2>
	                <h2 class="two" onclick="location.href='${contextPath}/admin/insertManyMember.page'">직원일괄등록</h2>
	              </div>

              	<form action="${contextPath}/admin/insertManyMember.do" method="post" enctype="multipart/form-data">
	                <br><br><br><br>
	                <h3>직원일괄등록</h3>
	                <div style="width: 400px;"><hr></div>
	                <h5>파일을 통해 대량의 직원을 일괄 등록할 수 있습니다.</h5>
	                <h5>등록 양식을 다운로드 받아, 직원을 일괄등록하세요.</h5>
	                <a href="${contextPath}/resources/insert/InsertManyMember.xlsx" class="sample">샘플다운로드</a>
									
	                <br><br><br><br><br>
	
	                <h3>직원등록 파일 작성방법</h3>
	                <div style="width: 400px;"><hr></div>
	                <h5>1. 비밀번호는 기본값 1111로 생성됩니다.	</h5>
	                <h5>2. 휴대전화번호는 010-xxxx-xxxx 양식으로 입력해야 합니다.</h5>
	                <h5>3. 입사일은 YYYY-MM-DD 로 입력하셔야합니다.</h5>
	                <h5>4. 주민등록번호는 xxxxxx-xxxxxxx 형식으로 입력해야 합니다. (- 포함)</h5>
	                <h5>5. 사번은 자동으로 기입됩니다.</h5>		
	                <h5>6. 이메일은 @gdu.com으로 끝나야 합니다.</h5>		
	
	                <br><br><br><br><br>
	
	                <span style="font-size: 22px; color: black;">대상파일선택</span>
	                <input type="file" required class="form-control" name="file"style="width: 500px;" accept=".xlsx, .xls">
	
	                <br><br><br>
	
	                <div align="center">
	                  <button type="submit" class="btn btn-secondary">등록하기</button>
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