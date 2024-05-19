<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료게시판 상세조회</title>
<!-- 리스트 스타일 -->
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
                  <h4 class="fw-semibold mb-8">자료게시글 상세조회</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">게시판</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="">자료게시판</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자료게시글 상세조회</li>
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
                  <a class="btn btn-secondary" style="float:right" href="">목록으로</a>
                  <br><br>
                  <table id="contentArea" align="center" class="table">
                    <tr>
                      <th width="100">제목</th>
                      <td colspan="3">게시판 제목자리여라 ..</td>
                    </tr>
                    <tr>
                      <th>작성자</th>
                      <td width="300">user01</td>
                      <th width="100">작성일</th>
                      <td>2020-03-20</td>
                    </tr>
                    <tr>
                      <th>첨부파일</th>
                      <td colspan="3">
                        <a href="" download="">파일명.jpg</a>
                      </td>
                    </tr>
                    <tr>
                      <th>내용</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr>
                      <td colspan="4"><p style="height:150px">게시판 내용자리입니다용</p></td>
                    </tr>
                  </table>
                  <br>
        
                  <div align="center">
                  <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                    <a class="btn btn-primary" href="">수정하기</a>
                    <a class="btn btn-danger" href="">삭제하기</a>
                  </div><br><br>
        
                  <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
                  <table id="replyArea" class="table" align="center">
                    <thead>
                      <tr>
                        <th colspan="2">
                          <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary">등록하기</button></th>
                      </tr>
                      <tr>
                        <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th>user02</th>
                        <td>댓글입니다.너무웃기다앙</td>
                        <td>2020-04-10</td>
                      </tr>
                      <tr>
                        <th>user01</th>
                        <td>많이봐주세용</td>
                        <td>2020-04-08</td>
                      </tr>
                      <tr>
                        <th>admin</th>
                        <td>댓글입니다ㅋㅋㅋ</td>
                        <td>2020-04-02</td>
                      </tr>
                    </tbody>
                  </table>
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