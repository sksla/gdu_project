<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 상세페이지</title>
<style>
    
    .innerOuter{    
      width:900px;
      margin:auto;
      background:white;
    }

    table *{margin:5px;}
    table{width:100%;}
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/boardSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">공지게시판</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">공지게시판</li>
                      <li class="breadcrumb-item" aria-current="page">상세페이지</li>
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

              <div class="content">
                <br><br>
                <div class="innerOuter">
                  <h2>게시글 상세보기</h2>
                  <br> 
                  <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                  <a class="btn btn-secondary" style="float:right" href="${ contextPath }/board/noticeList.do">목록으로</a>
                  <br><br>
                  <table id="contentArea" align="center" class="table">
                    <tr>
                      <th width="100">제목</th>
                      <td colspan="3">${ board.boardTitle }</td>
                    </tr>
                    <tr>
                      <th>작성자</th>
                      <td width="300">${ board.memName }</td>
                      <th width="100">작성일</th>
                      <td>${ board.registDate }</td>
                    </tr>
                    <tr>
                      <th>첨부파일</th>
                      <td colspan="3">
                        <c:forEach var="at" items="${ board.attachList }">
                        	<a href="${ contextPath }${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a><br>
                      	</c:forEach> 
                      </td>
                    </tr>
                    <tr>
                      <th>내용</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr>
                      <td colspan="4"><p style="height:150px">${ board.boardContent }</p></td>
                    </tr>
                  </table>
                  <br>
                  <div align="center">
	        					<c:if test="${ loginUser.memId eq board.memId }">
		                  <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
		                  <form id="frm" action="" method="post" align="center">
		                  	<input type="hidden" name="no" value="${board.boardNo }">
		                    <button type="submit" class="btn btn-primary" onclick="frmSubmit(1);">수정하기</button>
		                    <button type="submit" class="btn btn-danger" onclick="frmSubmit(2);">삭제하기</button>
		                  </form>
		                  <br><br>
		                  <script>
						            	function frmSubmit(num){
						            		$("#frm").attr("action", num==1 ? "${contextPath}/board/noticeModifyForm.page"
						            																		: "${contextPath}/board/noticeRemove.do");	
						            	}
												</script>
	                  </c:if>
 									</div>
                </div>
                <br><br>
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