<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료게시판 수정</title>

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
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center my-3">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">자료게시글 수정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">게시판</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">자료게시판</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자료게시글 수정</li>
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
                  <h2>게시글 수정하기</h2>
                  <br>
        
                  <form id="updateForm" method="post" action="" enctype="">
                    <table align="center">
                      <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="" value="게시판제목임ㅌㅌㅌ" required></td>
                      </tr>
                      <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" name="" value="user01" readonly></td>
                      </tr>
                      <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                          <input type="file" id="upfile" class="form-control-file border" name="">
                            현재 업로드된 파일 : 
                          <a href="" download="">flower.png</a>
                        </td>
                      </tr>
                      <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                      </tr>
                      <tr>
                        <th colspan="2"><textarea class="form-control" required name="" id="content" rows="10" style="resize:none;">게시판내용입니다.ㅋㅋㅋㅋ</textarea></th>
                      </tr>
                    </table>
                    <br>
        
                    <div align="center">
                      <button type="submit" class="btn btn-primary">수정하기</button>
                      <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                    </div>
                  </form>
                </div>
                <br><br>
              </div> 
            </div>
          </div>

          


        </div>
      </div>
	    <!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>