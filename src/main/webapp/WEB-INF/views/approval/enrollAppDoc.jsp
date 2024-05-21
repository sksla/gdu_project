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

<style>

  .app_line_table th, .app_line_table td{
    text-align: center;
    vertical-align: middle;
    font-size: 15px;
  }
  .app_title:hover{cursor: pointer;
  }
  /* 결재선 모달 스타일 */
  .list_box_wrap{
 		width: 30%;
    height: 400px;
  }
  .mem_list_box{
    border: 1px solid lightgrey;
    width: 100%;
    height: 100%;
  }
  .mem_list>div{
    font-size: 14px;
    padding: 8.5px 5px;
  }
  .mem_list>div:hover{
    background-color: #F2F2F2;
    color: rgb(90, 106, 133);
    cursor: pointer;
  }
  .selected_app_mem{
    width: 40%;
  }
  .selected_app_mem>div{
    display: flex;
    flex-direction: row;
  }
  .selected_mem{
    background-color: #03A9F3;
    color: white;
  }
  .app_mem_etc{
    height: 100%;
    width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .app_mem_etc:hover{
    cursor: pointer;
  }
  .box_header{
  	height: 20px;
    font-weight: bold;
    font-size: 15px;
    text-align: center;
    border-bottom: 1px solid lightgrey;
  }
  .app_mem{
    width: 80%;
    border: 1px solid lightgrey;
    height: 100%;
  }
  .list-group .badge{display:none;}
  .box_content_wrap{
  	height:95%;
  	overflow: auto;
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
          <form id="appForm" method="post" action="${contextPath}/approval/enroll.do">
          	<input type="hidden" id="status" name="status" value="O">
          	<input type="hidden" name="drafter" value="${loginUser.memNo}">
            <div class="mb-4" style="display: flex; justify-content: space-between;">
              <span>
                <button onclick="return enrollAppForm(1);" class="btn btn-info me-1 mb-1 px-4 fs-4">기안하기</button>
                <button onclick="return enrollAppForm(2);" class="btn btn-light mx-2 mb-1 px-4 fs-4">임시저장</button>
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
                          <select class="form-select" id="selectAppCategory" aria-label="Default select example">
                          	<option value="0" disabled selected>문서구분을 선택하세요.</option>
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
                          <select class="form-select" name="appNo" id="selectAppForm" aria-label="Default select example">
                            <option selected value="0" disabled>문서구분을 선택하세요.</option>
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
                          <select class="form-select" name="prePeriod" aria-label="Default select example">
                            <option selected>1년</option>
                            <option>5년</option>
                            <option>10년</option>
                            <option>영구보존</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="row align-items-center">
                        <label for="" class="form-label fw-semibold col-sm-3 col-form-label fs-4">???</label>
                        <div class="col-sm-9">
                          <select class="form-select" id="" aria-label="Default select example">
                            
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
                    <tr class="sign_area">
                      <td class="drafter" width="12.5%" height="140px">
                        <div style="height: 70%;">
                          <img src="${contextPath}${loginUser.signUrl}" style="height: 100%;" alt="서명이미지">
                        </div>
                        <label></label>
                      </td>
                      <td class="collaborator1" width="12.5%">
                        미결
                      </td>
                      <td class="collaborator2" width="12.5%">
                        -
                      </td>
                      <td class="collaborator3" width="12.5%">
                        -
                      </td>
                      <td class="collaborator4" width="12.5%">
                        -
                      </td>
                      <td class="collaborator5" width="12.5%">
                        -
                      </td>
                      <td class="approver" width="12.5%">
                        미결
                      </td>
                      <td class="receiver" width="12.5%">
                        미결
                      </td>
                    </tr>
                    <tr class="major_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${ loginUser.majorNo }</td>
                      <td class="collaborator1">-</td>
                      <td class="collaborator2">-</td>
                      <td class="collaborator3">-</td>
                      <td class="collaborator4">-</td>
                      <td class="collaborator5">-</td>
                      <td class="approver">-</td>
                      <td class="receiver">-</td>
                    </tr>
                    <tr class="job_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${ loginUser.jobNo }</td>
                      <td class="collaborator1">-</td>
                      <td class="collaborator2">-</td>
                      <td class="collaborator3">-</td>
                      <td class="collaborator4">-</td>
                      <td class="collaborator5">-</td>
                      <td class="approver">-</td>
                      <td class="receiver">-</td>
                    </tr>
                    <tr class="name_area">
                      <td width="12.5%" style="height: 30px;" class="drafter">${loginUser.memName}</td>
                      <td class="collaborator1">-</td>
                      <td class="collaborator2">-</td>
                      <td class="collaborator3">-</td>
                      <td class="collaborator4">-</td>
                      <td class="collaborator5">-</td>
                      <td class="approver">-</td>
                      <td class="receiver">-</td>
                    </tr>
                  </table>
                </div>
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
              </div>
              <br>
              
              <!-- 결재문서 작성 영역 -->
              <h5 class="card-title fw-semibold" style="display: inline;">결재내용</h5><br><br>
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <label for="example-text-input" class="col-md-2 col-form-label fs-4">제목</label>
                    <div class="">
                      <input class="form-control" type="text" name="docTitle" id="example-text-input" placeholder="결재문서의 제목을 입력해주세요"/>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <label for="example-text-input" class="col-md-2 col-form-label fs-4">내용</label>
                 	<div class="col-md-12">
                    <textarea cols="80" id="testedit" name="docContent" rows="10" data-sample="1" data-sample-short>
                    	양식을 선택하세요.
                  	</textarea>
	                  <div style="display:none;">
		                  <p id="editor"></p>
		                  <p id="editor1"></p>
		                  <p id="editor2"></p>
		                  <p id="testedit1"></p>
		                  <p id="testedit2"></p>
		                  <p id="tool-location"></p>
										</div>
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
    
    <!-- modal content -->
    <div class="modal fade" id="app_line_modal" tabindex="-1"
      aria-labelledby="bs-example-modal-lg" aria-hidden="true">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header d-flex align-items-center border-bottom">
            <h4 class="modal-title fw-semibold" id="myLargeModalLabel">
              결재선 등록
            </h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <div class="modal-body mx-4 my-2">
          	<!-- 자주쓰는 결재선에 이식
            <div class="mb-4 pb-4 row align-items-center border-bottom">
              <label for="" class="form-label fw-semibold col-sm-2 col-form-label fs-4">결재선 이름</label>
              <div class="col-sm-7">
                <input type="text" class="form-control">
              </div>
            </div>
             -->
            <form class="input-group mb-3">
              <div class="col-3">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="이름/부서명을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                  <button class="btn btn-outline-secondary me-2">검색</button>
                </div>
              </div>
              <span class="mx-2">
                <div class="custom-control py-2 custom-radio">
                  <input type="radio" id="customRadio1" name="customRadio" class="form-check-input" />
                  <label class="form-check-label" for="customRadio1">이름으로 검색</label>
                </div>
              </span>
              <span class="mx-2">
                <div class="custom-control py-2 custom-radio">
                  <input type="radio" id="customRadio2" name="customRadio" class="form-check-input" />
                  <label class="form-check-label" for="customRadio2">학과로 검색</label>
                </div>
              </span>
            </form>
            <div class="d-flex flex-row">
            	<div class="me-2 list_box_wrap">
            		<div class="my-1 text-end" style="height: 35px"></div>
	              <div class="mem_list_box">
	                <div class="box_header">부서목록</div>
	                <div id="myTreeview" class="box_content_wrap"></div>
	              </div>
              </div>
              <div class="list_box_wrap">
              	<div class="my-1 text-end" style="height: 35px">
              		<button class="btn text-info fw-semibold" onclick="selectAllMem(this);">전체선택</button>
              	</div>
	              <div class="mem_list_box">
	                <div class="box_header">직원목록</div>
	                <div class="mem_list my_mem_list box_content_wrap" style="overflow-y: auto">
	                  
	                </div>
	              </div>
              </div>
              <div class="selected_app_mem list_box_wrap">
              	<div class="my-1" style="display: block; height: 35px; text-align:right;">
              		<button class="btn btn-light fw-semibold" onclick="resetEnrollLineModal();">초기화</button>
              	</div>
                <div style="height: 220px; margin-bottom: 10px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_collaborator" onclick="addAppMember('collaborator');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_collaborator" onclick="removeAppMember('collaborator');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_collaborator app_mem">
                    <div class="box_header">협조자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
                <div style="height: 80px; margin-bottom: 10px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_approver" onclick="addAppMember('approver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_approver" onclick="removeAppMember('approver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_approver app_mem">
                    <div class="box_header">결재자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
                <div style="height: 80px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_receiver" onclick="addAppMember('receiver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_receiver" onclick="removeAppMember('receiver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_receiver app_mem">
                    <div class="box_header">수신자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer justify-content-center pb-4 pt-7">
            <button type="button" class="btn btn-primary waves-effect text-start"
              onclick="confirmAppLine();">
              확인
            </button>
            <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start"
              data-bs-dismiss="modal">
              닫기
            </button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    
    <!-- 해당 페이지 JavaScript 영역 start -->
    <script>
    	
    	// treeview의 부서 목록 전역변수
    	let majorTree = [];
    
    	$(document).ready(function(){
    		
    		// test용 버튼 이벤트
        $("#testtest").on("click", function(){
        	$("#appForm>input[name='approver']").remove();
        })
        
        
        // 양식목록 조회 이벤트
        $("#selectAppCategory").change(function(){
        	$.ajax({
         		url:"${contextPath}/approval/formList.do",
         		data:"appCategory=" + $(this).val(),
         		type:"get",
         		success: function(list){
         			$("#selectAppForm").empty();
         			$("#selectAppForm").append('<option value="0" disabled selected>문서양식을 선택하세요.</option>');
         			for(const appForm of list){
         				$("#selectAppForm").append('<option value="' + appForm.appNo + '">' + appForm.appFormName + '</option>');
         			}
         		},
         		error: function(){
         			console.log("양식 목록 ajax 통신 실패");
         		}
         	})
        })
        
        // 양식 내용 조회 이벤트
        $("#selectAppForm").change(function(){
        	$.ajax({
         		url:"${contextPath}/approval/formContent.do",
         		data:"appNo=" + $(this).val(),
         		type:"get",
         		success: function(formContent){
         			CKEDITOR.instances.testedit.setData(formContent);
         		},
         		error: function(){
         			console.log("양식 목록 ajax 통신 실패");
         		}
         	})
        })
        
        // 기안 결재선에 현재날짜 표시
				$(".sign_area>.drafter>label").text(getCurrentDate());
    		
    		// 결재선 선택 모달용 javascript **************************************
    		// 부서목록 리스트 조회
    		createMajorList();
    		
	    	// 부서 선택 시 직원 목록 조회
 				
	    	
    	})
    	
    	function getCurrentDate() {
          var today = new Date();
          var year = today.getFullYear();
          var month = String(today.getMonth() + 1).padStart(2, '0');
          var day = String(today.getDate()).padStart(2, '0');
          return year + '-' + month + '-' + day;
      }
    	
    	// 결재선 모달용 javascript ********************************************
    	// treeview의 부서 목록 생성
    	function createMajorList(){    		
    		$.ajax({
    			url:"${contextPath}/approval/majorTreeList.do",
    			type:"get",
    			success: function(list){
    				for(let i=0; i<list.length; i++){
    					majorTree[i] = {};
    					majorTree[i].text = list[i].colName;
    					majorTree[i].tags = [list[i].colNo, "college"];
    					majorTree[i].nodes = [];
    					let majorList = list[i].majorList;
    					for(let j=0; j<majorList.length; j++){
    						majorTree[i].nodes[j] = {};
    						majorTree[i].nodes[j].text = majorList[j].majorName;
    						majorTree[i].nodes[j].tags = [majorList[j].majorNo, "major"];
    					}
    				}
    				testTreeView();
    			},
    			error: function(){
    				console.log("부서 목록 조회 실패");
    			}    			
    		})
    		
    	}
      
    	// 부서목록 treeview 생성 함수
    	function testTreeView(){
    		
        $("#myTreeview").treeview({
            levels: 1,
            selectedBackColor: "#03a9f3",
            onhoverColor: "rgba(0, 0, 0, 0.05)",
            expandIcon: "ti ti-plus",
            collapseIcon: "ti ti-minus",
            nodeIcon: "ti ti-circle",
            data: majorTree,
            showTags: true,
            highlightSelected: true,
        }).on("click", function(){
        	let $badge = $(".node-selected").find(".badge");
        	if($badge.eq(1).text() == "major"){
        		$.ajax({
        			url:"${contextPath}/approval/memberList.do",
        			data:{ majorNo: $badge.eq(0).text() },
        			type:"get",
        			success: function(list){
        				$(".my_mem_list").empty();
        				for(const member of list){
        					let $newEl = $("<div>" + member.memName + " (" + member.majorNo + ", " + member.jobNo + ")" + "</div>");
        					$newEl.append("<span class='hide'>" + member.memNo + "</span>")
        								.append("<span class='hide'>" + member.majorNo + "</span>")
        								.append("<span class='hide'>" + member.jobNo + "</span>")
        								.append("<span class='hide'>" + member.memName + "</span>");
        					$(".my_mem_list").append($newEl);
        				}
        			},
        			error: function(){
        				console.log("부서목록 생성 ajax 통신 실패");
        			}
        		})
        	}
        });
      }
    	
    	// 직원 목록 선택
    	$(".mem_list").on("click", "div", function(){
    		// 컨트롤 누른경우 : 겹처서 선택, 하나씩 해제
    		// 컨트롤 안 누른 경우 : 해당 객체 하나만 선택(선택되어 있어도)
    		if(window.event.ctrlKey){
    			if( $(this).hasClass("selected_mem") ){
       			$(this).removeClass("selected_mem");
       		}else{
       			$(this).addClass("selected_mem");
       		}
    		}else{
       		$(".mem_list > div").removeClass("selected_mem");
    			if( !$(this).hasClass("selected_mem") ){
    				$(this).addClass("selected_mem");
    			}
    		}
    	})
    	function selectAllMem(target){
    		if($(target).text() == "전체선택"){
    			$(".my_mem_list>div").each(function(index, el){
	    			if(!$(el).hasClass("selected_mem")){
	    				$(el).addClass("selected_mem");
	    			}
	    		})
	    		$(target).text("전체해제");
    		}else{
	    		$(".my_mem_list>div").each(function(index, el){
    				$(el).removeClass("selected_mem");    				
	    		})
	    		$(target).text("전체선택");
    		}
    	}
    	
    	// 화살표 클릭시 결재자 추가
    	function addAppMember(appType){
    		let $selectedMem = $(".my_mem_list>.selected_mem");
    		let $boxMem = $(".app_" + appType + ">.mem_list");
    		if(appType == "collaborator" && ($boxMem.children("div").length + $selectedMem.length > 5)){
    			alert("협조자는 최대 5명까지 선택할 수 있습니다.");
    		}
    		else if(appType != "collaborator" && $boxMem.children("div").length + $selectedMem.length > 1){
    			alert("결재자, 수신자는 1명만 선택할 수 있습니다.");
    		}else{
    			$selectedMem.each(function(index, el1){
    				let isMem = false;
    				$(".selected_app_mem .mem_list").children().each(function(index, el2){
    					if($(el1).children("span").eq(0).text() == $(el2).children("span").eq(0).text()){
    						alert("동일한 직원이 이미 결재선에 존재합니다.");
    						isMem = true;
    					}
    				})
    				if(!isMem){
       				let $test = $boxMem.append($(el1).clone().addClass("selected_" + appType));    					
    				}else{
							return false;
    				}
       		})
    		}
    	}
    	// 화살표 클릭시 결재자 제거
    	function removeAppMember(appType){
    		let $boxMem = $(".app_" + appType + ">.mem_list").children(".selected_mem").each(function(index, el){
    			$(el).remove();
    		});
    	}
    	
    	// 결재선 등록 모달 초기화
     	function resetEnrollLineModal(){
     		createMajorList();
         	$(".mem_list").each(function(index, el){
         		$(el).empty();
         	})
     	}
    	
    	// 선택한 결재선 적용
    	function confirmAppLine(){
    		if($(".app_approver>.mem_list").html().trim() == "" || $(".app_receiver>.mem_list").html().trim() == ""){
    			alert("결재자와 수신자를 지정해주세요.")
    			return false;
    		}
    		// 협조자
    		$("#appForm>input[name='collaborator']").each(function(index, el){
    			$(el).remove();
    		});
    		if($(".selected_collaborator").length != 0){
    			$(".selected_collaborator").each(function(index, el){
    				let $collaborator = $(".collaborator" + (index+1));
    				$collaborator.eq(0).html("<h>미결<h>");
    				for(let i=1; i<=$collaborator.length-1; i++){
       				$collaborator.eq(i).text( $(el).children("span").eq(i).text() );
       			}
    				$("#appForm").append('<input type="hidden" name="collaboratorNo" value="' + $(el).children().eq(0).text() + '">');
    			})
    		}else{
    			for(let i=1; i<=5; i++){
    				let $collaborator = $(".collaborator" + i);
    				for(let j=0; j<$collaborator.length; j++){
    					$collaborator.eq(j).text("-");
        		}
    			}
    		}
    		// 결재자
    		$("#appForm>input[name='approver']").remove();
    		if($(".selected_approver").length != 0){
    			let $selectedApproverProp = $(".selected_approver>span");
    			$(".approver").eq(0).text("미결");
    			for(let i=1; i<=$(".approver").length-1; i++){
    				$(".approver").eq(i).text( $selectedApproverProp.eq(i).text() );
    			}
    			$("#appForm").append('<input type="hidden" name="approverNo" value="' + $selectedApproverProp.eq(0).text() + '">');
    		}else{
    			for(let i=0; i<$(".approver").length; i++){
    				$(".approver").eq(i).text("-");  
    			}
    		}
    		// 수신자
    		$("#appForm>input[name='receiver']").remove();
    		if($(".selected_receiver").length != 0){
    			let $selectedReceiverProp = $(".selected_receiver>span");
    			$(".receiver").eq(0).text("미결");
    			for(let i=1; i<=$(".receiver").length-1; i++){
    				$(".receiver").eq(i).text( $selectedReceiverProp.eq(i).text() );    				
    			}
    			$("#appForm").append('<input type="hidden" name="receiverNo" value="' + $selectedReceiverProp.eq(0).text() + '">');
    		}else{
    			for(let i=0; i<$(".receiver").length; i++){
    				$(".receiver").eq(i).text("-");
    			}
    		}
    		resetEnrollLineModal();
    		$("#app_line_modal").modal("hide");
    	}
    	// *****************************************************************
      
    	//
      function enrollAppForm(type){
    	  if(type == 1){
    		  $("#status").val("O");
    	  }else if(type == 2){
    		  $("#status").val("T");
    	  }
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