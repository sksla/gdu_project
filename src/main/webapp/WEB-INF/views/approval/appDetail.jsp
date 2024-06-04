<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<c:set var="colSize" value="${ fn:length(collaboratorList) }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>

<!-- cs editor 관련 css파일 연동 -->
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

<style>

  .app_line_table th, .app_line_table td{
    text-align: center;
    vertical-align: middle;
    font-size: 15px;
    border: 1px solid lightgrey;
  }
  .app_title:hover{cursor: pointer;}
  .sign_area{
  	height: 70%;
  	width: 100%;
  }
  .sign_area>img{width: 100%;}
  /* 결재 코멘트 스타일*/
  .app_comment{width: 100%; border: 1px solid lightgrey;}
  .app_comment th{
    background-color: rgb(255, 246, 235); 
    text-align: center;
    width: 150px;
  }
  
  @media print {
    
 	.td1 { 프린트시 background-color 안나오는 현상 수정
        background-color: #dfe3e7 !important; 
        -webkit-print-color-adjust:exact;
    } 
    
    header{
    display: none;
    }
    
    .print{
    display: none;
    }
    
    .leftDiv{
    display: none;
    }
    
     .rightDiv{
    margin-right: 21rem;
	} 
	
	html{
    font-size:12px; 1rem=10px
	}
	
	p{
    margin-top: 3rem;
	}

}
</style>

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
          	<input type="hidden" id="status" name="status" value="20">
          	<input type="hidden" name="drafter" value="${loginUser.memNo}">
            <div class="mb-4" style="display: flex; justify-content: space-between;">
              <span>
              	<c:if test="${ docInfo.nowApprover == loginUser.memNo }">
	                <button type="button" class="btn btn-info me-1 mb-1 px-4 fs-4" data-bs-toggle="modal"
	                data-bs-target="#approveModal">
	                	결재하기
	              	</button>
              	</c:if>
                <c:if test="${ docInfo.drafter.memNo == loginUser.memNo and (docInfo.status == 0 or docInfo.status == 1 or docInfo.status == 2) }">
                	<button type="button" class="btn btn-warning me-1 mb-1 px-4 fs-4" onclick="location.href='${contextPath}/approval/modifyPage.do?no=${docInfo.docNo}'">
                		수정하기
                	</button>
                </c:if>
                <c:if test="${ docInfo.historyCount == 0 and docInfo.drafter.memNo == loginUser.memNo and docInfo.status != 1 and docInfo.status != 0}">
                	<button type="button" class="btn btn-light me-1 mb-1 px-4 fs-4 recallBtn">
                		회수하기
                	</button>                
                </c:if>
              </span>
              <button type="button" class="btn btn-outline-secondary me-1 mb-1 px-4 fs-4" onclick="printDoc();">
              	인쇄 미리보기
              </button>
            </div>
            
            <div class="form-with-tabs">
              
              <h5 class="card-title fw-semibold mb-4">문서정보</h5>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="mb-4 row align-items-center">
                        <div class="col-sm-3" style="vertical-align: top;">
                          <label for="" class="form-label fw-semibold col-form-label fs-4">문서구분</label>
                        </div>
                        <div class="col-sm-9 fs-4">
                          ${ docInfo.appCategory }
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-4 row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">문서양식이름</label>
                        <div class="col-sm-9 fs-4">
                          ${ docInfo.appNo }
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6 mb-lg-0">
                      <div class="row align-items-center">
                        <div class="col-sm-3" style="vertical-align: top;">
                          <label for="" class="form-label fw-semibold col-form-label fs-4">보존기한</label>
                        </div>
                        <div class="col-sm-9 fs-4">
                          ${ docInfo.prePeriod }
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">수정일</label>
                        <div class="col-sm-9 fs-4">
                          ${ docInfo.modifyDate }
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
                    <tr class="sign_area_wrap">
                      <td class="drafter" width="12.5%" height="140px">
                        <div class="sign_area">
                          <img src="${contextPath}${docInfo.drafter.signUrl}" style="height: 100%;" alt="서명이미지">
                        </div>
                        <label>${ docInfo.draftDate }</label>
                      </td>
                      <c:forEach var="col" end="4" items="${ collaboratorList }" varStatus="status">
                      	<td class="collaborator${status.count}" width="12.5%">
	                      	<c:choose>
	                      		<c:when test="${col.appYn == 'Y'}">
			                      	<div class="sign_area">
			                          <img src="${contextPath}${col.approver.signUrl}" style="height: 100%;" alt="서명이미지">
			                        </div>
		                        	<label>${ col.appDate }</label>
		                        </c:when>
		                        <c:otherwise>
		                        	<c:choose>
		                        		<c:when test="${ docInfo.nowApprover == col.approver.memNo  and docInfo.status == 2 }">
				                        	<h5><b style="color: red;">반려</b></h5>
		                        		</c:when>
		                        		<c:otherwise>
				                        	<h5><b>미결</b></h5>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </c:otherwise>
                        	</c:choose>
                        </td>
                      </c:forEach>
                      <c:if test="${colSize < 5}">
										    <c:forEach var="i" begin="${colSize}" end="4">
										    	<td class="collaborator${i+1}" width="12.5%">
		                       -
	                        </td>
										    </c:forEach>
											</c:if>
                      <td class="approver" width="12.5%">
                      	<c:choose>
                      		<c:when test="${receiver.appYn == 'Y'}">
		                      	<div class="sign_area">
		                          <img src="${contextPath}${approver.approver.signUrl}" style="height: 100%;" alt="서명이미지">
		                        </div>
	                        	<label>${ approver.appDate }</label>
	                        </c:when>
	                        <c:otherwise>
	                        	<c:choose>
	                        		<c:when test="${ docInfo.nowApprover == col.approver.memNo  and docInfo.status == 2 }">
			                        	<h5><b style="color: red;">반려</b></h5>
	                        		</c:when>
	                        		<c:otherwise>
			                        	<h5><b>미결</b></h5>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="receiver" width="12.5%">
                      	<c:choose>
                      		<c:when test="${receiver.appYn == 'Y'}">
	                      	<div class="sign_area">
	                          <img src="${contextPath}${receiver.approver.signUrl}" style="height: 100%;" alt="서명이미지">
	                        </div>
	                        <label>${ col.receiver }</label>
	                        </c:when>
	                        <c:otherwise>
	                        	<c:choose>
	                        		<c:when test="${ docInfo.nowApprover == col.approver.memNo  and docInfo.status == 2 }">
			                        	<h5><b style="color: red;">반려</b></h5>
	                        		</c:when>
	                        		<c:otherwise>
			                        	<h5><b>미결</b></h5>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tr class="major_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${ docInfo.drafter.majorNo }</td>
                      <c:forEach var="col" end="4" items="${ collaboratorList }" varStatus="status">
                      	<td class="collaborator${status.count}" width="12.5%">
	                      	${ col.approver.majorNo }
                        </td>
                      </c:forEach>
                      <c:if test="${colSize < 5}">
										    <c:forEach var="i" begin="${colSize}" end="4">
										    	<td class="collaborator${i+1}" width="12.5%">
		                       -
	                        </td>
										    </c:forEach>
											</c:if>
                      <td class="approver">${ approver.approver.majorNo }</td>
                      <td class="receiver">${ receiver.approver.majorNo }</td>
                    </tr>
                    <tr class="job_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${ docInfo.drafter.jobNo }</td>
                      <c:forEach var="col" end="4" items="${ collaboratorList }" varStatus="status">
                      	<td class="collaborator${status.count}" width="12.5%">
	                      	${ col.approver.jobNo }
                        </td>
                      </c:forEach>
                      <c:if test="${colSize < 5}">
										    <c:forEach var="i" begin="${colSize}" end="4">
										    	<td class="collaborator${i+1}" width="12.5%">
		                       -
	                        </td>
										    </c:forEach>
											</c:if>
                      <td class="approver">${ approver.approver.jobNo }</td>
                      <td class="receiver">${ receiver.approver.jobNo }</td>
                    </tr>
                    <tr class="name_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${ docInfo.drafter.memName }</td>
                      <c:forEach var="col" end="4" items="${ collaboratorList }" varStatus="status">
                      	<td class="collaborator${status.count}" width="12.5%">
	                      	${ col.approver.memName }
                        </td>
                      </c:forEach>
                      <c:if test="${colSize < 5}">
										    <c:forEach var="i" begin="${colSize}" end="4">
										    	<td class="collaborator${i+1}" width="12.5%">
		                       -
	                        </td>
										    </c:forEach>
											</c:if>
                      <td class="approver">${ approver.approver.memName }</td>
                      <td class="receiver">${ receiver.approver.memName }</td>
                    </tr>
                  </table>
                </div>
                <!-- 
                <div class="mx-7 mb-4">
                  <table style="min-height:100px; width: 100%; border: 1px solid lightgrey;">
                    <tr>
                      <th width="150px" style="min-height:100px; background-color: rgb(255, 246, 235); text-align: center;">참조</th>
                      <td class="p-3" style="vertical-align: middle;">경영학과 학과장 홍길동, 전기전자과 학과장 정은정</td>
                    </tr>
                  </table>
                </div>
                <div class="mx-7 mb-4">
                  <table style="min-height:200px; width: 100%; border: 1px solid lightgrey;">
                    <tr>
                      <th width="150px" style="background-color: rgb(255, 246, 235); text-align: center;">개인공람</th>
                      <td class="p-3" style="vertical-align: middle;">경영학과 학과장 홍길동, 전기전자과 학과장 정은정</td>
                    </tr>
                    <tr>
                      <th width="150px" style="background-color: rgb(255, 246, 235); text-align: center;">부서공람</th>
                      <td class="p-3" style="vertical-align: middle;">경영학과 학과장 홍길동, 전기전자과 학과장 정은정</td>
                    </tr>
                  </table>
                </div>
                 -->
              </div>
              <br>
              
              <!-- 결재문서 내용 영역 -->
              <h5 class="card-title fw-semibold" style="display: inline;">결재내용</h5><br><br>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <label for="example-text-input" class="col-md-12 h1 col-form-label fs-4">문서제목</label>
                    <div class="fs-4">
                      ${ docInfo.docTitle }
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <label for="example-text-input" class="col-md-2 col-form-label fs-4">내용</label>
                  <div class="col-md-12" style="min-height:400px">
                    ${ docInfo.docContent }
                  </div>
                </div>
              </div>
              <br>
              
              <h5 class="card-title fw-semibold" style="display: inline;">첨부파일</h5><br><br>
              <div class="card">
                <div class="card-body">
                	<!-- dropzone
                  <div action="#" class="dropzone">
                    <div class="fallback">
                      <input name="uploadFiles" type="file" multiple />
                    </div>
                  </div>
                   -->
                  <div id="fileList">
                  	<c:choose>
	                  	<c:when test="${ not empty attachList }">
	                  	<ul>
                    		<c:forEach var="att" items="${ attachList }">
                    		<li>
                        	<a href="${ contextPath }${att.filePath}/${att.filesystemName}" download="${ att.originalName }">${ att.originalName }</a>
                        </li>
                        </c:forEach>
	                    </ul>
	                    </c:when>
	                    <c:otherwise>
	                    	첨부파일이 없습니다.
	                    </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
          <br><br><br>
          
          <!-- 결재 코멘트 -->
          <h5 class="card-title fw-semibold" style="display: inline;">결재 코멘트</h5><br><br>
          <div class="card">
            <div class="card-body">
            	<c:choose>
            		<c:when test="${ not empty commentList}">
            			<c:forEach var="comment" items="${ commentList }">
	            			<div class="mb-3">
			                <label for="example-text-input" class="col-md-12 h1 col-form-label fs-4">
			                	${ comment.appType }
			                  <span class="ps-3 fs-2">${ comment.commentDate }</span>
			                </label>
			                <table class="app_comment" style="width: 100%; border: 1px solid lightgrey;">
			                  <tr>
			                    <th height="100px">
			                      ${ comment.appYn == 'A' ? '승인' : '반려' }<br>
			                      (${ comment.commenter.memName })
			                    </th>
			                    <td class="px-3" style="vertical-align: middle;">${ comment.commentContent }</td>
			                  </tr>
			                </table>
			              </div>
		              </c:forEach>
            		</c:when>
            		<c:otherwise>
            			작성된 코멘트가 없습니다.
            		</c:otherwise>
            	</c:choose>
              
            </div>
          
					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 결재하기 modal content -->
    <div class="modal fade" id="approveModal" tabindex="-1"
      aria-labelledby="bs-example-modal-lg" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
        	<form class="approve_form" action="${ contextPath }/approval/approve.do" method="post">
        		<input type="hidden" name="appYn" value="A">
        		<input type="hidden" name="commenterNo" value="${ loginUser.memNo }">
        		<input type="hidden" name="docNo" value="${ docInfo.docNo }">
        		<input type="hidden" name="appType" value="${ docInfo.status }">
	          <div class="modal-header d-flex align-items-center border-bottom">
	            <h4 class="modal-title fw-semibold ms-3" id="myLargeModalLabel">
	              결재 코멘트
	            </h4>
	            <button type="button" class="btn-close" data-bs-dismiss="modal"
	              aria-label="Close"></button>
	          </div>
	          <div class="modal-body mx-4 my-2">
	            <div class="d-flex flex-row">
	              <textarea class="form-control comment_content" name="commentContent" style="height: 200px; resize: none;"></textarea>
	            </div>
	          </div>
	          <div class="modal-footer justify-content-center">
	            <!-- 버튼 클릭시 확인 알람창 띄우기 -->
	            <button type="submit" class="btn btn-primary waves-effect text-start">
	              결재하기
	            </button>
	            <button type="submit" onclick="return rejectApproval();" class="btn btn-danger waves-effect text-start">
	              반려하기
	            </button>
	          </div>
          </form>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    
    <!-- 해당 페이지 JavaScript 영역 start -->
    <script>
    	
    	$(document).ready(function(){
    		
    		// 회수하기 (post 방식으로 이동)
       	$(".recallBtn").on("click", function(){
       		var $form = $("<form>", {
       		    "action": "${contextPath}/approval/recall.do",
       		    "method": "post"
       		});
       		
       		$("body").append($form);
       		$form.append("<input type='hidden' name='docNo' value='${docInfo.docNo}'>").submit();
       	})
    		
    	})
    	
    	function rejectApproval(){
    		if($(".comment_content").val().trim() == ""){
    			alert("반려 사유를 입력하세요.");
    			return false;
    		}else{
        	$("input[name='appYn']").val('R');
    		}
    	}
    	
    	function printDoc(){
    		var div = "<div>테스트테스트테스트테스트테스트테스트</div>";
    		var initBody;
 		    
 		    window.onbeforeprint = function(){
 		    	initBody = document.body.innerHTML;
 		      document.body.innerHTML = div.innerHTML;
 		    };
 		    
 		    window.onafterprint = function(){
 		    	document.body.innerHTML = initBody;
 		    };
 		    window.print();
    		
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
  
  <!-- treeview 연동 스크립트 -->
	<script src="../assets/libs/bootstrap-tree/dist/bootstrap-treeview.min.js"></script>
	<script src="../assets/js/plugins/bootstrap-treeview-init.js"></script>
</body>
</html>