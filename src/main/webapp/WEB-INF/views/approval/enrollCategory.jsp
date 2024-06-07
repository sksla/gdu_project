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
                  <h3 class="fw-semibold mb-8">결재양식 등록</h3>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">전자결재</li>
                      <li class="breadcrumb-item" aria-current="page">결재양식 등록</li>
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
          <form id="category_form" action="${contextPath}/approval/enrollAppForm.do" method="post">
          	<input type="hidden" id="tmp_yn" name="tmp" value="N">
            <div class="mb-4">
              <span>
                <button type="button" onclick="return enrollAppForm(1);" class="btn btn-info me-1 mb-1 px-4 fs-4">등록하기</button>
                <button type="button" onclick="return enrollAppForm(2);" class="btn btn-light mx-2 mb-1 px-4 fs-4">임시저장</button>
              </span>
            </div>
            
            <div class="form-with-tabs">
  
              <h5 class="card-title fw-semibold mb-4">문서정보</h5>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="row align-items-center">
                        <div class="col-sm-3" style="vertical-align: top;">
                          <label for="" class="form-label fw-semibold col-form-label fs-4">문서구분</label>
                        </div>
                        <div class="col-sm-9">
                          <select class="form-select exist-category" id="test" name="appCategory" aria-label="Default select example">
                            	<c:forEach var="appCategory" items="${appCategories}">
                            		<option value="${appCategory}">${appCategory}</option>
                            	</c:forEach>
                          </select>
                          <input type="text" class="form-control new-category" name="appCategory" disabled placeholder="신규 문서 구분명" style="display:none;">
                        </div>
                        <div class="form-check" style="margin-left: 150px; margin-top: 8px;">
                          <input class="form-check-input" type="checkbox" value="" id="insertDocType">
                          <label class="form-check-label" for="insertDocType">
                            <b>문서구분 항목 신규 등록</b>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-4 row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">문서양식이름</label>
                        <div class="col-sm-9">
                          <input type="text" name="appFormName" class="form-control" required>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <br>
              
              <!-- 결재문서 작성 영역 -->
              <h5 class="card-title fw-semibold" style="display: inline;">양식내용</h5><br><br>
              <div class="card">

                <div class="card-body">
                  <div class="col-md-12">
                    <textarea cols="80" id="testedit" name="appForm" rows="10" data-sample="1" data-sample-short>
                    	양식을 작성하세요.
                  	</textarea>
	                  <div style="display:none;">
		                  <textarea cols="80" id="editor1" disabled>
											</textarea>
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
    
    	$(document).ready(function(){

        $("#testtest").on("click", function(){
          console.log($("input[name=appFormName]").val());
        })
		
				if(${empty appCategories} == true){
					$("#insertDocType").parent().css("display", "none");
					$(".exist-category").css("display", "none")
															.attr("disabled", true);
					$(".new-category").css("display", "")
														.attr("disabled", false);
				}
				
    	})
    		
  		$("#insertDocType").on("change", function(){
        if($(this).prop("checked")){
          $(".exist-category").css("display", "none")
          										.attr("disabled", true);
          $(".new-category").css("display", "")
          									.attr("disabled", false);
        }else{
        	$(".new-category").css("display", "none")
        										.attr("disabled", true);
          $(".exist-category").css("display", "")
          										.attr("disabled", false);
        }
      })
      
      // 결재 양식명 중복 체크 ajax
      function AjaxValidateFormName(){
    		return new Promise((resolve, reject) => {
    		    $.ajax({
    		      url: "${contextPath}/approval/validateFormName.do",
    		      data: { appFormName: $("input[name=appFormName]").val() },
    		      success: function(result){
    		        if(result == "YYYYY"){
    		          alert("동일한 이름의 양식 이름이 존재합니다.");
    		          resolve(false);
    		        } else if(result == "NNNNN"){
    		          resolve(true);
    		        }
    		      },
    		      error: function(){
    		        console.log("양식 이름 중복 체크 에러");
    		        reject("Error in AJAX request");
    		      }
    		    });
    		  });
    	}
      
      function enrollAppForm(type){
    	  if(type == 1){
    		  $("#tmp_yn").val("N");
    	  }else if(type == 2){
    		  $("#tmp_yn").val("Y");
    	  }
    	  
    	  AjaxValidateFormName()
		    	    .then(isResult => {
		    	    	if(isResult){
		    	    		$("#category_form").submit();
		    	    	}
		    	    })
		    	    .catch(error => {
		    	      console.error(error);
		    	    });
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