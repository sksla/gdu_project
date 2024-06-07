<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 작성 틀</title>

<!-- cs editor 관련 css파일 연동 -->
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/css/samples.css">

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
                  <h4 class="fw-semibold mb-8">공지수정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">공지게시판</li>
                      <li class="breadcrumb-item" aria-current="page">공지수정</li>
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
        
                  <form id="updateForm" method="post" action="${ contextPath }/board/noticeModify.do" enctype="multipart/form-data">
                    <input type="hidden" name="boardNo" value="${ board.boardNo }">
                    <table align="center">
                      <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" value="${board.boardTitle}" required></td>
                      </tr>
                      <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" name="memName" value="${board.memName}" readonly></td>
                      </tr>
                      <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                          <input type="file" id="upfile" class="form-control-file border" name="uploadFiles" multiple>
                            <div class="d-flex"> <div>현재 업로드된 파일 : </div>
		                          <!-- 기존의 첨부파일 목록들 -->
																<c:forEach var="at" items="${ board.attachList }">
																<div>
																	<a href="${ contextPath }${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a>
																	<span class="origin_del" data-fileno="${ at.fileNo }">x</span>
																</div>
																</c:forEach>
														</div>
                        </td>
                      </tr>
                      <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                      </tr>
                      <tr>
                       <th colspan="2">
                        <!--<textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;"></textarea> -->
                        <textarea cols="80" id="testedit" name="boardContent" rows="10" data-sample="1" data-sample-short required>
		                    	${ board.boardContent }
		                  	</textarea>
			                  <div style="display:none;">
				                  <textarea cols="80" id="editor1" disabled>
												</textarea>
												</div>
                        </th>
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
          
          <script>
	          $(document).ready(function(){
		      		$(".origin_del").on("click", function(){
		      			// 삭제하고자 하는 해당 첨부파일 번호를 form submit시 넘기기 위한 작업
		      			// => 해당 form요소내에 input type="hidden" 만들어서 append
		      			// <input type="hidden" name="delFileNo" value="클릭한첨부파일번호"
		      			let inputEl = document.createElement("input");
		      			inputEl.type = "hidden";
		      			inputEl.name = "delFileNo";
		      			inputEl.value = $(this).data("fileno");
		      			
		      			document.getElementById("updateForm").append(inputEl);
		      			
		      			// 화면으로부터 사라지도록 작업
		      			$(this).parent().remove();
		      			
		      		})
	      		})
          </script>

					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- ck editor 연동 스크립트 -->
  <script src="${ contextPath }/assets/libs/ckeditor/ckeditor.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/libs/ckeditor/samples/js/sample.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/js/plugins/ckeditor-init.js" type="text/javascript"></script>
</body>
</html>