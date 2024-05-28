<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약 상세페이지</title>
<style>
  .majorAndJob{
    display: flex;
  }
  .selectDate{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
  }
  .selectDate > table{
    font-weight: bold;
    font-size: 25px;
    color: black;
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
                  <h4 class="fw-semibold mb-8">예약</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자원 예약내역</li>
                      <li class="breadcrumb-item" aria-current="page">상세내역</li>
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

              <br><br><br><br><br>
              <div class="row">
                <div class="col-lg-6 mb-4 mb-lg-0">
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">자원명</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${r.resourceList[0].resName}" id="example-text-input" readonly/>
                    </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">신청자</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${r.memberList[0].memName} / ${r.memberList[0].majorNo}" id="example-search-input" readonly />
                    </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">예약사유</label>
                    <div class="col-sm-9">
                      <textarea name="" id="" class="form-control" readonly style="resize: none;">${r.revReason}</textarea>
                    </div>
                  </div>    
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">사용기간</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${r.revDate}" id="example-email-input" readonly />
                    </div>
                  </div>
                </div>
                
                <div class="col-lg-6">
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">타입</label>
                    <div class="col-sm-9">
                      <input class="form-control" type="text" value="${r.resourceList[0].resType}" id="example-email-input" readonly />
                    </div>
                  </div>
                  <div class="mb-4 row align-items-center">
                    <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">비고</label>
                    <div class="col-sm-9">
                    	<c:choose>
                    		<c:when test="${r.resourceList[0].resType == '비품'}">
                      		<input class="form-control reservationCount" type="text" value="${r.revCount}개 대여" id="example-email-input" readonly />
                      		<input type="hidden" class="resNo" value="${r.resourceList[0].resNo}">
                    		</c:when>
                    		<c:otherwise>
                      		<input class="form-control" type="text" value="${r.resourceList[0].resGps}" id="example-email-input" readonly />
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                  </div>     
                  <div class="mb-4 row align-items-center">
                    <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">상태</label>
                    <div class="col-sm-9">
                      <div class="input-group">
                        <input class="form-control" type="text" value="${r.status}" id="example-search-input" readonly/>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <br><br>

              <div align="center">
                <button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
                <c:if test="${r.status == '미반납'}">
                	<button type="button" class="btn btn-secondary" onclick="resourceReturn(${r.revNo});">반납처리</button>
                </c:if>
              </div>
              
              <script>
              	// 미반납 비품 반납처리 함수
              	function resourceReturn(revNo){
              		// 대여갯수 추출
              		let revCountText = $(".reservationCount").val();
              		let stock = revCountText.match(/\d+/)[0];
              		let resNo = $(".resNo").val();
              		console.log(resNo);
              		if(confirm("반납처리 하시겠습니까??")){
              			location.href = "${contextPath}/admin/resourceReturn.do?revNo=" + revNo + "&stock=" + stock + "&resNo=" + resNo;
              		}
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