<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 상세페이지</title>
<style>
  .useContent{
    width: 600px;
    height: 500px;
    max-height: 700px;
    overflow-y: scroll;
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
                  <h4 class="fw-semibold mb-8">자원</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자원관리</li>
                      <li class="breadcrumb-item" aria-current="page">상세</li>
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

              <form action="" method="post">
                <div class="row">
                  <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">고유번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${r.resNo}" id="example-text-input" disabled />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">자원명</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${r.resName}" id="example-search-input" disabled />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">타입</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="${r.resType}" id="example-search-input" disabled />
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">위치</label>
                      <div class="col-sm-9">         	
                     		<input class="form-control" type="text" value="${r.resGps}" id="example-search-input" disabled />
                      </div>
                    </div>
                    <c:if test="${r.stock != '0'}">  
	                    <div class="mb-4 row align-items-center">
	                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">수량</label>
	                      <div class="col-sm-9">         	
	                     		<input class="form-control" type="text" value="${r.stock}개" id="example-search-input" disabled />
	                      </div>
	                    </div>
                    </c:if>  
                  </div>
                </div>

                <br>
                <div class="form-control useContent">
                  <br>
                  <h3>사용기록</h3><hr>
                  <div class="use">
                  	<c:choose>
                  		<c:when test="${empty reserList}">
                  			<h5>${r.resName}를(을) 사용한 기록이 없습니다.</h5><br>
                  		</c:when>
                  		<c:otherwise>
		                  	<c:forEach var="re" items="${reserList}">
			                    <h5>-${re.memNo} / ${re.memberList[0].majorNo} / ${re.revDate} (${re.startTime}시 ~ ${re.endTime}시)</h5><br>
		                    </c:forEach>
                  		</c:otherwise>
                  	</c:choose>
                  </div>
                </div>
                <br><br><br>
                <div align="center">
                  <button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
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