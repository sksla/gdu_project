<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사일정 개별등록</title>
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
  .innerOuter{    
    width:900px;
    margin:auto;
    background:white;
  }

  #enrollForm>table{width:100%;}
  #enrollForm>table *{ margin:5px;}
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
                  <h4 class="fw-semibold mb-8">일정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">학사일정개별등록</li>
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
                <h2 class="one" onclick="location.href='${contextPath}/admin/univCalendarInsertOne.page'">학사일정개별등록</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="location.href='${contextPath}/admin/univCalendarInsertMany.page'">학사일정일괄등록</h2>
              </div>
              <br><br><br><br>
              <div class="innerOuter">
                <form id="enrollForm" method="post" action="${contextPath}/admin/univCalendarInsertOne.do">
                  <table align="center">
                    <tr>
                      <th><label for="title">제목</label></th>
                      <td><input type="text" id="title" class="form-control" name="calTitle" required></td>
                    </tr>
                    <tr>
                      <th colspan="3"><textarea class="form-control" required name="calContent" id="content" rows="10" style="resize:none;" placeholder="내용을 입력해주세요"></textarea></th>
                    </tr>
                    <tr>
                      <th><label for="title">시작일</label></th>
                      <td><input type="date" class="form-control" name="startDate" required></td>
                    </tr>
                    <tr>
                      <th><label for="title">종료일</label></th>
                      <td><input type="date" class="form-control" name="endDate" required></td>
                    </tr>
                  </table>
                  <br>
      
                  <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                  </div>
                </form>
              </div>

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