<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료게시판 등록</title>

<!-- cs editor 관련 css파일 연동 -->
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/css/samples.css">

<!-- 등록 스타일 -->
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
                  <h4 class="fw-semibold mb-8">자료게시글 작성</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">게시판</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/board/dataBoardList.page">자료게시판</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자료게시글 작성</li>
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
                  <h2>자료게시글 작성하기</h2>
                  <br>
                  <form id="enrollForm" method="post" action="${ contextPath }/board/dataRegist.do" enctype="multipart/form-data">
                    <table align="center">
                      <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required maxlength="30" placeholder="제목 입력(30자 이내)"></td>
                      </tr>
                      <tr>
                        <th><label for="writer">작성자</label></th>
                        <td>
                        	<input type="text" id="writer" class="form-control" value="${ loginUser.memName }" name="memName" readonly>
                        	
                       	</td>
                      </tr>
                      <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                        	<input type="file" id="upfile" class="form-control-file border" name="uploadFiles" multiple required>
                       	</td>
                      </tr>
                      <tr>
                      	<th></th>
                      	<td>
                      		<div class="fileList_wrap" style="border:1px solid lightgray; display:none;">
	                        	<ul id="fileList" class="file-list"></ul>
                      		</div>
                      	</td>
                      </tr>
                      <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                      </tr>
                      <tr>
                        <th colspan="2">
                        <!--<textarea class="form-control" required name="" id="content" rows="10" style="resize:none;"></textarea>-->
                       	<textarea cols="80" id="testedit" name="boardContent" rows="10" data-sample="1" data-sample-short style="resize:none;" required placeholder="내용 입력">
		                    내용입력
		                    </textarea>
		                  	<div style="display:none;">
				                  <textarea cols="80" id="editor1" style="resize:none;" placeholder="내용 입력" disabled>
													
													</textarea>
												</div>
                       </th>
                      </tr>
                    </table>
                    <br>
        
                    <div align="center">
                      <button type="submit" onclick="return registValidate();" class="btn btn-primary">등록하기</button>
                      <button type="reset" class="btn btn-danger">취소하기</button>
                    </div>
                  </form>
                  
                  <script>
                  
									
										$(document).ready(function(){
											
											let totalSize = 0;
											
											$("#upfile").change(function(evt){
												
												
												// input:file 요소에 change이벤트 발생됨
												// 현재이벤트가발생된요소 =>evt.target	// <input type='file'>
												// 현재선택된파일들 evt.target.files	// FileList {0:File, 1:File, 2:File, ...}
												
												let fileNames = "";
												const files= evt.target.files;	// FileList {0:File, 1:File, 2:File, ..., length:x}
												
												for(let i=0; i<files.length; i++){
													if(files[i].size > 10*1024*1024){	// 첨부파일 한개의 크기가 10MB를 초과했을 경우
														alert("첨부파일의 최대 크기는 10MB까지 입니다.");
														evt.target.value="";
														return;
													}
													totalSize += files[i].size;
													if(totalSize > 100*1024*1024){// 누적된 첨부파일의 전체 크기가 100MB를 초과했을 경우
														alert("전체 첨부파일의 최대 크기는 100MB까지 입니다.");
														evt.target.value="";
														return;
													}
													
													fileNames += "<li>" + files[i].name + "</li>";
													
												}
												
												$("#fileList").html(fileNames);
												
												$(".fileList_wrap").css("display", (files.length > 0 ? "block" : "none" ));
												
											})
										})
										
									// CKEDITOR.replace('testedit');
										
										function registValidate(){
											
											const content = CKEDITOR.instances.testedit.getData()
																																 .replace(/<[^>]*>/g, '')
																																 .replace(/&nbsp;/g, '')
																																 .trim();
											
											//console.log(content);
											
											if($("#title").val().trim() == ""){
												alert("제목을 입력해주세요");
												return false;
											}else if(content == "내용입력" || content == ""){
												alert("내용을 입력해주세요");
												return false;
											}
											
										}
										
										
									</script>
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
  
  <!-- ck editor 연동 스크립트 -->
  <script src="${ contextPath }/assets/libs/ckeditor/ckeditor.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/libs/ckeditor/samples/js/sample.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/js/plugins/ckeditor-init.js" type="text/javascript"></script>
	
</body>
</html>