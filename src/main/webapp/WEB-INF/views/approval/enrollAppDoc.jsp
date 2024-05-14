<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>

<!-- cs editor 관련 css파일 연동 -->
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/css/samples.css">

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/appSidebar.jsp"/>
    
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
                  <h3 class="fw-semibold mb-8">전자결재 기안</h3>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">전자결재</li>
                      <li class="breadcrumb-item" aria-current="page">기안하기</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <img src="" alt="" class="img-fluid mb-n4" />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <form action="">
          	<input type="hidden" id="tmp_yn" name="tmp" value="N">
            <div class="mb-4" style="display: flex; justify-content: space-between;">
              <span>
                <button class="btn btn-info me-1 mb-1 px-4 fs-4">기안하기</button>
                <button class="btn btn-light mx-2 mb-1 px-4 fs-4">임시저장</button>
              </span>
              <a href="" class="btn btn-outline-secondary me-1 mb-1 px-4 fs-4">인쇄 미리보기</a>
            </div>
            
            <div class="form-with-tabs">

              <h5 class="card-title fw-semibold mb-4">문서정보</h5>
              <div class="card">
                <div class="card-body">
                  <!-- row1 -->
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <label for="" class="form-label col-sm-3 fw-semibold col-form-label fs-4">문서구분</label>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            <c:forEach var="appCategory" items="${appCategories}">
                           		<option value="${appCategory}">${appCategory}</option>
                           	</c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-4 row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">문서양식</label>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            <option selected="">인사관련 결재문서1</option>
                            <option value="1">인사관련 결재문서2</option>
                            <option value="2">인사관련 결재문서3</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- row2 -->
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">보존기한</label>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            <option value="1" selected>1년</option>
                            <option value="5">5년</option>
                            <option value="10">10년</option>
                            <option value="20">영구보존</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">???</label>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            <option selected="">인사관련 결재문서1</option>
                            <option value="1">인사관련 결재문서2</option>
                            <option value="2">인사관련 결재문서3</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <br>

              <!-- 결재선 등록 영역 -->
              <h5 class="card-title fw-semibold mb-4" style="display: inline;">결재선</h5>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <!-- 결재선 modal -->
              <!-- ------------------------------------------ -->
              <button type="button" class="btn me-1 mb-1 sm-subtle text-info px-2 fs-4 " data-bs-toggle="modal"
                data-bs-target="#app_line_modal">
                <b>결재선 선택</b>
              </button>
              <!-- modal content -->
              <div class="modal fade" id="app_line_modal" tabindex="-1"
                aria-labelledby="bs-example-modal-lg" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header d-flex align-items-center">
                      <h4 class="modal-title fw-semibold" id="myLargeModalLabel">
                        결재선 선택
                      </h4>
                      <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                    </div>
                    <div class="modal-body mx-4 my-2">
                      <div class="d-flex flex-row">
                        <div class="dep_list_box app_mem_box">dfsgsdfg</div>
                        <div class="mem_list_box app_mem_box">sdfgsdfg</div>
                        <div class="mem_list_box app_mem_box">
                          <div></div>
                          <div></div>
                          <div></div>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect text-start"
                        data-bs-dismiss="modal">
                        확인
                      </button>
                      <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start"
                        data-bs-dismiss="modal">
                        취소
                      </button>
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <br><br>
              <div class="card">
                <div class="card-body">
                  <table class="app_line_table" style="width: 100%;">
                    <tr>
                      <th style="background-color: rgb(255, 246, 235); border: 1px solid lightgrey;">기안</th>
                      <th colspan="5" style="text-align: center; background-color: rgb(255, 246, 235); border: 1px solid lightgrey;">협조</th>
                      <th style="background-color: rgb(255, 246, 235); border: 1px solid lightgrey;">결재</th>
                      <th style="background-color: rgb(255, 246, 235); border: 1px solid lightgrey;">수신</th>
                    </tr>
                    <!-- 서명 이미지 -->
                    <tr>
                      <td width="12.5%" height="140px">
                        <div style="height: 70%;">
                          <img src="" style="height: 100%;" alt="서명이미지">
                        </div>
                        <label>2024-04-01</label>
                      </td>
                      <td width="12.5%">
                        미결
                      </td>
                      <td width="12.5%">
                        -
                      </td>
                      <td width="12.5%">
                        -
                      </td>
                      <td width="12.5%">
                        -
                      </td>
                      <td width="12.5%">
                        -
                      </td>
                      <td width="12.5%">
                        미결
                      </td>
                      <td width="12.5%">
                        미결
                      </td>
                    </tr>
                    <tr>
                      <td width="12.5%" style="height: 30px;">전기전자과</td>
                      <td width="12.5%">경영학과</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">전기전자과</td>
                      <td width="12.5%">행정부</td>
                    </tr>
                    <tr>
                      <td width="12.5%" style="height: 30px;">교수</td>
                      <td width="12.5%">교수</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">학과장</td>
                      <td width="12.5%">과장</td>
                    </tr>
                    <tr>
                      <td width="12.5%" style="height: 30px;">곽연우</td>
                      <td width="12.5%">김호용</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">-</td>
                      <td width="12.5%">임세진</td>
                      <td width="12.5%">김영주</td>
                    </tr>
                  </table>
                </div>
                <div class="mx-7 mb-4">
                  <table style="width: 100%; border: 1px solid lightgrey;">
                    <tr>
                      <th width="150px" height="100px" style="background-color: rgb(255, 246, 235); text-align: center;">참조</th>
                      <td class="px-3" style="vertical-align: middle;">경영학과 학과장 홍길동, 전기전자과 학과장 정은정</td>
                    </tr>
                  </table>
                </div>
              </div>
              <br>
              
              <!-- 결재문서 작성 영역 -->
              <h5 class="card-title fw-semibold" style="display: inline;">결재내용</h5><br><br>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <label for="example-text-input" class="col-md-2 col-form-label fs-4">제목</label>
                    <div class="">
                      <input class="form-control" type="text" value="" id="example-text-input" placeholder="결재문서의 제목을 입력해주세요"/>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <label for="example-text-input" class="col-md-2 col-form-label fs-4">내용</label>
                  <div class="col-md-12">
                    <textarea cols="80" id="testedit" name="appForm" rows="10" data-sample="1" data-sample-short>
                    	양식을 작성하세요.
                  	</textarea>
	                  <div style="display:none;">
		                  <textarea cols="80" id="editor1" disabled>
											</textarea>
										</div>
										<button type="button" id="testtest">test</button>
                  </div>
                </div>
              </div>
              <br>
              
              <h5 class="card-title fw-semibold" style="display: inline;">첨부파일</h5><br><br>
              <div class="card">
                <div class="card-body">
                  <div action="#" class="dropzone">
                    <div class="fallback">
                      <input name="" type="file" multiple />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <br><br><br>
          
					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 해당 페이지 JavaScript 영역 start -->
    <script>
    	// 결재구분에 따라 양식 목록을 가져오는 ajax
    	
    	// 결재구분 변경에 따라 양식 목록이 바뀌는 이벤트
    	
    	
    
    	$(document).ready(function(){
				
    		// test용 버튼 이벤트
        $("#testtest").on("click", function(){
          console.log($("input[name=appFormName]").val());
        })
				
    	})
      
      // 결재 양식명 중복 체크 ajax
      function AjaxValidateFormName(){
    		
    		let test;
    		$.ajax({
    			url:"${contextPath}/approval/validateFormName.do",
          data: {appFormName: $("input[name=appFormName]").val()},
          async: false,
          success: function(result){
						if(result == "YYYYY"){
							alert("동일한 이름의 양식 이름이 존재합니다.");
							test = false;
						}else if(result == "NNNNN"){
							test = true;
						}
          },
          error: function(){
						console.log("양식 이름 중복 체크 에러");
          }
    		})
    		
    		return test;
    	}
      
      function enrollAppForm(type){
    	  if(type == 1){
    		  $("#tmp_yn").val("N");
    	  }else if(type == 2){
    		  $("#tmp_yn").val("Y");
    	  }
    	  return AjaxValidateFormName();
    	}
    	
    	
    </script>
    <!-- 해당 페이지 JavaScript 영역 end-->
    
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